#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSPRIORITY.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPIN_CONNECT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Interface{
        get {
            if(!this.HasProp("__Interface"))
                this.__Interface := KSIDENTIFIER(this.ptr + 0)
            return this.__Interface
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    Medium{
        get {
            if(!this.HasProp("__Medium"))
                this.__Medium := KSIDENTIFIER(this.ptr + 8)
            return this.__Medium
        }
    }

    /**
     * @type {Integer}
     */
    PinId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    PinToHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {KSPRIORITY}
     */
    Priority{
        get {
            if(!this.HasProp("__Priority"))
                this.__Priority := KSPRIORITY(this.ptr + 32)
            return this.__Priority
        }
    }
}
