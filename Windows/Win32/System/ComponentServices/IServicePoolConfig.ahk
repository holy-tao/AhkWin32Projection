#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} dwMaxPool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_maxpoolsize
     */
    put_MaxPoolSize(dwMaxPool) {
        result := ComCall(3, this, "uint", dwMaxPool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMaxPool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_maxpoolsize
     */
    get_MaxPoolSize(pdwMaxPool) {
        result := ComCall(4, this, "uint*", pdwMaxPool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMinPool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_minpoolsize
     */
    put_MinPoolSize(dwMinPool) {
        result := ComCall(5, this, "uint", dwMinPool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMinPool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_minpoolsize
     */
    get_MinPoolSize(pdwMinPool) {
        result := ComCall(6, this, "uint*", pdwMinPool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCreationTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_creationtimeout
     */
    put_CreationTimeout(dwCreationTimeout) {
        result := ComCall(7, this, "uint", dwCreationTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCreationTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_creationtimeout
     */
    get_CreationTimeout(pdwCreationTimeout) {
        result := ComCall(8, this, "uint*", pdwCreationTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fTxAffinity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_transactionaffinity
     */
    put_TransactionAffinity(fTxAffinity) {
        result := ComCall(9, this, "int", fTxAffinity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfTxAffinity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_transactionaffinity
     */
    get_TransactionAffinity(pfTxAffinity) {
        result := ComCall(10, this, "ptr", pfTxAffinity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IClassFactory} pFactory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-put_classfactory
     */
    put_ClassFactory(pFactory) {
        result := ComCall(11, this, "ptr", pFactory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IClassFactory>} pFactory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepoolconfig-get_classfactory
     */
    get_ClassFactory(pFactory) {
        result := ComCall(12, this, "ptr*", pFactory, "HRESULT")
        return result
    }
}
