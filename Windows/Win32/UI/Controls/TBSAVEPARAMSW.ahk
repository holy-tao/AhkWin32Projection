#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Specifies the location in the registry where the TB_SAVERESTORE message stores and retrieves information about the state of a toolbar.
 * @remarks
 * 
  * > [!NOTE]
  * > The commctrl.h header defines TBSAVEPARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tbsaveparamsw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class TBSAVEPARAMSW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HKEY</a></b>
     * 
     * Handle to the registry key.
     * @type {HKEY}
     */
    hkr{
        get {
            if(!this.HasProp("__hkr"))
                this.__hkr := HKEY(this.ptr + 0)
            return this.__hkr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * Subkey name.
     * @type {PWSTR}
     */
    pszSubKey{
        get {
            if(!this.HasProp("__pszSubKey"))
                this.__pszSubKey := PWSTR(this.ptr + 8)
            return this.__pszSubKey
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * Value name.
     * @type {PWSTR}
     */
    pszValueName{
        get {
            if(!this.HasProp("__pszValueName"))
                this.__pszValueName := PWSTR(this.ptr + 16)
            return this.__pszValueName
        }
    }
}
