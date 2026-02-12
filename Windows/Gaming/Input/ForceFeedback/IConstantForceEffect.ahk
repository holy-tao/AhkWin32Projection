#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class IConstantForceEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConstantForceEffect
     * @type {Guid}
     */
    static IID => Guid("{9bfa0140-f3c7-415c-b068-0f068734bce0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetParameters", "SetParametersWithEnvelope"]

    /**
     * 
     * @param {Vector3} vector 
     * @param {TimeSpan} duration_ 
     * @returns {HRESULT} 
     */
    SetParameters(vector, duration_) {
        result := ComCall(6, this, "ptr", vector, "ptr", duration_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Vector3} vector 
     * @param {Float} attackGain 
     * @param {Float} sustainGain 
     * @param {Float} releaseGain 
     * @param {TimeSpan} startDelay 
     * @param {TimeSpan} attackDuration 
     * @param {TimeSpan} sustainDuration 
     * @param {TimeSpan} releaseDuration 
     * @param {Integer} repeatCount 
     * @returns {HRESULT} 
     */
    SetParametersWithEnvelope(vector, attackGain, sustainGain, releaseGain, startDelay, attackDuration, sustainDuration, releaseDuration, repeatCount) {
        result := ComCall(7, this, "ptr", vector, "float", attackGain, "float", sustainGain, "float", releaseGain, "ptr", startDelay, "ptr", attackDuration, "ptr", sustainDuration, "ptr", releaseDuration, "uint", repeatCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
