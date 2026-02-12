#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ILightSensorDataThreshold extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILightSensorDataThreshold
     * @type {Guid}
     */
    static IID => Guid("{b160afd1-878f-5492-9f2c-33dc3ae584a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LuxPercentage", "put_LuxPercentage", "get_AbsoluteLux", "put_AbsoluteLux"]

    /**
     * @type {Float} 
     */
    LuxPercentage {
        get => this.get_LuxPercentage()
        set => this.put_LuxPercentage(value)
    }

    /**
     * @type {Float} 
     */
    AbsoluteLux {
        get => this.get_AbsoluteLux()
        set => this.put_AbsoluteLux(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LuxPercentage() {
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
    put_LuxPercentage(value) {
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
    get_AbsoluteLux() {
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
    put_AbsoluteLux(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
