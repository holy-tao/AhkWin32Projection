#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes an event class that notifies subscribers whenever a method on the object that implements it either is called or returns from a call.
 * @remarks
 * To send method events to the COM+ tracker property, you need to obtain a handle to it and you need to obtain its GUID, which is defined as follows.
 * 
 * 
 * ``` syntax
 * GUID guidTrkPropPolicy = {0xecabaeb3, 0x7f19, 0x11d2, {0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a}}
 * 
 * ```
 * 
 * To obtain a handle to the COM+ tracker property, call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-icontext-getproperty">IContext::GetProperty</a> method with the <i>rGuid</i> argument set equal to this GUID.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-isendmethodevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ISendMethodEvents extends IUnknown {
    /**
     * The interface identifier for ISendMethodEvents
     * @type {Guid}
     */
    static IID := Guid("{2732fd59-b2b4-4d44-878c-8b8f09626008}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISendMethodEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SendMethodCall   : IntPtr
        SendMethodReturn : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISendMethodEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a method is called through a component interface.
     * @param {Pointer<Void>} pIdentity A pointer to the interface used to call the method.
     * @param {Pointer<Guid>} riid The ID of the interface used to call the method.
     * @param {Integer} dwMeth The method called.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isendmethodevents-sendmethodcall
     */
    SendMethodCall(pIdentity, riid, dwMeth) {
        pIdentityMarshal := pIdentity is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pIdentityMarshal, pIdentity, Guid.Ptr, riid, "uint", dwMeth, "HRESULT")
        return result
    }

    /**
     * Generated when a method called through a component interface returns control to the caller.
     * @param {Pointer<Void>} pIdentity A pointer to the interface used to call the method.
     * @param {Pointer<Guid>} riid The ID of the interface used to call the method.
     * @param {Integer} dwMeth The method called.
     * @param {HRESULT} hrCall The result returned by the method call.
     * @param {HRESULT} hrServer The result returned by the DCOM call to the server on which the component lives.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isendmethodevents-sendmethodreturn
     */
    SendMethodReturn(pIdentity, riid, dwMeth, hrCall, hrServer) {
        pIdentityMarshal := pIdentity is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pIdentityMarshal, pIdentity, Guid.Ptr, riid, "uint", dwMeth, "int", hrCall, "int", hrServer, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISendMethodEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SendMethodCall := CallbackCreate(GetMethod(implObj, "SendMethodCall"), flags, 4)
        this.vtbl.SendMethodReturn := CallbackCreate(GetMethod(implObj, "SendMethodReturn"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SendMethodCall)
        CallbackFree(this.vtbl.SendMethodReturn)
    }
}
