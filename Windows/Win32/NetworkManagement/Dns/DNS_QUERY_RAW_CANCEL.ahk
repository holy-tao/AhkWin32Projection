#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_QUERY_RAW_CANCEL extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Array<SByte>}
     */
    reserved{
        get {
            if(!this.HasProp("__reservedProxyArray"))
                this.__reservedProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__reservedProxyArray
        }
    }
}
