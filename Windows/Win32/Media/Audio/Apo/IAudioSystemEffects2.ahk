#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAudioSystemEffects.ahk" { IAudioSystemEffects }

/**
 * The IAudioSystemEffects2 interface was introduced with Windows 8.1 for retrieving information about the processing objects in a given mode.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nn-audioenginebaseapo-iaudiosystemeffects2
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IAudioSystemEffects2 extends IAudioSystemEffects {
    /**
     * The interface identifier for IAudioSystemEffects2
     * @type {Guid}
     */
    static IID := Guid("{bafe99d2-7436-44ce-9e0e-4d89afbfff56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioSystemEffects2 interfaces
    */
    struct Vtbl extends IAudioSystemEffects.Vtbl {
        GetEffectsList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioSystemEffects2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetEffectsList method is used for retrieving the list of audio processing effects that are currently active, and stores an event to be signaled if the list changes.
     * @remarks
     * The APO signals the specified  event when the list of audio processing effects changes from the list that was returned by <b>GetEffectsList</b>. The APO uses this event until either <b>GetEffectsList</b> is called again, or the APO is destroyed. The passed handle can be NULL, in which case the APO stops using any previous handle and does not signal an event.
     * 
     * An APO implements this method to allow Windows to discover the current effects applied by the APO. The list of effects may depend on the processing mode that the APO initialized, and on any end user configuration. The processing mode is indicated by the <i>AudioProcessingMode</i> member of <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/ns-audioenginebaseapo-apoinitsystemeffects2">APOInitSystemEffects2</a>.
     * 
     * APOs should identify effects using GUIDs defined by Windows, such as AUDIO_EFFECT_TYPE_ACOUSTIC_ECHO_CANCELLATION. An APO should only define and return a custom GUID in rare cases where the type of effect is clearly different from the ones defined by Windows.
     * @param {Pointer<Pointer<Guid>>} ppEffectsIds Pointer to the list of GUIDs that represent audio processing effects. The caller is responsible for freeing this memory by calling CoTaskMemFree.
     * @param {Pointer<Integer>} pcEffects A count of the audio processing effects in the list.
     * @param {HANDLE} Event The HANDLE of the event that will be signaled if the list changes.
     * @returns {HRESULT} The <b>GetEffectsList</b> method returns S_OK, If the method call is successful. If there are no effects in the list, the function still succeeds, <i>ppEffectsIds</i> returns a NULL pointer, and <i>pcEffects</i> returns a count of 0.
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffects2-geteffectslist
     */
    GetEffectsList(ppEffectsIds, pcEffects, Event) {
        ppEffectsIdsMarshal := ppEffectsIds is VarRef ? "ptr*" : "ptr"
        pcEffectsMarshal := pcEffects is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppEffectsIdsMarshal, ppEffectsIds, pcEffectsMarshal, pcEffects, HANDLE, Event, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioSystemEffects2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEffectsList := CallbackCreate(GetMethod(implObj, "GetEffectsList"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEffectsList)
    }
}
