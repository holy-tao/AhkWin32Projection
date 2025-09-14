#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The REGISTERWORDW (Unicode) structure (immdev.h) contains reading information or a word to register.
 * @remarks
 * The application can pass this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immconfigureimea">ImmConfigureIME</a> function to have the information or word appear as an initial value in the configuration dialog box for the IME.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The immdev.h header defines REGISTERWORD as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-registerwordw
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 * @charset Unicode
 */
class REGISTERWORDW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to the reading information for the word to register. If the reading information is not needed, the member can be set to <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    lpReading {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the word to register. If a word is not needed, the member can be set to <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    lpWord {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
