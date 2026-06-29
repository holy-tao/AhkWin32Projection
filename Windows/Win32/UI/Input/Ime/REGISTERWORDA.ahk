#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The REGISTERWORDA (ANSI) structure (immdev.h) contains reading information or a word to register.
 * @remarks
 * The application can pass this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immconfigureimea">ImmConfigureIME</a> function to have the information or word appear as an initial value in the configuration dialog box for the IME.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines REGISTERWORD as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-registerworda
 * @namespace Windows.Win32.UI.Input.Ime
 * @charset ANSI
 */
export default struct REGISTERWORDA {
    #StructPack 8

    /**
     * Pointer to the reading information for the word to register. If the reading information is not needed, the member can be set to <b>NULL</b>.
     */
    lpReading : PSTR

    /**
     * Pointer to the word to register. If a word is not needed, the member can be set to <b>NULL</b>.
     */
    lpWord : PSTR

}
