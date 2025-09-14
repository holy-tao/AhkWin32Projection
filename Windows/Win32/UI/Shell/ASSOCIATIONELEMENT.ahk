#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines information used by AssocCreateForClasses to retrieve an IQueryAssociations interface for a given file association.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-associationelement
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ASSOCIATIONELEMENT extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * Type: <b>ASSOCCLASS</b>
     * @type {Integer}
     */
    ac {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>HKEY</b>
     * 
     * A registry key that specifies a class that contains association information.
     * @type {Pointer<HKEY>}
     */
    hkClass {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * Type: <b>PCWSTR</b>
     * 
     * A pointer to the name of a class that contains association information.
     * @type {Pointer<PWSTR>}
     */
    pszClass {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }
}
