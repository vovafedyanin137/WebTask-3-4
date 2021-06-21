<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UsuallyFixtures extends Fixture
{
    private $encoder;

    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }

    public function load(ObjectManager $manager)
    {
        $user = new User();
        $user->setName('Polina');
        $user->setEmail('mochalovapolina2000@mail.ru');
        $user->setRoles(array('ROLE_ADMIN'));
        $password = $this->encoder->encodePassword($user, 'pass_1234');
        $user->setPassword($password);
        $manager->persist($user);
        $manager->flush();
    }
}
