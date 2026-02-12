#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\Brush.ahk
#Include ..\Media\DoubleCollection.ahk
#Include ..\Media\Transform.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class IShape extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShape
     * @type {Guid}
     */
    static IID => Guid("{786f2b75-9aa0-454d-ae06-a2466e37c832}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Fill", "put_Fill", "get_Stroke", "put_Stroke", "get_StrokeMiterLimit", "put_StrokeMiterLimit", "get_StrokeThickness", "put_StrokeThickness", "get_StrokeStartLineCap", "put_StrokeStartLineCap", "get_StrokeEndLineCap", "put_StrokeEndLineCap", "get_StrokeLineJoin", "put_StrokeLineJoin", "get_StrokeDashOffset", "put_StrokeDashOffset", "get_StrokeDashCap", "put_StrokeDashCap", "get_StrokeDashArray", "put_StrokeDashArray", "get_Stretch", "put_Stretch", "get_GeometryTransform"]

    /**
     * @type {Brush} 
     */
    Fill {
        get => this.get_Fill()
        set => this.put_Fill(value)
    }

    /**
     * @type {Brush} 
     */
    Stroke {
        get => this.get_Stroke()
        set => this.put_Stroke(value)
    }

    /**
     * @type {Float} 
     */
    StrokeMiterLimit {
        get => this.get_StrokeMiterLimit()
        set => this.put_StrokeMiterLimit(value)
    }

    /**
     * @type {Float} 
     */
    StrokeThickness {
        get => this.get_StrokeThickness()
        set => this.put_StrokeThickness(value)
    }

    /**
     * @type {Integer} 
     */
    StrokeStartLineCap {
        get => this.get_StrokeStartLineCap()
        set => this.put_StrokeStartLineCap(value)
    }

    /**
     * @type {Integer} 
     */
    StrokeEndLineCap {
        get => this.get_StrokeEndLineCap()
        set => this.put_StrokeEndLineCap(value)
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
    StrokeDashOffset {
        get => this.get_StrokeDashOffset()
        set => this.put_StrokeDashOffset(value)
    }

    /**
     * @type {Integer} 
     */
    StrokeDashCap {
        get => this.get_StrokeDashCap()
        set => this.put_StrokeDashCap(value)
    }

    /**
     * @type {DoubleCollection} 
     */
    StrokeDashArray {
        get => this.get_StrokeDashArray()
        set => this.put_StrokeDashArray(value)
    }

    /**
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * @type {Transform} 
     */
    GeometryTransform {
        get => this.get_GeometryTransform()
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Fill() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Fill(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Stroke() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Stroke(value) {
        result := ComCall(9, this, "ptr", value, "int")
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
    put_StrokeMiterLimit(value) {
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
    get_StrokeThickness() {
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
    put_StrokeThickness(value) {
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
    get_StrokeStartLineCap() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_StrokeStartLineCap(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeEndLineCap() {
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
    put_StrokeEndLineCap(value) {
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
    get_StrokeLineJoin() {
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
    put_StrokeLineJoin(value) {
        result := ComCall(19, this, "int", value, "int")
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
        result := ComCall(20, this, "double*", &value := 0, "int")
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
        result := ComCall(21, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeDashCap() {
        result := ComCall(22, this, "int*", &value := 0, "int")
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
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DoubleCollection} 
     */
    get_StrokeDashArray() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DoubleCollection(value)
    }

    /**
     * 
     * @param {DoubleCollection} value 
     * @returns {HRESULT} 
     */
    put_StrokeDashArray(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        result := ComCall(26, this, "int*", &value := 0, "int")
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
    put_Stretch(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Transform} 
     */
    get_GeometryTransform() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Transform(value)
    }
}
