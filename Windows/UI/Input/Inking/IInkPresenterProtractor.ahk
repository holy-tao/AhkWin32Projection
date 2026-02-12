#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Color.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPresenterProtractor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPresenterProtractor
     * @type {Guid}
     */
    static IID => Guid("{7de3f2aa-ef6c-4e91-a73b-5b70d56fbd17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AreTickMarksVisible", "put_AreTickMarksVisible", "get_AreRaysVisible", "put_AreRaysVisible", "get_IsCenterMarkerVisible", "put_IsCenterMarkerVisible", "get_IsAngleReadoutVisible", "put_IsAngleReadoutVisible", "get_IsResizable", "put_IsResizable", "get_Radius", "put_Radius", "get_AccentColor", "put_AccentColor"]

    /**
     * @type {Boolean} 
     */
    AreTickMarksVisible {
        get => this.get_AreTickMarksVisible()
        set => this.put_AreTickMarksVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    AreRaysVisible {
        get => this.get_AreRaysVisible()
        set => this.put_AreRaysVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCenterMarkerVisible {
        get => this.get_IsCenterMarkerVisible()
        set => this.put_IsCenterMarkerVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAngleReadoutVisible {
        get => this.get_IsAngleReadoutVisible()
        set => this.put_IsAngleReadoutVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsResizable {
        get => this.get_IsResizable()
        set => this.put_IsResizable(value)
    }

    /**
     * @type {Float} 
     */
    Radius {
        get => this.get_Radius()
        set => this.put_Radius(value)
    }

    /**
     * @type {Color} 
     */
    AccentColor {
        get => this.get_AccentColor()
        set => this.put_AccentColor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreTickMarksVisible() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreTickMarksVisible(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreRaysVisible() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreRaysVisible(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCenterMarkerVisible() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCenterMarkerVisible(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAngleReadoutVisible() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAngleReadoutVisible(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResizable() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsResizable(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Radius() {
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
    put_Radius(value) {
        result := ComCall(17, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_AccentColor() {
        value := Color()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_AccentColor(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
