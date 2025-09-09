#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DVDCOPY_CHLGKEY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    ChlgKey{
        get {
            if(!this.HasProp("__ChlgKeyProxyArray"))
                this.__ChlgKeyProxyArray := Win32FixedArray(this.ptr + 0, 10, Primitive, "char")
            return this.__ChlgKeyProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 10, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
