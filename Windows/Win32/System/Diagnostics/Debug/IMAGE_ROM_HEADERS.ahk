#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_FILE_HEADER.ahk
#Include .\IMAGE_ROM_OPTIONAL_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_ROM_HEADERS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {IMAGE_FILE_HEADER}
     */
    FileHeader{
        get {
            if(!this.HasProp("__FileHeader"))
                this.__FileHeader := IMAGE_FILE_HEADER(this.ptr + 0)
            return this.__FileHeader
        }
    }

    /**
     * @type {IMAGE_ROM_OPTIONAL_HEADER}
     */
    OptionalHeader{
        get {
            if(!this.HasProp("__OptionalHeader"))
                this.__OptionalHeader := IMAGE_ROM_OPTIONAL_HEADER(this.ptr + 24)
            return this.__OptionalHeader
        }
    }
}
