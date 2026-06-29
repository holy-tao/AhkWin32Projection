#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables retrieving an agile reference to an object.
 * @remarks
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-rogetagilereference">RoGetAgileReference</a> function to create an agile reference to an object.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iagilereference
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IAgileReference extends IUnknown {
    /**
     * The interface identifier for IAgileReference
     * @type {Guid}
     */
    static IID := Guid("{c03f6a43-65a4-9818-987e-e0b810d2a6f2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAgileReference interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Resolve : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAgileReference.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the interface ID of an agile reference to an object.
     * @remarks
     * Call the [**RoGetAgileReference**](/windows/desktop/api/ComBaseApi/nf-combaseapi-rogetagilereference) function to create an agile reference to an object. Call the **Resolve** method to localize the object into the apartment in which **Resolve** is called.
     * @param {Pointer<Guid>} riid The interface ID of the interface to be retrieved from the agile reference. It is not required to be the same as the registered interface.
     * @returns {Pointer<Void>} On successful completion, \**ppvObjectReference* is a pointer to the interface specified by *riid*.
     * @see https://learn.microsoft.com/windows/win32/WinRT/iagilereference-resolve
     */
    Resolve(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppvObjectReference := 0, "HRESULT")
        return ppvObjectReference
    }

    Query(iid) {
        if (IAgileReference.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Resolve := CallbackCreate(GetMethod(implObj, "Resolve"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Resolve)
    }
}
