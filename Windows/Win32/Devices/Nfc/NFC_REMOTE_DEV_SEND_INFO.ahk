#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_DATA_BUFFER.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_REMOTE_DEV_SEND_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hRemoteDev {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    usTimeOut {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {NFC_DATA_BUFFER}
     */
    sSendBuffer{
        get {
            if(!this.HasProp("__sSendBuffer"))
                this.__sSendBuffer := NFC_DATA_BUFFER(10, this)
            return this.__sSendBuffer
        }
    }
}
