<?php
session_start();

/**
 * si sur la page roles/create.html et poids > 90 alors OK
 * Sinon on redirection vers index.html
 * - Si notre page est dans le tableau $pagePoids
 * - On regarde le poids dans le tableau 
 *      - si >= alors OK on reste sur la page
 *      - sinon (<) redirection vers index.html
 * - Sinon on passe
 */

$pagePoids = [
    '/exoCardPerso/create.html' => 90,
    '/exoCardPerso/addfile.html' => 90,
];

if (isset($pagePoids[$_SERVER['SCRIPT_NAME']])) {
    /**
     * On redirige quand : 
     * - il n'y a pas d'index user dans $_SESSION
     * - poids de la page est > poids de user session
     */
    if (!isset($_SESSION['user']) || $pagePoids[$_SERVER['SCRIPT_NAME']] > $_SESSION['user']['poids']) {
        /** Redirection */
        header('Location: index.html');
        exit();
    }
}