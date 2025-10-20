#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcToXaHelper extends IUnknown{
    /**
     * The interface identifier for IDtcToXaHelper
     * @type {Guid}
     */
    static IID => Guid("{a9861611-304a-11d1-9813-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} i_fDoRecovery 
     * @returns {HRESULT} 
     */
    Close(i_fDoRecovery) {
        result := ComCall(3, this, "int", i_fDoRecovery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITransaction>} pITransaction 
     * @param {Pointer<Guid>} pguidBqual 
     * @param {Pointer<XID>} pXid 
     * @returns {HRESULT} 
     */
    TranslateTridToXid(pITransaction, pguidBqual, pXid) {
        result := ComCall(4, this, "ptr", pITransaction, "ptr", pguidBqual, "ptr", pXid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
