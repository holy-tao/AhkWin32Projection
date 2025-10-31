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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Translate", "Rotate", "Reflect", "Shear", "ScaleTransform", "GetTransform", "SetTransform", "get_eM11", "put_eM11", "get_eM12", "put_eM12", "get_eM21", "put_eM21", "get_eM22", "put_eM22", "get_eDx", "put_eDx", "get_eDy", "put_eDy", "get_Data", "put_Data"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalComponent 
     * @param {Float} VerticalComponent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-translate
     */
    Translate(HorizontalComponent, VerticalComponent) {
        result := ComCall(8, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Degrees 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-rotate
     */
    Rotate(Degrees, x, y) {
        result := ComCall(9, this, "float", Degrees, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Horizontally 
     * @param {VARIANT_BOOL} Vertically 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-reflect
     */
    Reflect(Horizontally, Vertically) {
        result := ComCall(10, this, "short", Horizontally, "short", Vertically, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalComponent 
     * @param {Float} VerticalComponent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-shear
     */
    Shear(HorizontalComponent, VerticalComponent) {
        result := ComCall(11, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-scaletransform
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(12, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} eM11 
     * @param {Pointer<Float>} eM12 
     * @param {Pointer<Float>} eM21 
     * @param {Pointer<Float>} eM22 
     * @param {Pointer<Float>} eDx 
     * @param {Pointer<Float>} eDy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-gettransform
     */
    GetTransform(eM11, eM12, eM21, eM22, eDx, eDy) {
        result := ComCall(13, this, "float*", eM11, "float*", eM12, "float*", eM21, "float*", eM22, "float*", eDx, "float*", eDy, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-settransform
     */
    SetTransform(eM11, eM12, eM21, eM22, eDx, eDy) {
        result := ComCall(14, this, "float", eM11, "float", eM12, "float", eM21, "float", eM22, "float", eDx, "float", eDy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-get_em11
     */
    get_eM11(Value) {
        result := ComCall(15, this, "float*", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-put_em11
     */
    put_eM11(Value) {
        result := ComCall(16, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-get_em12
     */
    get_eM12(Value) {
        result := ComCall(17, this, "float*", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-put_em12
     */
    put_eM12(Value) {
        result := ComCall(18, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-get_em21
     */
    get_eM21(Value) {
        result := ComCall(19, this, "float*", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-put_em21
     */
    put_eM21(Value) {
        result := ComCall(20, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-get_em22
     */
    get_eM22(Value) {
        result := ComCall(21, this, "float*", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-put_em22
     */
    put_eM22(Value) {
        result := ComCall(22, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-get_edx
     */
    get_eDx(Value) {
        result := ComCall(23, this, "float*", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-put_edx
     */
    put_eDx(Value) {
        result := ComCall(24, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-get_edy
     */
    get_eDy(Value) {
        result := ComCall(25, this, "float*", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-put_edy
     */
    put_eDy(Value) {
        result := ComCall(26, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XFORM>} XForm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-get_data
     */
    get_Data(XForm) {
        result := ComCall(27, this, "ptr", XForm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {XFORM} XForm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktransform-put_data
     */
    put_Data(XForm) {
        result := ComCall(28, this, "ptr", XForm, "HRESULT")
        return result
    }
}
