#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class CLSID_RESOLUTION_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CLSID_RESOLUTION_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLSID_RESOLUTION_REGISTERED => 1
}
