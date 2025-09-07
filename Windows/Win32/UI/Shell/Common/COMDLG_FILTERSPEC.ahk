#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Used generically to filter elements.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-comdlg_filterspec
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class COMDLG_FILTERSPEC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the friendly name of the filter.
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
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the filter pattern.
     * @type {PWSTR}
     */
    pszSpec{
        get {
            if(!this.HasProp("__pszSpec"))
                this.__pszSpec := PWSTR(this.ptr + 8)
            return this.__pszSpec
        }
    }
}
