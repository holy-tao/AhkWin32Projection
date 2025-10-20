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
     * 
     * @param {Integer} dwMaxPool 
     * @returns {HRESULT} 
     */
    put_MaxPoolSize(dwMaxPool) {
        result := ComCall(3, this, "uint", dwMaxPool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMaxPool 
     * @returns {HRESULT} 
     */
    get_MaxPoolSize(pdwMaxPool) {
        result := ComCall(4, this, "uint*", pdwMaxPool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMinPool 
     * @returns {HRESULT} 
     */
    put_MinPoolSize(dwMinPool) {
        result := ComCall(5, this, "uint", dwMinPool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMinPool 
     * @returns {HRESULT} 
     */
    get_MinPoolSize(pdwMinPool) {
        result := ComCall(6, this, "uint*", pdwMinPool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCreationTimeout 
     * @returns {HRESULT} 
     */
    put_CreationTimeout(dwCreationTimeout) {
        result := ComCall(7, this, "uint", dwCreationTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCreationTimeout 
     * @returns {HRESULT} 
     */
    get_CreationTimeout(pdwCreationTimeout) {
        result := ComCall(8, this, "uint*", pdwCreationTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fTxAffinity 
     * @returns {HRESULT} 
     */
    put_TransactionAffinity(fTxAffinity) {
        result := ComCall(9, this, "int", fTxAffinity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfTxAffinity 
     * @returns {HRESULT} 
     */
    get_TransactionAffinity(pfTxAffinity) {
        result := ComCall(10, this, "ptr", pfTxAffinity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IClassFactory>} pFactory 
     * @returns {HRESULT} 
     */
    put_ClassFactory(pFactory) {
        result := ComCall(11, this, "ptr", pFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IClassFactory>} pFactory 
     * @returns {HRESULT} 
     */
    get_ClassFactory(pFactory) {
        result := ComCall(12, this, "ptr", pFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
