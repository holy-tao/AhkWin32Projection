#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IConnectionPointContainer.ahk

/**
 * Controls the disk quota facilities of a single NTFS file system volume.
 * @see https://docs.microsoft.com/windows/win32/api//dskquota/nn-dskquota-idiskquotacontrol
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IDiskQuotaControl extends IConnectionPointContainer{
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

        result := ComCall(5, this, "ptr", pszPath, "int", bReadWrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     */
    SetQuotaState(dwState) {
        result := ComCall(6, this, "uint", dwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwState 
     * @returns {HRESULT} 
     */
    GetQuotaState(pdwState) {
        result := ComCall(7, this, "uint*", pdwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetQuotaLogFlags(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetQuotaLogFlags(pdwFlags) {
        result := ComCall(9, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} llThreshold 
     * @returns {HRESULT} 
     */
    SetDefaultQuotaThreshold(llThreshold) {
        result := ComCall(10, this, "int64", llThreshold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pllThreshold 
     * @returns {HRESULT} 
     */
    GetDefaultQuotaThreshold(pllThreshold) {
        result := ComCall(11, this, "int64*", pllThreshold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     */
    GetDefaultQuotaThresholdText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(12, this, "ptr", pszText, "uint", cchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} llLimit 
     * @returns {HRESULT} 
     */
    SetDefaultQuotaLimit(llLimit) {
        result := ComCall(13, this, "int64", llLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pllLimit 
     * @returns {HRESULT} 
     */
    GetDefaultQuotaLimit(pllLimit) {
        result := ComCall(14, this, "int64*", pllLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     */
    GetDefaultQuotaLimitText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(15, this, "ptr", pszText, "uint", cchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSID} pUserSid 
     * @param {Integer} fNameResolution 
     * @param {Pointer<IDiskQuotaUser>} ppUser 
     * @returns {HRESULT} 
     */
    AddUserSid(pUserSid, fNameResolution, ppUser) {
        result := ComCall(16, this, "ptr", pUserSid, "uint", fNameResolution, "ptr", ppUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszLogonName 
     * @param {Integer} fNameResolution 
     * @param {Pointer<IDiskQuotaUser>} ppUser 
     * @returns {HRESULT} 
     */
    AddUserName(pszLogonName, fNameResolution, ppUser) {
        pszLogonName := pszLogonName is String ? StrPtr(pszLogonName) : pszLogonName

        result := ComCall(17, this, "ptr", pszLogonName, "uint", fNameResolution, "ptr", ppUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiskQuotaUser>} pUser 
     * @returns {HRESULT} 
     */
    DeleteUser(pUser) {
        result := ComCall(18, this, "ptr", pUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSID} pUserSid 
     * @param {Integer} fNameResolution 
     * @param {Pointer<IDiskQuotaUser>} ppUser 
     * @returns {HRESULT} 
     */
    FindUserSid(pUserSid, fNameResolution, ppUser) {
        result := ComCall(19, this, "ptr", pUserSid, "uint", fNameResolution, "ptr", ppUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszLogonName 
     * @param {Pointer<IDiskQuotaUser>} ppUser 
     * @returns {HRESULT} 
     */
    FindUserName(pszLogonName, ppUser) {
        pszLogonName := pszLogonName is String ? StrPtr(pszLogonName) : pszLogonName

        result := ComCall(20, this, "ptr", pszLogonName, "ptr", ppUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PSID>} rgpUserSids 
     * @param {Integer} cpSids 
     * @param {Integer} fNameResolution 
     * @param {Pointer<IEnumDiskQuotaUsers>} ppEnum 
     * @returns {HRESULT} 
     */
    CreateEnumUsers(rgpUserSids, cpSids, fNameResolution, ppEnum) {
        result := ComCall(21, this, "ptr", rgpUserSids, "uint", cpSids, "uint", fNameResolution, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiskQuotaUserBatch>} ppBatch 
     * @returns {HRESULT} 
     */
    CreateUserBatch(ppBatch) {
        result := ComCall(22, this, "ptr", ppBatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateSidNameCache() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiskQuotaUser>} pUser 
     * @returns {HRESULT} 
     */
    GiveUserNameResolutionPriority(pUser) {
        result := ComCall(24, this, "ptr", pUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShutdownNameResolution() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
