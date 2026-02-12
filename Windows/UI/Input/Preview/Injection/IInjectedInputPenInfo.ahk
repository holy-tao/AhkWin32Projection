#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\InjectedInputPointerInfo.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class IInjectedInputPenInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInjectedInputPenInfo
     * @type {Guid}
     */
    static IID => Guid("{6b40ad03-ca1e-5527-7e02-2828540bb1d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointerInfo", "put_PointerInfo", "get_PenButtons", "put_PenButtons", "get_PenParameters", "put_PenParameters", "get_Pressure", "put_Pressure", "get_Rotation", "put_Rotation", "get_TiltX", "put_TiltX", "get_TiltY", "put_TiltY"]

    /**
     * @type {InjectedInputPointerInfo} 
     */
    PointerInfo {
        get => this.get_PointerInfo()
        set => this.put_PointerInfo(value)
    }

    /**
     * @type {Integer} 
     */
    PenButtons {
        get => this.get_PenButtons()
        set => this.put_PenButtons(value)
    }

    /**
     * @type {Integer} 
     */
    PenParameters {
        get => this.get_PenParameters()
        set => this.put_PenParameters(value)
    }

    /**
     * @type {Float} 
     */
    Pressure {
        get => this.get_Pressure()
        set => this.put_Pressure(value)
    }

    /**
     * @type {Float} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * @type {Integer} 
     */
    TiltX {
        get => this.get_TiltX()
        set => this.put_TiltX(value)
    }

    /**
     * @type {Integer} 
     */
    TiltY {
        get => this.get_TiltY()
        set => this.put_TiltY(value)
    }

    /**
     * 
     * @returns {InjectedInputPointerInfo} 
     */
    get_PointerInfo() {
        value := InjectedInputPointerInfo()
        result := ComCall(6, this, "ptr", value, "int")
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
    get_PenButtons() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
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
    put_PenButtons(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PenParameters() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
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
    put_PenParameters(value) {
        result := ComCall(11, this, "uint", value, "int")
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
     * @returns {Float} 
     */
    get_Rotation() {
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
    put_Rotation(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TiltX() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_TiltX(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TiltY() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_TiltY(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
