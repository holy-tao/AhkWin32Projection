#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IClassFactory.ahk" { IClassFactory }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to configure an object pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicepoolconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServicePoolConfig extends IUnknown {
    /**
     * The interface identifier for IServicePoolConfig
     * @type {Guid}
     */
    static IID := Guid("{a9690656-5bca-470c-8451-250c1f43a33e}")

    /**
     * The class identifier for ServicePoolConfig
     * @type {Guid}
     */
    static CLSID := Guid("{ecabb0ca-7f19-11d2-978e-0000f8757e2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServicePoolConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_MaxPoolSize         : IntPtr
        get_MaxPoolSize         : IntPtr
        put_MinPoolSize         : IntPtr
        get_MinPoolSize         : IntPtr
        put_CreationTimeout     : IntPtr
        get_CreationTimeout     : IntPtr
        put_TransactionAffinity : IntPtr
        get_TransactionAffinity : IntPtr
        put_ClassFactory        : IntPtr
        get_ClassFactory        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServicePoolConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MaxPoolSize {
        get => this.get_MaxPoolSize()
        set => this.put_MaxPoolSize(value)
    }

    /**
     * @type {Integer} 
     */
    MinPoolSize {
        get => this.get_MinPoolSize()
        set => this.put_MinPoolSize(value)
    }

    /**
     * @type {Integer} 
     */
    CreationTimeout {
        get => this.get_CreationTimeout()
        set => this.put_CreationTimeout(value)
    }

    /**
     * @type {BOOL} 
     */
    TransactionAffinity {
        get => this.get_TransactionAffinity()
        set => this.put_TransactionAffinity(value)
    }

    /**
     * @type {IClassFactory} 
     */
    ClassFactory {
        get => this.get_ClassFactory()
        set => this.put_ClassFactory(value)
    }

    /**
     * Sets the maximum number of objects in the pool.
     * @param {Integer} dwMaxPool The maximum number of objects.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_maxpoolsize
     */
    put_MaxPoolSize(dwMaxPool) {
        result := ComCall(3, this, "uint", dwMaxPool, "HRESULT")
        return result
    }

    /**
     * Retrieves the maximum number of objects in the pool.
     * @param {Pointer<Integer>} pdwMaxPool The maximum number of objects.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_maxpoolsize
     */
    get_MaxPoolSize(pdwMaxPool) {
        pdwMaxPoolMarshal := pdwMaxPool is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwMaxPoolMarshal, pdwMaxPool, "HRESULT")
        return result
    }

    /**
     * Sets the minimum number of objects in the pool.
     * @param {Integer} dwMinPool The minimum number of objects.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_minpoolsize
     */
    put_MinPoolSize(dwMinPool) {
        result := ComCall(5, this, "uint", dwMinPool, "HRESULT")
        return result
    }

    /**
     * Retrieves the minimum number of objects in the pool.
     * @param {Pointer<Integer>} pdwMinPool The minimum number of objects.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_minpoolsize
     */
    get_MinPoolSize(pdwMinPool) {
        pdwMinPoolMarshal := pdwMinPool is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwMinPoolMarshal, pdwMinPool, "HRESULT")
        return result
    }

    /**
     * Sets the time-out interval for activating a pooled object.
     * @param {Integer} dwCreationTimeout The time-out interval.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_creationtimeout
     */
    put_CreationTimeout(dwCreationTimeout) {
        result := ComCall(7, this, "uint", dwCreationTimeout, "HRESULT")
        return result
    }

    /**
     * Retrieves the time-out interval for activating a pooled object.
     * @param {Pointer<Integer>} pdwCreationTimeout The time-out interval.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_creationtimeout
     */
    get_CreationTimeout(pdwCreationTimeout) {
        pdwCreationTimeoutMarshal := pdwCreationTimeout is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwCreationTimeoutMarshal, pdwCreationTimeout, "HRESULT")
        return result
    }

    /**
     * Sets whether objects involved in transactions are held until the transaction completes.
     * @param {BOOL} fTxAffinity <b>TRUE</b> if the objects are to be held and <b>FALSE</b> otherwise.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_transactionaffinity
     */
    put_TransactionAffinity(fTxAffinity) {
        result := ComCall(9, this, BOOL, fTxAffinity, "HRESULT")
        return result
    }

    /**
     * Determines whether objects involved in transactions are held until the transaction completes.
     * @param {Pointer<BOOL>} pfTxAffinity <b>TRUE</b> if the objects are held and <b>FALSE</b> otherwise.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_transactionaffinity
     */
    get_TransactionAffinity(pfTxAffinity) {
        pfTxAffinityMarshal := pfTxAffinity is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pfTxAffinityMarshal, pfTxAffinity, "HRESULT")
        return result
    }

    /**
     * Sets a class factory for the pooled objects.
     * @param {IClassFactory} pFactory An <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> interface pointer.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_classfactory
     */
    put_ClassFactory(pFactory) {
        result := ComCall(11, this, "ptr", pFactory, "HRESULT")
        return result
    }

    /**
     * Retrieves a class factory for the pooled objects.
     * @returns {IClassFactory} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_classfactory
     */
    get_ClassFactory() {
        result := ComCall(12, this, "ptr*", &pFactory := 0, "HRESULT")
        return IClassFactory(pFactory)
    }

    Query(iid) {
        if (IServicePoolConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_MaxPoolSize := CallbackCreate(GetMethod(implObj, "put_MaxPoolSize"), flags, 2)
        this.vtbl.get_MaxPoolSize := CallbackCreate(GetMethod(implObj, "get_MaxPoolSize"), flags, 2)
        this.vtbl.put_MinPoolSize := CallbackCreate(GetMethod(implObj, "put_MinPoolSize"), flags, 2)
        this.vtbl.get_MinPoolSize := CallbackCreate(GetMethod(implObj, "get_MinPoolSize"), flags, 2)
        this.vtbl.put_CreationTimeout := CallbackCreate(GetMethod(implObj, "put_CreationTimeout"), flags, 2)
        this.vtbl.get_CreationTimeout := CallbackCreate(GetMethod(implObj, "get_CreationTimeout"), flags, 2)
        this.vtbl.put_TransactionAffinity := CallbackCreate(GetMethod(implObj, "put_TransactionAffinity"), flags, 2)
        this.vtbl.get_TransactionAffinity := CallbackCreate(GetMethod(implObj, "get_TransactionAffinity"), flags, 2)
        this.vtbl.put_ClassFactory := CallbackCreate(GetMethod(implObj, "put_ClassFactory"), flags, 2)
        this.vtbl.get_ClassFactory := CallbackCreate(GetMethod(implObj, "get_ClassFactory"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_MaxPoolSize)
        CallbackFree(this.vtbl.get_MaxPoolSize)
        CallbackFree(this.vtbl.put_MinPoolSize)
        CallbackFree(this.vtbl.get_MinPoolSize)
        CallbackFree(this.vtbl.put_CreationTimeout)
        CallbackFree(this.vtbl.get_CreationTimeout)
        CallbackFree(this.vtbl.put_TransactionAffinity)
        CallbackFree(this.vtbl.get_TransactionAffinity)
        CallbackFree(this.vtbl.put_ClassFactory)
        CallbackFree(this.vtbl.get_ClassFactory)
    }
}
