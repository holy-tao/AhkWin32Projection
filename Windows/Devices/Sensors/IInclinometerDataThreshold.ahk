#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IInclinometerDataThreshold extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInclinometerDataThreshold
     * @type {Guid}
     */
    static IID => Guid("{f80a4783-7bfe-545e-bb60-a0ebc47bd2fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PitchInDegrees", "put_PitchInDegrees", "get_RollInDegrees", "put_RollInDegrees", "get_YawInDegrees", "put_YawInDegrees"]

    /**
     * @type {Float} 
     */
    PitchInDegrees {
        get => this.get_PitchInDegrees()
        set => this.put_PitchInDegrees(value)
    }

    /**
     * @type {Float} 
     */
    RollInDegrees {
        get => this.get_RollInDegrees()
        set => this.put_RollInDegrees(value)
    }

    /**
     * @type {Float} 
     */
    YawInDegrees {
        get => this.get_YawInDegrees()
        set => this.put_YawInDegrees(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PitchInDegrees() {
        result := ComCall(6, this, "float*", &value := 0, "int")
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
    put_PitchInDegrees(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RollInDegrees() {
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
    put_RollInDegrees(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YawInDegrees() {
        result := ComCall(10, this, "float*", &value := 0, "int")
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
    put_YawInDegrees(value) {
        result := ComCall(11, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
