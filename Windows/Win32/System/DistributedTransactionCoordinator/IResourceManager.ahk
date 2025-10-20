#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IResourceManager interface resolves contentions for system resources.The filter graph manager exposes this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iresourcemanager
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IResourceManager extends IUnknown{
    /**
     * The interface identifier for IResourceManager
     * @type {Guid}
     */
    static IID => Guid("{13741d21-87eb-11ce-8081-0080c758527e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITransaction>} pTransaction 
     * @param {Pointer<ITransactionResourceAsync>} pRes 
     * @param {Pointer<BOID>} pUOW 
     * @param {Pointer<Int32>} pisoLevel 
     * @param {Pointer<ITransactionEnlistmentAsync>} ppEnlist 
     * @returns {HRESULT} 
     */
    Enlist(pTransaction, pRes, pUOW, pisoLevel, ppEnlist) {
        result := ComCall(3, this, "ptr", pTransaction, "ptr", pRes, "ptr", pUOW, "int*", pisoLevel, "ptr", ppEnlist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pPrepInfo 
     * @param {Integer} cbPrepInfo 
     * @param {Integer} lTimeout 
     * @param {Pointer<Int32>} pXactStat 
     * @returns {HRESULT} 
     */
    Reenlist(pPrepInfo, cbPrepInfo, lTimeout, pXactStat) {
        result := ComCall(4, this, "char*", pPrepInfo, "uint", cbPrepInfo, "uint", lTimeout, "int*", pXactStat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReenlistmentComplete() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    GetDistributedTransactionManager(iid, ppvObject) {
        result := ComCall(6, this, "ptr", iid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
