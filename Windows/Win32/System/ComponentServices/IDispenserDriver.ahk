#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Is called by the holder of the COM+ Resource Dispenser to create, enlist, evaluate, prepare, and destroy a resource.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-idispenserdriver
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IDispenserDriver extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispenserDriver
     * @type {Guid}
     */
    static IID => Guid("{208b3651-2b48-11cf-be10-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateResource", "RateResource", "EnlistResource", "ResetResource", "DestroyResource", "DestroyResourceS"]

    /**
     * 
     * @param {Pointer} ResTypId 
     * @param {Pointer<Pointer>} pResId 
     * @param {Pointer<Integer>} pSecsFreeBeforeDestroy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispenserdriver-createresource
     */
    CreateResource(ResTypId, pResId, pSecsFreeBeforeDestroy) {
        result := ComCall(3, this, "ptr", ResTypId, "ptr*", pResId, "int*", pSecsFreeBeforeDestroy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} ResTypId 
     * @param {Pointer} ResId 
     * @param {BOOL} fRequiresTransactionEnlistment 
     * @param {Pointer<Integer>} pRating 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispenserdriver-rateresource
     */
    RateResource(ResTypId, ResId, fRequiresTransactionEnlistment, pRating) {
        result := ComCall(4, this, "ptr", ResTypId, "ptr", ResId, "int", fRequiresTransactionEnlistment, "uint*", pRating, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} ResId 
     * @param {Pointer} TransId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispenserdriver-enlistresource
     */
    EnlistResource(ResId, TransId) {
        result := ComCall(5, this, "ptr", ResId, "ptr", TransId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} ResId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispenserdriver-resetresource
     */
    ResetResource(ResId) {
        result := ComCall(6, this, "ptr", ResId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} ResId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispenserdriver-destroyresource
     */
    DestroyResource(ResId) {
        result := ComCall(7, this, "ptr", ResId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ResId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispenserdriver-destroyresources
     */
    DestroyResourceS(ResId) {
        result := ComCall(8, this, "ushort*", ResId, "HRESULT")
        return result
    }
}
