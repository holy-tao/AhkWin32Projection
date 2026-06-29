#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used with the IDsAdminNewObjExt::Initialize method to supply additional data about an Active Directory Domain Services object creation wizard.
 * @see https://learn.microsoft.com/windows/win32/api/dsadmin/ns-dsadmin-dsa_newobj_dispinfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSA_NEWOBJ_DISPINFO {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the structure. This member is used for versioning purposes.
     */
    dwSize : UInt32

    /**
     * Contains the handle  of the class icon for the object created.
     */
    hObjClassIcon : HICON

    /**
     * Pointer to a null-terminated Unicode string that contains the title of the wizard.
     */
    lpszWizTitle : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the display name, or canonical name,  of the container the object is created in.
     */
    lpszContDisplayName : PWSTR

}
