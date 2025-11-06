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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pszPath 
     * @param {BOOL} bReadWrite 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pszPath, bReadWrite) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(5, this, "ptr", pszPath, "int", bReadWrite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-setquotastate
     */
    SetQuotaState(dwState) {
        result := ComCall(6, this, "uint", dwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-getquotastate
     */
    GetQuotaState(pdwState) {
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwStateMarshal, pdwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-setquotalogflags
     */
    SetQuotaLogFlags(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-getquotalogflags
     */
    GetQuotaLogFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} llThreshold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-setdefaultquotathreshold
     */
    SetDefaultQuotaThreshold(llThreshold) {
        result := ComCall(10, this, "int64", llThreshold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pllThreshold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-getdefaultquotathreshold
     */
    GetDefaultQuotaThreshold(pllThreshold) {
        pllThresholdMarshal := pllThreshold is VarRef ? "int64*" : "ptr"

        result := ComCall(11, this, pllThresholdMarshal, pllThreshold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-getdefaultquotathresholdtext
     */
    GetDefaultQuotaThresholdText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(12, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} llLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-setdefaultquotalimit
     */
    SetDefaultQuotaLimit(llLimit) {
        result := ComCall(13, this, "int64", llLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pllLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-getdefaultquotalimit
     */
    GetDefaultQuotaLimit(pllLimit) {
        pllLimitMarshal := pllLimit is VarRef ? "int64*" : "ptr"

        result := ComCall(14, this, pllLimitMarshal, pllLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-getdefaultquotalimittext
     */
    GetDefaultQuotaLimitText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(15, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSID} pUserSid 
     * @param {Integer} fNameResolution 
     * @returns {IDiskQuotaUser} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-addusersid
     */
    AddUserSid(pUserSid, fNameResolution) {
        result := ComCall(16, this, "ptr", pUserSid, "uint", fNameResolution, "ptr*", &ppUser := 0, "HRESULT")
        return IDiskQuotaUser(ppUser)
    }

    /**
     * 
     * @param {PWSTR} pszLogonName 
     * @param {Integer} fNameResolution 
     * @returns {IDiskQuotaUser} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-addusername
     */
    AddUserName(pszLogonName, fNameResolution) {
        pszLogonName := pszLogonName is String ? StrPtr(pszLogonName) : pszLogonName

        result := ComCall(17, this, "ptr", pszLogonName, "uint", fNameResolution, "ptr*", &ppUser := 0, "HRESULT")
        return IDiskQuotaUser(ppUser)
    }

    /**
     * 
     * @param {IDiskQuotaUser} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-deleteuser
     */
    DeleteUser(pUser) {
        result := ComCall(18, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSID} pUserSid 
     * @param {Integer} fNameResolution 
     * @returns {IDiskQuotaUser} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-findusersid
     */
    FindUserSid(pUserSid, fNameResolution) {
        result := ComCall(19, this, "ptr", pUserSid, "uint", fNameResolution, "ptr*", &ppUser := 0, "HRESULT")
        return IDiskQuotaUser(ppUser)
    }

    /**
     * 
     * @param {PWSTR} pszLogonName 
     * @returns {IDiskQuotaUser} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-findusername
     */
    FindUserName(pszLogonName) {
        pszLogonName := pszLogonName is String ? StrPtr(pszLogonName) : pszLogonName

        result := ComCall(20, this, "ptr", pszLogonName, "ptr*", &ppUser := 0, "HRESULT")
        return IDiskQuotaUser(ppUser)
    }

    /**
     * 
     * @param {Pointer<PSID>} rgpUserSids 
     * @param {Integer} cpSids 
     * @param {Integer} fNameResolution 
     * @returns {IEnumDiskQuotaUsers} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-createenumusers
     */
    CreateEnumUsers(rgpUserSids, cpSids, fNameResolution) {
        rgpUserSidsMarshal := rgpUserSids is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, rgpUserSidsMarshal, rgpUserSids, "uint", cpSids, "uint", fNameResolution, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDiskQuotaUsers(ppEnum)
    }

    /**
     * 
     * @returns {IDiskQuotaUserBatch} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-createuserbatch
     */
    CreateUserBatch() {
        result := ComCall(22, this, "ptr*", &ppBatch := 0, "HRESULT")
        return IDiskQuotaUserBatch(ppBatch)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-invalidatesidnamecache
     */
    InvalidateSidNameCache() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDiskQuotaUser} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-giveusernameresolutionpriority
     */
    GiveUserNameResolutionPriority(pUser) {
        result := ComCall(24, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotacontrol-shutdownnameresolution
     */
    ShutdownNameResolution() {
        result := ComCall(25, this, "HRESULT")
        return result
    }
}
