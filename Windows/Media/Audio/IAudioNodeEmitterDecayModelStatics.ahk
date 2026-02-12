#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioNodeEmitterDecayModel.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNodeEmitterDecayModelStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNodeEmitterDecayModelStatics
     * @type {Guid}
     */
    static IID => Guid("{c7787ca8-f178-462f-bc81-8dd5cbe5dae8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNatural", "CreateCustom"]

    /**
     * 
     * @param {Float} minGain 
     * @param {Float} maxGain 
     * @param {Float} unityGainDistance 
     * @param {Float} cutoffDistance 
     * @returns {AudioNodeEmitterDecayModel} 
     */
    CreateNatural(minGain, maxGain, unityGainDistance, cutoffDistance) {
        result := ComCall(6, this, "double", minGain, "double", maxGain, "double", unityGainDistance, "double", cutoffDistance, "ptr*", &decayModel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeEmitterDecayModel(decayModel)
    }

    /**
     * 
     * @param {Float} minGain 
     * @param {Float} maxGain 
     * @returns {AudioNodeEmitterDecayModel} 
     */
    CreateCustom(minGain, maxGain) {
        result := ComCall(7, this, "double", minGain, "double", maxGain, "ptr*", &decayModel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeEmitterDecayModel(decayModel)
    }
}
