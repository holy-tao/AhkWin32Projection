#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes a single event that provides access to the IMtsEvents interface of the event dispatcher for the current process.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imtslocator
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IMTSLocator extends IDispatch {
    /**
     * The interface identifier for IMTSLocator
     * @type {Guid}
     */
    static IID := Guid("{d19b8bfd-7f88-11d0-b16e-00aa00ba3258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMTSLocator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetEventDispatcher : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMTSLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a pointer to the event dispatcher for the current process.
     * @returns {IUnknown} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the event dispatcher for the current process.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtslocator-geteventdispatcher
     */
    GetEventDispatcher() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    Query(iid) {
        if (IMTSLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventDispatcher := CallbackCreate(GetMethod(implObj, "GetEventDispatcher"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventDispatcher)
    }
}
