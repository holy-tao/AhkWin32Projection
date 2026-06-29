#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQQueue.ahk" { IMSMQQueue }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQQueueInfo extends IDispatch {
    /**
     * The interface identifier for IMSMQQueueInfo
     * @type {Guid}
     */
    static IID := Guid("{d7d6e07b-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQQueueInfo
     * @type {Guid}
     */
    static CLSID := Guid("{d7d6e07c-dccd-11d0-aa4b-0060970debae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQQueueInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_QueueGuid       : IntPtr
        get_ServiceTypeGuid : IntPtr
        put_ServiceTypeGuid : IntPtr
        get_Label           : IntPtr
        put_Label           : IntPtr
        get_PathName        : IntPtr
        put_PathName        : IntPtr
        get_FormatName      : IntPtr
        put_FormatName      : IntPtr
        get_IsTransactional : IntPtr
        get_PrivLevel       : IntPtr
        put_PrivLevel       : IntPtr
        get_Journal         : IntPtr
        put_Journal         : IntPtr
        get_Quota           : IntPtr
        put_Quota           : IntPtr
        get_BasePriority    : IntPtr
        put_BasePriority    : IntPtr
        get_CreateTime      : IntPtr
        get_ModifyTime      : IntPtr
        get_Authenticate    : IntPtr
        put_Authenticate    : IntPtr
        get_JournalQuota    : IntPtr
        put_JournalQuota    : IntPtr
        get_IsWorldReadable : IntPtr
        Create              : IntPtr
        Delete              : IntPtr
        Open                : IntPtr
        Refresh             : IntPtr
        Update              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQQueueInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * 
     * @returns {BSTR} 
     */
    get_QueueGuid() {
        pbstrGuidQueue := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrGuidQueue, "HRESULT")
        return pbstrGuidQueue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ServiceTypeGuid() {
        pbstrGuidServiceType := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrGuidServiceType, "HRESULT")
        return pbstrGuidServiceType
    }

    /**
     * 
     * @param {BSTR} bstrGuidServiceType 
     * @returns {HRESULT} 
     */
    put_ServiceTypeGuid(bstrGuidServiceType) {
        bstrGuidServiceType := bstrGuidServiceType is String ? BSTR.Alloc(bstrGuidServiceType).Value : bstrGuidServiceType

        result := ComCall(9, this, BSTR, bstrGuidServiceType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Label() {
        pbstrLabel := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrLabel, "HRESULT")
        return pbstrLabel
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     */
    put_Label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(11, this, BSTR, bstrLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PathName() {
        pbstrPathName := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrPathName, "HRESULT")
        return pbstrPathName
    }

    /**
     * 
     * @param {BSTR} bstrPathName 
     * @returns {HRESULT} 
     */
    put_PathName(bstrPathName) {
        bstrPathName := bstrPathName is String ? BSTR.Alloc(bstrPathName).Value : bstrPathName

        result := ComCall(13, this, BSTR, bstrPathName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FormatName() {
        pbstrFormatName := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrFormatName, "HRESULT")
        return pbstrFormatName
    }

    /**
     * 
     * @param {BSTR} bstrFormatName 
     * @returns {HRESULT} 
     */
    put_FormatName(bstrFormatName) {
        bstrFormatName := bstrFormatName is String ? BSTR.Alloc(bstrFormatName).Value : bstrFormatName

        result := ComCall(15, this, BSTR, bstrFormatName, "HRESULT")
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
        result := ComCall(25, this, VARIANT.Ptr, pvarCreateTime, "HRESULT")
        return pvarCreateTime
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ModifyTime() {
        pvarModifyTime := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, pvarModifyTime, "HRESULT")
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
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @param {Pointer<VARIANT>} IsTransactional 
     * @param {Pointer<VARIANT>} IsWorldReadable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create(IsTransactional, IsWorldReadable) {
        result := ComCall(32, this, VARIANT.Ptr, IsTransactional, VARIANT.Ptr, IsWorldReadable, "HRESULT")
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
     * @returns {IMSMQQueue} 
     */
    Open(Access, ShareMode) {
        result := ComCall(34, this, "int", Access, "int", ShareMode, "ptr*", &ppq := 0, "HRESULT")
        return IMSMQQueue(ppq)
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
     * Learn more about: Update constructor
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/update-constructor
     */
    Update() {
        result := ComCall(36, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSMQQueueInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_QueueGuid := CallbackCreate(GetMethod(implObj, "get_QueueGuid"), flags, 2)
        this.vtbl.get_ServiceTypeGuid := CallbackCreate(GetMethod(implObj, "get_ServiceTypeGuid"), flags, 2)
        this.vtbl.put_ServiceTypeGuid := CallbackCreate(GetMethod(implObj, "put_ServiceTypeGuid"), flags, 2)
        this.vtbl.get_Label := CallbackCreate(GetMethod(implObj, "get_Label"), flags, 2)
        this.vtbl.put_Label := CallbackCreate(GetMethod(implObj, "put_Label"), flags, 2)
        this.vtbl.get_PathName := CallbackCreate(GetMethod(implObj, "get_PathName"), flags, 2)
        this.vtbl.put_PathName := CallbackCreate(GetMethod(implObj, "put_PathName"), flags, 2)
        this.vtbl.get_FormatName := CallbackCreate(GetMethod(implObj, "get_FormatName"), flags, 2)
        this.vtbl.put_FormatName := CallbackCreate(GetMethod(implObj, "put_FormatName"), flags, 2)
        this.vtbl.get_IsTransactional := CallbackCreate(GetMethod(implObj, "get_IsTransactional"), flags, 2)
        this.vtbl.get_PrivLevel := CallbackCreate(GetMethod(implObj, "get_PrivLevel"), flags, 2)
        this.vtbl.put_PrivLevel := CallbackCreate(GetMethod(implObj, "put_PrivLevel"), flags, 2)
        this.vtbl.get_Journal := CallbackCreate(GetMethod(implObj, "get_Journal"), flags, 2)
        this.vtbl.put_Journal := CallbackCreate(GetMethod(implObj, "put_Journal"), flags, 2)
        this.vtbl.get_Quota := CallbackCreate(GetMethod(implObj, "get_Quota"), flags, 2)
        this.vtbl.put_Quota := CallbackCreate(GetMethod(implObj, "put_Quota"), flags, 2)
        this.vtbl.get_BasePriority := CallbackCreate(GetMethod(implObj, "get_BasePriority"), flags, 2)
        this.vtbl.put_BasePriority := CallbackCreate(GetMethod(implObj, "put_BasePriority"), flags, 2)
        this.vtbl.get_CreateTime := CallbackCreate(GetMethod(implObj, "get_CreateTime"), flags, 2)
        this.vtbl.get_ModifyTime := CallbackCreate(GetMethod(implObj, "get_ModifyTime"), flags, 2)
        this.vtbl.get_Authenticate := CallbackCreate(GetMethod(implObj, "get_Authenticate"), flags, 2)
        this.vtbl.put_Authenticate := CallbackCreate(GetMethod(implObj, "put_Authenticate"), flags, 2)
        this.vtbl.get_JournalQuota := CallbackCreate(GetMethod(implObj, "get_JournalQuota"), flags, 2)
        this.vtbl.put_JournalQuota := CallbackCreate(GetMethod(implObj, "put_JournalQuota"), flags, 2)
        this.vtbl.get_IsWorldReadable := CallbackCreate(GetMethod(implObj, "get_IsWorldReadable"), flags, 2)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 3)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 4)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_QueueGuid)
        CallbackFree(this.vtbl.get_ServiceTypeGuid)
        CallbackFree(this.vtbl.put_ServiceTypeGuid)
        CallbackFree(this.vtbl.get_Label)
        CallbackFree(this.vtbl.put_Label)
        CallbackFree(this.vtbl.get_PathName)
        CallbackFree(this.vtbl.put_PathName)
        CallbackFree(this.vtbl.get_FormatName)
        CallbackFree(this.vtbl.put_FormatName)
        CallbackFree(this.vtbl.get_IsTransactional)
        CallbackFree(this.vtbl.get_PrivLevel)
        CallbackFree(this.vtbl.put_PrivLevel)
        CallbackFree(this.vtbl.get_Journal)
        CallbackFree(this.vtbl.put_Journal)
        CallbackFree(this.vtbl.get_Quota)
        CallbackFree(this.vtbl.put_Quota)
        CallbackFree(this.vtbl.get_BasePriority)
        CallbackFree(this.vtbl.put_BasePriority)
        CallbackFree(this.vtbl.get_CreateTime)
        CallbackFree(this.vtbl.get_ModifyTime)
        CallbackFree(this.vtbl.get_Authenticate)
        CallbackFree(this.vtbl.put_Authenticate)
        CallbackFree(this.vtbl.get_JournalQuota)
        CallbackFree(this.vtbl.put_JournalQuota)
        CallbackFree(this.vtbl.get_IsWorldReadable)
        CallbackFree(this.vtbl.Create)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Update)
    }
}
