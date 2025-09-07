#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FEATURE_HOST_METADATA_DATA extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 1

    /**
     * @type {Integer}
     */
    NumberOfMetadataElementDescriptors {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Array<Byte>}
     */
    MetadataElementDescriptors{
        get {
            if(!this.HasProp("__MetadataElementDescriptorsProxyArray"))
                this.__MetadataElementDescriptorsProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__MetadataElementDescriptorsProxyArray
        }
    }
}
