#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LOCALMANAGEDAPPLICATION structure describes a managed application installed for a user or a computer. Returned by the GetLocalManagedApplications function.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-localmanagedapplication
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class LOCALMANAGEDAPPLICATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * This is a Unicode string that gives the user friendly name of the application as it appears in the Application Deployment Editor (ADE).
     * @type {Pointer<Char>}
     */
    pszDeploymentName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * This is the user-friendly name of the group policy object (GPO) from which the application originates.
     * @type {Pointer<Char>}
     */
    pszPolicyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This is a Unicode string that gives the <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> product code GUID for the application.
     * @type {Pointer<Char>}
     */
    pszProductId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
