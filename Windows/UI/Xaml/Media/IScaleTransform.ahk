#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IScaleTransform extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScaleTransform
     * @type {Guid}
     */
    static IID => Guid("{ed67f18d-936e-43ab-929a-e9cd0a511e52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CenterX", "put_CenterX", "get_CenterY", "put_CenterY", "get_ScaleX", "put_ScaleX", "get_ScaleY", "put_ScaleY"]

    /**
     * @type {Float} 
     */
    CenterX {
        get => this.get_CenterX()
        set => this.put_CenterX(value)
    }

    /**
     * @type {Float} 
     */
    CenterY {
        get => this.get_CenterY()
        set => this.put_CenterY(value)
    }

    /**
     * @type {Float} 
     */
    ScaleX {
        get => this.get_ScaleX()
        set => this.put_ScaleX(value)
    }

    /**
     * @type {Float} 
     */
    ScaleY {
        get => this.get_ScaleY()
        set => this.put_ScaleY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterX() {
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
    put_CenterX(value) {
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
    get_CenterY() {
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
    put_CenterY(value) {
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
    get_ScaleX() {
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
    put_ScaleX(value) {
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
    get_ScaleY() {
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
    put_ScaleY(value) {
        result := ComCall(13, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
