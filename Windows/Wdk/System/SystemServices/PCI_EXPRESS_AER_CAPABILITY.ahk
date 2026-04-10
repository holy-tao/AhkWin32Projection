#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_AER_CAPABILITY extends Win32Struct {
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    UncorrectableErrorStatus {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    UncorrectableErrorMask {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    UncorrectableErrorSeverity {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    CorrectableErrorStatus {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    CorrectableErrorMask {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    CapabilitiesAndControl {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Array<Integer>}
     */
    HeaderLog {
        get {
            if(!this.HasProp("__HeaderLogProxyArray"))
                this.__HeaderLogProxyArray := Win32FixedArray(this.ptr + 56, 4, Primitive, "uint")
            return this.__HeaderLogProxyArray
        }
    }

    /**
     * @type {Pointer}
     */
    SecUncorrectableErrorStatus {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    SecUncorrectableErrorMask {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer}
     */
    SecUncorrectableErrorSeverity {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    SecCapabilitiesAndControl {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Array<Integer>}
     */
    SecHeaderLog {
        get {
            if(!this.HasProp("__SecHeaderLogProxyArray"))
                this.__SecHeaderLogProxyArray := Win32FixedArray(this.ptr + 104, 4, Primitive, "uint")
            return this.__SecHeaderLogProxyArray
        }
    }
}
