#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_LLCP_SOCKET_OPTION.ahk
#Include .\NFC_LLCP_SERVICE_NAME_ENTRY.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_SNEP_SERVER_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    eServerType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {NFC_LLCP_SOCKET_OPTION}
     */
    sSocketOption{
        get {
            if(!this.HasProp("__sSocketOption"))
                this.__sSocketOption := NFC_LLCP_SOCKET_OPTION(this.ptr + 4)
            return this.__sSocketOption
        }
    }

    /**
     * @type {Integer}
     */
    usInboxSize {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bSAP {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {NFC_LLCP_SERVICE_NAME_ENTRY}
     */
    sService{
        get {
            if(!this.HasProp("__sService"))
                this.__sService := NFC_LLCP_SERVICE_NAME_ENTRY(this.ptr + 16)
            return this.__sService
        }
    }
}
