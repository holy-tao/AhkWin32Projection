#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionBrush.ahk
#Include .\CompositionGeometry.ahk
#Include .\CompositionStrokeDashArray.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionSpriteShape extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionSpriteShape
     * @type {Guid}
     */
    static IID => Guid("{401b61bb-0007-4363-b1f3-6bcc003fb83e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FillBrush", "put_FillBrush", "get_Geometry", "put_Geometry", "get_IsStrokeNonScaling", "put_IsStrokeNonScaling", "get_StrokeBrush", "put_StrokeBrush", "get_StrokeDashArray", "get_StrokeDashCap", "put_StrokeDashCap", "get_StrokeDashOffset", "put_StrokeDashOffset", "get_StrokeEndCap", "put_StrokeEndCap", "get_StrokeLineJoin", "put_StrokeLineJoin", "get_StrokeMiterLimit", "put_StrokeMiterLimit", "get_StrokeStartCap", "put_StrokeStartCap", "get_StrokeThickness", "put_StrokeThickness"]

    /**
     * @type {CompositionBrush} 
     */
    FillBrush {
        get => this.get_FillBrush()
        set => this.put_FillBrush(value)
    }

    /**
     * @type {CompositionGeometry} 
     */
    Geometry {
        get => this.get_Geometry()
        set => this.put_Geometry(value)
    }

    /**
     * @type {Boolean} 
     */
    IsStrokeNonScaling {
        get => this.get_IsStrokeNonScaling()
        set => this.put_IsStrokeNonScaling(value)
    }

    /**
     * @type {CompositionBrush} 
     */
    StrokeBrush {
        get => this.get_StrokeBrush()
        set => this.put_StrokeBrush(value)
    }

    /**
     * @type {CompositionStrokeDashArray} 
     */
    StrokeDashArray {
        get => this.get_StrokeDashArray()
    }

    /**
     * @type {Integer} 
     */
    StrokeDashCap {
        get => this.get_StrokeDashCap()
        set => this.put_StrokeDashCap(value)
    }

    /**
     * @type {Float} 
     */
    StrokeDashOffset {
        get => this.get_StrokeDashOffset()
        set => this.put_StrokeDashOffset(value)
    }

    /**
     * @type {Integer} 
     */
    StrokeEndCap {
        get => this.get_StrokeEndCap()
        set => this.put_StrokeEndCap(value)
    }

    /**
     * @type {Integer} 
     */
    StrokeLineJoin {
        get => this.get_StrokeLineJoin()
        set => this.put_StrokeLineJoin(value)
    }

    /**
     * @type {Float} 
     */
    StrokeMiterLimit {
        get => this.get_StrokeMiterLimit()
        set => this.put_StrokeMiterLimit(value)
    }

    /**
     * @type {Integer} 
     */
    StrokeStartCap {
        get => this.get_StrokeStartCap()
        set => this.put_StrokeStartCap(value)
    }

    /**
     * @type {Float} 
     */
    StrokeThickness {
        get => this.get_StrokeThickness()
        set => this.put_StrokeThickness(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_FillBrush() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
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
    put_FillBrush(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionGeometry} 
     */
    get_Geometry() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionGeometry(value)
    }

    /**
     * 
     * @param {CompositionGeometry} value 
     * @returns {HRESULT} 
     */
    put_Geometry(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStrokeNonScaling() {
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
    put_IsStrokeNonScaling(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_StrokeBrush() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
    put_StrokeBrush(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionStrokeDashArray} 
     */
    get_StrokeDashArray() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionStrokeDashArray(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeDashCap() {
        result := ComCall(15, this, "int*", &value := 0, "int")
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
    put_StrokeDashCap(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeDashOffset() {
        result := ComCall(17, this, "float*", &value := 0, "int")
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
    put_StrokeDashOffset(value) {
        result := ComCall(18, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeEndCap() {
        result := ComCall(19, this, "int*", &value := 0, "int")
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
    put_StrokeEndCap(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeLineJoin() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_StrokeLineJoin(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeMiterLimit() {
        result := ComCall(23, this, "float*", &value := 0, "int")
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
    put_StrokeMiterLimit(value) {
        result := ComCall(24, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeStartCap() {
        result := ComCall(25, this, "int*", &value := 0, "int")
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
    put_StrokeStartCap(value) {
        result := ComCall(26, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeThickness() {
        result := ComCall(27, this, "float*", &value := 0, "int")
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
    put_StrokeThickness(value) {
        result := ComCall(28, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
