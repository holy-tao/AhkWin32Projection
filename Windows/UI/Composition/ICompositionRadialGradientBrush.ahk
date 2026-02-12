#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector2.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionRadialGradientBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionRadialGradientBrush
     * @type {Guid}
     */
    static IID => Guid("{3d3b50c5-e3fa-4ce2-b9fc-3ee12561788f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EllipseCenter", "put_EllipseCenter", "get_EllipseRadius", "put_EllipseRadius", "get_GradientOriginOffset", "put_GradientOriginOffset"]

    /**
     * @type {Vector2} 
     */
    EllipseCenter {
        get => this.get_EllipseCenter()
        set => this.put_EllipseCenter(value)
    }

    /**
     * @type {Vector2} 
     */
    EllipseRadius {
        get => this.get_EllipseRadius()
        set => this.put_EllipseRadius(value)
    }

    /**
     * @type {Vector2} 
     */
    GradientOriginOffset {
        get => this.get_GradientOriginOffset()
        set => this.put_GradientOriginOffset(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_EllipseCenter() {
        value := Vector2()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_EllipseCenter(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_EllipseRadius() {
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
    put_EllipseRadius(value) {
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
    get_GradientOriginOffset() {
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
    put_GradientOriginOffset(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
