#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FEATURE_HOST_IDENTIFIER_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    HOSTID{
        get {
            if(!this.HasProp("__HOSTIDProxyArray"))
                this.__HOSTIDProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__HOSTIDProxyArray
        }
    }
}
