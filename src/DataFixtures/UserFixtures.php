<?php
namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class UserFixtures extends Fixture
{
    public const ADMIN_USER = 'user_admin';

    public function load(ObjectManager $manager)
    {
        $userAdmin = new User($name = 'admin', $email = 'noqdy80@gmail.com', $password = 'hola1234');
        $manager->persist($userAdmin);
        $manager->flush();

        $this->addReference(self::ADMIN_USER, $userAdmin);
    }
}