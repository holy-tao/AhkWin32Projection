#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDiskQuotaUser.ahk
#Include .\IEnumDiskQuotaUsers.ahk
#Include .\IDiskQuotaUserBatch.ahk
#Include ..\..\System\Com\IConnectionPointContainer.ahk

/**
 * Controls the disk quota facilities of a single NTFS file system volume.
 * @see https://docs.microsoft.com/windows/win32/api//dskquota/nn-dskquota-idiskquotacontrol
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IDiskQuotaControl extends IConnectionPointContainer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiskQuotaControl
     * @type {Guid}
     */
    static IID => Guid("{7988b572-ec89-11cf-9c00-00aa00a14f56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SetQuotaState", "GetQuotaState", "SetQuotaLogFlags", "GetQuotaLogFlags", "SetDefaultQuotaThreshold", "GetDefaultQuotaThreshold", "GetDefaultQuotaThresholdText", "SetDefaultQuotaLimit", "GetDefaultQuotaLimit", "GetDefaultQuotaLimitText", "AddUserSid", "AddUserName", "DeleteUser", "FindUserSid", "FindUserName", "CreateEnumUsers", "CreateUserBatch", "InvalidateSidNameCache", "GiveUserNameResolutionPriority", "ShutdownNameResolution"]

    /**
     * Initializes a new DiskQuotaControl object by opening the NTFS file system volume with the requested access rights.
     * @param {PWSTR} pszPath The path to the volume root, such as C:\ or &#92;&#92;<i>yourcomputer</i>.
     * @param {BOOL} bReadWrite If this value is <b>TRUE</b>, the volume is opened in read/write mode. If this value is <b>FALSE</b>, the volume is opened in read-only mode. To write data to the quota file, you must specify <b>TRUE</b>, and the call to this method must return successfully.
     * @returns {HRESULT} This method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested path name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested file or object is not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The controller object has already been initialized. Multiple initialization is not allowed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested file path is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file system does not support quotas.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested file path is not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-initialize
     */
    Initialize(pszPath, bReadWrite) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(5, this, "ptr", pszPath, "int", bReadWrite, "HRESULT")
        return result
    }

    /**
     * Sets the state of the quota system.
     * @param {Integer} dwState State to be applied to the volume. Use the following macros to set the proper bits.
     * 					
     * 
     * <table>
     * <tr>
     * <th>Macro</th>
     * <th>Enable</th>
     * <th>Track</th>
     * <th>Enforce</th>
     * </tr>
     * <tr>
     * <td>DISKQUOTA_SET_DISABLED</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <td>DISKQUOTA_SET_TRACKED</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <td>DISKQUOTA_SET_ENFORCED</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwState</i> parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-setquotastate
     */
    SetQuotaState(dwState) {
        result := ComCall(6, this, "uint", dwState, "HRESULT")
        return result
    }

    /**
     * Retrieves a set of flags describing the state of the quota system.
     * @param {Pointer<Integer>} pdwState The quota state flags. This parameter can include one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_FILESTATE_INCOMPLETE"></a><a id="diskquota_filestate_incomplete"></a><dl>
     * <dt><b>DISKQUOTA_FILESTATE_INCOMPLETE</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume's quota information is out of date. Quotas are probably disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_FILESTATE_REBUILDING"></a><a id="diskquota_filestate_rebuilding"></a><dl>
     * <dt><b>DISKQUOTA_FILESTATE_REBUILDING</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume is rebuilding its quota information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_STATE_DISABLED"></a><a id="diskquota_state_disabled"></a><dl>
     * <dt><b>DISKQUOTA_STATE_DISABLED</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Quotas are not enabled on the volume.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_STATE_ENFORCE"></a><a id="diskquota_state_enforce"></a><dl>
     * <dt><b>DISKQUOTA_STATE_ENFORCE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Quotas are enabled and the limit value is enforced. Users cannot exceed their quota limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_STATE_TRACK"></a><a id="diskquota_state_track"></a><dl>
     * <dt><b>DISKQUOTA_STATE_TRACK</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Quotas are enabled but the limit value is not being enforced. Users may exceed their quota limit.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwState</i> parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-getquotastate
     */
    GetQuotaState(pdwState) {
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwStateMarshal, pdwState, "HRESULT")
        return result
    }

    /**
     * Controls the logging of user-related quota events on the volume.
     * @param {Integer} dwFlags The log flags to be applied to the volume. Use the following macros to set the proper bits in the <i>dwFlags</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Macro</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>DISKQUOTA_SET_LOG_USER_LIMIT</td>
     * <td>Turn on/off logging of user quota limit violations. If set, an event log entry will be created when the user exceeds his assigned hard quota limit.</td>
     * </tr>
     * <tr>
     * <td>DISKQUOTA_SET_LOG_USER_THRESHOLD</td>
     * <td>Turn on/off logging of user warning threshold violations. If set, an event log entry will be created when the user exceeds his assigned warning threshold.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-setquotalogflags
     */
    SetQuotaLogFlags(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the flags that control the logging of user-related quota events on the volume.
     * @param {Pointer<Integer>} pdwFlags The volume's quota logging flags. Use the following macros to retrieve the contents of the flag value.
     * 
     * <table>
     * <tr>
     * <th>Macro</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>DISKQUOTA_IS_LOGGED_USER_LIMIT</td>
     * <td>If set, an event log entry will be created when the user exceeds his assigned hard quota limit.</td>
     * </tr>
     * <tr>
     * <td>DISKQUOTA_IS_LOGGED_USER_THRESHOLD</td>
     * <td>If set, an event log entry will be created when the user exceeds his assigned warning threshold.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwFlags</i> parameter is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-getquotalogflags
     */
    GetQuotaLogFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Modifies the default warning threshold.
     * @param {Integer} llThreshold The default warning threshold value, in bytes.
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-setdefaultquotathreshold
     */
    SetDefaultQuotaThreshold(llThreshold) {
        result := ComCall(10, this, "int64", llThreshold, "HRESULT")
        return result
    }

    /**
     * Retrieves the default quota warning threshold for the volume.
     * @param {Pointer<Integer>} pllThreshold The default warning threshold value, in bytes.
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pllThreshold</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-getdefaultquotathreshold
     */
    GetDefaultQuotaThreshold(pllThreshold) {
        pllThresholdMarshal := pllThreshold is VarRef ? "int64*" : "ptr"

        result := ComCall(11, this, pllThresholdMarshal, pllThreshold, "HRESULT")
        return result
    }

    /**
     * Retrieves the default warning threshold for the volume.
     * @param {PWSTR} pszText The text string.
     * @param {Integer} cchText The size of the buffer, in characters.
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pszText</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-getdefaultquotathresholdtext
     */
    GetDefaultQuotaThresholdText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(12, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Modifies the default quota limit.
     * @param {Integer} llLimit The default quota limit, in bytes. If this value is -1, the user has an unlimited quota.
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-setdefaultquotalimit
     */
    SetDefaultQuotaLimit(llLimit) {
        result := ComCall(13, this, "int64", llLimit, "HRESULT")
        return result
    }

    /**
     * Retrieves the default quota limit for the volume.
     * @param {Pointer<Integer>} pllLimit A pointer to the variable to receive the quota limit. If this value is -1, the user has an unlimited quota.
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pllLimit</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-getdefaultquotalimit
     */
    GetDefaultQuotaLimit(pllLimit) {
        pllLimitMarshal := pllLimit is VarRef ? "int64*" : "ptr"

        result := ComCall(14, this, pllLimitMarshal, pllLimit, "HRESULT")
        return result
    }

    /**
     * Retrieves the default quota limit for the volume. The limit is expressed as a text string; for example, 10.5 MB.
     * @param {PWSTR} pszText The text string. If the volume has no limit, the string returned is "No Limit" (localized). If the buffer is too small, the string is truncated to fit the buffer.
     * @param {Integer} cchText The size of the buffer, in characters.
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pszText</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-getdefaultquotalimittext
     */
    GetDefaultQuotaLimitText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(15, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Adds a new quota entry on the volume for the specified user. The user is identified by security identifier (SID).
     * @param {PSID} pUserSid The user's SID.
     * @param {Integer} fNameResolution 
     * @returns {IDiskQuotaUser} A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauser">IDiskQuotaUser</a> interface pointer to the newly created quota user object.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-addusersid
     */
    AddUserSid(pUserSid, fNameResolution) {
        result := ComCall(16, this, "ptr", pUserSid, "uint", fNameResolution, "ptr*", &ppUser := 0, "HRESULT")
        return IDiskQuotaUser(ppUser)
    }

    /**
     * Adds a new quota entry on the volume for the specified user. The user is identified by domain and account name.
     * @param {PWSTR} pszLogonName The user's account logon name string.
     * @param {Integer} fNameResolution 
     * @returns {IDiskQuotaUser} A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauser">IDiskQuotaUser</a> interface pointer to the newly created quota user object.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-addusername
     */
    AddUserName(pszLogonName, fNameResolution) {
        pszLogonName := pszLogonName is String ? StrPtr(pszLogonName) : pszLogonName

        result := ComCall(17, this, "ptr", pszLogonName, "uint", fNameResolution, "ptr*", &ppUser := 0, "HRESULT")
        return IDiskQuotaUser(ppUser)
    }

    /**
     * Removes a user entry from the volume quota information file.
     * @param {IDiskQuotaUser} pUser A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauser">IDiskQuotaUser</a> interface of the user whose quota record is marked for deletion.
     * @returns {HRESULT} This method returns a file system error or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user owns files on the volume.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pUser</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-deleteuser
     */
    DeleteUser(pUser) {
        result := ComCall(18, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * Locates a specific user entry in the volume quota information.
     * @param {PSID} pUserSid A pointer to the user's SID.
     * @param {Integer} fNameResolution 
     * @returns {IDiskQuotaUser} Pointer to receive the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauser">IDiskQuotaUser</a> interface pointer to the quota user object.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-findusersid
     */
    FindUserSid(pUserSid, fNameResolution) {
        result := ComCall(19, this, "ptr", pUserSid, "uint", fNameResolution, "ptr*", &ppUser := 0, "HRESULT")
        return IDiskQuotaUser(ppUser)
    }

    /**
     * Locates a specific entry in the volume quota information.
     * @param {PWSTR} pszLogonName A pointer to the user's account logon name.
     * @returns {IDiskQuotaUser} A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauser">IDiskQuotaUser</a> interface pointer to the quota user object.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-findusername
     */
    FindUserName(pszLogonName) {
        pszLogonName := pszLogonName is String ? StrPtr(pszLogonName) : pszLogonName

        result := ComCall(20, this, "ptr", pszLogonName, "ptr*", &ppUser := 0, "HRESULT")
        return IDiskQuotaUser(ppUser)
    }

    /**
     * Creates an enumerator object for enumerating quota users on the volume.
     * @param {Pointer<PSID>} rgpUserSids An array of security identifier (SID) pointers representing the user objects to be included in the enumeration. If this value is <b>NULL</b>, all user entries are enumerated.
     * @param {Integer} cpSids The number of items in the <i>rgpUserSids</i> array. Ignored if <i>rgpUserSids</i> is <b>NULL</b>.
     * @param {Integer} fNameResolution 
     * @returns {IEnumDiskQuotaUsers} A pointer to a pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-ienumdiskquotausers">IEnumDiskQuotaUsers</a> enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-createenumusers
     */
    CreateEnumUsers(rgpUserSids, cpSids, fNameResolution) {
        rgpUserSidsMarshal := rgpUserSids is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, rgpUserSidsMarshal, rgpUserSids, "uint", cpSids, "uint", fNameResolution, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDiskQuotaUsers(ppEnum)
    }

    /**
     * Creates a batching object for optimizing updates to the quota settings of multiple users simultaneously.
     * @returns {IDiskQuotaUserBatch} A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauserbatch">IDiskQuotaUserBatch</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-createuserbatch
     */
    CreateUserBatch() {
        result := ComCall(22, this, "ptr*", &ppBatch := 0, "HRESULT")
        return IDiskQuotaUserBatch(ppBatch)
    }

    /**
     * Invalidates the contents of the system's SID-to-name cache so subsequent requests for new user objects (IEnumDiskQuotaUsers::Next, IDiskQuotaControl::FindUserSid, and IDiskQuotaControl::FindUserName) must obtain user names from the domain controller.
     * @returns {HRESULT} This method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID-to-name cache is not available or could not be exclusively locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-invalidatesidnamecache
     */
    InvalidateSidNameCache() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Promotes the specified user object to the head of the queue so that it is next in line for resolution.
     * @param {IDiskQuotaUser} pUser A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauser">IDiskQuotaUser</a> interface.
     * @returns {HRESULT} This method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>DiskQuotaControl</b> object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Quota user object not in the resolver queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-giveusernameresolutionpriority
     */
    GiveUserNameResolutionPriority(pUser) {
        result := ComCall(24, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * Translates user security identifiers (SID) to user names.
     * @returns {HRESULT} This method returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotacontrol-shutdownnameresolution
     */
    ShutdownNameResolution() {
        result := ComCall(25, this, "HRESULT")
        return result
    }
}
