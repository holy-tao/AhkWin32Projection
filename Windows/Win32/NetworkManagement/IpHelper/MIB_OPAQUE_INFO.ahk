#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information returned from a MIB opaque query.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_opaque_info
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_OPAQUE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The type of information returned.
     * @type {Integer}
     */
    dwId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ullAlign {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbyData{
        get {
            if(!this.HasProp("__rgbyDataProxyArray"))
                this.__rgbyDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__rgbyDataProxyArray
        }
    }
}
