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
     * 
     * @param {Pointer<Guid>} ppEffectsIds 
     * @param {Pointer<UInt32>} pcEffects 
     * @param {HANDLE} Event 
     * @returns {HRESULT} 
     */
    GetEffectsList(ppEffectsIds, pcEffects, Event) {
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        result := ComCall(3, this, "ptr", ppEffectsIds, "uint*", pcEffects, "ptr", Event, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
