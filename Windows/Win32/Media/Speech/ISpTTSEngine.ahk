#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpTTSEngineSite.ahk" { ISpTTSEngineSite }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\SPVTEXTFRAG.ahk" { SPVTEXTFRAG }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpTTSEngine extends IUnknown {
    /**
     * The interface identifier for ISpTTSEngine
     * @type {Guid}
     */
    static IID := Guid("{a74d7c8e-4cc5-4f2f-a6eb-804dee18500e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpTTSEngine interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Speak           : IntPtr
        GetOutputFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpTTSEngine.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwSpeakFlags 
     * @param {Pointer<Guid>} rguidFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {Pointer<SPVTEXTFRAG>} pTextFragList 
     * @param {ISpTTSEngineSite} pOutputSite 
     * @returns {HRESULT} 
     */
    Speak(dwSpeakFlags, rguidFormatId, pWaveFormatEx, pTextFragList, pOutputSite) {
        result := ComCall(3, this, "uint", dwSpeakFlags, Guid.Ptr, rguidFormatId, WAVEFORMATEX.Ptr, pWaveFormatEx, SPVTEXTFRAG.Ptr, pTextFragList, "ptr", pOutputSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pTargetFmtId 
     * @param {Pointer<WAVEFORMATEX>} pTargetWaveFormatEx 
     * @param {Pointer<Guid>} pOutputFormatId 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppCoMemOutputWaveFormatEx 
     * @returns {HRESULT} 
     */
    GetOutputFormat(pTargetFmtId, pTargetWaveFormatEx, pOutputFormatId, ppCoMemOutputWaveFormatEx) {
        ppCoMemOutputWaveFormatExMarshal := ppCoMemOutputWaveFormatEx is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, Guid.Ptr, pTargetFmtId, WAVEFORMATEX.Ptr, pTargetWaveFormatEx, Guid.Ptr, pOutputFormatId, ppCoMemOutputWaveFormatExMarshal, ppCoMemOutputWaveFormatEx, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpTTSEngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Speak := CallbackCreate(GetMethod(implObj, "Speak"), flags, 6)
        this.vtbl.GetOutputFormat := CallbackCreate(GetMethod(implObj, "GetOutputFormat"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Speak)
        CallbackFree(this.vtbl.GetOutputFormat)
    }
}
