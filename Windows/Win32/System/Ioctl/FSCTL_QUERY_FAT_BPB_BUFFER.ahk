#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class FSCTL_QUERY_FAT_BPB_BUFFER extends Win32Struct {
    static sizeof => 36

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    First0x24BytesOfBootSector {
        get {
            if(!this.HasProp("__First0x24BytesOfBootSectorProxyArray"))
                this.__First0x24BytesOfBootSectorProxyArray := Win32FixedArray(this.ptr + 0, 36, Primitive, "char")
            return this.__First0x24BytesOfBootSectorProxyArray
        }
    }
}
