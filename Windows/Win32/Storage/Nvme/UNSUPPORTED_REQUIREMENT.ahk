#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class UNSUPPORTED_REQUIREMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    ReqId{
        get {
            if(!this.HasProp("__ReqIdProxyArray"))
                this.__ReqIdProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ReqIdProxyArray
        }
    }
}
