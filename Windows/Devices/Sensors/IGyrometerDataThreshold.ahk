#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IGyrometerDataThreshold extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGyrometerDataThreshold
     * @type {Guid}
     */
    static IID => Guid("{8648b31e-6e52-5259-bbad-242a69dc38c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XAxisInDegreesPerSecond", "put_XAxisInDegreesPerSecond", "get_YAxisInDegreesPerSecond", "put_YAxisInDegreesPerSecond", "get_ZAxisInDegreesPerSecond", "put_ZAxisInDegreesPerSecond"]

    /**
     * @type {Float} 
     */
    XAxisInDegreesPerSecond {
        get => this.get_XAxisInDegreesPerSecond()
        set => this.put_XAxisInDegreesPerSecond(value)
    }

    /**
     * @type {Float} 
     */
    YAxisInDegreesPerSecond {
        get => this.get_YAxisInDegreesPerSecond()
        set => this.put_YAxisInDegreesPerSecond(value)
    }

    /**
     * @type {Float} 
     */
    ZAxisInDegreesPerSecond {
        get => this.get_ZAxisInDegreesPerSecond()
        set => this.put_ZAxisInDegreesPerSecond(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_XAxisInDegreesPerSecond() {
        result := ComCall(6, this, "double*", &value := 0, "int")
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
    put_XAxisInDegreesPerSecond(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YAxisInDegreesPerSecond() {
        result := ComCall(8, this, "double*", &value := 0, "int")
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
    put_YAxisInDegreesPerSecond(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZAxisInDegreesPerSecond() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
    put_ZAxisInDegreesPerSecond(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
