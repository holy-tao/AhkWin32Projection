#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\KSPRIORITY.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPIN_CONNECT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Interface{
        get {
            if(!this.HasProp("__Interface"))
                this.__Interface := KSIDENTIFIER(0, this)
            return this.__Interface
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    Medium{
        get {
            if(!this.HasProp("__Medium"))
                this.__Medium := KSIDENTIFIER(16, this)
            return this.__Medium
        }
    }

    /**
     * @type {Integer}
     */
    PinId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {HANDLE}
     */
    PinToHandle{
        get {
            if(!this.HasProp("__PinToHandle"))
                this.__PinToHandle := HANDLE(40, this)
            return this.__PinToHandle
        }
    }

    /**
     * @type {KSPRIORITY}
     */
    Priority{
        get {
            if(!this.HasProp("__Priority"))
                this.__Priority := KSPRIORITY(48, this)
            return this.__Priority
        }
    }
}
