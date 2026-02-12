#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFhScopeIterator.ahk
#Include .\IFhTarget.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFhConfigMgr interface allows client applications to read and modify the File History configuration for the user account under which the methods of this interface are called.
 * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nn-fhcfg-ifhconfigmgr
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
     * @remarks
     * This method or the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-createdefaultconfiguration">IFhConfigMgr::CreateDefaultConfiguration</a> method must be called before any other <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nn-fhcfg-ifhconfigmgr">IFhConfigMgr</a> method can be called.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code such as one of the values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-loadconfiguration
     */
    LoadConfiguration() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates File History configuration files with default settings for the current user and loads them into an FhConfigMgr object.
     * @remarks
     * This method or the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-loadconfiguration">LoadConfiguration</a> method must be called before any other <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nn-fhcfg-ifhconfigmgr">IFhConfigMgr</a> method can be called.
     * @param {BOOL} OverwriteIfExists If File History configuration files already exist for the current user and this parameter is set to <b>TRUE</b>, those files are overwritten and all previous settings and policies are reset to default values.
     * 
     * If File History configuration files already exist for the current user and this parameter is set to <b>FALSE</b>, those files are not overwritten and an unsuccessful <b>HRESULT</b> value is returned.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-createdefaultconfiguration
     */
    CreateDefaultConfiguration(OverwriteIfExists) {
        result := ComCall(4, this, "int", OverwriteIfExists, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves to disk all the changes that were made in an FhConfigMgr object since the last time that the LoadConfiguration, CreateDefaultConfiguration or SaveConfiguration method was called for the File History configuration files of the current user.
     * @remarks
     * This method can be called as many times as needed during the lifetime of an <a href="https://docs.microsoft.com/windows/desktop/DevNotes/fhconfigmgr">FhConfigMgr</a> object.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-saveconfiguration
     */
    SaveConfiguration() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an exclusion rule to the exclusion list or removes a rule from the list.
     * @remarks
     * The File History protection scope is the set of files that are backed up by the File History feature.  It contains inclusion rules and exclusion rules. Inclusion rules specify the files and folders that are included. Exclusion rules specify the files and folders that are excluded.
     * 
     * The default protection scope includes all folders from all user libraries and the  Contacts, Desktop, and Favorites folders.
     * 
     * Exclusion rules take precedence over inclusion rules. In other words, if an inclusion rule conflicts with an exclusion rule, the File History feature follows the exclusion rule.
     * 
     * To reduce the protection scope, use the <b>IFhConfigMgr::AddRemoveExcludeRule</b> to add exclusion rules. 
     * 
     * This method can be used to add or remove exclusion rules. It cannot be used to modify inclusion rules.
     * 
     * User libraries can be enumerated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderitem">SHGetKnownFolderItem</a> function and the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a> interfaces.
     * 
     * Standard folders and libraries are specified by a GUID, prefixed with an asterisk. For example,  *a990ae9f-a03b-4e80-94bc-9912d7504104 specifies the Pictures library. For a list of standard folders and libraries and their GUIDs, see the <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> documentation. 
     * 
     * Custom libraries are specified by name. Folders are specified by their full path (for example, C:\Users\Public\Videos).
     * @param {BOOL} Add If this parameter is <b>TRUE</b>, a new exclusion rule is added.
     * If it is set to <b>FALSE</b>, an existing exclusion rule is removed.
     * @param {Integer} Category Specifies the type of the exclusion rule. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_protected_item_category">FH_PROTECTED_ITEM_CATEGORY</a> enumeration for possible values.
     * @param {BSTR} Item The folder path or library name or GUID of the item that the exclusion rule applies to.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-addremoveexcluderule
     */
    AddRemoveExcludeRule(Add, Category, Item) {
        if(Item is String) {
            pin := BSTR.Alloc(Item)
            Item := pin.Value
        }

        result := ComCall(6, this, "int", Add, "int", Category, "ptr", Item, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the inclusion and exclusion rules that are currently stored in an FhConfigMgr object.
     * @remarks
     * The File History protection scope is the set of files that are backed up by this feature.  It contains inclusion rules and exclusion rules. Inclusion rules specify the files and folders that are included. Exclusion rules specify the files and folders that are excluded.
     * 
     * The default protection scope includes all folders from all user libraries and the  Contacts, Desktop, and Favorites folders.
     * 
     * You can modify the File History protection scope  by adding exclusion rules to reduce the File History protection scope without removing folders from user libraries.
     * 
     * Exclusion rules take precedence over inclusion rules. In other words, if an inclusion rule conflicts with an exclusion rule, the File History feature follows the exclusion rule.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-addremoveexcluderule">IFhConfigMgr::AddRemoveExcludeRule</a> method can be used to add or remove exclusion rules. It cannot be used to modify the inclusion rules.
     * @param {BOOL} Include If set to <b>TRUE</b>, inclusion rules are returned. If set to <b>FALSE</b>, exclusion rules are returned.
     * @param {Integer} Category An <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_protected_item_category">FH_PROTECTED_ITEM_CATEGORY</a> enumeration value that specifies the type of the inclusion or exclusion rules.
     * @returns {IFhScopeIterator} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nn-fhcfg-ifhscopeiterator">IFhScopeIterator</a> interface pointer that can be used to enumerate the rules in the requested category.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-getincludeexcluderules
     */
    GetIncludeExcludeRules(Include, Category) {
        result := ComCall(7, this, "int", Include, "int", Category, "ptr*", &Iterator := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFhScopeIterator(Iterator)
    }

    /**
     * Retrieves the numeric parameter for a local policy for the File History feature.
     * @remarks
     * Each local policy contains a numeric parameter that specifies how or when the File History feature backs up files and folders. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_local_policy_type">FH_LOCAL_POLICY_TYPE</a> enumeration for more information about the local policies that can be specified.
     * 
     * To set the numeric parameter value for a local policy, use the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-setlocalpolicy">IFhConfigMgr::SetLocalPolicy</a> method.
     * @param {Integer} LocalPolicyType Specifies the local policy.
     * @returns {Integer} Receives the value of the numeric parameter for the specified local policy.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-getlocalpolicy
     */
    GetLocalPolicy(LocalPolicyType) {
        result := ComCall(8, this, "int", LocalPolicyType, "uint*", &PolicyValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PolicyValue
    }

    /**
     * Changes the numeric parameter value of a local policy in an FhConfigMgr object.
     * @remarks
     * Each local policy contains a numeric parameter that specifies how or when the File History feature backs up files and folders. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_local_policy_type">FH_LOCAL_POLICY_TYPE</a> enumeration for more information about the local policies that can be specified.
     * 
     * To retrieve the numeric parameter value for a local policy, use the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-getlocalpolicy">IFhConfigMgr::GetLocalPolicy</a> method.
     * @param {Integer} LocalPolicyType Specifies the local policy.
     * @param {Integer} PolicyValue Specifies the new value of the numeric parameter for the specified local policy.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-setlocalpolicy
     */
    SetLocalPolicy(LocalPolicyType, PolicyValue) {
        result := ComCall(9, this, "int", LocalPolicyType, "uint", PolicyValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the backup status value for an FhConfigMgr object.
     * @returns {Integer} Receives the backup status value. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_backup_status">FH_BACKUP_STATUS</a> enumeration for the list of possible backup status values.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-getbackupstatus
     */
    GetBackupStatus() {
        result := ComCall(10, this, "int*", &BackupStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackupStatus
    }

    /**
     * Changes the backup status value for an FhConfigMgr object.
     * @remarks
     * <b>FH_STATUS_DISABLED_BY_GP</b> is not a valid value for the <i>BackupStatus</i> parameter.
     * @param {Integer} BackupStatus The backup status value. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_backup_status">FH_BACKUP_STATUS</a> enumeration for a list of possible backup status values.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-setbackupstatus
     */
    SetBackupStatus(BackupStatus) {
        result := ComCall(11, this, "int", BackupStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a pointer to an IFhTarget interface that can be used to query information about the currently assigned backup target.
     * @remarks
     * If no backup target is currently assigned, this method returns <c>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</c>.
     * @returns {IFhTarget} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nn-fhcfg-ifhtarget">IFhTarget</a> interface of an object that represents the currently assigned default target, or <b>NULL</b> if there is no default target.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-getdefaulttarget
     */
    GetDefaultTarget() {
        result := ComCall(12, this, "ptr*", &DefaultTarget := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFhTarget(DefaultTarget)
    }

    /**
     * Checks whether a certain storage device or network share can be used as a File History backup target.
     * @remarks
     * For local disks, the <i>TargetUrl</i> parameter contains the drive letter. This path must end with a trailing backslash (for example, "X:\\").
     * 
     * For network shares, the <i>TargetUrl</i> parameter contains the full path of the share.  This path must end with a trailing backslash (for example, "\\\\myserver\myshare\\").
     * @param {BSTR} TargetUrl The storage device or network share to be validated.
     * @returns {Integer} Receives the result of the device validation. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_device_validation_result">FH_DEVICE_VALIDATION_RESULT</a> enumeration for the list of possible device validation result values.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-validatetarget
     */
    ValidateTarget(TargetUrl) {
        if(TargetUrl is String) {
            pin := BSTR.Alloc(TargetUrl)
            TargetUrl := pin.Value
        }

        result := ComCall(13, this, "ptr", TargetUrl, "int*", &ValidationResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValidationResult
    }

    /**
     * Provisions a certain storage device or network share as a File History backup target and assigns it as the default backup target for the current user.
     * @remarks
     * For local disks, the <i>TargetUrl</i> parameter contains the drive letter. This path must end with a trailing backslash (for example, "X:\\").
     * 
     * For network shares, the <i>TargetUrl</i> parameter contains the full path of the share.  This path must end with a trailing backslash (for example, "\\\\myserver\myshare\\").
     * 
     * It is highly recommended that the storage device or network share specified by the <i>TargetUrl</i> parameter be validated first using the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-validatetarget">IFhConfigMgr::ValidateTarget</a> method. If <b>ValidateTarget</b> returns a validation result other than <b>FH_VALID_TARGET</b>, assigning this storage device or network share as the default backup target may have unpredictable consequences.
     * @param {BSTR} TargetUrl Specifies the storage device or network share to be provisioned and assigned as the default.
     * @param {BSTR} TargetName Specifies a user-friendly name for the specified backup target.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code such as one of the values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-provisionandsetnewtarget
     */
    ProvisionAndSetNewTarget(TargetUrl, TargetName) {
        if(TargetUrl is String) {
            pin := BSTR.Alloc(TargetUrl)
            TargetUrl := pin.Value
        }
        if(TargetName is String) {
            pin := BSTR.Alloc(TargetName)
            TargetName := pin.Value
        }

        result := ComCall(14, this, "ptr", TargetUrl, "ptr", TargetName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Causes the currently assigned backup target to be recommended or not recommended to other members of the home group that the computer belongs to.
     * @remarks
     * When a backup target is recommended to other computers in the home group, users on those computers see that storage device in the list of available backup targets in the File History item in Control Panel. 
     * 
     * If the backup target is not recommended to other computers in the home group, or if the recommendation is withdrawn, the target does not appear in the list of available backup targets on the other computers.
     * 
     * A backup target cannot be recommended or not recommended on a computer that is joined to a domain or on a computer that is having ARM architecture.
     * @param {BOOL} Recommend If set to <b>TRUE</b>, the currently assigned backup target is recommended to other members of the home group. If set to <b>FALSE</b> and the currently assigned backup target is currently recommended to other members of the home group, this recommendation is withdrawn.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code such as one of the values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-changedefaulttargetrecommendation
     */
    ChangeDefaultTargetRecommendation(Recommend) {
        result := ComCall(15, this, "int", Recommend, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current File History protection state.
     * @remarks
     * The caller is responsible for releasing the memory allocated for <i>ProtectedUntilTime</i> by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> on it.
     * 
     * The protection state indicates the File History operational state and the date and time until which all files within the protection scope are protected.
     * 
     * If the target is full or disconnected, the File History feature will provide a degraded level of protection as follows: 
     * 
     * <ul>
     * <li>Files will be backed up to the File History cache on one of the local disks.</li>
     * <li>If the cache fills up during this time, older copies will be deleted from the cache to back up newer copies.</li>
     * <li>If the target is low on free space, the degraded level of protection will start once the target becomes full.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhconfigmgr-queryprotectionstatus
     */
    QueryProtectionStatus(ProtectionState, ProtectedUntilTime) {
        ProtectionStateMarshal := ProtectionState is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, ProtectionStateMarshal, ProtectionState, "ptr", ProtectedUntilTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
