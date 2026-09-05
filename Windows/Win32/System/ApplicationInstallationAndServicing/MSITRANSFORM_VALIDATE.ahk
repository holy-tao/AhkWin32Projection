#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSITRANSFORM_VALIDATE extends Win32Enum {

    /**
     * Native name: MSITRANSFORM_VALIDATE_LANGUAGE
     * @type {Integer (Int32)}
     */
    static LANGUAGE => 1

    /**
     * Native name: MSITRANSFORM_VALIDATE_PRODUCT
     * @type {Integer (Int32)}
     */
    static PRODUCT => 2

    /**
     * Native name: MSITRANSFORM_VALIDATE_PLATFORM
     * @type {Integer (Int32)}
     */
    static PLATFORM => 4

    /**
     * Native name: MSITRANSFORM_VALIDATE_MAJORVERSION
     * @type {Integer (Int32)}
     */
    static MAJORVERSION => 8

    /**
     * Native name: MSITRANSFORM_VALIDATE_MINORVERSION
     * @type {Integer (Int32)}
     */
    static MINORVERSION => 16

    /**
     * Native name: MSITRANSFORM_VALIDATE_UPDATEVERSION
     * @type {Integer (Int32)}
     */
    static UPDATEVERSION => 32

    /**
     * Native name: MSITRANSFORM_VALIDATE_NEWLESSBASEVERSION
     * @type {Integer (Int32)}
     */
    static NEWLESSBASEVERSION => 64

    /**
     * Native name: MSITRANSFORM_VALIDATE_NEWLESSEQUALBASEVERSION
     * @type {Integer (Int32)}
     */
    static NEWLESSEQUALBASEVERSION => 128

    /**
     * Native name: MSITRANSFORM_VALIDATE_NEWEQUALBASEVERSION
     * @type {Integer (Int32)}
     */
    static NEWEQUALBASEVERSION => 256

    /**
     * Native name: MSITRANSFORM_VALIDATE_NEWGREATEREQUALBASEVERSION
     * @type {Integer (Int32)}
     */
    static NEWGREATEREQUALBASEVERSION => 512

    /**
     * Native name: MSITRANSFORM_VALIDATE_NEWGREATERBASEVERSION
     * @type {Integer (Int32)}
     */
    static NEWGREATERBASEVERSION => 1024

    /**
     * Native name: MSITRANSFORM_VALIDATE_UPGRADECODE
     * @type {Integer (Int32)}
     */
    static UPGRADECODE => 2048
}
