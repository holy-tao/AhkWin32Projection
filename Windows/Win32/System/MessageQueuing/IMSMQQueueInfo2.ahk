#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IMSMQQueue2.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueueInfo2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQueueInfo2
     * @type {Guid}
     */
    static IID => Guid("{fd174a80-89cf-11d2-b0f2-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QueueGuid", "get_ServiceTypeGuid", "put_ServiceTypeGuid", "get_Label", "put_Label", "get_PathName", "put_PathName", "get_FormatName", "put_FormatName", "get_IsTransactional", "get_PrivLevel", "put_PrivLevel", "get_Journal", "put_Journal", "get_Quota", "put_Quota", "get_BasePriority", "put_BasePriority", "get_CreateTime", "get_ModifyTime", "get_Authenticate", "put_Authenticate", "get_JournalQuota", "put_JournalQuota", "get_IsWorldReadable", "Create", "Delete", "Open", "Refresh", "Update", "get_PathNameDNS", "get_Properties", "get_Security", "put_Security"]

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
     * 
     * @returns {BSTR} 
     */
    get_QueueGuid() {
        pbstrGuidQueue := BSTR()
        result := ComCall(7, this, "ptr", pbstrGuidQueue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrGuidQueue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ServiceTypeGuid() {
        pbstrGuidServiceType := BSTR()
        result := ComCall(8, this, "ptr", pbstrGuidServiceType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrGuidServiceType
    }

    /**
     * 
     * @param {BSTR} bstrGuidServiceType 
     * @returns {HRESULT} 
     */
    put_ServiceTypeGuid(bstrGuidServiceType) {
        if(bstrGuidServiceType is String) {
            pin := BSTR.Alloc(bstrGuidServiceType)
            bstrGuidServiceType := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrGuidServiceType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Label() {
        pbstrLabel := BSTR()
        result := ComCall(10, this, "ptr", pbstrLabel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrLabel
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     */
    put_Label(bstrLabel) {
        if(bstrLabel is String) {
            pin := BSTR.Alloc(bstrLabel)
            bstrLabel := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrLabel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PathName() {
        pbstrPathName := BSTR()
        result := ComCall(12, this, "ptr", pbstrPathName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrPathName
    }

    /**
     * 
     * @param {BSTR} bstrPathName 
     * @returns {HRESULT} 
     */
    put_PathName(bstrPathName) {
        if(bstrPathName is String) {
            pin := BSTR.Alloc(bstrPathName)
            bstrPathName := pin.Value
        }

        result := ComCall(13, this, "ptr", bstrPathName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FormatName() {
        pbstrFormatName := BSTR()
        result := ComCall(14, this, "ptr", pbstrFormatName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFormatName
    }

    /**
     * 
     * @param {BSTR} bstrFormatName 
     * @returns {HRESULT} 
     */
    put_FormatName(bstrFormatName) {
        if(bstrFormatName is String) {
            pin := BSTR.Alloc(bstrFormatName)
            bstrFormatName := pin.Value
        }

        result := ComCall(15, this, "ptr", bstrFormatName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsTransactional() {
        result := ComCall(16, this, "short*", &pisTransactional := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pisTransactional
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivLevel() {
        result := ComCall(17, this, "int*", &plPrivLevel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plPrivLevel
    }

    /**
     * 
     * @param {Integer} lPrivLevel 
     * @returns {HRESULT} 
     */
    put_PrivLevel(lPrivLevel) {
        result := ComCall(18, this, "int", lPrivLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Journal() {
        result := ComCall(19, this, "int*", &plJournal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plJournal
    }

    /**
     * 
     * @param {Integer} lJournal 
     * @returns {HRESULT} 
     */
    put_Journal(lJournal) {
        result := ComCall(20, this, "int", lJournal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Quota() {
        result := ComCall(21, this, "int*", &plQuota := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plQuota
    }

    /**
     * 
     * @param {Integer} lQuota 
     * @returns {HRESULT} 
     */
    put_Quota(lQuota) {
        result := ComCall(22, this, "int", lQuota, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BasePriority() {
        result := ComCall(23, this, "int*", &plBasePriority := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plBasePriority
    }

    /**
     * 
     * @param {Integer} lBasePriority 
     * @returns {HRESULT} 
     */
    put_BasePriority(lBasePriority) {
        result := ComCall(24, this, "int", lBasePriority, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CreateTime() {
        pvarCreateTime := VARIANT()
        result := ComCall(25, this, "ptr", pvarCreateTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarCreateTime
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ModifyTime() {
        pvarModifyTime := VARIANT()
        result := ComCall(26, this, "ptr", pvarModifyTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarModifyTime
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Authenticate() {
        result := ComCall(27, this, "int*", &plAuthenticate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plAuthenticate
    }

    /**
     * 
     * @param {Integer} lAuthenticate 
     * @returns {HRESULT} 
     */
    put_Authenticate(lAuthenticate) {
        result := ComCall(28, this, "int", lAuthenticate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JournalQuota() {
        result := ComCall(29, this, "int*", &plJournalQuota := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plJournalQuota
    }

    /**
     * 
     * @param {Integer} lJournalQuota 
     * @returns {HRESULT} 
     */
    put_JournalQuota(lJournalQuota) {
        result := ComCall(30, this, "int", lJournalQuota, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsWorldReadable() {
        result := ComCall(31, this, "short*", &pisWorldReadable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pisWorldReadable
    }

    /**
     * Create Extended Stored Procedures
     * @param {Pointer<VARIANT>} IsTransactional 
     * @param {Pointer<VARIANT>} IsWorldReadable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(IsTransactional, IsWorldReadable) {
        result := ComCall(32, this, "ptr", IsTransactional, "ptr", IsWorldReadable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete() {
        result := ComCall(33, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Open Method (ADO MD)
     * @remarks
     * The **Open** method generates an error if either of its parameters is omitted and its corresponding property value has not been set prior to attempting to open the **Cellset**.
     * @param {Integer} Access 
     * @param {Integer} ShareMode 
     * @returns {IMSMQQueue2} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-md-api/open-method-ado-md
     */
    Open(Access, ShareMode) {
        result := ComCall(34, this, "int", Access, "int", ShareMode, "ptr*", &ppq := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMSMQQueue2(ppq)
    }

    /**
     * Refresh Method (RDS)
     * @remarks
     * You must set the [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties before you use the **Refresh** method. All data-bound controls on the form associated with an **RDS.DataControl** object will reflect the new set of records. Any pre-existing [Recordset](../ado-api/recordset-object-ado.md) object is released, and any unsaved changes are discarded. The **Refresh** method automatically makes the first record the current record.  
     *   
     *  It is a good idea to call the **Refresh** method periodically when you work with data. If you retrieve data, and then leave it on a client computer for a while, it is likely to become out of date. It is possible that any changes that you make will fail, because someone else might have changed the record and submitted changes before you.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/refresh-method-rds
     */
    Refresh() {
        result := ComCall(35, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn more about: Update constructor
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/update-constructor
     */
    Update() {
        result := ComCall(36, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PathNameDNS() {
        pbstrPathNameDNS := BSTR()
        result := ComCall(37, this, "ptr", pbstrPathNameDNS, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrPathNameDNS
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(38, this, "ptr*", &ppcolProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppcolProperties)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Security() {
        pvarSecurity := VARIANT()
        result := ComCall(39, this, "ptr", pvarSecurity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarSecurity
    }

    /**
     * 
     * @param {VARIANT} varSecurity 
     * @returns {HRESULT} 
     */
    put_Security(varSecurity) {
        result := ComCall(40, this, "ptr", varSecurity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
