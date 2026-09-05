#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSIINSTALLCONTEXT extends Win32Enum {

    /**
     * Native name: MSIINSTALLCONTEXT_FIRSTVISIBLE
     * @type {Integer (Int32)}
     */
    static FIRSTVISIBLE => 0

    /**
     * Native name: MSIINSTALLCONTEXT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: MSIINSTALLCONTEXT_USERMANAGED
     * @type {Integer (Int32)}
     */
    static USERMANAGED => 1

    /**
     * Native name: MSIINSTALLCONTEXT_USERUNMANAGED
     * @type {Integer (Int32)}
     */
    static USERUNMANAGED => 2

    /**
     * Native name: MSIINSTALLCONTEXT_MACHINE
     * @type {Integer (Int32)}
     */
    static MACHINE => 4

    /**
     * Native name: MSIINSTALLCONTEXT_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 7

    /**
     * Native name: MSIINSTALLCONTEXT_ALLUSERMANAGED
     * @type {Integer (Int32)}
     */
    static ALLUSERMANAGED => 8
}
