#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IResourceManager.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IResourceManager2 extends IResourceManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceManager2
     * @type {Guid}
     */
    static IID => Guid("{d136c69a-f749-11d1-8f47-00c04f8ee57d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Enlist2", "Reenlist2"]

    /**
     * 
     * @param {ITransaction} pTransaction 
     * @param {ITransactionResourceAsync} pResAsync 
     * @param {Pointer<BOID>} pUOW 
     * @param {Pointer<Integer>} pisoLevel 
     * @param {Pointer<XID>} pXid 
     * @param {Pointer<ITransactionEnlistmentAsync>} ppEnlist 
     * @returns {HRESULT} 
     */
    Enlist2(pTransaction, pResAsync, pUOW, pisoLevel, pXid, ppEnlist) {
        pisoLevelMarshal := pisoLevel is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pTransaction, "ptr", pResAsync, "ptr", pUOW, pisoLevelMarshal, pisoLevel, "ptr", pXid, "ptr*", ppEnlist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XID>} pXid 
     * @param {Integer} dwTimeout 
     * @returns {Integer} 
     */
    Reenlist2(pXid, dwTimeout) {
        result := ComCall(8, this, "ptr", pXid, "uint", dwTimeout, "int*", &pXactStat := 0, "HRESULT")
        return pXactStat
    }
}
