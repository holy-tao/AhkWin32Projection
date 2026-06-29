#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSCAMERA_PROFILE_INFO.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_PROFILE_CONCURRENCYINFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Guid}
     */
    ReferenceGuid {
        get {
            if(!this.HasProp("__ReferenceGuid"))
                this.__ReferenceGuid := Guid(0, this)
            return this.__ReferenceGuid
        }
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
    ProfileCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<KSCAMERA_PROFILE_INFO>}
     */
    Profiles {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
