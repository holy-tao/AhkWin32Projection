#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQManagement extends IDispatch {
    /**
     * The interface identifier for IMSMQManagement
     * @type {Guid}
     */
    static IID := Guid("{be5f0241-e489-4957-8cc4-a452fcf3e23e}")

    /**
     * The class identifier for MSMQManagement
     * @type {Guid}
     */
    static CLSID := Guid("{39ce96fe-f4c5-4484-a143-4c2d5d324229}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQManagement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Init                    : IntPtr
        get_FormatName          : IntPtr
        get_Machine             : IntPtr
        get_MessageCount        : IntPtr
        get_ForeignStatus       : IntPtr
        get_QueueType           : IntPtr
        get_IsLocal             : IntPtr
        get_TransactionalStatus : IntPtr
        get_BytesInQueue        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQManagement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    FormatName {
        get => this.get_FormatName()
    }

    /**
     * @type {BSTR} 
     */
    Machine {
        get => this.get_Machine()
    }

    /**
     * @type {Integer} 
     */
    MessageCount {
        get => this.get_MessageCount()
    }

    /**
     * @type {Integer} 
     */
    ForeignStatus {
        get => this.get_ForeignStatus()
    }

    /**
     * @type {Integer} 
     */
    QueueType {
        get => this.get_QueueType()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsLocal {
        get => this.get_IsLocal()
    }

    /**
     * @type {Integer} 
     */
    TransactionalStatus {
        get => this.get_TransactionalStatus()
    }

    /**
     * @type {VARIANT} 
     */
    BytesInQueue {
        get => this.get_BytesInQueue()
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Machine 
     * @param {Pointer<VARIANT>} _Pathname 
     * @param {Pointer<VARIANT>} FormatName 
     * @returns {HRESULT} 
     */
    Init(Machine, _Pathname, FormatName) {
        result := ComCall(7, this, VARIANT.Ptr, Machine, VARIANT.Ptr, _Pathname, VARIANT.Ptr, FormatName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FormatName() {
        pbstrFormatName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrFormatName, "HRESULT")
        return pbstrFormatName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Machine() {
        pbstrMachine := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrMachine, "HRESULT")
        return pbstrMachine
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageCount() {
        result := ComCall(10, this, "int*", &plMessageCount := 0, "HRESULT")
        return plMessageCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ForeignStatus() {
        result := ComCall(11, this, "int*", &plForeignStatus := 0, "HRESULT")
        return plForeignStatus
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QueueType() {
        result := ComCall(12, this, "int*", &plQueueType := 0, "HRESULT")
        return plQueueType
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLocal() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &pfIsLocal := 0, "HRESULT")
        return pfIsLocal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransactionalStatus() {
        result := ComCall(14, this, "int*", &plTransactionalStatus := 0, "HRESULT")
        return plTransactionalStatus
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_BytesInQueue() {
        pvBytesInQueue := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, pvBytesInQueue, "HRESULT")
        return pvBytesInQueue
    }

    Query(iid) {
        if (IMSMQManagement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 4)
        this.vtbl.get_FormatName := CallbackCreate(GetMethod(implObj, "get_FormatName"), flags, 2)
        this.vtbl.get_Machine := CallbackCreate(GetMethod(implObj, "get_Machine"), flags, 2)
        this.vtbl.get_MessageCount := CallbackCreate(GetMethod(implObj, "get_MessageCount"), flags, 2)
        this.vtbl.get_ForeignStatus := CallbackCreate(GetMethod(implObj, "get_ForeignStatus"), flags, 2)
        this.vtbl.get_QueueType := CallbackCreate(GetMethod(implObj, "get_QueueType"), flags, 2)
        this.vtbl.get_IsLocal := CallbackCreate(GetMethod(implObj, "get_IsLocal"), flags, 2)
        this.vtbl.get_TransactionalStatus := CallbackCreate(GetMethod(implObj, "get_TransactionalStatus"), flags, 2)
        this.vtbl.get_BytesInQueue := CallbackCreate(GetMethod(implObj, "get_BytesInQueue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.get_FormatName)
        CallbackFree(this.vtbl.get_Machine)
        CallbackFree(this.vtbl.get_MessageCount)
        CallbackFree(this.vtbl.get_ForeignStatus)
        CallbackFree(this.vtbl.get_QueueType)
        CallbackFree(this.vtbl.get_IsLocal)
        CallbackFree(this.vtbl.get_TransactionalStatus)
        CallbackFree(this.vtbl.get_BytesInQueue)
    }
}
