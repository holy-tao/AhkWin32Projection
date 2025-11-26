#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IClassFactory.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to configure an object pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicepoolconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServicePoolConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServicePoolConfig
     * @type {Guid}
     */
    static IID => Guid("{a9690656-5bca-470c-8451-250c1f43a33e}")

    /**
     * The class identifier for ServicePoolConfig
     * @type {Guid}
     */
    static CLSID => Guid("{ecabb0ca-7f19-11d2-978e-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_MaxPoolSize", "get_MaxPoolSize", "put_MinPoolSize", "get_MinPoolSize", "put_CreationTimeout", "get_CreationTimeout", "put_TransactionAffinity", "get_TransactionAffinity", "put_ClassFactory", "get_ClassFactory"]

    /**
     */
    MaxPoolSize {
        get => this.get_MaxPoolSize()
        set => this.put_MaxPoolSize(value)
    }

    /**
     */
    MinPoolSize {
        get => this.get_MinPoolSize()
        set => this.put_MinPoolSize(value)
    }

    /**
     */
    CreationTimeout {
        get => this.get_CreationTimeout()
        set => this.put_CreationTimeout(value)
    }

    /**
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-put_maxpoolsize
     */
    put_MaxPoolSize(dwMaxPool) {
        result := ComCall(3, this, "uint", dwMaxPool, "HRESULT")
        return result
    }

    /**
     * Retrieves the maximum number of objects in the pool.
     * @param {Pointer<Integer>} pdwMaxPool The maximum number of objects.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-get_maxpoolsize
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-put_minpoolsize
     */
    put_MinPoolSize(dwMinPool) {
        result := ComCall(5, this, "uint", dwMinPool, "HRESULT")
        return result
    }

    /**
     * Retrieves the minimum number of objects in the pool.
     * @param {Pointer<Integer>} pdwMinPool The minimum number of objects.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-get_minpoolsize
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-put_creationtimeout
     */
    put_CreationTimeout(dwCreationTimeout) {
        result := ComCall(7, this, "uint", dwCreationTimeout, "HRESULT")
        return result
    }

    /**
     * Retrieves the time-out interval for activating a pooled object.
     * @param {Pointer<Integer>} pdwCreationTimeout The time-out interval.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-get_creationtimeout
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-put_transactionaffinity
     */
    put_TransactionAffinity(fTxAffinity) {
        result := ComCall(9, this, "int", fTxAffinity, "HRESULT")
        return result
    }

    /**
     * Determines whether objects involved in transactions are held until the transaction completes.
     * @param {Pointer<BOOL>} pfTxAffinity <b>TRUE</b> if the objects are held and <b>FALSE</b> otherwise.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-get_transactionaffinity
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-put_classfactory
     */
    put_ClassFactory(pFactory) {
        result := ComCall(11, this, "ptr", pFactory, "HRESULT")
        return result
    }

    /**
     * Retrieves a class factory for the pooled objects.
     * @returns {IClassFactory} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepoolconfig-get_classfactory
     */
    get_ClassFactory() {
        result := ComCall(12, this, "ptr*", &pFactory := 0, "HRESULT")
        return IClassFactory(pFactory)
    }
}
