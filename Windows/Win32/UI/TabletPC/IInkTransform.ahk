#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\XFORM.ahk
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
     * @type {Float} 
     */
    eM11 {
        get => this.get_eM11()
        set => this.put_eM11(value)
    }

    /**
     * @type {Float} 
     */
    eM12 {
        get => this.get_eM12()
        set => this.put_eM12(value)
    }

    /**
     * @type {Float} 
     */
    eM21 {
        get => this.get_eM21()
        set => this.put_eM21(value)
    }

    /**
     * @type {Float} 
     */
    eM22 {
        get => this.get_eM22()
        set => this.put_eM22(value)
    }

    /**
     * @type {Float} 
     */
    eDx {
        get => this.get_eDx()
        set => this.put_eDx(value)
    }

    /**
     * @type {Float} 
     */
    eDy {
        get => this.get_eDy()
        set => this.put_eDy(value)
    }

    /**
     * @type {XFORM} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Resets the transform to its default state, the identity transform.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Applies a translation to a transform.
     * @param {Float} HorizontalComponent The horizontal component of the translation.
     * @param {Float} VerticalComponent The vertical component of the translation.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected parameter or property type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-translate
     */
    Translate(HorizontalComponent, VerticalComponent) {
        result := ComCall(8, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * Changes the amount, measured in degrees, to change the rotation factor of the InkTransform object and optionally the center point of the rotation.
     * @param {Float} Degrees The degrees by which to rotate clockwise. Without the optional x and y arguments, rotation takes place around the origin point, which by default is the upper left corner of the ink collection area to which the transform is applied.
     * @param {Float} x Optional. The x-coordinate of the point in ink space coordinates around which rotation occurs. The default value is 0.
     * @param {Float} y Optional. The y-coordinate of the point in ink space coordinates around which rotation occurs. The default value is 0.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-rotate
     */
    Rotate(Degrees, x, y) {
        result := ComCall(9, this, "float", Degrees, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * Performs reflection on a transform in either horizontal or vertical directions.
     * @param {VARIANT_BOOL} Horizontally <b>VARIANT_TRUE</b> to reflect in the horizontal direction; otherwise, <b>VARIANT_FALSE</b>.
     * @param {VARIANT_BOOL} Vertically <b>VARIANT_TRUE</b> to reflect in the vertical direction; otherwise, <b>VARIANT_FALSE</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid VARIANT_BOOL variants.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-reflect
     */
    Reflect(Horizontally, Vertically) {
        result := ComCall(10, this, "short", Horizontally, "short", Vertically, "HRESULT")
        return result
    }

    /**
     * Adjusts the shear of the InkTransform by the specified horizontal and vertical factors.
     * @param {Float} HorizontalComponent The horizontal factor of the shear.
     * @param {Float} VerticalComponent The vertical factor of the shear.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-shear
     */
    Shear(HorizontalComponent, VerticalComponent) {
        result := ComCall(11, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * Applies the specified horizontal and vertical factors to the transform or ink.
     * @param {Float} HorizontalMultiplier The factor to scale the horizontal dimension in the transform.
     * @param {Float} VerticalMultiplier The factor to scale the vertical dimension in the transform.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-scaletransform
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(12, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
        return result
    }

    /**
     * Gets the InkTransform member data.
     * @param {Pointer<Float>} eM11 The real number that specifies the element in the first row, first column.
     * @param {Pointer<Float>} eM12 The real number that specifies the element in the first row, second column.
     * @param {Pointer<Float>} eM21 The real number that specifies the element in the second row, first column.
     * @param {Pointer<Float>} eM22 The real number that specifies the element in the second row, second column.
     * @param {Pointer<Float>} eDx The real number that specifies the element in the third row, first column.
     * @param {Pointer<Float>} eDy The real number that specifies the element in the third row, second column.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-gettransform
     */
    GetTransform(eM11, eM12, eM21, eM22, eDx, eDy) {
        eM11Marshal := eM11 is VarRef ? "float*" : "ptr"
        eM12Marshal := eM12 is VarRef ? "float*" : "ptr"
        eM21Marshal := eM21 is VarRef ? "float*" : "ptr"
        eM22Marshal := eM22 is VarRef ? "float*" : "ptr"
        eDxMarshal := eDx is VarRef ? "float*" : "ptr"
        eDyMarshal := eDy is VarRef ? "float*" : "ptr"

        result := ComCall(13, this, eM11Marshal, eM11, eM12Marshal, eM12, eM21Marshal, eM21, eM22Marshal, eM22, eDxMarshal, eDx, eDyMarshal, eDy, "HRESULT")
        return result
    }

    /**
     * Modifies the InkTransform member data.
     * @param {Float} eM11 The element in the first row, first column.
     * @param {Float} eM12 The element in the first row, second column.
     * @param {Float} eM21 The element in the second row, first column.
     * @param {Float} eM22 The element in the second row, second column.
     * @param {Float} eDx The element in the third row, first column.
     * @param {Float} eDy The element in the third row, second column.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-settransform
     */
    SetTransform(eM11, eM12, eM21, eM22, eDx, eDy) {
        result := ComCall(14, this, "float", eM11, "float", eM12, "float", eM21, "float", eM22, "float", eDx, "float", eDy, "HRESULT")
        return result
    }

    /**
     * Gets or sets the element in the first row, first column of the affine transform matrix that is represented by an InkTransform object.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-get_em11
     */
    get_eM11() {
        result := ComCall(15, this, "float*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * Gets or sets the element in the first row, first column of the affine transform matrix that is represented by an InkTransform object.
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-put_em11
     */
    put_eM11(Value) {
        result := ComCall(16, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets or sets the element in the first row, second column of the affine transform matrix that is represented by an InkTransform object.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-get_em12
     */
    get_eM12() {
        result := ComCall(17, this, "float*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * Gets or sets the element in the first row, second column of the affine transform matrix that is represented by an InkTransform object.
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-put_em12
     */
    put_eM12(Value) {
        result := ComCall(18, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets or sets the element in the second row, first column of the affine transform matrix that is represented by an InkTransform object.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-get_em21
     */
    get_eM21() {
        result := ComCall(19, this, "float*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * Gets or sets the element in the second row, first column of the affine transform matrix that is represented by an InkTransform object.
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-put_em21
     */
    put_eM21(Value) {
        result := ComCall(20, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets or sets the element in the second row, second column of the affine transform matrix that is represented by an InkTransform object.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-get_em22
     */
    get_eM22() {
        result := ComCall(21, this, "float*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * Gets or sets the element in the second row, second column of the affine transform matrix that is represented by an InkTransform object.
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-put_em22
     */
    put_eM22(Value) {
        result := ComCall(22, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets or sets the element in the third row, first column of the affine transform matrix that is represented by an InkTransform object.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-get_edx
     */
    get_eDx() {
        result := ComCall(23, this, "float*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * Gets or sets the element in the third row, first column of the affine transform matrix that is represented by an InkTransform object.
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-put_edx
     */
    put_eDx(Value) {
        result := ComCall(24, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets or sets the element in the third row, second column of the affine transform matrix that is represented by an InkTransform object.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-get_edy
     */
    get_eDy() {
        result := ComCall(25, this, "float*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * Gets or sets the element in the third row, second column of the affine transform matrix that is represented by an InkTransform object.
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-put_edy
     */
    put_eDy(Value) {
        result := ComCall(26, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Gets or sets access to the XFORM structure.
     * @returns {XFORM} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-get_data
     */
    get_Data() {
        XForm := XFORM()
        result := ComCall(27, this, "ptr", XForm, "HRESULT")
        return XForm
    }

    /**
     * Gets or sets access to the XFORM structure.
     * @param {XFORM} XForm 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinktransform-put_data
     */
    put_Data(XForm) {
        result := ComCall(28, this, "ptr", XForm, "HRESULT")
        return result
    }
}
