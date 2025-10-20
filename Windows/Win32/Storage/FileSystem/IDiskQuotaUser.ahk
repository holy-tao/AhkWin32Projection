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
     * 
     * @param {Pointer<Integer>} pulID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getid
     */
    GetID(pulID) {
        result := ComCall(3, this, "uint*", pulID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAccountContainer 
     * @param {Integer} cchAccountContainer 
     * @param {PWSTR} pszLogonName 
     * @param {Integer} cchLogonName 
     * @param {PWSTR} pszDisplayName 
     * @param {Integer} cchDisplayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getname
     */
    GetName(pszAccountContainer, cchAccountContainer, pszLogonName, cchLogonName, pszDisplayName, cchDisplayName) {
        pszAccountContainer := pszAccountContainer is String ? StrPtr(pszAccountContainer) : pszAccountContainer
        pszLogonName := pszLogonName is String ? StrPtr(pszLogonName) : pszLogonName
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(4, this, "ptr", pszAccountContainer, "uint", cchAccountContainer, "ptr", pszLogonName, "uint", cchLogonName, "ptr", pszDisplayName, "uint", cchDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getsidlength
     */
    GetSidLength(pdwLength) {
        result := ComCall(5, this, "uint*", pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbSidBuffer 
     * @param {Integer} cbSidBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getsid
     */
    GetSid(pbSidBuffer, cbSidBuffer) {
        result := ComCall(6, this, "char*", pbSidBuffer, "uint", cbSidBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pllThreshold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getquotathreshold
     */
    GetQuotaThreshold(pllThreshold) {
        result := ComCall(7, this, "int64*", pllThreshold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getquotathresholdtext
     */
    GetQuotaThresholdText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(8, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pllLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getquotalimit
     */
    GetQuotaLimit(pllLimit) {
        result := ComCall(9, this, "int64*", pllLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getquotalimittext
     */
    GetQuotaLimitText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(10, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pllUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getquotaused
     */
    GetQuotaUsed(pllUsed) {
        result := ComCall(11, this, "int64*", pllUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getquotausedtext
     */
    GetQuotaUsedText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(12, this, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pbQuotaInfo 
     * @param {Integer} cbQuotaInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getquotainformation
     */
    GetQuotaInformation(pbQuotaInfo, cbQuotaInfo) {
        result := ComCall(13, this, "ptr", pbQuotaInfo, "uint", cbQuotaInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} llThreshold 
     * @param {BOOL} fWriteThrough 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-setquotathreshold
     */
    SetQuotaThreshold(llThreshold, fWriteThrough) {
        result := ComCall(14, this, "int64", llThreshold, "int", fWriteThrough, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} llLimit 
     * @param {BOOL} fWriteThrough 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-setquotalimit
     */
    SetQuotaLimit(llLimit, fWriteThrough) {
        result := ComCall(15, this, "int64", llLimit, "int", fWriteThrough, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-invalidate
     */
    Invalidate() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauser-getaccountstatus
     */
    GetAccountStatus(pdwStatus) {
        result := ComCall(17, this, "uint*", pdwStatus, "HRESULT")
        return result
    }
}
