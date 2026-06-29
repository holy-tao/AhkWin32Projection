#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The LOCALMANAGEDAPPLICATION structure describes a managed application installed for a user or a computer. Returned by the GetLocalManagedApplications function.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-localmanagedapplication
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct LOCALMANAGEDAPPLICATION {
    #StructPack 8

    /**
     * This is a Unicode string that gives the user friendly name of the application as it appears in the Application Deployment Editor (ADE).
     */
    pszDeploymentName : PWSTR

    /**
     * This is the user-friendly name of the group policy object (GPO) from which the application originates.
     */
    pszPolicyName : PWSTR

    /**
     * This is a Unicode string that gives the <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> product code GUID for the application.
     */
    pszProductId : PWSTR

    dwState : UInt32

}
