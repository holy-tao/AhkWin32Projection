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
     * 
     * @param {Pointer<UInt32>} pulID 
     * @returns {HRESULT} 
     */
    GetID(pulID) {
        result := ComCall(3, this, "uint*", pulID, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    GetName(pszAccountContainer, cchAccountContainer, pszLogonName, cchLogonName, pszDisplayName, cchDisplayName) {
        pszAccountContainer := pszAccountContainer is String ? StrPtr(pszAccountContainer) : pszAccountContainer
        pszLogonName := pszLogonName is String ? StrPtr(pszLogonName) : pszLogonName
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(4, this, "ptr", pszAccountContainer, "uint", cchAccountContainer, "ptr", pszLogonName, "uint", cchLogonName, "ptr", pszDisplayName, "uint", cchDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetSidLength(pdwLength) {
        result := ComCall(5, this, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbSidBuffer 
     * @param {Integer} cbSidBuffer 
     * @returns {HRESULT} 
     */
    GetSid(pbSidBuffer, cbSidBuffer) {
        result := ComCall(6, this, "char*", pbSidBuffer, "uint", cbSidBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pllThreshold 
     * @returns {HRESULT} 
     */
    GetQuotaThreshold(pllThreshold) {
        result := ComCall(7, this, "int64*", pllThreshold, "int")
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
    GetQuotaThresholdText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(8, this, "ptr", pszText, "uint", cchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pllLimit 
     * @returns {HRESULT} 
     */
    GetQuotaLimit(pllLimit) {
        result := ComCall(9, this, "int64*", pllLimit, "int")
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
    GetQuotaLimitText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(10, this, "ptr", pszText, "uint", cchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pllUsed 
     * @returns {HRESULT} 
     */
    GetQuotaUsed(pllUsed) {
        result := ComCall(11, this, "int64*", pllUsed, "int")
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
    GetQuotaUsedText(pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(12, this, "ptr", pszText, "uint", cchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pbQuotaInfo 
     * @param {Integer} cbQuotaInfo 
     * @returns {HRESULT} 
     */
    GetQuotaInformation(pbQuotaInfo, cbQuotaInfo) {
        result := ComCall(13, this, "ptr", pbQuotaInfo, "uint", cbQuotaInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} llThreshold 
     * @param {BOOL} fWriteThrough 
     * @returns {HRESULT} 
     */
    SetQuotaThreshold(llThreshold, fWriteThrough) {
        result := ComCall(14, this, "int64", llThreshold, "int", fWriteThrough, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} llLimit 
     * @param {BOOL} fWriteThrough 
     * @returns {HRESULT} 
     */
    SetQuotaLimit(llLimit, fWriteThrough) {
        result := ComCall(15, this, "int64", llLimit, "int", fWriteThrough, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Invalidate() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetAccountStatus(pdwStatus) {
        result := ComCall(17, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
