#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_TABLE_SECTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulPrimarySectionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulSecondarySectionId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulcbSectionLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<UInt32>}
     */
    argbSectionData{
        get {
            if(!this.HasProp("__argbSectionDataProxyArray"))
                this.__argbSectionDataProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "uint")
            return this.__argbSectionDataProxyArray
        }
    }
}
