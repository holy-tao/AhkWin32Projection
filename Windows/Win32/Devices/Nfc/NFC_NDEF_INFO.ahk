#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

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
    fIsNdefFormatted{
        get {
            if(!this.HasProp("__fIsNdefFormatted"))
                this.__fIsNdefFormatted := BOOLEAN(this.ptr + 0)
            return this.__fIsNdefFormatted
        }
    }

    /**
     * @type {BOOLEAN}
     */
    fIsReadOnly{
        get {
            if(!this.HasProp("__fIsReadOnly"))
                this.__fIsReadOnly := BOOLEAN(this.ptr + 1)
            return this.__fIsReadOnly
        }
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
