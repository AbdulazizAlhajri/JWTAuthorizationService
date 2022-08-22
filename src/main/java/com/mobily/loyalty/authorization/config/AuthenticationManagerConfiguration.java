package com.mobily.loyalty.authorization.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.ldap.authentication.ad.ActiveDirectoryLdapAuthenticationProvider;

@EnableWebSecurity
public class AuthenticationManagerConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private LdapAuthenticator ldapAuthenticator;


	@Bean
	protected AuthenticationManager getAuthenticationManager() throws Exception {
		return super.authenticationManagerBean();
	}

	@Bean
	PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) {
		ActiveDirectoryLdapAuthenticationProvider adldapProvider =
				new ActiveDirectoryLdapAuthenticationProvider(
						"az",
						"ldap://10.11.12.13:123",
						"DC=prod,DC=az,DC=lan"
				);
		adldapProvider.setUserDetailsContextMapper(ldapAuthenticator);
		auth.authenticationProvider(adldapProvider);
	}
}
