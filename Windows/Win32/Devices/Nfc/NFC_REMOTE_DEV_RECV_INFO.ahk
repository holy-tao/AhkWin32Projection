#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_DATA_BUFFER.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_REMOTE_DEV_RECV_INFO extends Win32Struct
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
     * @type {NFC_DATA_BUFFER}
     */
    sRecvBuffer{
        get {
            if(!this.HasProp("__sRecvBuffer"))
                this.__sRecvBuffer := NFC_DATA_BUFFER(8, this)
            return this.__sRecvBuffer
        }
    }
}
