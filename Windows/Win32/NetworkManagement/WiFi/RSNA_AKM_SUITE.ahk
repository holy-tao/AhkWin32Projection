#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class RSNA_AKM_SUITE extends Win32Enum {

    /**
     * Native name: rsna_akm_none
     * @type {Integer (Int32)}
     */
    static none => 11276032

    /**
     * Native name: rsna_akm_1x
     * @type {Integer (Int32)}
     */
    static 1x => 28053248

    /**
     * Native name: rsna_akm_psk
     * @type {Integer (Int32)}
     */
    static psk => 44830464

    /**
     * Native name: rsna_akm_ft_1x_sha256
     * @type {Integer (Int32)}
     */
    static ft_1x_sha256 => 61607680

    /**
     * Native name: rsna_akm_ft_psk_sha256
     * @type {Integer (Int32)}
     */
    static ft_psk_sha256 => 78384896

    /**
     * Native name: rsna_akm_1x_sha256
     * @type {Integer (Int32)}
     */
    static 1x_sha256 => 95162112

    /**
     * Native name: rsna_akm_psk_sha256
     * @type {Integer (Int32)}
     */
    static psk_sha256 => 111939328

    /**
     * Native name: rsna_akm_tdls_sha256
     * @type {Integer (Int32)}
     */
    static tdls_sha256 => 128716544

    /**
     * Native name: rsna_akm_sae_pmk256
     * @type {Integer (Int32)}
     */
    static sae_pmk256 => 145493760

    /**
     * Native name: rsna_akm_ft_sae_pmk256
     * @type {Integer (Int32)}
     */
    static ft_sae_pmk256 => 162270976

    /**
     * Native name: rsna_akm_peerkey_sha256
     * @type {Integer (Int32)}
     */
    static peerkey_sha256 => 179048192

    /**
     * Native name: rsna_akm_1x_suite_b_sha256
     * @type {Integer (Int32)}
     */
    static 1x_suite_b_sha256 => 195825408

    /**
     * Native name: rsna_akm_1x_suite_b_sha384
     * @type {Integer (Int32)}
     */
    static 1x_suite_b_sha384 => 212602624

    /**
     * Native name: rsna_akm_ft_1x_sha384_cmp_256
     * @type {Integer (Int32)}
     */
    static ft_1x_sha384_cmp_256 => 229379840

    /**
     * Native name: rsna_akm_fils_1x_sha256
     * @type {Integer (Int32)}
     */
    static fils_1x_sha256 => 246157056

    /**
     * Native name: rsna_akm_fils_1x_sha384
     * @type {Integer (Int32)}
     */
    static fils_1x_sha384 => 262934272

    /**
     * Native name: rsna_akm_ft_fils_1x_sha256
     * @type {Integer (Int32)}
     */
    static ft_fils_1x_sha256 => 279711488

    /**
     * Native name: rsna_akm_ft_fils_sha384
     * @type {Integer (Int32)}
     */
    static ft_fils_sha384 => 296488704

    /**
     * Native name: rsna_akm_owe
     * @type {Integer (Int32)}
     */
    static owe => 313265920

    /**
     * Native name: rsna_akm_ft_psk_sha384
     * @type {Integer (Int32)}
     */
    static ft_psk_sha384 => 330043136

    /**
     * Native name: rsna_akm_psk_sha384
     * @type {Integer (Int32)}
     */
    static psk_sha384 => 346820352

    /**
     * Native name: rsna_akm_ft_1x_sha384
     * @type {Integer (Int32)}
     */
    static ft_1x_sha384 => 380374784

    /**
     * Native name: rsna_akm_1x_sha384
     * @type {Integer (Int32)}
     */
    static 1x_sha384 => 397152000

    /**
     * Native name: rsna_akm_sae_pmk384
     * @type {Integer (Int32)}
     */
    static sae_pmk384 => 413929216

    /**
     * Native name: rsna_akm_ft_sae_pmk384
     * @type {Integer (Int32)}
     */
    static ft_sae_pmk384 => 430706432

    /**
     * Native name: rsna_akm_max
     * @type {Integer (Int32)}
     */
    static max => 430706432
}
