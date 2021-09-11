<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CampaignUser
 *
 * @ORM\Table(name="campaign_user", indexes={@ORM\Index(name="fk_cu_current_character", columns={"current_character_id"}), @ORM\Index(name="fk_cu_campaign", columns={"campaign_id"}), @ORM\Index(name="fk_cu_user", columns={"user_id"})})
 * @ORM\Entity
 */
class CampaignUser
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var bool
     *
     * @ORM\Column(name="role", type="boolean", nullable=false, options={"default"="1"})
     */
    private $role = true;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_at", type="datetime", nullable=false, options={"default"="CURRENT_TIMESTAMP"})
     */
    private $createdAt = 'CURRENT_TIMESTAMP';

    /**
     * @var \Campaign
     *
     * @ORM\ManyToOne(targetEntity="Campaign")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="campaign_id", referencedColumnName="id")
     * })
     */
    private $campaign;

    /**
     * @var \Character
     *
     * @ORM\ManyToOne(targetEntity="Character")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="current_character_id", referencedColumnName="id")
     * })
     */
    private $currentCharacter;

    /**
     * @var \User
     *
     * @ORM\ManyToOne(targetEntity="User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     * })
     */
    private $user;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getRole(): ?bool
    {
        return $this->role;
    }

    public function setRole(bool $role): self
    {
        $this->role = $role;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getCampaign(): ?Campaign
    {
        return $this->campaign;
    }

    public function setCampaign(?Campaign $campaign): self
    {
        $this->campaign = $campaign;

        return $this;
    }

    public function getCurrentCharacter(): ?Character
    {
        return $this->currentCharacter;
    }

    public function setCurrentCharacter(?Character $currentCharacter): self
    {
        $this->currentCharacter = $currentCharacter;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }


}
