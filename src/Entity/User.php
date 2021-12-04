<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection; //Bas
use Doctrine\Common\Collections\Collection; //Bas
use Symfony\Component\Uid\Uuid;

class User
{

    private string $id;
    private string $name;
    private string $email;
    private string $password;
    private string $avatar;
    private int $language;
    private \DateTime $createdAt;
    private \DateTime $updatedAt;
    private Collection $characters;

    public function __construct(string $name, string $email, string $password)
    {
        $this->id = Uuid::v4()->toRfc4122();
        $this->name = $name;
        $this->email = $email;
        $this->password = $password;
        $this->language = 1;
        $this->createdAt = new \DateTime();
        $this->updatedTime();
        $this->characters = new ArrayCollection();
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

    public function getEmail(): string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;
        return $this;
    }

    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;
        return $this;
    }

    public function getAvatar(): ?string
    {
        return $this->avatar;
    }

    public function setAvatar(?string $avatar): self
    {
        $this->avatar = $avatar;
        return $this;
    }

    public function getLanguage(): int
    {
        return $this->language;
    }

    public function setLanguage(int $language): self
    {
        $this->language = $language;
        return $this;
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


    public function getCharacters(): ArrayCollection | Collection
    {
        return $this->characters;
    }

}
