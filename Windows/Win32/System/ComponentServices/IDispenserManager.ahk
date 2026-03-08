#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHolder.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Connects to the dispenser manager.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-idispensermanager
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IDispenserManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispenserManager
     * @type {Guid}
     */
    static IID => Guid("{5cb31e10-2b5f-11cf-be10-00aa00a2fa25}")

    /**
     * The class identifier for DispenserManager
     * @type {Guid}
     */
    static CLSID => Guid("{ecabb0c0-7f19-11d2-978e-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDispenser", "GetContext"]

    /**
     * Registers the resource dispenser with the dispenser manager.
     * @remarks
     * The Resource Dispenser notifies the Dispenser Manager that it has started and is prepared to accept notifications on this <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-idispenserdriver">IDispenserDriver</a> interface. Then the Dispenser Manager creates the Holder for this new Resource Dispenser and returns it to the Resource Dispenser.
     * 
     * 
     * 
     * This method does not call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the <i>pDispenserDriver</i> object, but <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iholder-close">IHolder::Close</a> does perform a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on <i>pDispenserDriver</i>. This can cause the Resource Dispenser object to be destroyed prematurely. To prevent this premature destruction, the caller of <b>IDispenserManager::RegisterDispenser</b> must explicitly call <b>AddRef</b> on the <i>pDispenserDriver</i> object.
     * @param {IDispenserDriver} __MIDL__IDispenserManager0000 The <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-idispenserdriver">IDispenserDriver</a> interface the Resource Dispenser offers to the Dispenser Manager to use later to notify the Resource Dispenser.
     * @param {PWSTR} szDispenserName A friendly name of the Resource Dispenser for administrator display.
     * @returns {IHolder} The <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iholder">IHolder</a> interface that has been instantiated for the resource dispenser.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispensermanager-registerdispenser
     */
    RegisterDispenser(__MIDL__IDispenserManager0000, szDispenserName) {
        szDispenserName := szDispenserName is String ? StrPtr(szDispenserName) : szDispenserName

        result := ComCall(3, this, "ptr", __MIDL__IDispenserManager0000, "ptr", szDispenserName, "ptr*", &__MIDL__IDispenserManager0001 := 0, "HRESULT")
        return IHolder(__MIDL__IDispenserManager0001)
    }

    /**
     * Determines the current context.
     * @param {Pointer<Pointer>} __MIDL__IDispenserManager0002 An internal unique identifier of the current object, or 0 if no current object. This may not be interpreted as an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer to the current object.
     * @param {Pointer<Pointer>} __MIDL__IDispenserManager0003 The transaction that the current object is running in, or 0 if none. This value may be cast to <b>ITransaction *</b>.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispensermanager-getcontext
     */
    GetContext(__MIDL__IDispenserManager0002, __MIDL__IDispenserManager0003) {
        __MIDL__IDispenserManager0002Marshal := __MIDL__IDispenserManager0002 is VarRef ? "ptr*" : "ptr"
        __MIDL__IDispenserManager0003Marshal := __MIDL__IDispenserManager0003 is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, __MIDL__IDispenserManager0002Marshal, __MIDL__IDispenserManager0002, __MIDL__IDispenserManager0003Marshal, __MIDL__IDispenserManager0003, "HRESULT")
        return result
    }
}
