<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\User;
use App\Entity\Character;

class UserController extends AbstractController
{
    #[Route('/user', name: 'user')]
    public function index(): Response
    {
        $repository_u = $this->getDoctrine()->getRepository(User::class);

        $users = $repository_u->findAll();

        foreach ($users as $user) {
            echo "<h1>{$user->getName()}</h1>";
           foreach ($user->getCharacters() as $character) {
                echo "<p>{$character->getName()} - {$character->getUser()->getEmail()}</p>";
           }
        }

        die();
        /*return $this->json([
            'message' => 'Welcome to your new controller!',
            'path' => 'src/Controller/UserController.php',
        ]);*/
    }
}
