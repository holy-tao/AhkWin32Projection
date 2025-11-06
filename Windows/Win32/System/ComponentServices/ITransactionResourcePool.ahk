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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PutResource", "GetResource"]

    /**
     * 
     * @param {IObjPool} pPool 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionresourcepool-putresource
     */
    PutResource(pPool, pUnk) {
        result := ComCall(3, this, "ptr", pPool, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IObjPool} pPool 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionresourcepool-getresource
     */
    GetResource(pPool) {
        result := ComCall(4, this, "ptr", pPool, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }
}
