#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSCAMERA_PROFILE_MEDIAINFO.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_PROFILE_PININFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Guid}
     */
    PinCategory {
        get {
            if(!this.HasProp("__PinCategory"))
                this.__PinCategory := Guid(0, this)
            return this.__PinCategory
        }
    }

    /**
     * @type {Integer}
     */
    PinIndex {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ProfileSensorType {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MediaInfoCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<KSCAMERA_PROFILE_MEDIAINFO>}
     */
    MediaInfos {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
