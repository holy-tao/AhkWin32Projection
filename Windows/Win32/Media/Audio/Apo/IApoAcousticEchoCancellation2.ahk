#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APO_REFERENCE_STREAM_PROPERTIES.ahk" { APO_REFERENCE_STREAM_PROPERTIES }
#Import ".\IApoAcousticEchoCancellation.ahk" { IApoAcousticEchoCancellation }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IApoAcousticEchoCancellation2 extends IApoAcousticEchoCancellation {
    /**
     * The interface identifier for IApoAcousticEchoCancellation2
     * @type {Guid}
     */
    static IID := Guid("{f235855f-f06d-45b3-a63f-ee4b71509dc2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApoAcousticEchoCancellation2 interfaces
    */
    struct Vtbl extends IApoAcousticEchoCancellation.Vtbl {
        GetDesiredReferenceStreamProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApoAcousticEchoCancellation2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {APO_REFERENCE_STREAM_PROPERTIES} 
     */
    GetDesiredReferenceStreamProperties() {
        result := ComCall(3, this, "int*", &pProperties := 0, "HRESULT")
        return pProperties
    }

    Query(iid) {
        if (IApoAcousticEchoCancellation2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesiredReferenceStreamProperties := CallbackCreate(GetMethod(implObj, "GetDesiredReferenceStreamProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesiredReferenceStreamProperties)
    }
}
