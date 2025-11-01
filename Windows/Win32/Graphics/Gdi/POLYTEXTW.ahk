#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The POLYTEXT structure describes how the PolyTextOut function should draw a string of text.
 * @remarks
 * 
  * > [!NOTE]
  * > The wingdi.h header defines POLYTEXT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-polytextw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset Unicode
 */
class POLYTEXTW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The horizontal reference point for the string. The string is aligned to this point using the current text-alignment mode.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The vertical reference point for the string. The string is aligned to this point using the current text-alignment mode.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <b>lpstr</b>.
     * @type {Integer}
     */
    n {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a string of text to be drawn by the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-polytextouta">PolyTextOut</a> function. This string need not be null-terminated, since <b>n</b> specifies the length of the string.
     * @type {PWSTR}
     */
    lpstr {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    uiFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A rectangle structure that contains the dimensions of the opaquing or clipping rectangle. This member is ignored if neither of the ETO_OPAQUE nor the ETO_CLIPPED value is specified for the <b>uiFlags</b> member.
     * @type {RECT}
     */
    rcl{
        get {
            if(!this.HasProp("__rcl"))
                this.__rcl := RECT(32, this)
            return this.__rcl
        }
    }

    /**
     * Pointer to an array containing the width value for each character in the string.
     * @type {Pointer<Integer>}
     */
    pdx {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
