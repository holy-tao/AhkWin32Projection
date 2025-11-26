#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a single user quota entry in the volume quota information file.
 * @see https://docs.microsoft.com/windows/win32/api//dskquota/nn-dskquota-idiskquotauser
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IDiskQuotaUser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiskQuotaUser
     * @type {Guid}
     */
    static IID => Guid("{7988b574-ec89-11cf-9c00-00aa00a14f56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetID", "GetName", "GetSidLength", "GetSid", "GetQuotaThreshold", "GetQuotaThresholdText", "GetQuotaLimit", "GetQuotaLimitText", "GetQuotaUsed", "GetQuotaUsedText", "GetQuotaInformation", "SetQuotaThreshold", "SetQuotaLimit", "Invalidate", "GetAccountStatus"]

    /**
     * Retrieves a unique identifier (ID) number for the DiskQuotaUser object.
     * @param {Pointer<Integer>} pulID The name strings associated with the disk quota user.
     * @returns {HRESULT} This method returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getid
     */
    GetID(pulID) {
        pulIDMarshal := pulID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulIDMarshal, pulID, "HRESULT")
        return result
    }

    /**
     * Retrieves the name strings associated with a disk quota user.
     * @param {PWSTR} pszAccountContainer The name of the user's account container. This value can be <b>NULL</b>. For accounts without directory service information, this string is simply the domain name. For accounts with directory service information available, this string is a canonical name with the terminating object name removed.
     * @param {Integer} cchAccountContainer The size of the account container buffer, in characters. Ignored if <i>pszAccountContainer</i> is <b>NULL</b>.
     * @param {PWSTR} pszLogonName A pointer to the buffer to receive the name the user specified to log on the computer. This value can be <b>NULL</b>. The format of the name returned depends on whether directory service information is available.
     * @param {Integer} cchLogonName The size of the logon name buffer, in characters. Ignored if <i>pszLogonName</i> is <b>NULL</b>.
     * @param {PWSTR} pszDisplayName A pointer to the buffer to receive the display name for the quota user. This value can be <b>NULL</b>. If the information is not available, the string returned is of zero length.
     * @param {Integer} cchDisplayName The size of the display-name buffer, in characters. Ignored if <i>pszDisplayName</i> is <b>NULL</b>.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getname
     */
    GetName(pszAccountContainer, cchAccountContainer, pszLogonName, cchLogonName, pszDisplayName, cchDisplayName) {
        pszAccountContainer := pszAccountContainer is String ? StrPtr(pszAccountContainer) : pszAccountContainer
        pszLogonName := pszLogonName is String ? StrPtr(pszLogonName) : pszLogonName
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(4, this, "ptr", pszAccountContainer, "uint", cchAccountContainer, "ptr", pszLogonName, "uint", cchLogonName, "ptr", pszDisplayName, "uint", cchDisplayName, "HRESULT")
        return result
    }

    /**
     * Retrieves the length of the user's security identifier (SID), in bytes.
     * @param {Pointer<Integer>} pdwLength The SID length, in bytes.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwLength</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID for the user is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getsidlength
     */
    GetSidLength(pdwLength) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * Retrieves the user's security identifier (SID).
     * @param {Pointer<Integer>} pbSidBuffer The SID.
     * @param {Integer} cbSidBuffer The size of the buffer, in bytes. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nf-dskquota-idiskquotauser-getsidlength">IDiskQuotaUser::GetSidLength</a> method to obtain the required size for the buffer.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pbSidBuffer</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID for the user is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient destination buffer size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getsid
     */
    GetSid(pbSidBuffer, cbSidBuffer) {
        pbSidBufferMarshal := pbSidBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pbSidBufferMarshal, pbSidBuffer, "uint", cbSidBuffer, "HRESULT")
        return result
    }

    /**
     * Retrieves the user's warning threshold value on the volume.
     * @param {Pointer<Integer>} pllThreshold The warning threshold value.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
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
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getquotathreshold
     */
    GetQuotaThreshold(pllThreshold) {
        pllThresholdMarshal := pllThreshold is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, pllThresholdMarshal, pllThreshold, "HRESULT")
        return result
    }

    /**
     * Retrieves the user's warning threshold for the volume.
     * @param {PWSTR} pszText The text string.
     * @param {Integer} cchText The size of the destination buffer, in characters.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
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
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getquotathresholdtext
     */
    GetQuotaThresholdText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(8, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Retrieves the user's quota limit value on the volume.
     * @param {Pointer<Integer>} pllLimit The limit value. If this value is –1, the user has an unlimited quota.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
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
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getquotalimit
     */
    GetQuotaLimit(pllLimit) {
        pllLimitMarshal := pllLimit is VarRef ? "int64*" : "ptr"

        result := ComCall(9, this, pllLimitMarshal, pllLimit, "HRESULT")
        return result
    }

    /**
     * Retrieves the user's quota limit for the volume.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
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
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getquotalimittext
     */
    GetQuotaLimitText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(10, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Retrieves the user's quota used value on the volume.
     * @param {Pointer<Integer>} pllUsed The quota used value.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
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
     * The <i>pllUsed</i> parameter is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getquotaused
     */
    GetQuotaUsed(pllUsed) {
        pllUsedMarshal := pllUsed is VarRef ? "int64*" : "ptr"

        result := ComCall(11, this, pllUsedMarshal, pllUsed, "HRESULT")
        return result
    }

    /**
     * Retrieves the user's quota used value for the volume.
     * @param {PWSTR} pszText The text string.
     * @param {Integer} cchText The size of the buffer, in bytes.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
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
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getquotausedtext
     */
    GetQuotaUsedText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(12, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Retrieves the values for the user's warning threshold, hard quota limit, and quota used.
     * @param {Pointer<Void>} pbQuotaInfo A pointer to the 
     * [DISKQUOTA_USER_INFORMATION](./ns-dskquota-diskquota_user_information.md) structure to receive the quota information.
     * @param {Integer} cbQuotaInfo The size of the quota information structure, in bytes.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
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
     * The <i>pQuotaInfo</i> parameter is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getquotainformation
     */
    GetQuotaInformation(pbQuotaInfo, cbQuotaInfo) {
        pbQuotaInfoMarshal := pbQuotaInfo is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, pbQuotaInfoMarshal, pbQuotaInfo, "uint", cbQuotaInfo, "HRESULT")
        return result
    }

    /**
     * Sets the user's warning threshold value on the volume.
     * @param {Integer} llThreshold The warning threshold value.
     * @param {BOOL} fWriteThrough If this value is <b>TRUE</b>, the value is written immediately to the volume's quota file. Otherwise, the value is written only to the quota user object's local memory. This value should typically be set to <b>TRUE</b>. Set it to <b>FALSE</b> when using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauserbatch">IDiskQuotaUserBatch</a> interface to modify multiple user quota entries at the same time.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-setquotathreshold
     */
    SetQuotaThreshold(llThreshold, fWriteThrough) {
        result := ComCall(14, this, "int64", llThreshold, "int", fWriteThrough, "HRESULT")
        return result
    }

    /**
     * Sets the user's quota limit value on the volume.
     * @param {Integer} llLimit The default quota limit, in bytes. If this value is -1, the user has an unlimited quota.
     * @param {BOOL} fWriteThrough If this value is <b>TRUE</b>, the value is written immediately to the volume's quota file. Otherwise, the value is written only to the quota user object's local memory. This value should typically be set to <b>TRUE</b>. Set it to <b>FALSE</b> when using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauserbatch">IDiskQuotaUserBatch</a> interface to modify multiple user quota entries at once.
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
     * <dt><b>ERROR_LOCK_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to obtain an exclusive lock.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-setquotalimit
     */
    SetQuotaLimit(llLimit, fWriteThrough) {
        result := ComCall(15, this, "int64", llLimit, "int", fWriteThrough, "HRESULT")
        return result
    }

    /**
     * Invalidates the quota information stored in the quota user object.
     * @returns {HRESULT} This method returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-invalidate
     */
    Invalidate() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the status of the user object's account.
     * @param {Pointer<Integer>} pdwStatus The user's account status. The status value can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_USER_ACCOUNT_RESOLVED"></a><a id="diskquota_user_account_resolved"></a><dl>
     * <dt><b>DISKQUOTA_USER_ACCOUNT_RESOLVED</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID was resolved to a user account. Names are available through 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nf-dskquota-idiskquotauser-getname">IDiskQuotaUser::GetName</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_USER_ABLE"></a><a id="diskquota_user_able"></a><dl>
     * <dt><b>DISKQUOTA_USER_ABLE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account is unavailable at this time. The network domain controller may not be available. Name information is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_USER_ACCOUNT_DELETED"></a><a id="diskquota_user_account_deleted"></a><dl>
     * <dt><b>DISKQUOTA_USER_ACCOUNT_DELETED</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account was deleted from the domain. Name information is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_USER_ACCOUNT_INVALID"></a><a id="diskquota_user_account_invalid"></a><dl>
     * <dt><b>DISKQUOTA_USER_ACCOUNT_INVALID</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account is invalid. Name information is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_USER_ACCOUNT_UNKNOWN"></a><a id="diskquota_user_account_unknown"></a><dl>
     * <dt><b>DISKQUOTA_USER_ACCOUNT_UNKNOWN</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account is unknown. Name information is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISKQUOTA_USER_ACCOUNT_UNRESOLVED"></a><a id="diskquota_user_account_unresolved"></a><dl>
     * <dt><b>DISKQUOTA_USER_ACCOUNT_UNRESOLVED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SID has not been resolved to a user account.
     * 
     * </td>
     * </tr>
     * </table>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwStatus</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dskquota/nf-dskquota-idiskquotauser-getaccountstatus
     */
    GetAccountStatus(pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }
}
