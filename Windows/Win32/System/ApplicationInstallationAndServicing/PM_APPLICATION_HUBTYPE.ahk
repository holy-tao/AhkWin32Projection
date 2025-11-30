#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_APPLICATION_HUBTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_HUBTYPE_NONMUSIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_HUBTYPE_MUSIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_APPLICATION_HUBTYPE_INVALID => 2
}
