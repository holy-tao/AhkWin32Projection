#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IAccelerometerDataThreshold extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccelerometerDataThreshold
     * @type {Guid}
     */
    static IID => Guid("{f92c1b68-6320-5577-879e-9942621c3dd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XAxisInGForce", "put_XAxisInGForce", "get_YAxisInGForce", "put_YAxisInGForce", "get_ZAxisInGForce", "put_ZAxisInGForce"]

    /**
     * @type {Float} 
     */
    XAxisInGForce {
        get => this.get_XAxisInGForce()
        set => this.put_XAxisInGForce(value)
    }

    /**
     * @type {Float} 
     */
    YAxisInGForce {
        get => this.get_YAxisInGForce()
        set => this.put_YAxisInGForce(value)
    }

    /**
     * @type {Float} 
     */
    ZAxisInGForce {
        get => this.get_ZAxisInGForce()
        set => this.put_ZAxisInGForce(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_XAxisInGForce() {
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
    put_XAxisInGForce(value) {
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
    get_YAxisInGForce() {
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
    put_YAxisInGForce(value) {
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
    get_ZAxisInGForce() {
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
    put_ZAxisInGForce(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
