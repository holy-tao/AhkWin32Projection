#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\FONTSIGNATURE.ahk

/**
 * Contains information about a character set.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-charsetinfo
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class CHARSETINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Character set value.
     * @type {Integer}
     */
    ciCharset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Windows ANSI code page identifier. For a list of identifiers, see <a href="https://docs.microsoft.com/windows/desktop/Intl/code-page-identifiers">Code Page Identifiers</a>.
     * @type {Integer}
     */
    ciACP {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-fontsignature">FONTSIGNATURE</a> structure that identifies the Unicode subrange and the specific Windows ANSI character set/code page. Only one code page will be set when this structure is set by the function.
     * @type {FONTSIGNATURE}
     */
    fs{
        get {
            if(!this.HasProp("__fs"))
                this.__fs := FONTSIGNATURE(8, this)
            return this.__fs
        }
    }
}
