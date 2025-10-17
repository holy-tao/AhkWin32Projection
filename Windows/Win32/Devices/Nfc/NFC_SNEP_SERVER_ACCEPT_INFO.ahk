#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_LLCP_SOCKET_OPTION.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_SNEP_SERVER_ACCEPT_INFO extends Win32Struct
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
     * @type {NFC_LLCP_SOCKET_OPTION}
     */
    sSocketOption{
        get {
            if(!this.HasProp("__sSocketOption"))
                this.__sSocketOption := NFC_LLCP_SOCKET_OPTION(16, this)
            return this.__sSocketOption
        }
    }
}
