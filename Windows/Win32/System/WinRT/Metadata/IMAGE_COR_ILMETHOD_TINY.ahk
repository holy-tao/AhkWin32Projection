#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMAGE_COR_ILMETHOD_TINY extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Flags_CodeSize {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
