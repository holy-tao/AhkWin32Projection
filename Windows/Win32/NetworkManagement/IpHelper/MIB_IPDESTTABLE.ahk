#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPFORWARD_TYPE.ahk
#Include .\MIB_IPFORWARDROW.ahk
#Include .\MIB_IPDESTROW.ahk
#Include ..\..\Networking\WinSock\NL_ROUTE_PROTOCOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class MIB_IPDESTTABLE extends Win32Struct {
    static sizeof => 68

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MIB_IPDESTROW}
     */
    table {
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 4, 1, MIB_IPDESTROW, "")
            return this.__tableProxyArray
        }
    }
}
