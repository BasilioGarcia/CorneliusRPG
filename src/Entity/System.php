<?php

namespace App\Entity;

use Symfony\Component\Uid\Uuid;

class System
{
    private string $id;

    public function __construct()
    {
        $this->id = Uuid::v4()->toRfc4122();
    }

    public function getId(): string
    {
        return $this->id;
    }
}