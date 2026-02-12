#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ISensorQuaternion extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensorQuaternion
     * @type {Guid}
     */
    static IID => Guid("{c9c5c827-c71c-46e7-9da3-36a193b232bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_W", "get_X", "get_Y", "get_Z"]

    /**
     * @type {Float} 
     */
    W {
        get => this.get_W()
    }

    /**
     * @type {Float} 
     */
    X {
        get => this.get_X()
    }

    /**
     * @type {Float} 
     */
    Y {
        get => this.get_Y()
    }

    /**
     * @type {Float} 
     */
    Z {
        get => this.get_Z()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_W() {
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
    get_X() {
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
    get_Y() {
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
    get_Z() {
        result := ComCall(9, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
