#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IAudioSourceProvider extends IUnknown {
    /**
     * The interface identifier for IAudioSourceProvider
     * @type {Guid}
     */
    static IID := Guid("{ebbaf249-afc2-4582-91c6-b60df2e84954}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioSourceProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ProvideInput : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioSourceProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwSampleCount 
     * @param {Pointer<Integer>} pdwChannelCount 
     * @returns {Float} 
     */
    ProvideInput(dwSampleCount, pdwChannelCount) {
        pdwChannelCountMarshal := pdwChannelCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwSampleCount, pdwChannelCountMarshal, pdwChannelCount, "float*", &pInterleavedAudioData := 0, "HRESULT")
        return pInterleavedAudioData
    }

    Query(iid) {
        if (IAudioSourceProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProvideInput := CallbackCreate(GetMethod(implObj, "ProvideInput"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProvideInput)
    }
}
