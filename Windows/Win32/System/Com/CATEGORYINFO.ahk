#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a component category.
 * @see https://learn.microsoft.com/windows/win32/api/comcat/ns-comcat-categoryinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CATEGORYINFO extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * The category identifier for the component.
     * @type {Pointer<Guid>}
     */
    catid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The locale identifier. See <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a>.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The description of the category (cannot exceed 128 characters).
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 12, 127, "UTF-16")
        set => StrPut(value, this.ptr + 12, 127, "UTF-16")
    }
}
