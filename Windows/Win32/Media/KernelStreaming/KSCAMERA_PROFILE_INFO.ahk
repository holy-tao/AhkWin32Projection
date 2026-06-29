#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSCAMERA_PROFILE_PININFO.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_PROFILE_INFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Guid}
     */
    ProfileId {
        get {
            if(!this.HasProp("__ProfileId"))
                this.__ProfileId := Guid(0, this)
            return this.__ProfileId
        }
    }

    /**
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PinCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<KSCAMERA_PROFILE_PININFO>}
     */
    Pins {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
