#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\RASTUNNELENDPOINT.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASCONNSTATUSW extends Win32Struct
{
    static sizeof => 608

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    rasconnstate {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 12, 16, "UTF-16")
        set => StrPut(value, this.ptr + 12, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 46, 128, "UTF-16")
        set => StrPut(value, this.ptr + 46, 128, "UTF-16")
    }

    /**
     * @type {String}
     */
    szPhoneNumber {
        get => StrGet(this.ptr + 304, 128, "UTF-16")
        set => StrPut(value, this.ptr + 304, 128, "UTF-16")
    }

    /**
     * @type {RASTUNNELENDPOINT}
     */
    localEndPoint{
        get {
            if(!this.HasProp("__localEndPoint"))
                this.__localEndPoint := RASTUNNELENDPOINT(564, this)
            return this.__localEndPoint
        }
    }

    /**
     * @type {RASTUNNELENDPOINT}
     */
    remoteEndPoint{
        get {
            if(!this.HasProp("__remoteEndPoint"))
                this.__remoteEndPoint := RASTUNNELENDPOINT(584, this)
            return this.__remoteEndPoint
        }
    }

    /**
     * @type {Integer}
     */
    rasconnsubstate {
        get => NumGet(this, 604, "int")
        set => NumPut("int", value, this, 604)
    }
}
