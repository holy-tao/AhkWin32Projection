#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IResourceManager.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IResourceManager2 extends IResourceManager{
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
     * 
     * @param {Pointer<ITransaction>} pTransaction 
     * @param {Pointer<ITransactionResourceAsync>} pResAsync 
     * @param {Pointer<BOID>} pUOW 
     * @param {Pointer<Int32>} pisoLevel 
     * @param {Pointer<XID>} pXid 
     * @param {Pointer<ITransactionEnlistmentAsync>} ppEnlist 
     * @returns {HRESULT} 
     */
    Enlist2(pTransaction, pResAsync, pUOW, pisoLevel, pXid, ppEnlist) {
        result := ComCall(7, this, "ptr", pTransaction, "ptr", pResAsync, "ptr", pUOW, "int*", pisoLevel, "ptr", pXid, "ptr", ppEnlist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XID>} pXid 
     * @param {Integer} dwTimeout 
     * @param {Pointer<Int32>} pXactStat 
     * @returns {HRESULT} 
     */
    Reenlist2(pXid, dwTimeout, pXactStat) {
        result := ComCall(8, this, "ptr", pXid, "uint", dwTimeout, "int*", pXactStat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
