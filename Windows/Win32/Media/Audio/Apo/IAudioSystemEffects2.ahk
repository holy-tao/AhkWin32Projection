#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioSystemEffects.ahk

/**
 * The IAudioSystemEffects2 interface was introduced with Windows 8.1 for retrieving information about the processing objects in a given mode.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudiosystemeffects2
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
     * 
     * @param {Pointer<Pointer<Guid>>} ppEffectsIds 
     * @param {Pointer<Integer>} pcEffects 
     * @param {HANDLE} Event 
     * @returns {HRESULT} 
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
