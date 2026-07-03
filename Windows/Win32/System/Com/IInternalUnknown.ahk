#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IInternalUnknown (objidlbase.h) interface is used in lightweight client-side handlers that require access to the internal interfaces on the proxy.
 * @remarks
 * Handlers that need access to some of the internal interfaces on the proxy manager have to go through the <b>IInternalUnknown</b> interface. This prevents the handlers from blindly delegating and exposing the aggregatee's internal interfaces outside of the aggregate. These interfaces include <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imultiqi">IMultiQI</a>. If the handler wants to expose <b>IClientSecurity</b> or <b>IMultiQI</b>, the handler should implement these interfaces itself and delegate to the proxy manager's implementation of these interfaces when appropriate.
 * 
 * For the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a> interface, if the client tries to set the security on an interface that the handler has exposed, the handler should set the security on the underlying network interface proxy.
 * 
 * 
 * 
 * For the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imultiqi">IMultiQI</a> interface, the handler should fill in the interfaces it knows about and then forward the call to the proxy manager to fill in the rest of the interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-iinternalunknown
 * @namespace Windows.Win32.System.Com
 */
export default struct IInternalUnknown extends IUnknown {
    /**
     * The interface identifier for IInternalUnknown
     * @type {Guid}
     */
    static IID := Guid("{00000021-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternalUnknown interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryInternalInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternalUnknown.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IInternalUnknown::QueryInternalInterface (objidlbase.h) method retrieves pointers to the supported internal interfaces on an object.
     * @remarks
     * This method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> method, except that the COM proxy manager, when aggregated, will not expose some interfaces through <b>QueryInterface</b>. Instead, those internal interfaces must be exposed through <b>QueryInternalInterface</b>.
     * @param {Pointer<Guid>} riid The identifier of the internal interface being requested.
     * @returns {Pointer<Void>} The address of a pointer variable that receives the interface pointer requested in the <i>riid</i> parameter. Upon successful return, *<i>ppv</i> contains the requested interface pointer to the object. If the object does not support the interface, *<i>ppv</i> is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iinternalunknown-queryinternalinterface
     */
    QueryInternalInterface(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IInternalUnknown.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryInternalInterface := CallbackCreate(GetMethod(implObj, "QueryInternalInterface"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryInternalInterface)
    }
}
