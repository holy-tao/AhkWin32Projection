#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectManipulationManager2.ahk" { IDirectManipulationManager2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends the IDirectManipulationManager2 interface that provides access to all the Direct Manipulation features and APIs available to the client application.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationmanager3
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationManager3 extends IDirectManipulationManager2 {
    /**
     * The interface identifier for IDirectManipulationManager3
     * @type {Guid}
     */
    static IID := Guid("{2cb6b33d-ffe8-488c-b750-fbdfe88dca8c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationManager3 interfaces
    */
    struct Vtbl extends IDirectManipulationManager2.Vtbl {
        GetService : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationManager3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an IDirectManipulationDeferContactService object.
     * @param {Pointer<Guid>} clsid The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationdefercontactservice">IDirectManipulationDeferContactService</a> CLSID.
     * @param {Pointer<Guid>} riid The IID of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationdefercontactservice">IDirectManipulationDeferContactService</a> to retrieve.
     * @returns {Pointer<Void>} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationdefercontactservice">IDirectManipulationDeferContactService</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager3-getservice
     */
    GetService(clsid, riid) {
        result := ComCall(11, this, Guid.Ptr, clsid, Guid.Ptr, riid, "ptr*", &_object := 0, "HRESULT")
        return _object
    }

    Query(iid) {
        if (IDirectManipulationManager3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetService := CallbackCreate(GetMethod(implObj, "GetService"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetService)
    }
}
