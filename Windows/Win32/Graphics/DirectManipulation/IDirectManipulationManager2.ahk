#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectManipulationManager.ahk" { IDirectManipulationManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends the IDirectManipulationManager interface that provides access to all the Direct Manipulation features and APIs available to the client application.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationmanager2
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationManager2 extends IDirectManipulationManager {
    /**
     * The interface identifier for IDirectManipulationManager2
     * @type {Guid}
     */
    static IID := Guid("{fa1005e9-3d16-484c-bfc9-62b61e56ec4e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationManager2 interfaces
    */
    struct Vtbl extends IDirectManipulationManager.Vtbl {
        CreateBehavior : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Factory method to create a behavior.
     * @param {Pointer<Guid>} clsid CLSID of the behavior. The CLSID specifies the type of behavior.
     * @param {Pointer<Guid>} riid The IID of the behavior interface to create.
     * @returns {Pointer<Void>} The new behavior object that implements the specified interface.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager2-createbehavior
     */
    CreateBehavior(clsid, riid) {
        result := ComCall(10, this, Guid.Ptr, clsid, Guid.Ptr, riid, "ptr*", &_object := 0, "HRESULT")
        return _object
    }

    Query(iid) {
        if (IDirectManipulationManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateBehavior := CallbackCreate(GetMethod(implObj, "CreateBehavior"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateBehavior)
    }
}
