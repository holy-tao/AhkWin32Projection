#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFCRM_RADIO_STATE extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    MediaRadioOn {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
