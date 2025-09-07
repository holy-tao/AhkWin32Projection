#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_LLCP_SOCKET_OPTION.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_LLCP_SOCKET_ACCEPT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hSocket {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {NFC_LLCP_SOCKET_OPTION}
     */
    sSocketOption{
        get {
            if(!this.HasProp("__sSocketOption"))
                this.__sSocketOption := NFC_LLCP_SOCKET_OPTION(this.ptr + 8)
            return this.__sSocketOption
        }
    }
}
