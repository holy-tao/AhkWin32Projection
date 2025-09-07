#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_COR_ILMETHOD_FAT.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMAGE_COR_ILMETHOD extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Tiny {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {IMAGE_COR_ILMETHOD_FAT}
     */
    Fat{
        get {
            if(!this.HasProp("__Fat"))
                this.__Fat := IMAGE_COR_ILMETHOD_FAT(this.ptr + 0)
            return this.__Fat
        }
    }
}
