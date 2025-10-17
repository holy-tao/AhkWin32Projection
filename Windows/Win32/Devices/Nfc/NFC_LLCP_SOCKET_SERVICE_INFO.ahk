#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_LLCP_SERVICE_NAME_ENTRY.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_LLCP_SOCKET_SERVICE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hSocket {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bSAP {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {NFC_LLCP_SERVICE_NAME_ENTRY}
     */
    sServiceName{
        get {
            if(!this.HasProp("__sServiceName"))
                this.__sServiceName := NFC_LLCP_SERVICE_NAME_ENTRY(16, this)
            return this.__sServiceName
        }
    }
}
