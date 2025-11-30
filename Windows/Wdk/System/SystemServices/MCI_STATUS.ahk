#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MCI_STATUS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Pointer<MCI_STATUS_BITS_COMMON>}
     */
    CommonBits {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<MCI_STATUS_AMD_BITS>}
     */
    AmdBits {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<MCI_STATUS_INTEL_BITS>}
     */
    IntelBits {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    QuadPart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
