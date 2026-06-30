#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a component category.
 * @see https://learn.microsoft.com/windows/win32/api/comcat/ns-comcat-categoryinfo
 * @namespace Windows.Win32.System.Com
 */
class CATEGORYINFO extends Win32Struct {
    static sizeof => 276

    static packingSize => 4

    /**
     * The category identifier for the component.
     * @type {Guid}
     */
    catid {
        get {
            if(!this.HasProp("__catid"))
                this.__catid := Guid(0, this)
            return this.__catid
        }
    }

    /**
     * The locale identifier. See <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a>.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The description of the category (cannot exceed 128 characters).
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 20, 127, "UTF-16")
        set => StrPut(value, this.ptr + 20, 127, "UTF-16")
    }
}
