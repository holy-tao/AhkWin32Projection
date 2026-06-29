#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ASSOCCLASS.ahk" { ASSOCCLASS }

/**
 * Defines information used by AssocCreateForClasses to retrieve an IQueryAssociations interface for a given file association.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-associationelement
 * @namespace Windows.Win32.UI.Shell
 * @architecture X64, Arm64
 */
export default struct ASSOCIATIONELEMENT {
    #StructPack 8

    /**
     * Type: <b>ASSOCCLASS</b>
     */
    ac : ASSOCCLASS

    /**
     * Type: <b>HKEY</b>
     * 
     * A registry key that specifies a class that contains association information.
     */
    hkClass : HKEY

    /**
     * Type: <b>PCWSTR</b>
     * 
     * A pointer to the name of a class that contains association information.
     */
    pszClass : PWSTR

}
