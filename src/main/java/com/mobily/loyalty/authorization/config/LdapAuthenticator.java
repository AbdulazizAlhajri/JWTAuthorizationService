package com.mobily.loyalty.authorization.config;

import com.mobily.loyalty.authorization.service.UserDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.DirContextOperations;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.ldap.userdetails.LdapUserDetailsMapper;
import org.springframework.stereotype.Component;

import java.util.Collection;

@Component
public class LdapAuthenticator extends LdapUserDetailsMapper {

    @Autowired
    private UserDetailServiceImpl userDetailService;

    @Override
    public UserDetails mapUserFromContext(DirContextOperations ctx, String username, Collection<? extends GrantedAuthority> authorities) {

        UserDetails userDetails = this.userDetailService.loadUserByUsername(username);
        System.out.println("User logged in, getting UserDetails for: "+username);
        return super.mapUserFromContext(ctx, username, userDetails.getAuthorities());
    }
}