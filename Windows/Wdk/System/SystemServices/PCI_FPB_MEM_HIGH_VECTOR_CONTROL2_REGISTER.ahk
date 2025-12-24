#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_FPB_MEM_HIGH_VECTOR_CONTROL2_REGISTER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MemHighVectorStartUpper {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
