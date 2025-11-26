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
     * Adds an object to the list of pooled objects.
     * @param {IObjPool} pPool The key to each object in the transaction resource pool. It determines the type of pooled object to add to the list.
     * @param {IUnknown} pUnk A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the pooled object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionresourcepool-putresource
     */
    PutResource(pPool, pUnk) {
        result := ComCall(3, this, "ptr", pPool, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * Retrieves an object from the list of pooled objects.
     * @param {IObjPool} pPool The key to each object in the transaction resource pool. It determines the type of pooled object to retrieve from the list.
     * @returns {IUnknown} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the pooled object.
     * 
     * The object that is retrieved must have the same <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjpool">IObjPool</a> pointer as an object that was put on the list by using <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-itransactionresourcepool-putresource">PutResource</a>.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionresourcepool-getresource
     */
    GetResource(pPool) {
        result := ComCall(4, this, "ptr", pPool, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }
}
