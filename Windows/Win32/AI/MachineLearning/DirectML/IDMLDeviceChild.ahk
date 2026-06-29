#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDMLObject.ahk" { IDMLObject }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * An interface implemented by all objects created from the DirectML device.
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmldevicechild
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLDeviceChild extends IDMLObject {
    /**
     * The interface identifier for IDMLDeviceChild
     * @type {Guid}
     */
    static IID := Guid("{27e83142-8165-49e3-974e-2fd66e4cb69d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLDeviceChild interfaces
    */
    struct Vtbl extends IDMLObject.Vtbl {
        GetDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLDeviceChild.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the DirectML device that was used to create this object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppv</i>. This is expected to be the GUID of [IDMLDevice](/windows/win32/api/directml/nn-directml-idmldevice).
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the DirectML device. This is the address of a pointer to an [IDMLDevice](/windows/win32/api/directml/nn-directml-idmldevice), representing  the DirectML device.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevicechild-getdevice
     */
    GetDevice(riid) {
        result := ComCall(7, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IDMLDeviceChild.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
    }
}
