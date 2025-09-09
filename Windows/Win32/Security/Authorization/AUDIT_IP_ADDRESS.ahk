#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUDIT_IP_ADDRESS extends Win32Struct
{
    static sizeof => 128

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    pIpAddress{
        get {
            if(!this.HasProp("__pIpAddressProxyArray"))
                this.__pIpAddressProxyArray := Win32FixedArray(this.ptr + 0, 128, Primitive, "char")
            return this.__pIpAddressProxyArray
        }
    }
}
