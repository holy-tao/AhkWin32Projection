#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The MANAGEDAPPLICATION structure contains information about an application. The function GetManagedApplications returns an array of MANAGEDAPPLICATION structures.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-managedapplication
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class MANAGEDAPPLICATION extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The user-friendly name of the application.
     * @type {PWSTR}
     */
    pszPackageName{
        get {
            if(!this.HasProp("__pszPackageName"))
                this.__pszPackageName := PWSTR(this.ptr + 0)
            return this.__pszPackageName
        }
    }

    /**
     * The name of the application's publisher.
     * @type {PWSTR}
     */
    pszPublisher{
        get {
            if(!this.HasProp("__pszPublisher"))
                this.__pszPublisher := PWSTR(this.ptr + 8)
            return this.__pszPublisher
        }
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
     * @type {PWSTR}
     */
    pszPolicyName{
        get {
            if(!this.HasProp("__pszPolicyName"))
                this.__pszPolicyName := PWSTR(this.ptr + 40)
            return this.__pszPolicyName
        }
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
     * @type {PWSTR}
     */
    pszOwner{
        get {
            if(!this.HasProp("__pszOwner"))
                this.__pszOwner := PWSTR(this.ptr + 64)
            return this.__pszOwner
        }
    }

    /**
     * This member is unused.
     * @type {PWSTR}
     */
    pszCompany{
        get {
            if(!this.HasProp("__pszCompany"))
                this.__pszCompany := PWSTR(this.ptr + 72)
            return this.__pszCompany
        }
    }

    /**
     * This member is unused.
     * @type {PWSTR}
     */
    pszComments{
        get {
            if(!this.HasProp("__pszComments"))
                this.__pszComments := PWSTR(this.ptr + 80)
            return this.__pszComments
        }
    }

    /**
     * This member is unused.
     * @type {PWSTR}
     */
    pszContact{
        get {
            if(!this.HasProp("__pszContact"))
                this.__pszContact := PWSTR(this.ptr + 88)
            return this.__pszContact
        }
    }

    /**
     * This member is unused.
     * @type {PWSTR}
     */
    pszSupportUrl{
        get {
            if(!this.HasProp("__pszSupportUrl"))
                this.__pszSupportUrl := PWSTR(this.ptr + 96)
            return this.__pszSupportUrl
        }
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
