<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AnswersRepository")
 */
class Answers
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="text")
     */
    private $answer_text;

    /**
     * @ORM\Column(type="date")
     */
    private $answer_date;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="answers")
     * @ORM\JoinColumn(nullable=false, name="users_id", referencedColumnName="id")
     */
    private $users;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Questions", inversedBy="answers")
     * @ORM\JoinColumn(nullable=false, name="questions_id", referencedColumnName="id")
     */
    private $questions;

    public function __construct()
    {
        $this->answer_date = new \DateTime();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAnswerText(): ?string
    {
        return $this->answer_text;
    }

    public function setAnswerText(string $answer_text): self
    {
        $this->answer_text = $answer_text;

        return $this;
    }

    public function getAnswerDate(): ?\DateTimeInterface
    {
        return $this->answer_date;
    }

    public function setAnswerDate(\DateTimeInterface $answer_date): self
    {
        $this->answer_date = $answer_date;

        return $this;
    }

    public function getUsers(): ?user
    {
        return $this->users;
    }

    public function setUsers(?user $users): self
    {
        $this->users = $users;

        return $this;
    }

    public function getQuestions(): ?questions
    {
        return $this->questions;
    }

    public function setQuestions(?questions $questions): self
    {
        $this->questions = $questions;

        return $this;
    }

    public function __toString()
    {
        return $this->getAnswerText();
    }
}
