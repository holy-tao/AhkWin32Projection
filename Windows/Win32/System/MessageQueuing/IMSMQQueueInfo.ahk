#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueueInfo extends IDispatch{
    /**
     * The interface identifier for IMSMQQueueInfo
     * @type {Guid}
     */
    static IID => Guid("{d7d6e07b-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQQueueInfo
     * @type {Guid}
     */
    static CLSID => Guid("{d7d6e07c-dccd-11d0-aa4b-0060970debae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGuidQueue 
     * @returns {HRESULT} 
     */
    get_QueueGuid(pbstrGuidQueue) {
        result := ComCall(7, this, "ptr", pbstrGuidQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGuidServiceType 
     * @returns {HRESULT} 
     */
    get_ServiceTypeGuid(pbstrGuidServiceType) {
        result := ComCall(8, this, "ptr", pbstrGuidServiceType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGuidServiceType 
     * @returns {HRESULT} 
     */
    put_ServiceTypeGuid(bstrGuidServiceType) {
        bstrGuidServiceType := bstrGuidServiceType is String ? BSTR.Alloc(bstrGuidServiceType).Value : bstrGuidServiceType

        result := ComCall(9, this, "ptr", bstrGuidServiceType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLabel 
     * @returns {HRESULT} 
     */
    get_Label(pbstrLabel) {
        result := ComCall(10, this, "ptr", pbstrLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     */
    put_Label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(11, this, "ptr", bstrLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPathName 
     * @returns {HRESULT} 
     */
    get_PathName(pbstrPathName) {
        result := ComCall(12, this, "ptr", pbstrPathName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPathName 
     * @returns {HRESULT} 
     */
    put_PathName(bstrPathName) {
        bstrPathName := bstrPathName is String ? BSTR.Alloc(bstrPathName).Value : bstrPathName

        result := ComCall(13, this, "ptr", bstrPathName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFormatName 
     * @returns {HRESULT} 
     */
    get_FormatName(pbstrFormatName) {
        result := ComCall(14, this, "ptr", pbstrFormatName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFormatName 
     * @returns {HRESULT} 
     */
    put_FormatName(bstrFormatName) {
        bstrFormatName := bstrFormatName is String ? BSTR.Alloc(bstrFormatName).Value : bstrFormatName

        result := ComCall(15, this, "ptr", bstrFormatName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pisTransactional 
     * @returns {HRESULT} 
     */
    get_IsTransactional(pisTransactional) {
        result := ComCall(16, this, "short*", pisTransactional, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPrivLevel 
     * @returns {HRESULT} 
     */
    get_PrivLevel(plPrivLevel) {
        result := ComCall(17, this, "int*", plPrivLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPrivLevel 
     * @returns {HRESULT} 
     */
    put_PrivLevel(lPrivLevel) {
        result := ComCall(18, this, "int", lPrivLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plJournal 
     * @returns {HRESULT} 
     */
    get_Journal(plJournal) {
        result := ComCall(19, this, "int*", plJournal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lJournal 
     * @returns {HRESULT} 
     */
    put_Journal(lJournal) {
        result := ComCall(20, this, "int", lJournal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plQuota 
     * @returns {HRESULT} 
     */
    get_Quota(plQuota) {
        result := ComCall(21, this, "int*", plQuota, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lQuota 
     * @returns {HRESULT} 
     */
    put_Quota(lQuota) {
        result := ComCall(22, this, "int", lQuota, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBasePriority 
     * @returns {HRESULT} 
     */
    get_BasePriority(plBasePriority) {
        result := ComCall(23, this, "int*", plBasePriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lBasePriority 
     * @returns {HRESULT} 
     */
    put_BasePriority(lBasePriority) {
        result := ComCall(24, this, "int", lBasePriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarCreateTime 
     * @returns {HRESULT} 
     */
    get_CreateTime(pvarCreateTime) {
        result := ComCall(25, this, "ptr", pvarCreateTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarModifyTime 
     * @returns {HRESULT} 
     */
    get_ModifyTime(pvarModifyTime) {
        result := ComCall(26, this, "ptr", pvarModifyTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAuthenticate 
     * @returns {HRESULT} 
     */
    get_Authenticate(plAuthenticate) {
        result := ComCall(27, this, "int*", plAuthenticate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAuthenticate 
     * @returns {HRESULT} 
     */
    put_Authenticate(lAuthenticate) {
        result := ComCall(28, this, "int", lAuthenticate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plJournalQuota 
     * @returns {HRESULT} 
     */
    get_JournalQuota(plJournalQuota) {
        result := ComCall(29, this, "int*", plJournalQuota, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lJournalQuota 
     * @returns {HRESULT} 
     */
    put_JournalQuota(lJournalQuota) {
        result := ComCall(30, this, "int", lJournalQuota, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pisWorldReadable 
     * @returns {HRESULT} 
     */
    get_IsWorldReadable(pisWorldReadable) {
        result := ComCall(31, this, "short*", pisWorldReadable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} IsTransactional 
     * @param {Pointer<VARIANT>} IsWorldReadable 
     * @returns {HRESULT} 
     */
    Create(IsTransactional, IsWorldReadable) {
        result := ComCall(32, this, "ptr", IsTransactional, "ptr", IsWorldReadable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(33, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Access 
     * @param {Integer} ShareMode 
     * @param {Pointer<IMSMQQueue>} ppq 
     * @returns {HRESULT} 
     */
    Open(Access, ShareMode, ppq) {
        result := ComCall(34, this, "int", Access, "int", ShareMode, "ptr", ppq, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(35, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Update() {
        result := ComCall(36, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
