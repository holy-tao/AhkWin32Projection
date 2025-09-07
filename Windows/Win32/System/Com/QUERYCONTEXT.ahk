#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CSPLATFORM.ahk

/**
 * Contains a list of attributes used to look up a class implementation.
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ns-wtypes-querycontext
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class QUERYCONTEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The execution context.
     * @type {Integer}
     */
    dwContext {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The operating system platform and processor architecture. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-csplatform">CSPLATFORM</a>.
     * @type {CSPLATFORM}
     */
    Platform{
        get {
            if(!this.HasProp("__Platform"))
                this.__Platform := CSPLATFORM(this.ptr + 8)
            return this.__Platform
        }
    }

    /**
     * The locale identifier. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a>.
     * @type {Integer}
     */
    Locale {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The high version number.
     * @type {Integer}
     */
    dwVersionHi {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The low version number.
     * @type {Integer}
     */
    dwVersionLo {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
