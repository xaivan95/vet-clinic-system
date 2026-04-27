<?php
// authentication helper functions

/**
 * Check if the user is logged in.
 * @return bool
 */
function isLoggedIn() {
    return isset($_SESSION['user_id']);
}

/**
 * Log the user in.
 * @param string $username
 * @param string $password
 * @return bool
 */
function login($username, $password) {
    // Implement login logic here
}

/**
 * Log the user out.
 */
function logout() {
    session_unset();
    session_destroy();
}

/**
 * Get the currently logged in user.
 * @return array|null
 */
function getCurrentUser() {
    if (isLoggedIn()) {
        // Fetch user from database
    }
    return null;
}