#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_EPILOGUE_DYNAMIC_RELOCATION_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * @type {Integer}
     */
    EpilogueCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EpilogueByteCount {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    BranchDescriptorElementSize {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    BranchDescriptorCount {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
