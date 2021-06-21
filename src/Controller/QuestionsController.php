<?php

namespace App\Controller;

use App\Entity\Answers;
use App\Entity\Questions;
use App\Form\AnswersType;
use App\Form\QuestionsType;
use App\Repository\AnswersRepository;
use App\Repository\QuestionsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @Route("/questions")
 */
class QuestionsController extends AbstractController
{
    /**
     * @Route("/", name="questions_index", methods={"GET"})
     */
    public function index(QuestionsRepository $questionsRepository): Response
    {
        return $this->render('questions/index.html.twig', [
            'questions' => $questionsRepository->findBy(array(), array('id' => 'DESC'))
        ]);
    }

    /**
     * @Route("/new", name="questions_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        if ($this->getUser() === null) {
            return $this->redirectToRoute('questions_index');
        }

        $question = new Questions();
        $question->setUsers($this->getUser());
        $form = $this->createForm(QuestionsType::class, $question);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($question);
            $entityManager->flush();

            return $this->redirectToRoute('questions_show', ['id' => $question->getId()]);
        }

        return $this->render('questions/new.html.twig', [
            'question' => $question,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="questions_show", methods={"GET","POST"})
     */
    public function show(Questions $question, Request $request, AnswersRepository $answersRepository): Response
    {
        $answer = new Answers();
        $answer->setUsers($this->getUser());
        $answer->setQuestions($question);
        $answerForm = $this->createForm(AnswersType::class, $answer);
        $answerForm->handleRequest($request);

        if ($answerForm->isSubmitted() && $answerForm->isValid()) {
            $question->addAnswer($answer);
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($answer);
            $entityManager->flush();

            $this->addFlash('success', 'Ваш ответ успешно добавлен!');
            return $this->redirect($request->getUri());
        }

        return $this->render('questions/show.html.twig', [
            'question' => $question,
            'answers' => $answersRepository->findBy(array('questions' => $question->getId()), array('id' => 'DESC')),
            'formA' => $answerForm->createView(),
        ]);
    }
}
