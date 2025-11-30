#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_DPC_CAPABILITY extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Pointer<PCI_EXPRESS_ENHANCED_CAPABILITY_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_CAPS_REGISTER>}
     */
    DpcCapabilities {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_CONTROL_REGISTER>}
     */
    DpcControl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_STATUS_REGISTER>}
     */
    DpcStatus {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_ERROR_SOURCE_ID>}
     */
    DpcErrSrcId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_RP_PIO_STATUS_REGISTER>}
     */
    RpPioStatus {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_RP_PIO_MASK_REGISTER>}
     */
    RpPioMask {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_RP_PIO_SEVERITY_REGISTER>}
     */
    RpPioSeverity {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_RP_PIO_SYSERR_REGISTER>}
     */
    RpPioSysError {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_RP_PIO_EXCEPTION_REGISTER>}
     */
    RpPioException {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_RP_PIO_HEADERLOG_REGISTER>}
     */
    RpPioHeaderLog {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_RP_PIO_IMPSPECLOG_REGISTER>}
     */
    RpPioImpSpecLog {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DPC_RP_PIO_TLPPREFIXLOG_REGISTER>}
     */
    RpPioPrefixLog {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
