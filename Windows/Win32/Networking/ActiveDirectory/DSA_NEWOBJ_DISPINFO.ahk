#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the IDsAdminNewObjExt::Initialize method to supply additional data about an Active Directory Domain Services object creation wizard.
 * @see https://docs.microsoft.com/windows/win32/api//dsadmin/ns-dsadmin-dsa_newobj_dispinfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSA_NEWOBJ_DISPINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the structure. This member is used for versioning purposes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the handle  of the class icon for the object created.
     * @type {Pointer<Void>}
     */
    hObjClassIcon {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the title of the wizard.
     * @type {Pointer<Char>}
     */
    lpszWizTitle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the display name, or canonical name,  of the container the object is created in.
     * @type {Pointer<Char>}
     */
    lpszContDisplayName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
