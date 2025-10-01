#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SUPPORTED_LOG_PAGES_LOG extends Win32Struct
{
    static sizeof => 1024

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
     */
    LogPageIdentifierSupported{
        get {
            if(!this.HasProp("__LogPageIdentifierSupportedProxyArray"))
                this.__LogPageIdentifierSupportedProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "uint")
            return this.__LogPageIdentifierSupportedProxyArray
        }
    }
}
