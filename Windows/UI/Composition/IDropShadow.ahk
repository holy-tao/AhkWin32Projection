#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Color.ahk
#Include .\CompositionBrush.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IDropShadow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropShadow
     * @type {Guid}
     */
    static IID => Guid("{cb977c07-a154-4851-85e7-a8924c84fad8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BlurRadius", "put_BlurRadius", "get_Color", "put_Color", "get_Mask", "put_Mask", "get_Offset", "put_Offset", "get_Opacity", "put_Opacity"]

    /**
     * @type {Float} 
     */
    BlurRadius {
        get => this.get_BlurRadius()
        set => this.put_BlurRadius(value)
    }

    /**
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * @type {CompositionBrush} 
     */
    Mask {
        get => this.get_Mask()
        set => this.put_Mask(value)
    }

    /**
     * @type {Vector3} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BlurRadius() {
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
    put_BlurRadius(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        value := Color()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_Color(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Mask() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionBrush(value)
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_Mask(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Offset() {
        value := Vector3()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        result := ComCall(14, this, "float*", &value := 0, "int")
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
    put_Opacity(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
