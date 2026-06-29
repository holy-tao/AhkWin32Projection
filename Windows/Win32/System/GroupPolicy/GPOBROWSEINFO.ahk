#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\GROUP_POLICY_HINT_TYPE.ahk" { GROUP_POLICY_HINT_TYPE }
#Import ".\GROUP_POLICY_OBJECT_TYPE.ahk" { GROUP_POLICY_OBJECT_TYPE }

/**
 * The GPOBROWSEINFO structure contains information that the BrowseForGPO function uses to initialize a GPO browser dialog box. After the user closes the dialog box, the system returns information about the user's actions in this structure.
 * @see https://learn.microsoft.com/windows/win32/api/gpedit/ns-gpedit-gpobrowseinfo
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPOBROWSEINFO {
    #StructPack 8

    /**
     * Specifies the size of the structure, in bytes.
     */
    dwSize : UInt32

    dwFlags : UInt32

    /**
     * Specifies the handle to the parent window. If this member is <b>NULL</b>, the dialog box has no owner.
     */
    hwndOwner : HWND

    /**
     * Specifies the title bar text. If this member is <b>NULL</b>, the title bar text is <b>Browse for a Group Policy Object</b>.
     */
    lpTitle : PWSTR

    /**
     * Specifies the initial domain or organizational unit.
     */
    lpInitialOU : PWSTR

    /**
     * Pointer to a buffer that receives the Active Directory path of the GPO.
     */
    lpDSPath : PWSTR

    /**
     * Specifies the size, in characters, of the <b>lpDSPath</b> buffer.
     */
    dwDSPathSize : UInt32

    /**
     * Pointer to a buffer that receives either the computer name or the friendly (display) name of the GPO. If the user opens or creates a GPO in the <b>Computers</b> tab, this member contains the computer name. If the user opens or creates a GPO in the Active Directory, this member contains the friendly name. To determine the GPO type, see the description for the <b>gpoType</b> member.
     * 
     * This member can be <b>NULL</b>.
     */
    lpName : PWSTR

    /**
     * Specifies the size, in characters, of the <b>lpName</b> buffer.
     */
    dwNameSize : UInt32

    gpoType : GROUP_POLICY_OBJECT_TYPE

    gpoHint : GROUP_POLICY_HINT_TYPE

}
