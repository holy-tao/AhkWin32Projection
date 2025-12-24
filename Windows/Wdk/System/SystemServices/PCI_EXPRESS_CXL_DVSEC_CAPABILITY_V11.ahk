#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_CXL_DVSEC_CAPABILITY_V11 extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {Pointer<PCI_EXPRESS_ENHANCED_CAPABILITY_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DESIGNATED_VENDOR_SPECIFIC_HEADER_1>}
     */
    DvsecHeader1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_DESIGNATED_VENDOR_SPECIFIC_HEADER_2>}
     */
    DvsecHeader2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_CAPABILITY_REGISTER_V11>}
     */
    Capability {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_CONTROL_REGISTER>}
     */
    Control {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_STATUS_REGISTER>}
     */
    Status {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Control2 {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Status2 {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_LOCK_REGISTER>}
     */
    Lock {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_RANGE_SIZE_HIGH_REGISTER>}
     */
    Range1SizeHigh {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_RANGE_SIZE_LOW_REGISTER_V11>}
     */
    Range1SizeLow {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_RANGE_BASE_HIGH_REGISTER>}
     */
    Range1BaseHigh {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_RANGE_BASE_LOW_REGISTER>}
     */
    Range1BaseLow {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_RANGE_SIZE_HIGH_REGISTER>}
     */
    Range2SizeHigh {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_RANGE_SIZE_LOW_REGISTER_V11>}
     */
    Range2SizeLow {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_RANGE_BASE_HIGH_REGISTER>}
     */
    Range2BaseHigh {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_CXL_DVSEC_RANGE_BASE_LOW_REGISTER>}
     */
    Range2BaseLow {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
