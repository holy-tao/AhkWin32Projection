#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_DATA_BUFFER.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_SNEP_CLIENT_PUT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hSnepClient {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {NFC_DATA_BUFFER}
     */
    sPutPayload{
        get {
            if(!this.HasProp("__sPutPayload"))
                this.__sPutPayload := NFC_DATA_BUFFER(this.ptr + 8)
            return this.__sPutPayload
        }
    }
}
