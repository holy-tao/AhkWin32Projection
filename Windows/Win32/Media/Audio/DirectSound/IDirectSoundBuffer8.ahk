#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSEFFECTDESC.ahk" { DSEFFECTDESC }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirectSoundBuffer.ahk" { IDirectSoundBuffer }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundBuffer8 extends IDirectSoundBuffer {
    /**
     * The interface identifier for IDirectSoundBuffer8
     * @type {Guid}
     */
    static IID := Guid("{6825a449-7524-4d82-920f-50e36ab3ab1e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundBuffer8 interfaces
    */
    struct Vtbl extends IDirectSoundBuffer.Vtbl {
        SetFX            : IntPtr
        AcquireResources : IntPtr
        GetObjectInPath  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundBuffer8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwEffectsCount 
     * @param {Pointer<DSEFFECTDESC>} pDSFXDesc 
     * @returns {Integer} 
     */
    SetFX(dwEffectsCount, pDSFXDesc) {
        result := ComCall(21, this, "uint", dwEffectsCount, DSEFFECTDESC.Ptr, pDSFXDesc, "uint*", &pdwResultCodes := 0, "HRESULT")
        return pdwResultCodes
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwEffectsCount 
     * @returns {Integer} 
     */
    AcquireResources(dwFlags, dwEffectsCount) {
        result := ComCall(22, this, "uint", dwFlags, "uint", dwEffectsCount, "uint*", &pdwResultCodes := 0, "HRESULT")
        return pdwResultCodes
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidObject 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} rguidInterface 
     * @returns {Pointer<Void>} 
     */
    GetObjectInPath(rguidObject, dwIndex, rguidInterface) {
        result := ComCall(23, this, Guid.Ptr, rguidObject, "uint", dwIndex, Guid.Ptr, rguidInterface, "ptr*", &ppObject := 0, "HRESULT")
        return ppObject
    }

    Query(iid) {
        if (IDirectSoundBuffer8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFX := CallbackCreate(GetMethod(implObj, "SetFX"), flags, 4)
        this.vtbl.AcquireResources := CallbackCreate(GetMethod(implObj, "AcquireResources"), flags, 4)
        this.vtbl.GetObjectInPath := CallbackCreate(GetMethod(implObj, "GetObjectInPath"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFX)
        CallbackFree(this.vtbl.AcquireResources)
        CallbackFree(this.vtbl.GetObjectInPath)
    }
}
