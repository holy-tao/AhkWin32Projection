#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\RASTUNNELENDPOINT.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASCONNSTATUSA extends Win32Struct
{
    static sizeof => 344

    static packingSize => 8

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
        get => StrGet(this.ptr + 12, 16, "UTF-8")
        set => StrPut(value, this.ptr + 12, 16, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 29, 128, "UTF-8")
        set => StrPut(value, this.ptr + 29, 128, "UTF-8")
    }

    /**
     * @type {String}
     */
    szPhoneNumber {
        get => StrGet(this.ptr + 158, 128, "UTF-8")
        set => StrPut(value, this.ptr + 158, 128, "UTF-8")
    }

    /**
     * @type {RASTUNNELENDPOINT}
     */
    localEndPoint{
        get {
            if(!this.HasProp("__localEndPoint"))
                this.__localEndPoint := RASTUNNELENDPOINT(288, this)
            return this.__localEndPoint
        }
    }

    /**
     * @type {RASTUNNELENDPOINT}
     */
    remoteEndPoint{
        get {
            if(!this.HasProp("__remoteEndPoint"))
                this.__remoteEndPoint := RASTUNNELENDPOINT(312, this)
            return this.__remoteEndPoint
        }
    }

    /**
     * @type {Integer}
     */
    rasconnsubstate {
        get => NumGet(this, 336, "int")
        set => NumPut("int", value, this, 336)
    }
}
