#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG extends Win32Struct {
    static sizeof => 504

    static packingSize => 8

    /**
     * @type {Array<Integer>}
     */
    VersionSpecificData {
        get {
            if(!this.HasProp("__VersionSpecificDataProxyArray"))
                this.__VersionSpecificDataProxyArray := Win32FixedArray(this.ptr + 0, 494, Primitive, "char")
            return this.__VersionSpecificDataProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LogPageVersionNumber {
        get => NumGet(this, 494, "ushort")
        set => NumPut("ushort", value, this, 494)
    }

    /**
     * @type {Pointer}
     */
    LogPageGUID {
        get => NumGet(this, 496, "ptr")
        set => NumPut("ptr", value, this, 496)
    }
}
