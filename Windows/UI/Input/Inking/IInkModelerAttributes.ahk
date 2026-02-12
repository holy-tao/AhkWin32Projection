#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkModelerAttributes extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkModelerAttributes
     * @type {Guid}
     */
    static IID => Guid("{bad31f27-0cd9-4bfd-b6f3-9e03ba8d7454}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PredictionTime", "put_PredictionTime", "get_ScalingFactor", "put_ScalingFactor"]

    /**
     * @type {TimeSpan} 
     */
    PredictionTime {
        get => this.get_PredictionTime()
        set => this.put_PredictionTime(value)
    }

    /**
     * @type {Float} 
     */
    ScalingFactor {
        get => this.get_ScalingFactor()
        set => this.put_ScalingFactor(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_PredictionTime() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_PredictionTime(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScalingFactor() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ScalingFactor(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
