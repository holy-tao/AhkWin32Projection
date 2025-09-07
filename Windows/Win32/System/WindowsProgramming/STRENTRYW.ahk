#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Represents a registry string replacement. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The advpub.h header defines STRENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/advpub/ns-advpub-strentryw
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset Unicode
 */
class STRENTRYW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The name of the string to substitute.
     * @type {PWSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PWSTR(this.ptr + 0)
            return this.__pszName
        }
    }

    /**
     * The replacement string.
     * @type {PWSTR}
     */
    pszValue{
        get {
            if(!this.HasProp("__pszValue"))
                this.__pszValue := PWSTR(this.ptr + 8)
            return this.__pszValue
        }
    }
}
