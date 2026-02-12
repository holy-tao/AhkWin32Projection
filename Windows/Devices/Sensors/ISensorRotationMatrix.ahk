#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ISensorRotationMatrix extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensorRotationMatrix
     * @type {Guid}
     */
    static IID => Guid("{0a3d5a67-22f4-4392-9538-65d0bd064aa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_M11", "get_M12", "get_M13", "get_M21", "get_M22", "get_M23", "get_M31", "get_M32", "get_M33"]

    /**
     * @type {Float} 
     */
    M11 {
        get => this.get_M11()
    }

    /**
     * @type {Float} 
     */
    M12 {
        get => this.get_M12()
    }

    /**
     * @type {Float} 
     */
    M13 {
        get => this.get_M13()
    }

    /**
     * @type {Float} 
     */
    M21 {
        get => this.get_M21()
    }

    /**
     * @type {Float} 
     */
    M22 {
        get => this.get_M22()
    }

    /**
     * @type {Float} 
     */
    M23 {
        get => this.get_M23()
    }

    /**
     * @type {Float} 
     */
    M31 {
        get => this.get_M31()
    }

    /**
     * @type {Float} 
     */
    M32 {
        get => this.get_M32()
    }

    /**
     * @type {Float} 
     */
    M33 {
        get => this.get_M33()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M11() {
        result := ComCall(6, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M12() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M13() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M21() {
        result := ComCall(9, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M22() {
        result := ComCall(10, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M23() {
        result := ComCall(11, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M31() {
        result := ComCall(12, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M32() {
        result := ComCall(13, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M33() {
        result := ComCall(14, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
