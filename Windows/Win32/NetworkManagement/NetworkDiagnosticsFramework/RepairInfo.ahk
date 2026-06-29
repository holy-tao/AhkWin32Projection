#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UiInfo.ahk" { UiInfo }
#Import ".\REPAIR_SCOPE.ahk" { REPAIR_SCOPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UI_INFO_TYPE.ahk" { UI_INFO_TYPE }
#Import ".\REPAIR_RISK.ahk" { REPAIR_RISK }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ShellCommandInfo.ahk" { ShellCommandInfo }

/**
 * The RepairInfo structure contains data required for a particular repair option.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-repairinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct RepairInfo {
    #StructPack 8

    /**
     * A unique GUID for this repair.
     */
    guid : Guid

    /**
     * A pointer to a null-terminated  string that contains the helper class name in a user-friendly way.
     */
    pwszClassName : PWSTR

    /**
     * A pointer to a null-terminated string that describes the repair in a user friendly way.
     */
    pwszDescription : PWSTR

    /**
     * One of the WELL_KNOWN_SID_TYPE if the repair requires certain user contexts or privileges.
     */
    sidType : UInt32

    /**
     * The number of seconds required to perform the repair.
     */
    cost : Int32

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
     */
    flags : UInt32

    /**
     * Reserved for future use.
     */
    scope : REPAIR_SCOPE

    /**
     * Reserved for future use.
     */
    risk : REPAIR_RISK

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-uiinfo">UiInfo</a> structure.
     */
    UiInfo : UiInfo

    rootCauseIndex : Int32

}
