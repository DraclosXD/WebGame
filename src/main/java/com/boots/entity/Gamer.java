package com.boots.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Collection;
import java.util.Set;

@Entity
@Table(name = "t_gamer")
public class Gamer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min=2, message = "Не меньше 5 знаков")
    private Long xPos;

    @Size(min=2, message = "Не меньше 5 знаков")
    private Long yPos;
    @OneToOne(fetch = FetchType.EAGER)
    private User users;

    public Gamer() {

    }

    public Gamer(Long id,Long xPos,Long yPos, User users) {
        this.id = id;
        this.xPos = xPos;
        this.yPos = yPos;
        this.users = users;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setxPos(Long xPos) {
        this.xPos = xPos;
    }

    public void setyPos(Long yPos) {
        this.yPos = yPos;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    public Long getxPos() {
        return xPos;
    }

    public Long getyPos() {
        return yPos;
    }

    public User getUsers() {
        return users;
    }
}
