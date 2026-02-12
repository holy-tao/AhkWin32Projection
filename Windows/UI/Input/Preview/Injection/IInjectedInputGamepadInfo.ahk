#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class IInjectedInputGamepadInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInjectedInputGamepadInfo
     * @type {Guid}
     */
    static IID => Guid("{20ae9a3f-df11-4572-a9ab-d75b8a5e48ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Buttons", "put_Buttons", "get_LeftThumbstickX", "put_LeftThumbstickX", "get_LeftThumbstickY", "put_LeftThumbstickY", "get_LeftTrigger", "put_LeftTrigger", "get_RightThumbstickX", "put_RightThumbstickX", "get_RightThumbstickY", "put_RightThumbstickY", "get_RightTrigger", "put_RightTrigger"]

    /**
     * @type {Integer} 
     */
    Buttons {
        get => this.get_Buttons()
        set => this.put_Buttons(value)
    }

    /**
     * @type {Float} 
     */
    LeftThumbstickX {
        get => this.get_LeftThumbstickX()
        set => this.put_LeftThumbstickX(value)
    }

    /**
     * @type {Float} 
     */
    LeftThumbstickY {
        get => this.get_LeftThumbstickY()
        set => this.put_LeftThumbstickY(value)
    }

    /**
     * @type {Float} 
     */
    LeftTrigger {
        get => this.get_LeftTrigger()
        set => this.put_LeftTrigger(value)
    }

    /**
     * @type {Float} 
     */
    RightThumbstickX {
        get => this.get_RightThumbstickX()
        set => this.put_RightThumbstickX(value)
    }

    /**
     * @type {Float} 
     */
    RightThumbstickY {
        get => this.get_RightThumbstickY()
        set => this.put_RightThumbstickY(value)
    }

    /**
     * @type {Float} 
     */
    RightTrigger {
        get => this.get_RightTrigger()
        set => this.put_RightTrigger(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Buttons() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Buttons(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftThumbstickX() {
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
    put_LeftThumbstickX(value) {
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
    get_LeftThumbstickY() {
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
    put_LeftThumbstickY(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftTrigger() {
        result := ComCall(12, this, "double*", &value := 0, "int")
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
    put_LeftTrigger(value) {
        result := ComCall(13, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightThumbstickX() {
        result := ComCall(14, this, "double*", &value := 0, "int")
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
    put_RightThumbstickX(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightThumbstickY() {
        result := ComCall(16, this, "double*", &value := 0, "int")
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
    put_RightThumbstickY(value) {
        result := ComCall(17, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightTrigger() {
        result := ComCall(18, this, "double*", &value := 0, "int")
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
    put_RightTrigger(value) {
        result := ComCall(19, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
