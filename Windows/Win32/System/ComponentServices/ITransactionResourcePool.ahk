#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Maintains a list of pooled objects, keyed by IObjPool, that are used until the transaction completes.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-itransactionresourcepool
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ITransactionResourcePool extends IUnknown{
    /**
     * The interface identifier for ITransactionResourcePool
     * @type {Guid}
     */
    static IID => Guid("{c5feb7c1-346a-11d1-b1cc-00aa00ba3258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IObjPool>} pPool 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    PutResource(pPool, pUnk) {
        result := ComCall(3, this, "ptr", pPool, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjPool>} pPool 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    GetResource(pPool, ppUnk) {
        result := ComCall(4, this, "ptr", pPool, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
