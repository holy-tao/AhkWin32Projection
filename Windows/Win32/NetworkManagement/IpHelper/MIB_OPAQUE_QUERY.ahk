#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information for a MIB opaque query.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_opaque_query
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_OPAQUE_QUERY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The identifier of the MIB object to query.
     * @type {Integer}
     */
    dwVarId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The index of the MIB object to query.
     * @type {Array<UInt32>}
     */
    rgdwVarIndex{
        get {
            if(!this.HasProp("__rgdwVarIndexProxyArray"))
                this.__rgdwVarIndexProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__rgdwVarIndexProxyArray
        }
    }
}
