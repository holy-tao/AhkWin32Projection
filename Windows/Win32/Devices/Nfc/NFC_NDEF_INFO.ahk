#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_NDEF_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {BOOLEAN}
     */
    fIsNdefFormatted {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    fIsReadOnly {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    dwActualMessageLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwMaxMessageLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
