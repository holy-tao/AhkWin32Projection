#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MANAGEDAPPLICATION structure contains information about an application. The function GetManagedApplications returns an array of MANAGEDAPPLICATION structures.
 * @see https://docs.microsoft.com/windows/win32/api//appmgmt/ns-appmgmt-managedapplication
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class MANAGEDAPPLICATION extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The user-friendly name of the application.
     * @type {Pointer<Char>}
     */
    pszPackageName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The name of the application's publisher.
     * @type {Pointer<Char>}
     */
    pszPublisher {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The major version number of the application.
     * @type {Integer}
     */
    dwVersionHi {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The minor version number of the application.
     * @type {Integer}
     */
    dwVersionLo {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The version number of the deployment. The version changes each time an application gets patched.
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The GUID of the GPO from which this application is deployed.
     * @type {Pointer<Guid>}
     */
    GpoId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The user-friendly name for the GPO from which this application is deployed.
     * @type {Pointer<Char>}
     */
    pszPolicyName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * If this application is installed by <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a>, this member is the ProductId GUID.
     * @type {Pointer<Guid>}
     */
    ProductId {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The numeric language identifier that indicates the language version of the application. For a list of language numeric identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a> topic.
     * @type {Integer}
     */
    Language {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * This member is unused.
     * @type {Pointer<Char>}
     */
    pszOwner {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * This member is unused.
     * @type {Pointer<Char>}
     */
    pszCompany {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * This member is unused.
     * @type {Pointer<Char>}
     */
    pszComments {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * This member is unused.
     * @type {Pointer<Char>}
     */
    pszContact {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * This member is unused.
     * @type {Pointer<Char>}
     */
    pszSupportUrl {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * 
     * @type {Integer}
     */
    dwPathType {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * This parameter is <b>TRUE</b> if the application is currently installed and  is <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bInstalled {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }
}
