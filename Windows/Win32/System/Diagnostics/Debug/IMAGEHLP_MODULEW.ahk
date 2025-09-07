#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class IMAGEHLP_MODULEW extends Win32Struct
{
    static sizeof => 1116

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BaseOfImage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ImageSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumSyms {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    SymType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {String}
     */
    ModuleName {
        get => StrGet(this.ptr + 28, 31, "UTF-16")
        set => StrPut(value, this.ptr + 28, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    ImageName {
        get => StrGet(this.ptr + 92, 255, "UTF-16")
        set => StrPut(value, this.ptr + 92, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    LoadedImageName {
        get => StrGet(this.ptr + 604, 255, "UTF-16")
        set => StrPut(value, this.ptr + 604, 255, "UTF-16")
    }
}
