#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class IRampForceEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRampForceEffect
     * @type {Guid}
     */
    static IID => Guid("{f1f81259-1ca6-4080-b56d-b43f3354d052}")

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
     * @param {Vector3} startVector 
     * @param {Vector3} endVector 
     * @param {TimeSpan} duration_ 
     * @returns {HRESULT} 
     */
    SetParameters(startVector, endVector, duration_) {
        result := ComCall(6, this, "ptr", startVector, "ptr", endVector, "ptr", duration_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Vector3} startVector 
     * @param {Vector3} endVector 
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
    SetParametersWithEnvelope(startVector, endVector, attackGain, sustainGain, releaseGain, startDelay, attackDuration, sustainDuration, releaseDuration, repeatCount) {
        result := ComCall(7, this, "ptr", startVector, "ptr", endVector, "float", attackGain, "float", sustainGain, "float", releaseGain, "ptr", startDelay, "ptr", attackDuration, "ptr", sustainDuration, "ptr", releaseDuration, "uint", repeatCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
