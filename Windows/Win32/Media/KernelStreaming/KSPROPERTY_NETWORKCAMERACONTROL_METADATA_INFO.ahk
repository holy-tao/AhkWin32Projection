#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_NETWORKCAMERACONTROL_METADATA_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MetadataItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    PTZStatus{
        get {
            if(!this.HasProp("__PTZStatus"))
                this.__PTZStatus := BOOL(this.ptr + 8)
            return this.__PTZStatus
        }
    }

    /**
     * @type {BOOL}
     */
    Events{
        get {
            if(!this.HasProp("__Events"))
                this.__Events := BOOL(this.ptr + 12)
            return this.__Events
        }
    }

    /**
     * @type {BOOL}
     */
    Analytics{
        get {
            if(!this.HasProp("__Analytics"))
                this.__Analytics := BOOL(this.ptr + 16)
            return this.__Analytics
        }
    }

    /**
     * @type {BOOL}
     */
    Reserved{
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := BOOL(this.ptr + 20)
            return this.__Reserved
        }
    }
}
