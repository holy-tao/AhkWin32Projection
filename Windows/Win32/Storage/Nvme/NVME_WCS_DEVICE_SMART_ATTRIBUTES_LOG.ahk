#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG extends Win32Struct {
    static sizeof => 512

    static packingSize => 4

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
     * @type {Guid}
     */
    LogPageGUID {
        get {
            if(!this.HasProp("__LogPageGUID"))
                this.__LogPageGUID := Guid(496, this)
            return this.__LogPageGUID
        }
    }
}
