#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector2.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IRectangleClip extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRectangleClip
     * @type {Guid}
     */
    static IID => Guid("{b3e7549e-00b4-5b53-8be8-353f6c433101}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bottom", "put_Bottom", "get_BottomLeftRadius", "put_BottomLeftRadius", "get_BottomRightRadius", "put_BottomRightRadius", "get_Left", "put_Left", "get_Right", "put_Right", "get_Top", "put_Top", "get_TopLeftRadius", "put_TopLeftRadius", "get_TopRightRadius", "put_TopRightRadius"]

    /**
     * @type {Float} 
     */
    Bottom {
        get => this.get_Bottom()
        set => this.put_Bottom(value)
    }

    /**
     * @type {Vector2} 
     */
    BottomLeftRadius {
        get => this.get_BottomLeftRadius()
        set => this.put_BottomLeftRadius(value)
    }

    /**
     * @type {Vector2} 
     */
    BottomRightRadius {
        get => this.get_BottomRightRadius()
        set => this.put_BottomRightRadius(value)
    }

    /**
     * @type {Float} 
     */
    Left {
        get => this.get_Left()
        set => this.put_Left(value)
    }

    /**
     * @type {Float} 
     */
    Right {
        get => this.get_Right()
        set => this.put_Right(value)
    }

    /**
     * @type {Float} 
     */
    Top {
        get => this.get_Top()
        set => this.put_Top(value)
    }

    /**
     * @type {Vector2} 
     */
    TopLeftRadius {
        get => this.get_TopLeftRadius()
        set => this.put_TopLeftRadius(value)
    }

    /**
     * @type {Vector2} 
     */
    TopRightRadius {
        get => this.get_TopRightRadius()
        set => this.put_TopRightRadius(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Bottom() {
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
    put_Bottom(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_BottomLeftRadius() {
        value := Vector2()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_BottomLeftRadius(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_BottomRightRadius() {
        value := Vector2()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_BottomRightRadius(value) {
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
    get_Left() {
        result := ComCall(12, this, "float*", &value := 0, "int")
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
    put_Left(value) {
        result := ComCall(13, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Right() {
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
    put_Right(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Top() {
        result := ComCall(16, this, "float*", &value := 0, "int")
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
    put_Top(value) {
        result := ComCall(17, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_TopLeftRadius() {
        value := Vector2()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_TopLeftRadius(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_TopRightRadius() {
        value := Vector2()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_TopRightRadius(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
