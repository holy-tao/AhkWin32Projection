#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_STORAGE extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ss_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    __ss_pad1{
        get {
            if(!this.HasProp("____ss_pad1ProxyArray"))
                this.____ss_pad1ProxyArray := Win32FixedArray(this.ptr + 2, 6, Primitive, "char")
            return this.____ss_pad1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    __ss_align {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Array<SByte>}
     */
    __ss_pad2{
        get {
            if(!this.HasProp("____ss_pad2ProxyArray"))
                this.____ss_pad2ProxyArray := Win32FixedArray(this.ptr + 16, 112, Primitive, "char")
            return this.____ss_pad2ProxyArray
        }
    }
}
