#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_FPB_CAPABILITY extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<PCI_FPB_CAPABILITY_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PCI_FPB_CAPABILITIES_REGISTER>}
     */
    CapabilitiesRegister {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PCI_FPB_RID_VECTOR_CONTROL1_REGISTER>}
     */
    RidVectorControl1Register {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PCI_FPB_RID_VECTOR_CONTROL2_REGISTER>}
     */
    RidVectorControl2Register {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PCI_FPB_MEM_LOW_VECTOR_CONTROL_REGISTER>}
     */
    MemLowVectorControlRegister {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PCI_FPB_MEM_HIGH_VECTOR_CONTROL1_REGISTER>}
     */
    MemHighVectorControl1Register {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PCI_FPB_MEM_HIGH_VECTOR_CONTROL2_REGISTER>}
     */
    MemHighVectorControl2Register {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PCI_FPB_VECTOR_ACCESS_CONTROL_REGISTER>}
     */
    VectorAccessControlRegister {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PCI_FPB_VECTOR_ACCESS_DATA_REGISTER>}
     */
    VectorAccessDataRegister {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
