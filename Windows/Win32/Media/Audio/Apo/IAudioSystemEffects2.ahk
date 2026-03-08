#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioSystemEffects.ahk

/**
 * The IAudioSystemEffects2 interface was introduced with Windows 8.1 for retrieving information about the processing objects in a given mode.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nn-audioenginebaseapo-iaudiosystemeffects2
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioSystemEffects2 extends IAudioSystemEffects{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSystemEffects2
     * @type {Guid}
     */
    static IID => Guid("{bafe99d2-7436-44ce-9e0e-4d89afbfff56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEffectsList"]

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
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ppEffectsIdsMarshal := ppEffectsIds is VarRef ? "ptr*" : "ptr"
        pcEffectsMarshal := pcEffects is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppEffectsIdsMarshal, ppEffectsIds, pcEffectsMarshal, pcEffects, "ptr", Event, "HRESULT")
        return result
    }
}
