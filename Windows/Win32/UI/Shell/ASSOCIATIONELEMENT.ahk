#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {HKEY}
     */
    hkClass{
        get {
            if(!this.HasProp("__hkClass"))
                this.__hkClass := HKEY(this.ptr + 4)
            return this.__hkClass
        }
    }

    /**
     * Type: <b>PCWSTR</b>
     * 
     * A pointer to the name of a class that contains association information.
     * @type {PWSTR}
     */
    pszClass{
        get {
            if(!this.HasProp("__pszClass"))
                this.__pszClass := PWSTR(this.ptr + 12)
            return this.__pszClass
        }
    }
}
