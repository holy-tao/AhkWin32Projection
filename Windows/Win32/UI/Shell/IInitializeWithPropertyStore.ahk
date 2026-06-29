#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that initializes a handler, such as a property handler, thumbnail handler, or preview handler, with a property store.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Use this interface when initializing a handler for OpenSearch result sets, which are returned as RSS or Atom feeds.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinitializewithpropertystore
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInitializeWithPropertyStore extends IUnknown {
    /**
     * The interface identifier for IInitializeWithPropertyStore
     * @type {Guid}
     */
    static IID := Guid("{c3e12eb5-7d8d-44f8-b6dd-0e77b34d6de4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInitializeWithPropertyStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInitializeWithPropertyStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a handler with an IPropertyStore.
     * @remarks
     * This method supports initializing handlers for use with OpenSearch result sets, which are returned from web services as RSS or Atom feeds.
     * @param {IPropertyStore} pps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinitializewithpropertystore-initialize
     */
    Initialize(pps) {
        result := ComCall(3, this, "ptr", pps, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInitializeWithPropertyStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
