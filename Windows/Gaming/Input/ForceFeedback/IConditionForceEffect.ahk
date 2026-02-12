#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class IConditionForceEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConditionForceEffect
     * @type {Guid}
     */
    static IID => Guid("{32d1ea68-3695-4e69-85c0-cd1944189140}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "SetParameters"]

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
     * @param {Vector3} direction_ 
     * @param {Float} positiveCoefficient 
     * @param {Float} negativeCoefficient 
     * @param {Float} maxPositiveMagnitude 
     * @param {Float} maxNegativeMagnitude 
     * @param {Float} deadZone 
     * @param {Float} bias 
     * @returns {HRESULT} 
     */
    SetParameters(direction_, positiveCoefficient, negativeCoefficient, maxPositiveMagnitude, maxNegativeMagnitude, deadZone, bias) {
        result := ComCall(7, this, "ptr", direction_, "float", positiveCoefficient, "float", negativeCoefficient, "float", maxPositiveMagnitude, "float", maxNegativeMagnitude, "float", deadZone, "float", bias, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
