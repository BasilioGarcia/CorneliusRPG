<?php

namespace App\Entity;

use Symfony\Component\Uid\Uuid;

class Character
{
    private string $id;
    private string $name;
    private bool $status;
    private \DateTime $createdAt;
    private \DateTime $updatedAt;
    //private $campaign;
    //private $system;
    private User $user;

    public function __construct(string $name, User $user)
    {
        $this->id = Uuid::v4()->toRfc4122();
        $this->name = $name;
        $this->status = true;
        $this->createdAt = new \DateTime();
        $this->updatedTime();
        $this->user = $user;
    }

    public function getId(): string
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function setName(string $name): void
    {
        $this->name = $name;
    }

    public function isStatus(): bool
    {
        return $this->status;
    }

    public function setStatus(bool $status): void
    {
        $this->status = $status;
    }

    public function getCreatedAt(): \DateTime
    {
        return $this->createdAt;
    }

    public function getUpdatedAt(): \DateTime
    {
        return $this->updatedAt;
    }

    public function updatedTime(): void
    {
        $this->updatedAt = new \DateTime();
    }

    public function getUser(): User
    {
        return $this->user;
    }

}
