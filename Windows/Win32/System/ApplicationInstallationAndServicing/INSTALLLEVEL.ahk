#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/Msi/installlevel
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class INSTALLLEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLEVEL_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLEVEL_MINIMUM => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLEVEL_MAXIMUM => 65535
}
