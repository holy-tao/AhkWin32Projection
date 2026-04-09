#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class VOLUME_CONTROL extends Win32Struct {
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    PortVolume {
        get {
            if(!this.HasProp("__PortVolumeProxyArray"))
                this.__PortVolumeProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__PortVolumeProxyArray
        }
    }
}
