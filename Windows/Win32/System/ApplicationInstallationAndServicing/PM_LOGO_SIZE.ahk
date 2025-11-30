#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_LOGO_SIZE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PM_LOGO_SIZE_SMALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_LOGO_SIZE_MEDIUM => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_LOGO_SIZE_LARGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_LOGO_SIZE_INVALID => 3
}
