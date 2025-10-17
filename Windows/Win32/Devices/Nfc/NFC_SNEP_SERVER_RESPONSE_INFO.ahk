#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_DATA_BUFFER.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_SNEP_SERVER_RESPONSE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hSnepServer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    hConnection {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwResponseStatus {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {NFC_DATA_BUFFER}
     */
    sResponsePayload{
        get {
            if(!this.HasProp("__sResponsePayload"))
                this.__sResponsePayload := NFC_DATA_BUFFER(20, this)
            return this.__sResponsePayload
        }
    }
}
