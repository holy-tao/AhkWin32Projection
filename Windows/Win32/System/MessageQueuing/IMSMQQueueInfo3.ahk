#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueueInfo3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQueueInfo3
     * @type {Guid}
     */
    static IID => Guid("{eba96b1d-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QueueGuid", "get_ServiceTypeGuid", "put_ServiceTypeGuid", "get_Label", "put_Label", "get_PathName", "put_PathName", "get_FormatName", "put_FormatName", "get_IsTransactional", "get_PrivLevel", "put_PrivLevel", "get_Journal", "put_Journal", "get_Quota", "put_Quota", "get_BasePriority", "put_BasePriority", "get_CreateTime", "get_ModifyTime", "get_Authenticate", "put_Authenticate", "get_JournalQuota", "put_JournalQuota", "get_IsWorldReadable", "Create", "Delete", "Open", "Refresh", "Update", "get_PathNameDNS", "get_Properties", "get_Security", "put_Security", "get_IsTransactional2", "get_IsWorldReadable2", "get_MulticastAddress", "put_MulticastAddress", "get_ADsPath"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGuidQueue 
     * @returns {HRESULT} 
     */
    get_QueueGuid(pbstrGuidQueue) {
        result := ComCall(7, this, "ptr", pbstrGuidQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGuidServiceType 
     * @returns {HRESULT} 
     */
    get_ServiceTypeGuid(pbstrGuidServiceType) {
        result := ComCall(8, this, "ptr", pbstrGuidServiceType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGuidServiceType 
     * @returns {HRESULT} 
     */
    put_ServiceTypeGuid(bstrGuidServiceType) {
        bstrGuidServiceType := bstrGuidServiceType is String ? BSTR.Alloc(bstrGuidServiceType).Value : bstrGuidServiceType

        result := ComCall(9, this, "ptr", bstrGuidServiceType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLabel 
     * @returns {HRESULT} 
     */
    get_Label(pbstrLabel) {
        result := ComCall(10, this, "ptr", pbstrLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     */
    put_Label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(11, this, "ptr", bstrLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPathName 
     * @returns {HRESULT} 
     */
    get_PathName(pbstrPathName) {
        result := ComCall(12, this, "ptr", pbstrPathName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPathName 
     * @returns {HRESULT} 
     */
    put_PathName(bstrPathName) {
        bstrPathName := bstrPathName is String ? BSTR.Alloc(bstrPathName).Value : bstrPathName

        result := ComCall(13, this, "ptr", bstrPathName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFormatName 
     * @returns {HRESULT} 
     */
    get_FormatName(pbstrFormatName) {
        result := ComCall(14, this, "ptr", pbstrFormatName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFormatName 
     * @returns {HRESULT} 
     */
    put_FormatName(bstrFormatName) {
        bstrFormatName := bstrFormatName is String ? BSTR.Alloc(bstrFormatName).Value : bstrFormatName

        result := ComCall(15, this, "ptr", bstrFormatName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pisTransactional 
     * @returns {HRESULT} 
     */
    get_IsTransactional(pisTransactional) {
        result := ComCall(16, this, "short*", pisTransactional, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPrivLevel 
     * @returns {HRESULT} 
     */
    get_PrivLevel(plPrivLevel) {
        result := ComCall(17, this, "int*", plPrivLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPrivLevel 
     * @returns {HRESULT} 
     */
    put_PrivLevel(lPrivLevel) {
        result := ComCall(18, this, "int", lPrivLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plJournal 
     * @returns {HRESULT} 
     */
    get_Journal(plJournal) {
        result := ComCall(19, this, "int*", plJournal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lJournal 
     * @returns {HRESULT} 
     */
    put_Journal(lJournal) {
        result := ComCall(20, this, "int", lJournal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plQuota 
     * @returns {HRESULT} 
     */
    get_Quota(plQuota) {
        result := ComCall(21, this, "int*", plQuota, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lQuota 
     * @returns {HRESULT} 
     */
    put_Quota(lQuota) {
        result := ComCall(22, this, "int", lQuota, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plBasePriority 
     * @returns {HRESULT} 
     */
    get_BasePriority(plBasePriority) {
        result := ComCall(23, this, "int*", plBasePriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lBasePriority 
     * @returns {HRESULT} 
     */
    put_BasePriority(lBasePriority) {
        result := ComCall(24, this, "int", lBasePriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarCreateTime 
     * @returns {HRESULT} 
     */
    get_CreateTime(pvarCreateTime) {
        result := ComCall(25, this, "ptr", pvarCreateTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarModifyTime 
     * @returns {HRESULT} 
     */
    get_ModifyTime(pvarModifyTime) {
        result := ComCall(26, this, "ptr", pvarModifyTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plAuthenticate 
     * @returns {HRESULT} 
     */
    get_Authenticate(plAuthenticate) {
        result := ComCall(27, this, "int*", plAuthenticate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lAuthenticate 
     * @returns {HRESULT} 
     */
    put_Authenticate(lAuthenticate) {
        result := ComCall(28, this, "int", lAuthenticate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plJournalQuota 
     * @returns {HRESULT} 
     */
    get_JournalQuota(plJournalQuota) {
        result := ComCall(29, this, "int*", plJournalQuota, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lJournalQuota 
     * @returns {HRESULT} 
     */
    put_JournalQuota(lJournalQuota) {
        result := ComCall(30, this, "int", lJournalQuota, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pisWorldReadable 
     * @returns {HRESULT} 
     */
    get_IsWorldReadable(pisWorldReadable) {
        result := ComCall(31, this, "short*", pisWorldReadable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} IsTransactional 
     * @param {Pointer<VARIANT>} IsWorldReadable 
     * @returns {HRESULT} 
     */
    Create(IsTransactional, IsWorldReadable) {
        result := ComCall(32, this, "ptr", IsTransactional, "ptr", IsWorldReadable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Access 
     * @param {Integer} ShareMode 
     * @param {Pointer<IMSMQQueue3>} ppq 
     * @returns {HRESULT} 
     */
    Open(Access, ShareMode, ppq) {
        result := ComCall(34, this, "int", Access, "int", ShareMode, "ptr*", ppq, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Update() {
        result := ComCall(36, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPathNameDNS 
     * @returns {HRESULT} 
     */
    get_PathNameDNS(pbstrPathNameDNS) {
        result := ComCall(37, this, "ptr", pbstrPathNameDNS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(38, this, "ptr*", ppcolProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSecurity 
     * @returns {HRESULT} 
     */
    get_Security(pvarSecurity) {
        result := ComCall(39, this, "ptr", pvarSecurity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varSecurity 
     * @returns {HRESULT} 
     */
    put_Security(varSecurity) {
        result := ComCall(40, this, "ptr", varSecurity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pisTransactional 
     * @returns {HRESULT} 
     */
    get_IsTransactional2(pisTransactional) {
        result := ComCall(41, this, "ptr", pisTransactional, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pisWorldReadable 
     * @returns {HRESULT} 
     */
    get_IsWorldReadable2(pisWorldReadable) {
        result := ComCall(42, this, "ptr", pisWorldReadable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMulticastAddress 
     * @returns {HRESULT} 
     */
    get_MulticastAddress(pbstrMulticastAddress) {
        result := ComCall(43, this, "ptr", pbstrMulticastAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMulticastAddress 
     * @returns {HRESULT} 
     */
    put_MulticastAddress(bstrMulticastAddress) {
        bstrMulticastAddress := bstrMulticastAddress is String ? BSTR.Alloc(bstrMulticastAddress).Value : bstrMulticastAddress

        result := ComCall(44, this, "ptr", bstrMulticastAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrADsPath 
     * @returns {HRESULT} 
     */
    get_ADsPath(pbstrADsPath) {
        result := ComCall(45, this, "ptr", pbstrADsPath, "HRESULT")
        return result
    }
}
