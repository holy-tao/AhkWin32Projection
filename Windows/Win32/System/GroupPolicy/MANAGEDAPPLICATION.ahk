#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The MANAGEDAPPLICATION structure contains information about an application. The function GetManagedApplications returns an array of MANAGEDAPPLICATION structures.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-managedapplication
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct MANAGEDAPPLICATION {
    #StructPack 8

    /**
     * The user-friendly name of the application.
     */
    pszPackageName : PWSTR

    /**
     * The name of the application's publisher.
     */
    pszPublisher : PWSTR

    /**
     * The major version number of the application.
     */
    dwVersionHi : UInt32

    /**
     * The minor version number of the application.
     */
    dwVersionLo : UInt32

    /**
     * The version number of the deployment. The version changes each time an application gets patched.
     */
    dwRevision : UInt32

    /**
     * The GUID of the GPO from which this application is deployed.
     */
    GpoId : Guid

    /**
     * The user-friendly name for the GPO from which this application is deployed.
     */
    pszPolicyName : PWSTR

    /**
     * If this application is installed by <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a>, this member is the ProductId GUID.
     */
    ProductId : Guid

    /**
     * The numeric language identifier that indicates the language version of the application. For a list of language numeric identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a> topic.
     */
    Language : UInt16

    /**
     * This member is unused.
     */
    pszOwner : PWSTR

    /**
     * This member is unused.
     */
    pszCompany : PWSTR

    /**
     * This member is unused.
     */
    pszComments : PWSTR

    /**
     * This member is unused.
     */
    pszContact : PWSTR

    /**
     * This member is unused.
     */
    pszSupportUrl : PWSTR

    dwPathType : UInt32

    /**
     * This parameter is <b>TRUE</b> if the application is currently installed and  is <b>FALSE</b> otherwise.
     */
    bInstalled : BOOL

}
