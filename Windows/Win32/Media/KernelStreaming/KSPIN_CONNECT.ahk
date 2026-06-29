#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSPRIORITY.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPIN_CONNECT extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Interface {
        get {
            if(!this.HasProp("__Interface"))
                this.__Interface := KSIDENTIFIER(0, this)
            return this.__Interface
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    Medium {
        get {
            if(!this.HasProp("__Medium"))
                this.__Medium := KSIDENTIFIER(24, this)
            return this.__Medium
        }
    }

    /**
     * @type {Integer}
     */
    PinId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {HANDLE}
     */
    PinToHandle {
        get {
            if(!this.HasProp("__PinToHandle"))
                this.__PinToHandle := HANDLE(56, this)
            return this.__PinToHandle
        }
    }

    /**
     * @type {KSPRIORITY}
     */
    Priority {
        get {
            if(!this.HasProp("__Priority"))
                this.__Priority := KSPRIORITY(64, this)
            return this.__Priority
        }
    }
}
