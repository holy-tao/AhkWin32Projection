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
     * 
     * @param {Pointer} ResTypId 
     * @param {Pointer<UIntPtr>} pResId 
     * @param {Pointer<Int32>} pSecsFreeBeforeDestroy 
     * @returns {HRESULT} 
     */
    CreateResource(ResTypId, pResId, pSecsFreeBeforeDestroy) {
        result := ComCall(3, this, "ptr", ResTypId, "ptr*", pResId, "int*", pSecsFreeBeforeDestroy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} ResTypId 
     * @param {Pointer} ResId 
     * @param {BOOL} fRequiresTransactionEnlistment 
     * @param {Pointer<UInt32>} pRating 
     * @returns {HRESULT} 
     */
    RateResource(ResTypId, ResId, fRequiresTransactionEnlistment, pRating) {
        result := ComCall(4, this, "ptr", ResTypId, "ptr", ResId, "int", fRequiresTransactionEnlistment, "uint*", pRating, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} ResId 
     * @param {Pointer} TransId 
     * @returns {HRESULT} 
     */
    EnlistResource(ResId, TransId) {
        result := ComCall(5, this, "ptr", ResId, "ptr", TransId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} ResId 
     * @returns {HRESULT} 
     */
    ResetResource(ResId) {
        result := ComCall(6, this, "ptr", ResId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} ResId 
     * @returns {HRESULT} 
     */
    DestroyResource(ResId) {
        result := ComCall(7, this, "ptr", ResId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ResId 
     * @returns {HRESULT} 
     */
    DestroyResourceS(ResId) {
        result := ComCall(8, this, "ushort*", ResId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
