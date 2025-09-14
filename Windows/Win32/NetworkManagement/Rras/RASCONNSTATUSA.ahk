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
    static sizeof => 312

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
     * @type {Array<SByte>}
     */
    szDeviceType{
        get {
            if(!this.HasProp("__szDeviceTypeProxyArray"))
                this.__szDeviceTypeProxyArray := Win32FixedArray(this.ptr + 12, 17, Primitive, "char")
            return this.__szDeviceTypeProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDeviceName{
        get {
            if(!this.HasProp("__szDeviceNameProxyArray"))
                this.__szDeviceNameProxyArray := Win32FixedArray(this.ptr + 29, 129, Primitive, "char")
            return this.__szDeviceNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szPhoneNumber{
        get {
            if(!this.HasProp("__szPhoneNumberProxyArray"))
                this.__szPhoneNumberProxyArray := Win32FixedArray(this.ptr + 158, 129, Primitive, "char")
            return this.__szPhoneNumberProxyArray
        }
    }

    /**
     * @type {RASTUNNELENDPOINT}
     */
    localEndPoint{
        get {
            if(!this.HasProp("__localEndPoint"))
                this.__localEndPoint := RASTUNNELENDPOINT(this.ptr + 288)
            return this.__localEndPoint
        }
    }

    /**
     * @type {RASTUNNELENDPOINT}
     */
    remoteEndPoint{
        get {
            if(!this.HasProp("__remoteEndPoint"))
                this.__remoteEndPoint := RASTUNNELENDPOINT(this.ptr + 296)
            return this.__remoteEndPoint
        }
    }

    /**
     * @type {Integer}
     */
    rasconnsubstate {
        get => NumGet(this, 304, "int")
        set => NumPut("int", value, this, 304)
    }
}
