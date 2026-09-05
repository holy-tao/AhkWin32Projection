#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_SE_EMULATION_MODE extends Win32Enum {

    /**
     * Native name: EmulationDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Native name: EmulationEnabled
     * @type {Integer (Int32)}
     */
    static Enabled => 1
}
