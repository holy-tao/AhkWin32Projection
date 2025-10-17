#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_COR_ILMETHOD_TINY.ahk
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
     * @type {IMAGE_COR_ILMETHOD_TINY}
     */
    Tiny{
        get {
            if(!this.HasProp("__Tiny"))
                this.__Tiny := IMAGE_COR_ILMETHOD_TINY(0, this)
            return this.__Tiny
        }
    }

    /**
     * @type {IMAGE_COR_ILMETHOD_FAT}
     */
    Fat{
        get {
            if(!this.HasProp("__Fat"))
                this.__Fat := IMAGE_COR_ILMETHOD_FAT(0, this)
            return this.__Fat
        }
    }
}
