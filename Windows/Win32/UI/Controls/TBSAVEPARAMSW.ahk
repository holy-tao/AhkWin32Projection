#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Specifies the location in the registry where the TB_SAVERESTORE message stores and retrieves information about the state of a toolbar. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines TBSAVEPARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tbsaveparamsw
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct TBSAVEPARAMSW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HKEY</a></b>
     * 
     * Handle to the registry key.
     */
    hkr : HKEY

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * Subkey name.
     */
    pszSubKey : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * Value name.
     */
    pszValueName : PWSTR

}
