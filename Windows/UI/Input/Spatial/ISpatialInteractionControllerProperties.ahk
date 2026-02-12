#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionControllerProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionControllerProperties
     * @type {Guid}
     */
    static IID => Guid("{61056fb1-7ba9-4e35-b93f-9272cba9b28b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTouchpadTouched", "get_IsTouchpadPressed", "get_IsThumbstickPressed", "get_ThumbstickX", "get_ThumbstickY", "get_TouchpadX", "get_TouchpadY"]

    /**
     * @type {Boolean} 
     */
    IsTouchpadTouched {
        get => this.get_IsTouchpadTouched()
    }

    /**
     * @type {Boolean} 
     */
    IsTouchpadPressed {
        get => this.get_IsTouchpadPressed()
    }

    /**
     * @type {Boolean} 
     */
    IsThumbstickPressed {
        get => this.get_IsThumbstickPressed()
    }

    /**
     * @type {Float} 
     */
    ThumbstickX {
        get => this.get_ThumbstickX()
    }

    /**
     * @type {Float} 
     */
    ThumbstickY {
        get => this.get_ThumbstickY()
    }

    /**
     * @type {Float} 
     */
    TouchpadX {
        get => this.get_TouchpadX()
    }

    /**
     * @type {Float} 
     */
    TouchpadY {
        get => this.get_TouchpadY()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTouchpadTouched() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTouchpadPressed() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsThumbstickPressed() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ThumbstickX() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ThumbstickY() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TouchpadX() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TouchpadY() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
