#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class REMOTE_LINK_TRACKING_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    TargetFileObject {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TargetLinkTrackingInformationLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    TargetLinkTrackingInformationBuffer{
        get {
            if(!this.HasProp("__TargetLinkTrackingInformationBufferProxyArray"))
                this.__TargetLinkTrackingInformationBufferProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__TargetLinkTrackingInformationBufferProxyArray
        }
    }
}
