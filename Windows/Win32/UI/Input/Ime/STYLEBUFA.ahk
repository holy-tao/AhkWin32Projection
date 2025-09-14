#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The STYLEBUFA (ANSI) structure (immdev.h) contains the identifier and name of a style.
 * @remarks
 * > [!NOTE]
  * > The immdev.h header defines STYLEBUF as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-stylebufa
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 * @charset ANSI
 */
class STYLEBUFA extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Style of the register string. Can be IME_REGWORD_STYLE_EUDC to indicate a string in the EUDC range.
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Description of the style.
     * @type {Array<SByte>}
     */
    szDescription{
        get {
            if(!this.HasProp("__szDescriptionProxyArray"))
                this.__szDescriptionProxyArray := Win32FixedArray(this.ptr + 4, 32, Primitive, "char")
            return this.__szDescriptionProxyArray
        }
    }
}
