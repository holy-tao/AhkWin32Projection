#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\InjectedInputRectangle.ahk
#Include .\InjectedInputPointerInfo.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class IInjectedInputTouchInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInjectedInputTouchInfo
     * @type {Guid}
     */
    static IID => Guid("{224fd1df-43e8-5ef5-510a-69ca8c9b4c28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Contact", "put_Contact", "get_Orientation", "put_Orientation", "get_PointerInfo", "put_PointerInfo", "get_Pressure", "put_Pressure", "get_TouchParameters", "put_TouchParameters"]

    /**
     * @type {InjectedInputRectangle} 
     */
    Contact {
        get => this.get_Contact()
        set => this.put_Contact(value)
    }

    /**
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * @type {InjectedInputPointerInfo} 
     */
    PointerInfo {
        get => this.get_PointerInfo()
        set => this.put_PointerInfo(value)
    }

    /**
     * @type {Float} 
     */
    Pressure {
        get => this.get_Pressure()
        set => this.put_Pressure(value)
    }

    /**
     * @type {Integer} 
     */
    TouchParameters {
        get => this.get_TouchParameters()
        set => this.put_TouchParameters(value)
    }

    /**
     * 
     * @returns {InjectedInputRectangle} 
     */
    get_Contact() {
        value := InjectedInputRectangle()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {InjectedInputRectangle} value 
     * @returns {HRESULT} 
     */
    put_Contact(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_Orientation(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InjectedInputPointerInfo} 
     */
    get_PointerInfo() {
        value := InjectedInputPointerInfo()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {InjectedInputPointerInfo} value 
     * @returns {HRESULT} 
     */
    put_PointerInfo(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pressure() {
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
    put_Pressure(value) {
        result := ComCall(13, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TouchParameters() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
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
    put_TouchParameters(value) {
        result := ComCall(15, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
