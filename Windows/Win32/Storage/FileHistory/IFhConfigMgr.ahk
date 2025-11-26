#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFhScopeIterator.ahk
#Include .\IFhTarget.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFhConfigMgr interface allows client applications to read and modify the File History configuration for the user account under which the methods of this interface are called.
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nn-fhcfg-ifhconfigmgr
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class IFhConfigMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFhConfigMgr
     * @type {Guid}
     */
    static IID => Guid("{6a5fea5b-bf8f-4ee5-b8c3-44d8a0d7331c}")

    /**
     * The class identifier for FhConfigMgr
     * @type {Guid}
     */
    static CLSID => Guid("{ed43bb3c-09e9-498a-9df6-2177244c6db4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadConfiguration", "CreateDefaultConfiguration", "SaveConfiguration", "AddRemoveExcludeRule", "GetIncludeExcludeRules", "GetLocalPolicy", "SetLocalPolicy", "GetBackupStatus", "SetBackupStatus", "GetDefaultTarget", "ValidateTarget", "ProvisionAndSetNewTarget", "ChangeDefaultTargetRecommendation", "QueryProtectionStatus"]

    /**
     * Loads the File History configuration information for the current user into an FhConfigMgr object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code such as one of the values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-loadconfiguration
     */
    LoadConfiguration() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Creates File History configuration files with default settings for the current user and loads them into an FhConfigMgr object.
     * @param {BOOL} OverwriteIfExists If File History configuration files already exist for the current user and this parameter is set to <b>TRUE</b>, those files are overwritten and all previous settings and policies are reset to default values.
     * 
     * If File History configuration files already exist for the current user and this parameter is set to <b>FALSE</b>, those files are not overwritten and an unsuccessful <b>HRESULT</b> value is returned.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-createdefaultconfiguration
     */
    CreateDefaultConfiguration(OverwriteIfExists) {
        result := ComCall(4, this, "int", OverwriteIfExists, "HRESULT")
        return result
    }

    /**
     * Saves to disk all the changes that were made in an FhConfigMgr object since the last time that the LoadConfiguration, CreateDefaultConfiguration or SaveConfiguration method was called for the File History configuration files of the current user.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-saveconfiguration
     */
    SaveConfiguration() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Adds an exclusion rule to the exclusion list or removes a rule from the list.
     * @param {BOOL} Add If this parameter is <b>TRUE</b>, a new exclusion rule is added.
     * If it is set to <b>FALSE</b>, an existing exclusion rule is removed.
     * @param {Integer} Category Specifies the type of the exclusion rule. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_protected_item_category">FH_PROTECTED_ITEM_CATEGORY</a> enumeration for possible values.
     * @param {BSTR} Item The folder path or library name or GUID of the item that the exclusion rule applies to.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-addremoveexcluderule
     */
    AddRemoveExcludeRule(Add, Category, Item) {
        Item := Item is String ? BSTR.Alloc(Item).Value : Item

        result := ComCall(6, this, "int", Add, "int", Category, "ptr", Item, "HRESULT")
        return result
    }

    /**
     * Retrieves the inclusion and exclusion rules that are currently stored in an FhConfigMgr object.
     * @param {BOOL} Include If set to <b>TRUE</b>, inclusion rules are returned. If set to <b>FALSE</b>, exclusion rules are returned.
     * @param {Integer} Category An <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_protected_item_category">FH_PROTECTED_ITEM_CATEGORY</a> enumeration value that specifies the type of the inclusion or exclusion rules.
     * @returns {IFhScopeIterator} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nn-fhcfg-ifhscopeiterator">IFhScopeIterator</a> interface pointer that can be used to enumerate the rules in the requested category.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-getincludeexcluderules
     */
    GetIncludeExcludeRules(Include, Category) {
        result := ComCall(7, this, "int", Include, "int", Category, "ptr*", &Iterator := 0, "HRESULT")
        return IFhScopeIterator(Iterator)
    }

    /**
     * Retrieves the numeric parameter for a local policy for the File History feature.
     * @param {Integer} LocalPolicyType Specifies the local policy.
     * @returns {Integer} Receives the value of the numeric parameter for the specified local policy.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-getlocalpolicy
     */
    GetLocalPolicy(LocalPolicyType) {
        result := ComCall(8, this, "int", LocalPolicyType, "uint*", &PolicyValue := 0, "HRESULT")
        return PolicyValue
    }

    /**
     * Changes the numeric parameter value of a local policy in an FhConfigMgr object.
     * @param {Integer} LocalPolicyType Specifies the local policy.
     * @param {Integer} PolicyValue Specifies the new value of the numeric parameter for the specified local policy.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-setlocalpolicy
     */
    SetLocalPolicy(LocalPolicyType, PolicyValue) {
        result := ComCall(9, this, "int", LocalPolicyType, "uint", PolicyValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the backup status value for an FhConfigMgr object.
     * @returns {Integer} Receives the backup status value. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_backup_status">FH_BACKUP_STATUS</a> enumeration for the list of possible backup status values.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-getbackupstatus
     */
    GetBackupStatus() {
        result := ComCall(10, this, "int*", &BackupStatus := 0, "HRESULT")
        return BackupStatus
    }

    /**
     * Changes the backup status value for an FhConfigMgr object.
     * @param {Integer} BackupStatus The backup status value. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_backup_status">FH_BACKUP_STATUS</a> enumeration for a list of possible backup status values.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-setbackupstatus
     */
    SetBackupStatus(BackupStatus) {
        result := ComCall(11, this, "int", BackupStatus, "HRESULT")
        return result
    }

    /**
     * Returns a pointer to an IFhTarget interface that can be used to query information about the currently assigned backup target.
     * @returns {IFhTarget} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nn-fhcfg-ifhtarget">IFhTarget</a> interface of an object that represents the currently assigned default target, or <b>NULL</b> if there is no default target.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-getdefaulttarget
     */
    GetDefaultTarget() {
        result := ComCall(12, this, "ptr*", &DefaultTarget := 0, "HRESULT")
        return IFhTarget(DefaultTarget)
    }

    /**
     * Checks whether a certain storage device or network share can be used as a File History backup target.
     * @param {BSTR} TargetUrl The storage device or network share to be validated.
     * @returns {Integer} Receives the result of the device validation. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_device_validation_result">FH_DEVICE_VALIDATION_RESULT</a> enumeration for the list of possible device validation result values.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-validatetarget
     */
    ValidateTarget(TargetUrl) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl

        result := ComCall(13, this, "ptr", TargetUrl, "int*", &ValidationResult := 0, "HRESULT")
        return ValidationResult
    }

    /**
     * Provisions a certain storage device or network share as a File History backup target and assigns it as the default backup target for the current user.
     * @param {BSTR} TargetUrl Specifies the storage device or network share to be provisioned and assigned as the default.
     * @param {BSTR} TargetName Specifies a user-friendly name for the specified backup target.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code such as one of the values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-provisionandsetnewtarget
     */
    ProvisionAndSetNewTarget(TargetUrl, TargetName) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(14, this, "ptr", TargetUrl, "ptr", TargetName, "HRESULT")
        return result
    }

    /**
     * Causes the currently assigned backup target to be recommended or not recommended to other members of the home group that the computer belongs to.
     * @param {BOOL} Recommend If set to <b>TRUE</b>, the currently assigned backup target is recommended to other members of the home group. If set to <b>FALSE</b> and the currently assigned backup target is currently recommended to other members of the home group, this recommendation is withdrawn.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code such as one of the values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-changedefaulttargetrecommendation
     */
    ChangeDefaultTargetRecommendation(Recommend) {
        result := ComCall(15, this, "int", Recommend, "HRESULT")
        return result
    }

    /**
     * Retrieves the current File History protection state.
     * @param {Pointer<Integer>} ProtectionState On return, this parameter receives the current File History protection state. The following protection states are defined in the FhStatus.h header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_NOT_TRACKED"></a><a id="fh_state_not_tracked"></a><dl>
     * <dt><b>FH_STATE_NOT_TRACKED</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The File History protection state is unknown, because the File History service is not started or the current user is not tracked in it. This value cannot be ORed with <b>FH_STATE_RUNNING</b> (0x100).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_OFF"></a><a id="fh_state_off"></a><dl>
     * <dt><b>FH_STATE_OFF</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File History protection is not enabled for the current user. No files will be backed up. This value cannot be ORed with <b>FH_STATE_RUNNING</b> (0x100).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_DISABLED_BY_GP"></a><a id="fh_state_disabled_by_gp"></a><dl>
     * <dt><b>FH_STATE_DISABLED_BY_GP</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File History protection is disabled by Group Policy. No files will be backed up. This value cannot be ORed with <b>FH_STATE_RUNNING</b> (0x100).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_FATAL_CONFIG_ERROR"></a><a id="fh_state_fatal_config_error"></a><dl>
     * <dt><b>FH_STATE_FATAL_CONFIG_ERROR</b></dt>
     * <dt>0x03</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a fatal error in one of the files that store internal File History information for the current user. No files will be backed up. This value cannot be ORed with <b>FH_STATE_RUNNING</b> (0x100).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_TARGET_ACCESS_DENIED"></a><a id="fh_state_target_access_denied"></a><dl>
     * <dt><b>FH_STATE_TARGET_ACCESS_DENIED</b></dt>
     * <dt>0x0E</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current user does not have write permission for the currently assigned target. Backup copies of file versions will not be  created. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_TARGET_VOLUME_DIRTY"></a><a id="fh_state_target_volume_dirty"></a><dl>
     * <dt><b>FH_STATE_TARGET_VOLUME_DIRTY</b></dt>
     * <dt>0x0F</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The currently assigned target has been marked as dirty. Backup copies of file versions will not be created until after the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc730714(v=ws.11)">Chkdsk</a> utility is run. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_TARGET_FULL_RETENTION_MAX"></a><a id="fh_state_target_full_retention_max"></a><dl>
     * <dt><b>FH_STATE_TARGET_FULL_RETENTION_MAX</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The currently assigned target does not have sufficient space for storing backup copies of files from the File History protection scope, and retention is already set to the most aggressive policy. File History will provide a degraded level of protection. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_TARGET_FULL"></a><a id="fh_state_target_full"></a><dl>
     * <dt><b>FH_STATE_TARGET_FULL</b></dt>
     * <dt>0x11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The currently assigned target does not have sufficient space for storing backup copies of files from the File History protection scope. File History will provide a degraded level of protection. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_STAGING_FULL"></a><a id="fh_state_staging_full"></a><dl>
     * <dt><b>FH_STATE_STAGING_FULL</b></dt>
     * <dt>0x12</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The File History cache on one of the local disks does not have sufficient space for storing backup copies of files from the File History protection scope temporarily. File History will provide a degraded level of protection. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_TARGET_LOW_SPACE_RETENTION_MAX"></a><a id="fh_state_target_low_space_retention_max"></a><dl>
     * <dt><b>FH_STATE_TARGET_LOW_SPACE_RETENTION_MAX</b></dt>
     * <dt>0x13</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The currently assigned target is running low on free space, and retention is already set to the most aggressive policy. The level of File History protection is likely to degrade soon. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_TARGET_LOW_SPACE"></a><a id="fh_state_target_low_space"></a><dl>
     * <dt><b>FH_STATE_TARGET_LOW_SPACE</b></dt>
     * <dt>0x14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The currently assigned target is running low on free space. The level of File History protection is likely to degrade soon. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_TARGET_ABSENT"></a><a id="fh_state_target_absent"></a><dl>
     * <dt><b>FH_STATE_TARGET_ABSENT</b></dt>
     * <dt>0x15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The currently assigned target has not been available for backups for a substantial period of time, causing File History level of protection to start degrading. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_TOO_MUCH_BEHIND"></a><a id="fh_state_too_much_behind"></a><dl>
     * <dt><b>FH_STATE_TOO_MUCH_BEHIND</b></dt>
     * <dt>0x16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Too many changes have been made in the protected files or the protection scope. File History level of protection is likely to degrade, unless the user explicitly initiates an immediate backup instead of relying on regular backup cycles to be performed in the background. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FH_STATE_NO_ERROR"></a><a id="fh_state_no_error"></a><dl>
     * <dt><b>FH_STATE_NO_ERROR</b></dt>
     * <dt>0xFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File History backups are performed regularly, no error conditions are detected, an optimal level of File History protection is provided. This value can be ORed with <b>FH_STATE_RUNNING</b> (0x100) to indicate that a backup cycle is being performed for the current user right now.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<BSTR>} ProtectedUntilTime Receives a pointer to a string allocated with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> containing the date and time until which all files within the File History protection scope are protected. The date and time are formatted per the system locale. If the date and time are unknown, an empty string is returned.
     * 
     * A file is considered protected until a certain point in time if one of the following conditions is true:<ul>
     * <li>There is a version of that file that was captured at or after that point in time and was fully copied to the currently assigned backup target before now.</li>
     * <li>The file was created or included in the File History protection scope at or after that point in time.</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code such as one of the values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhconfigmgr-queryprotectionstatus
     */
    QueryProtectionStatus(ProtectionState, ProtectedUntilTime) {
        ProtectionStateMarshal := ProtectionState is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, ProtectionStateMarshal, ProtectionState, "ptr", ProtectedUntilTime, "HRESULT")
        return result
    }
}
