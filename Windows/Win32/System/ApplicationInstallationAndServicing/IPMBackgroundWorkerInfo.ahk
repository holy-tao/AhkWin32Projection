#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMBackgroundWorkerInfo extends IUnknown {
    /**
     * The interface identifier for IPMBackgroundWorkerInfo
     * @type {Guid}
     */
    static IID := Guid("{7dd4531b-d3bf-4b6b-94f3-69c098b1497d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMBackgroundWorkerInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ProductID         : IntPtr
        get_TaskID            : IntPtr
        get_BGName            : IntPtr
        get_MaxStartupLatency : IntPtr
        get_ExpectedRuntime   : IntPtr
        get_IsBootWorker      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMBackgroundWorkerInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Guid} 
     */
    ProductID {
        get => this.get_ProductID()
    }

    /**
     */
    TaskID {
        get => this.get_TaskID()
    }

    /**
     */
    BGName {
        get => this.get_BGName()
    }

    /**
     * @type {Integer} 
     */
    MaxStartupLatency {
        get => this.get_MaxStartupLatency()
    }

    /**
     * @type {Integer} 
     */
    ExpectedRuntime {
        get => this.get_ExpectedRuntime()
    }

    /**
     * @type {BOOL} 
     */
    IsBootWorker {
        get => this.get_IsBootWorker()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProductID() {
        pProductID := Guid()
        result := ComCall(3, this, Guid.Ptr, pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(4, this, BSTR.Ptr, pTaskID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGName 
     * @returns {HRESULT} 
     */
    get_BGName(pBGName) {
        result := ComCall(5, this, BSTR.Ptr, pBGName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxStartupLatency() {
        result := ComCall(6, this, "uint*", &pMaxStartupLatency := 0, "HRESULT")
        return pMaxStartupLatency
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpectedRuntime() {
        result := ComCall(7, this, "uint*", &pExpectedRuntime := 0, "HRESULT")
        return pExpectedRuntime
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsBootWorker() {
        result := ComCall(8, this, BOOL.Ptr, &pIsBootWorker := 0, "HRESULT")
        return pIsBootWorker
    }

    Query(iid) {
        if (IPMBackgroundWorkerInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProductID := CallbackCreate(GetMethod(implObj, "get_ProductID"), flags, 2)
        this.vtbl.get_TaskID := CallbackCreate(GetMethod(implObj, "get_TaskID"), flags, 2)
        this.vtbl.get_BGName := CallbackCreate(GetMethod(implObj, "get_BGName"), flags, 2)
        this.vtbl.get_MaxStartupLatency := CallbackCreate(GetMethod(implObj, "get_MaxStartupLatency"), flags, 2)
        this.vtbl.get_ExpectedRuntime := CallbackCreate(GetMethod(implObj, "get_ExpectedRuntime"), flags, 2)
        this.vtbl.get_IsBootWorker := CallbackCreate(GetMethod(implObj, "get_IsBootWorker"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProductID)
        CallbackFree(this.vtbl.get_TaskID)
        CallbackFree(this.vtbl.get_BGName)
        CallbackFree(this.vtbl.get_MaxStartupLatency)
        CallbackFree(this.vtbl.get_ExpectedRuntime)
        CallbackFree(this.vtbl.get_IsBootWorker)
    }
}
