#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Retrieves information about the state of clerks.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icrmmonitorclerks
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICrmMonitorClerks extends IDispatch {
    /**
     * The interface identifier for ICrmMonitorClerks
     * @type {Guid}
     */
    static IID := Guid("{70c8e442-c7ed-11d1-82fb-00a0c91eede9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICrmMonitorClerks interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Item              : IntPtr
        get__NewEnum      : IntPtr
        get_Count         : IntPtr
        ProgIdCompensator : IntPtr
        Description       : IntPtr
        TransactionUOW    : IntPtr
        ActivityId        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICrmMonitorClerks.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Retrieves the instance CLSID of the CRM clerk for the specified index.
     * @param {VARIANT} Index The index of the required CRM clerk as a numeric <b>Variant</b>.
     * @returns {VARIANT} A pointer to <b>Variant</b> string returning the instance CLSID corresponding to this numeric index.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-item
     */
    Item(Index) {
        pItem := VARIANT()
        result := ComCall(7, this, VARIANT, Index, VARIANT.Ptr, pItem, "HRESULT")
        return pItem
    }

    /**
     * Retrieves an enumerator for the instance CLSIDs of the CRM clerks.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Retrieves the count of CRM clerks in the collection.
     * @returns {Integer} The number of CRM clerks.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the ProgId of the CRM Compensator for the specified index.
     * @param {VARIANT} Index The index of the required CRM clerk as a numeric <b>Variant</b>, or the instance CLSID as a <b>Variant</b> string.
     * @returns {VARIANT} The ProgId of the CRM Compensator.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-progidcompensator
     */
    ProgIdCompensator(Index) {
        pItem := VARIANT()
        result := ComCall(10, this, VARIANT, Index, VARIANT.Ptr, pItem, "HRESULT")
        return pItem
    }

    /**
     * Retrieves the description of the CRM Compensator for the specified index.
     * @param {VARIANT} Index The index of the required CRM clerk as a numeric <b>Variant</b>, or the instance CLSID as a <b>Variant</b> string.
     * @returns {VARIANT} The description string originally provided by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator">ICrmLogControl::RegisterCompensator</a>.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-description
     */
    Description(Index) {
        pItem := VARIANT()
        result := ComCall(11, this, VARIANT, Index, VARIANT.Ptr, pItem, "HRESULT")
        return pItem
    }

    /**
     * Retrieves the unit of work (UOW) of the transaction for the specified index.
     * @param {VARIANT} Index The index of the required CRM clerk as a numeric <b>Variant</b>, or the instance CLSID as a <b>Variant</b> string.
     * @returns {VARIANT} The transaction UOW.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-transactionuow
     */
    TransactionUOW(Index) {
        pItem := VARIANT()
        result := ComCall(12, this, VARIANT, Index, VARIANT.Ptr, pItem, "HRESULT")
        return pItem
    }

    /**
     * Retrieves the activity ID of the CRM Worker for the specified index.
     * @param {VARIANT} Index The index of the required CRM clerk as a numeric <b>Variant</b>, or the instance CLSID as a <b>Variant</b> string.
     * @returns {VARIANT} The activity ID of the CRM Worker.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitorclerks-activityid
     */
    ActivityId(Index) {
        pItem := VARIANT()
        result := ComCall(13, this, VARIANT, Index, VARIANT.Ptr, pItem, "HRESULT")
        return pItem
    }

    Query(iid) {
        if (ICrmMonitorClerks.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.ProgIdCompensator := CallbackCreate(GetMethod(implObj, "ProgIdCompensator"), flags, 3)
        this.vtbl.Description := CallbackCreate(GetMethod(implObj, "Description"), flags, 3)
        this.vtbl.TransactionUOW := CallbackCreate(GetMethod(implObj, "TransactionUOW"), flags, 3)
        this.vtbl.ActivityId := CallbackCreate(GetMethod(implObj, "ActivityId"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.ProgIdCompensator)
        CallbackFree(this.vtbl.Description)
        CallbackFree(this.vtbl.TransactionUOW)
        CallbackFree(this.vtbl.ActivityId)
    }
}
