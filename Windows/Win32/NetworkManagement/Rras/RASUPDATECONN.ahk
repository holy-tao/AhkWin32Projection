#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\RASTUNNELENDPOINT.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASUPDATECONN extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {RASTUNNELENDPOINT}
     */
    localEndPoint{
        get {
            if(!this.HasProp("__localEndPoint"))
                this.__localEndPoint := RASTUNNELENDPOINT(16, this)
            return this.__localEndPoint
        }
    }

    /**
     * @type {RASTUNNELENDPOINT}
     */
    remoteEndPoint{
        get {
            if(!this.HasProp("__remoteEndPoint"))
                this.__remoteEndPoint := RASTUNNELENDPOINT(36, this)
            return this.__remoteEndPoint
        }
    }
}
