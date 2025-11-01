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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Enlist", "Reenlist", "ReenlistmentComplete", "GetDistributedTransactionManager"]

    /**
     * 
     * @param {ITransaction} pTransaction 
     * @param {ITransactionResourceAsync} pRes 
     * @param {Pointer<BOID>} pUOW 
     * @param {Pointer<Integer>} pisoLevel 
     * @param {Pointer<ITransactionEnlistmentAsync>} ppEnlist 
     * @returns {HRESULT} 
     */
    Enlist(pTransaction, pRes, pUOW, pisoLevel, ppEnlist) {
        pisoLevelMarshal := pisoLevel is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pTransaction, "ptr", pRes, "ptr", pUOW, pisoLevelMarshal, pisoLevel, "ptr*", ppEnlist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPrepInfo 
     * @param {Integer} cbPrepInfo 
     * @param {Integer} lTimeout 
     * @param {Pointer<Integer>} pXactStat 
     * @returns {HRESULT} 
     */
    Reenlist(pPrepInfo, cbPrepInfo, lTimeout, pXactStat) {
        pPrepInfoMarshal := pPrepInfo is VarRef ? "char*" : "ptr"
        pXactStatMarshal := pXactStat is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pPrepInfoMarshal, pPrepInfo, "uint", cbPrepInfo, "uint", lTimeout, pXactStatMarshal, pXactStat, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReenlistmentComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    GetDistributedTransactionManager(iid, ppvObject) {
        result := ComCall(6, this, "ptr", iid, "ptr*", ppvObject, "HRESULT")
        return result
    }
}
