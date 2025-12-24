#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IMSMQQueue3.ahk
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
     * @type {BSTR} 
     */
    QueueGuid {
        get => this.get_QueueGuid()
    }

    /**
     * @type {BSTR} 
     */
    ServiceTypeGuid {
        get => this.get_ServiceTypeGuid()
        set => this.put_ServiceTypeGuid(value)
    }

    /**
     * @type {BSTR} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * @type {BSTR} 
     */
    PathName {
        get => this.get_PathName()
        set => this.put_PathName(value)
    }

    /**
     * @type {BSTR} 
     */
    FormatName {
        get => this.get_FormatName()
        set => this.put_FormatName(value)
    }

    /**
     * @type {Integer} 
     */
    IsTransactional {
        get => this.get_IsTransactional()
    }

    /**
     * @type {Integer} 
     */
    PrivLevel {
        get => this.get_PrivLevel()
        set => this.put_PrivLevel(value)
    }

    /**
     * @type {Integer} 
     */
    Journal {
        get => this.get_Journal()
        set => this.put_Journal(value)
    }

    /**
     * @type {Integer} 
     */
    Quota {
        get => this.get_Quota()
        set => this.put_Quota(value)
    }

    /**
     * @type {Integer} 
     */
    BasePriority {
        get => this.get_BasePriority()
        set => this.put_BasePriority(value)
    }

    /**
     * @type {VARIANT} 
     */
    CreateTime {
        get => this.get_CreateTime()
    }

    /**
     * @type {VARIANT} 
     */
    ModifyTime {
        get => this.get_ModifyTime()
    }

    /**
     * @type {Integer} 
     */
    Authenticate {
        get => this.get_Authenticate()
        set => this.put_Authenticate(value)
    }

    /**
     * @type {Integer} 
     */
    JournalQuota {
        get => this.get_JournalQuota()
        set => this.put_JournalQuota(value)
    }

    /**
     * @type {Integer} 
     */
    IsWorldReadable {
        get => this.get_IsWorldReadable()
    }

    /**
     * @type {BSTR} 
     */
    PathNameDNS {
        get => this.get_PathNameDNS()
    }

    /**
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {VARIANT} 
     */
    Security {
        get => this.get_Security()
        set => this.put_Security(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsTransactional2 {
        get => this.get_IsTransactional2()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsWorldReadable2 {
        get => this.get_IsWorldReadable2()
    }

    /**
     * @type {BSTR} 
     */
    MulticastAddress {
        get => this.get_MulticastAddress()
        set => this.put_MulticastAddress(value)
    }

    /**
     * @type {BSTR} 
     */
    ADsPath {
        get => this.get_ADsPath()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_QueueGuid() {
        pbstrGuidQueue := BSTR()
        result := ComCall(7, this, "ptr", pbstrGuidQueue, "HRESULT")
        return pbstrGuidQueue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ServiceTypeGuid() {
        pbstrGuidServiceType := BSTR()
        result := ComCall(8, this, "ptr", pbstrGuidServiceType, "HRESULT")
        return pbstrGuidServiceType
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
     * @returns {BSTR} 
     */
    get_Label() {
        pbstrLabel := BSTR()
        result := ComCall(10, this, "ptr", pbstrLabel, "HRESULT")
        return pbstrLabel
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
     * @returns {BSTR} 
     */
    get_PathName() {
        pbstrPathName := BSTR()
        result := ComCall(12, this, "ptr", pbstrPathName, "HRESULT")
        return pbstrPathName
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
     * @returns {BSTR} 
     */
    get_FormatName() {
        pbstrFormatName := BSTR()
        result := ComCall(14, this, "ptr", pbstrFormatName, "HRESULT")
        return pbstrFormatName
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
     * @returns {Integer} 
     */
    get_IsTransactional() {
        result := ComCall(16, this, "short*", &pisTransactional := 0, "HRESULT")
        return pisTransactional
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivLevel() {
        result := ComCall(17, this, "int*", &plPrivLevel := 0, "HRESULT")
        return plPrivLevel
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
     * @returns {Integer} 
     */
    get_Journal() {
        result := ComCall(19, this, "int*", &plJournal := 0, "HRESULT")
        return plJournal
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
     * @returns {Integer} 
     */
    get_Quota() {
        result := ComCall(21, this, "int*", &plQuota := 0, "HRESULT")
        return plQuota
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
     * @returns {Integer} 
     */
    get_BasePriority() {
        result := ComCall(23, this, "int*", &plBasePriority := 0, "HRESULT")
        return plBasePriority
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
     * @returns {VARIANT} 
     */
    get_CreateTime() {
        pvarCreateTime := VARIANT()
        result := ComCall(25, this, "ptr", pvarCreateTime, "HRESULT")
        return pvarCreateTime
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ModifyTime() {
        pvarModifyTime := VARIANT()
        result := ComCall(26, this, "ptr", pvarModifyTime, "HRESULT")
        return pvarModifyTime
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Authenticate() {
        result := ComCall(27, this, "int*", &plAuthenticate := 0, "HRESULT")
        return plAuthenticate
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
     * @returns {Integer} 
     */
    get_JournalQuota() {
        result := ComCall(29, this, "int*", &plJournalQuota := 0, "HRESULT")
        return plJournalQuota
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
     * @returns {Integer} 
     */
    get_IsWorldReadable() {
        result := ComCall(31, this, "short*", &pisWorldReadable := 0, "HRESULT")
        return pisWorldReadable
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
     * @returns {IMSMQQueue3} 
     */
    Open(Access, ShareMode) {
        result := ComCall(34, this, "int", Access, "int", ShareMode, "ptr*", &ppq := 0, "HRESULT")
        return IMSMQQueue3(ppq)
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
     * @returns {BSTR} 
     */
    get_PathNameDNS() {
        pbstrPathNameDNS := BSTR()
        result := ComCall(37, this, "ptr", pbstrPathNameDNS, "HRESULT")
        return pbstrPathNameDNS
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(38, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Security() {
        pvarSecurity := VARIANT()
        result := ComCall(39, this, "ptr", pvarSecurity, "HRESULT")
        return pvarSecurity
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
     * @returns {VARIANT_BOOL} 
     */
    get_IsTransactional2() {
        result := ComCall(41, this, "short*", &pisTransactional := 0, "HRESULT")
        return pisTransactional
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsWorldReadable2() {
        result := ComCall(42, this, "short*", &pisWorldReadable := 0, "HRESULT")
        return pisWorldReadable
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_MulticastAddress() {
        pbstrMulticastAddress := BSTR()
        result := ComCall(43, this, "ptr", pbstrMulticastAddress, "HRESULT")
        return pbstrMulticastAddress
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
     * @returns {BSTR} 
     */
    get_ADsPath() {
        pbstrADsPath := BSTR()
        result := ComCall(45, this, "ptr", pbstrADsPath, "HRESULT")
        return pbstrADsPath
    }
}
