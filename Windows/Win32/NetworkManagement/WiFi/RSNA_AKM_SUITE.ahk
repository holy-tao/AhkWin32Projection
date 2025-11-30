#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class RSNA_AKM_SUITE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_none => 11276032

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_1x => 28053248

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_psk => 44830464

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_ft_1x_sha256 => 61607680

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_ft_psk_sha256 => 78384896

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_1x_sha256 => 95162112

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_psk_sha256 => 111939328

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_tdls_sha256 => 128716544

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_sae_pmk256 => 145493760

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_ft_sae_pmk256 => 162270976

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_peerkey_sha256 => 179048192

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_1x_suite_b_sha256 => 195825408

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_1x_suite_b_sha384 => 212602624

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_ft_1x_sha384_cmp_256 => 229379840

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_fils_1x_sha256 => 246157056

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_fils_1x_sha384 => 262934272

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_ft_fils_1x_sha256 => 279711488

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_ft_fils_sha384 => 296488704

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_owe => 313265920

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_ft_psk_sha384 => 330043136

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_psk_sha384 => 346820352

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_ft_1x_sha384 => 380374784

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_1x_sha384 => 397152000

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_sae_pmk384 => 413929216

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_ft_sae_pmk384 => 430706432

    /**
     * @type {Integer (Int32)}
     */
    static rsna_akm_max => 430706432
}
