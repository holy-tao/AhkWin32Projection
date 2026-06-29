#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectSoundCaptureBuffer.ahk" { IDirectSoundCaptureBuffer }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundCaptureBuffer8 extends IDirectSoundCaptureBuffer {
    /**
     * The interface identifier for IDirectSoundCaptureBuffer8
     * @type {Guid}
     */
    static IID := Guid("{00990df4-0dbb-4872-833e-6d303e80aeb6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundCaptureBuffer8 interfaces
    */
    struct Vtbl extends IDirectSoundCaptureBuffer.Vtbl {
        GetObjectInPath : IntPtr
        GetFXStatus     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundCaptureBuffer8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidObject 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} rguidInterface 
     * @returns {Pointer<Void>} 
     */
    GetObjectInPath(rguidObject, dwIndex, rguidInterface) {
        result := ComCall(12, this, Guid.Ptr, rguidObject, "uint", dwIndex, Guid.Ptr, rguidInterface, "ptr*", &ppObject := 0, "HRESULT")
        return ppObject
    }

    /**
     * 
     * @param {Integer} dwEffectsCount 
     * @returns {Integer} 
     */
    GetFXStatus(dwEffectsCount) {
        result := ComCall(13, this, "uint", dwEffectsCount, "uint*", &pdwFXStatus := 0, "HRESULT")
        return pdwFXStatus
    }

    Query(iid) {
        if (IDirectSoundCaptureBuffer8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObjectInPath := CallbackCreate(GetMethod(implObj, "GetObjectInPath"), flags, 5)
        this.vtbl.GetFXStatus := CallbackCreate(GetMethod(implObj, "GetFXStatus"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObjectInPath)
        CallbackFree(this.vtbl.GetFXStatus)
    }
}
