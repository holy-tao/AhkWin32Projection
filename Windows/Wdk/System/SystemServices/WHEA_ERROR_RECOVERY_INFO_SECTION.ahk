#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEA_RECOVERY_TYPE.ahk
#Include .\WHEA_RECOVERY_FAILURE_REASON.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_ERROR_RECOVERY_INFO_SECTION extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {BOOLEAN}
     */
    RecoveryKernel {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    RecoveryAction {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {WHEA_RECOVERY_TYPE}
     */
    RecoveryType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Irql {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * @type {BOOLEAN}
     */
    RecoverySucceeded {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * @type {WHEA_RECOVERY_FAILURE_REASON}
     */
    FailureReason {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    ProcessName {
        get {
            if(!this.HasProp("__ProcessNameProxyArray"))
                this.__ProcessNameProxyArray := Win32FixedArray(this.ptr + 28, 20, Primitive, "char")
            return this.__ProcessNameProxyArray
        }
    }
}
