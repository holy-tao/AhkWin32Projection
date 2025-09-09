#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ACTIVE_NAMESPACE_ID_LIST extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
     */
    NSID{
        get {
            if(!this.HasProp("__NSIDProxyArray"))
                this.__NSIDProxyArray := Win32FixedArray(this.ptr + 0, 1024, Primitive, "uint")
            return this.__NSIDProxyArray
        }
    }
}
