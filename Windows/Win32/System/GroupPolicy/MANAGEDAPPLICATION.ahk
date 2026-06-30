#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The MANAGEDAPPLICATION structure contains information about an application. The function GetManagedApplications returns an array of MANAGEDAPPLICATION structures.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-managedapplication
 * @namespace Windows.Win32.System.GroupPolicy
 */
class MANAGEDAPPLICATION extends Win32Struct {
    static sizeof => 128

    static packingSize => 8

    /**
     * The user-friendly name of the application.
     * @type {PWSTR}
     */
    pszPackageName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The name of the application's publisher.
     * @type {PWSTR}
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
     * @type {Guid}
     */
    GpoId {
        get {
            if(!this.HasProp("__GpoId"))
                this.__GpoId := Guid(28, this)
            return this.__GpoId
        }
    }

    /**
     * The user-friendly name for the GPO from which this application is deployed.
     * @type {PWSTR}
     */
    pszPolicyName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * If this application is installed by <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a>, this member is the ProductId GUID.
     * @type {Guid}
     */
    ProductId {
        get {
            if(!this.HasProp("__ProductId"))
                this.__ProductId := Guid(56, this)
            return this.__ProductId
        }
    }

    /**
     * The numeric language identifier that indicates the language version of the application. For a list of language numeric identifiers, see the <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a> topic.
     * @type {Integer}
     */
    Language {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * This member is unused.
     * @type {PWSTR}
     */
    pszOwner {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * This member is unused.
     * @type {PWSTR}
     */
    pszCompany {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * This member is unused.
     * @type {PWSTR}
     */
    pszComments {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * This member is unused.
     * @type {PWSTR}
     */
    pszContact {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * This member is unused.
     * @type {PWSTR}
     */
    pszSupportUrl {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    dwPathType {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * This parameter is <b>TRUE</b> if the application is currently installed and  is <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    bInstalled {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }
}
