#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDispenserDriver.ahk" { IDispenserDriver }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHolder.ahk" { IHolder }

/**
 * Connects to the dispenser manager.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-idispensermanager
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IDispenserManager extends IUnknown {
    /**
     * The interface identifier for IDispenserManager
     * @type {Guid}
     */
    static IID := Guid("{5cb31e10-2b5f-11cf-be10-00aa00a2fa25}")

    /**
     * The class identifier for DispenserManager
     * @type {Guid}
     */
    static CLSID := Guid("{ecabb0c0-7f19-11d2-978e-0000f8757e2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDispenserManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterDispenser : IntPtr
        GetContext        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDispenserManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IDispenserManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterDispenser := CallbackCreate(GetMethod(implObj, "RegisterDispenser"), flags, 4)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterDispenser)
        CallbackFree(this.vtbl.GetContext)
    }
}
