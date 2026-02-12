#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioNodeEmitter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNodeEmitterFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNodeEmitterFactory
     * @type {Guid}
     */
    static IID => Guid("{fdc8489a-6ad6-4ce4-b7f7-a99370df7ee9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAudioNodeEmitter"]

    /**
     * 
     * @param {AudioNodeEmitterShape} shape_ 
     * @param {AudioNodeEmitterDecayModel} decayModel 
     * @param {Integer} settings 
     * @returns {AudioNodeEmitter} 
     */
    CreateAudioNodeEmitter(shape_, decayModel, settings) {
        result := ComCall(6, this, "ptr", shape_, "ptr", decayModel, "uint", settings, "ptr*", &emitter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeEmitter(emitter)
    }
}
