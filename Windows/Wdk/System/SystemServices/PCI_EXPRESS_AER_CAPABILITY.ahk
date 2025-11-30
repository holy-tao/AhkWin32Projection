#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_AER_CAPABILITY extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Pointer<PCI_EXPRESS_ENHANCED_CAPABILITY_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_UNCORRECTABLE_ERROR_STATUS>}
     */
    UncorrectableErrorStatus {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_UNCORRECTABLE_ERROR_MASK>}
     */
    UncorrectableErrorMask {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_UNCORRECTABLE_ERROR_SEVERITY>}
     */
    UncorrectableErrorSeverity {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CORRECTABLE_ERROR_STATUS>}
     */
    CorrectableErrorStatus {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CORRECTABLE_ERROR_MASK>}
     */
    CorrectableErrorMask {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_AER_CAPABILITIES>}
     */
    CapabilitiesAndControl {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Array<UInt32>}
     */
    HeaderLog{
        get {
            if(!this.HasProp("__HeaderLogProxyArray"))
                this.__HeaderLogProxyArray := Win32FixedArray(this.ptr + 56, 4, Primitive, "uint")
            return this.__HeaderLogProxyArray
        }
    }

    /**
     * @type {Pointer<PCI_EXPRESS_SEC_UNCORRECTABLE_ERROR_STATUS>}
     */
    SecUncorrectableErrorStatus {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_SEC_UNCORRECTABLE_ERROR_MASK>}
     */
    SecUncorrectableErrorMask {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_SEC_UNCORRECTABLE_ERROR_SEVERITY>}
     */
    SecUncorrectableErrorSeverity {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_SEC_AER_CAPABILITIES>}
     */
    SecCapabilitiesAndControl {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Array<UInt32>}
     */
    SecHeaderLog{
        get {
            if(!this.HasProp("__SecHeaderLogProxyArray"))
                this.__SecHeaderLogProxyArray := Win32FixedArray(this.ptr + 104, 4, Primitive, "uint")
            return this.__SecHeaderLogProxyArray
        }
    }
}
