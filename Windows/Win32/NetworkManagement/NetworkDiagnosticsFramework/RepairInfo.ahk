#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ShellCommandInfo.ahk
#Include .\UiInfo.ahk

/**
 * The RepairInfo structure contains data required for a particular repair option.
 * @see https://docs.microsoft.com/windows/win32/api//ndattrib/ns-ndattrib-repairinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class RepairInfo extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * A unique GUID for this repair.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a null-terminated  string that contains the helper class name in a user-friendly way.
     * @type {PWSTR}
     */
    pwszClassName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated string that describes the repair in a user friendly way.
     * @type {PWSTR}
     */
    pwszDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * One of the WELL_KNOWN_SID_TYPE if the repair requires certain user contexts or privileges.
     * @type {Integer}
     */
    sidType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of seconds required to perform the repair.
     * @type {Integer}
     */
    cost {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Additional information about the repair.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_WORKAROUND"></a><a id="rf_workaround"></a><dl>
     * <dt><b>RF_WORKAROUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the repair is a workaround for the issue.  For example, sometimes resetting a network interface solves intermittent problems, but does not directly address a specific issue, so it is considered a workaround.  NDF will show non-workarounds to the user before workarounds.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_USER_ACTION"></a><a id="rf_user_action"></a><dl>
     * <dt><b>RF_USER_ACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the repair prompts the user to perform a manual task outside of NDF.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_USER_CONFIRMATION"></a><a id="rf_user_confirmation"></a><dl>
     * <dt><b>RF_USER_CONFIRMATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the repair should not be automatically performed.  The user is instead prompted to select the repair.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_INFORMATION_ONLY"></a><a id="rf_information_only"></a><dl>
     * <dt><b>RF_INFORMATION_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the repair consists of actionable information for the user.  Repair and validation sessions do not occur for information-only repairs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_VALIDATE_HELPTOPIC"></a><a id="rf_validate_helptopic"></a><dl>
     * <dt><b>RF_VALIDATE_HELPTOPIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the repair provides information to the user as well as a help topic. Unlike <b>RF_INFORMATION_ONLY</b> repairs, which cannot be validated, this repair can be executed and validated within a diagnostic session.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 7, Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_REPRO"></a><a id="rf_repro"></a><dl>
     * <dt><b>RF_REPRO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the repair prompts the user to reproduce their problem. At the same time, the helper class may have enabled more detailed logging or other background mechanisms to help detect the failure.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 7, Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_CONTACT_ADMIN"></a><a id="rf_contact_admin"></a><dl>
     * <dt><b>RF_CONTACT_ADMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the repair prompts the user to contact their network administrator in order to resolve the problem.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 7, Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_RESERVED"></a><a id="rf_reserved"></a><dl>
     * <dt><b>RF_RESERVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved for system use.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 7, Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_RESERVED_CA"></a><a id="rf_reserved_ca"></a><dl>
     * <dt><b>RF_RESERVED_CA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved for system use.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 7, Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RF_RESERVED_LNI"></a><a id="rf_reserved_lni"></a><dl>
     * <dt><b>RF_RESERVED_LNI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved for system use.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 7, Windows Server 2008 R2, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    scope {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    risk {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-uiinfo">UiInfo</a> structure.
     * @type {UiInfo}
     */
    UiInfo{
        get {
            if(!this.HasProp("__UiInfo"))
                this.__UiInfo := UiInfo(48, this)
            return this.__UiInfo
        }
    }

    /**
     * 
     * @type {Integer}
     */
    rootCauseIndex {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }
}
