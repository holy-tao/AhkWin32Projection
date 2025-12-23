#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPV6_OPTION_HEADER.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPV6_OPTION_ROUTER_ALERT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {IPV6_OPTION_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := IPV6_OPTION_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Value{
        get {
            if(!this.HasProp("__ValueProxyArray"))
                this.__ValueProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "char")
            return this.__ValueProxyArray
        }
    }
}
