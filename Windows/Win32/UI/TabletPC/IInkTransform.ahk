#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinktransform
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkTransform extends IDispatch{
    /**
     * The interface identifier for IInkTransform
     * @type {Guid}
     */
    static IID => Guid("{615f1d43-8703-4565-88e2-8201d2ecd7b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} HorizontalComponent 
     * @param {Float} VerticalComponent 
     * @returns {HRESULT} 
     */
    Translate(HorizontalComponent, VerticalComponent) {
        result := ComCall(8, this, "float", HorizontalComponent, "float", VerticalComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Degrees 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    Rotate(Degrees, x, y) {
        result := ComCall(9, this, "float", Degrees, "float", x, "float", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Horizontally 
     * @param {VARIANT_BOOL} Vertically 
     * @returns {HRESULT} 
     */
    Reflect(Horizontally, Vertically) {
        result := ComCall(10, this, "short", Horizontally, "short", Vertically, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} HorizontalComponent 
     * @param {Float} VerticalComponent 
     * @returns {HRESULT} 
     */
    Shear(HorizontalComponent, VerticalComponent) {
        result := ComCall(11, this, "float", HorizontalComponent, "float", VerticalComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @returns {HRESULT} 
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(12, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} eM11 
     * @param {Pointer<Single>} eM12 
     * @param {Pointer<Single>} eM21 
     * @param {Pointer<Single>} eM22 
     * @param {Pointer<Single>} eDx 
     * @param {Pointer<Single>} eDy 
     * @returns {HRESULT} 
     */
    GetTransform(eM11, eM12, eM21, eM22, eDx, eDy) {
        result := ComCall(13, this, "float*", eM11, "float*", eM12, "float*", eM21, "float*", eM22, "float*", eDx, "float*", eDy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} eM11 
     * @param {Float} eM12 
     * @param {Float} eM21 
     * @param {Float} eM22 
     * @param {Float} eDx 
     * @param {Float} eDy 
     * @returns {HRESULT} 
     */
    SetTransform(eM11, eM12, eM21, eM22, eDx, eDy) {
        result := ComCall(14, this, "float", eM11, "float", eM12, "float", eM21, "float", eM22, "float", eDx, "float", eDy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} Value 
     * @returns {HRESULT} 
     */
    get_eM11(Value) {
        result := ComCall(15, this, "float*", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_eM11(Value) {
        result := ComCall(16, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} Value 
     * @returns {HRESULT} 
     */
    get_eM12(Value) {
        result := ComCall(17, this, "float*", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_eM12(Value) {
        result := ComCall(18, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} Value 
     * @returns {HRESULT} 
     */
    get_eM21(Value) {
        result := ComCall(19, this, "float*", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_eM21(Value) {
        result := ComCall(20, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} Value 
     * @returns {HRESULT} 
     */
    get_eM22(Value) {
        result := ComCall(21, this, "float*", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_eM22(Value) {
        result := ComCall(22, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} Value 
     * @returns {HRESULT} 
     */
    get_eDx(Value) {
        result := ComCall(23, this, "float*", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_eDx(Value) {
        result := ComCall(24, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} Value 
     * @returns {HRESULT} 
     */
    get_eDy(Value) {
        result := ComCall(25, this, "float*", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_eDy(Value) {
        result := ComCall(26, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XFORM>} XForm 
     * @returns {HRESULT} 
     */
    get_Data(XForm) {
        result := ComCall(27, this, "ptr", XForm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {XFORM} XForm 
     * @returns {HRESULT} 
     */
    put_Data(XForm) {
        result := ComCall(28, this, "ptr", XForm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
