#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFCRM_SET_RADIO_STATE extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    SystemStateUpdate {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    MediaRadioOn {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
