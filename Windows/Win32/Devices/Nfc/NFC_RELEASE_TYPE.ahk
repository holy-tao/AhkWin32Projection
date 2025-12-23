#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_RELEASE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IdleMode => 0

    /**
     * @type {Integer (Int32)}
     */
    static SleepMode => 1

    /**
     * @type {Integer (Int32)}
     */
    static Discovery => 2
}
