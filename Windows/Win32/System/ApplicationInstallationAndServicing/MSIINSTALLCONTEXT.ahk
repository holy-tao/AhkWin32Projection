#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSIINSTALLCONTEXT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSIINSTALLCONTEXT_FIRSTVISIBLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIINSTALLCONTEXT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIINSTALLCONTEXT_USERMANAGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIINSTALLCONTEXT_USERUNMANAGED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSIINSTALLCONTEXT_MACHINE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSIINSTALLCONTEXT_ALL => 7

    /**
     * @type {Integer (Int32)}
     */
    static MSIINSTALLCONTEXT_ALLUSERMANAGED => 8
}
