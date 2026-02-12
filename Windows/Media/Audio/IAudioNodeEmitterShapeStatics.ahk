#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioNodeEmitterShape.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNodeEmitterShapeStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNodeEmitterShapeStatics
     * @type {Guid}
     */
    static IID => Guid("{57bb2771-ffa5-4b86-a779-e264aeb9145f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCone", "CreateOmnidirectional"]

    /**
     * 
     * @param {Float} innerAngle 
     * @param {Float} outerAngle 
     * @param {Float} outerAngleGain 
     * @returns {AudioNodeEmitterShape} 
     */
    CreateCone(innerAngle, outerAngle, outerAngleGain) {
        result := ComCall(6, this, "double", innerAngle, "double", outerAngle, "double", outerAngleGain, "ptr*", &shape_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeEmitterShape(shape_)
    }

    /**
     * 
     * @returns {AudioNodeEmitterShape} 
     */
    CreateOmnidirectional() {
        result := ComCall(7, this, "ptr*", &shape_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeEmitterShape(shape_)
    }
}
