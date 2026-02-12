#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class IPeriodicForceEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPeriodicForceEffect
     * @type {Guid}
     */
    static IID => Guid("{5c5138d7-fc75-4d52-9a0a-efe4cab5fe64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "SetParameters", "SetParametersWithEnvelope"]

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} vector 
     * @param {Float} frequency 
     * @param {Float} phase 
     * @param {Float} bias 
     * @param {TimeSpan} duration_ 
     * @returns {HRESULT} 
     */
    SetParameters(vector, frequency, phase, bias, duration_) {
        result := ComCall(7, this, "ptr", vector, "float", frequency, "float", phase, "float", bias, "ptr", duration_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Vector3} vector 
     * @param {Float} frequency 
     * @param {Float} phase 
     * @param {Float} bias 
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
    SetParametersWithEnvelope(vector, frequency, phase, bias, attackGain, sustainGain, releaseGain, startDelay, attackDuration, sustainDuration, releaseDuration, repeatCount) {
        result := ComCall(8, this, "ptr", vector, "float", frequency, "float", phase, "float", bias, "float", attackGain, "float", sustainGain, "float", releaseGain, "ptr", startDelay, "ptr", attackDuration, "ptr", sustainDuration, "ptr", releaseDuration, "uint", repeatCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
