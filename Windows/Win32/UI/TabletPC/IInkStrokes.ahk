#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IInkDisp.ahk
#Include .\IInkRecognitionResult.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkStrokeDisp.ahk
#Include .\IInkRectangle.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkstrokes
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkStrokes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokes
     * @type {Guid}
     */
    static IID => Guid("{f1f4c9d8-590a-4963-b3ae-1935671bb6f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Ink", "get_RecognitionResult", "ToString", "Item", "Add", "AddStrokes", "Remove", "RemoveStrokes", "ModifyDrawingAttributes", "GetBoundingBox", "Transform", "ScaleToRectangle", "Move", "Rotate", "Shear", "ScaleTransform", "Clip", "RemoveRecognitionResult"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {IInkDisp} 
     */
    Ink {
        get => this.get_Ink()
    }

    /**
     * @type {IInkRecognitionResult} 
     */
    RecognitionResult {
        get => this.get_RecognitionResult()
    }

    /**
     * Gets the number of objects or collections contained in a collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &_NewEnum := 0, "HRESULT")
        return IUnknown(_NewEnum)
    }

    /**
     * Gets the InkDisp object that contains a collection of strokes.
     * @returns {IInkDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-get_ink
     */
    get_Ink() {
        result := ComCall(9, this, "ptr*", &Ink := 0, "HRESULT")
        return IInkDisp(Ink)
    }

    /**
     * Gets the IInkRecognitionResult object of the InkStrokes collection.
     * @remarks
     * 
     * The value of this property is <b>NULL</b> if recognition has not been done or if the results were not persisted.
     * 
     * 
     * @returns {IInkRecognitionResult} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-get_recognitionresult
     */
    get_RecognitionResult() {
        result := ComCall(10, this, "ptr*", &RecognitionResult := 0, "HRESULT")
        return IInkRecognitionResult(RecognitionResult)
    }

    /**
     * ToString is no longer available for use as of Windows Vista.
     * @returns {BSTR} The top string of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionresult-get_topalternate">TopAlternate</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">IInkRecognitionResult</a> object, after the default recognizer performs recognition on the collection of strokes.
     * 
     * For more information about the <b>BSTR</b> data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-tostring
     */
    ToString() {
        ToString := BSTR()
        result := ComCall(11, this, "ptr", ToString, "HRESULT")
        return ToString
    }

    /**
     * Retrieves the IInkStrokeDisp object at the specified index within the InkStrokes collection.
     * @param {Integer} Index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object to get.
     * @returns {IInkStrokeDisp} When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object at the specified index within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-item
     */
    Item(Index) {
        result := ComCall(12, this, "int", Index, "ptr*", &Stroke := 0, "HRESULT")
        return IInkStrokeDisp(Stroke)
    }

    /**
     * Adds an IInkStrokeDisp object or InkStrokes collection to an existing InkStrokes collection.
     * @param {IInkStrokeDisp} InkStroke The stroke to add to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot allocate <a href="/windows/desktop/tablet/inkcollector-stroke">Stroke</a> handler helper object.
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
     * <dt><b>E_INK_INCOMPATIBLE_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IInkStrokeDisp* does not point to a compatible <a href="/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_MISMATCHED_INK_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object of the <a href="/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> being added does not match the <b>InkDisp</b> object of the <a href="/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-add
     */
    Add(InkStroke) {
        result := ComCall(13, this, "ptr", InkStroke, "HRESULT")
        return result
    }

    /**
     * Adds a Strokes collection to an existing Strokes collection.
     * @param {IInkStrokes} InkStrokes The collection of strokes to add to the collection of strokes.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot allocate <a href="/windows/desktop/tablet/inkcollector-stroke">Stroke</a> handler helper object.
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
     * <dt><b>E_INK_INCOMPATIBLE_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IInkStrokes* does not point to a compatible <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_MISMATCHED_INK_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object of the <a href="/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection that is being added must match the <b>InkDisp</b> object of the InkStrokes collection to which it is being added.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-addstrokes
     */
    AddStrokes(InkStrokes) {
        result := ComCall(14, this, "ptr", InkStrokes, "HRESULT")
        return result
    }

    /**
     * Removes an IInkStrokeDisp object from a InkStrokes collection.
     * @param {IInkStrokeDisp} InkStroke The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> to remove.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot allocate <a href="/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> handler helper object.
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
     * <dt><b>E_INK_INCOMPATIBLE_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IInkStroke* does not point to a valid <a href="/windows/desktop/tablet/inkdisp-class">InkDisp Class</a> object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_MISMATCHED_INK_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object of the <a href="/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection and this <a href="/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object do not match.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-remove
     */
    Remove(InkStroke) {
        result := ComCall(15, this, "ptr", InkStroke, "HRESULT")
        return result
    }

    /**
     * Removes strokes from the collection.
     * @param {IInkStrokes} InkStrokes The strokes to remove from the collection.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot allocate Stroke handler helper object.
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
     * <dt><b>E_INK_INCOMPATIBLE_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IInkStrokes* does not point to a valid <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_MISMATCHED_INK_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object of the <a href="/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection and the specified InkStrokes don't match.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-removestrokes
     */
    RemoveStrokes(InkStrokes) {
        result := ComCall(16, this, "ptr", InkStrokes, "HRESULT")
        return result
    }

    /**
     * Sets the drawing attributes of all of the strokes in an InkStrokes collection.
     * @param {IInkDrawingAttributes} DrawAttrs The new drawing attributes for all of the strokes in the collection.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected parameter or property type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-modifydrawingattributes
     */
    ModifyDrawingAttributes(DrawAttrs) {
        result := ComCall(17, this, "ptr", DrawAttrs, "HRESULT")
        return result
    }

    /**
     * Gets the bounding box in ink space coordinates for either all of the strokes in an InkDisp object, an individual stroke, or an InkStrokes collection.
     * @param {Integer} BoundingBoxMode Optional. Specifies the stroke characteristics to use to calculate the bounding box. For more details about the use of stroke characteristics to calculate a bounding box, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkboundingboxmode">BoundingBoxMode</a> enumeration type.
     * 
     * The <i>BoundingBoxMode</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-getboundingbox">GetBoundingBox</a> method has a default value of -1, which means that all characteristics of a stroke are used to specify the bounding box.
     * @returns {IInkRectangle} When this method returns, contains a pointer to the rectangle that defines the bounding box of an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object, an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, or an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * 
     * <div class="alert"><b>Note</b>  For an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, the returned bounding box is a copy of the strokes bounding box, so altering the returned bounding box does not affect the strokes location.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-getboundingbox
     */
    GetBoundingBox(BoundingBoxMode) {
        result := ComCall(18, this, "int", BoundingBoxMode, "ptr*", &BoundingBox := 0, "HRESULT")
        return IInkRectangle(BoundingBox)
    }

    /**
     * Applies a linear transformation to an IInkStrokeDisp object or an InkStrokes collection, which can represent scaling, rotation, translation, and combinations of transformations.
     * @param {IInkTransform} Transform The transform to use on the stroke or strokes. (This is an <a href="https://docs.microsoft.com/windows/desktop/tablet/inktransform-class">InkTransform</a> object, which correlates to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-xform">XFORM</a> structure). The transformation applies to both the points and pen width (if <i>ApplyOnPenWidth</i> is <b>VARIANT_TRUE</b>).
     * @param {VARIANT_BOOL} ApplyOnPenWidth Optional. <b>VARIANT_TRUE</b> to apply the transform to the width of the ink in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdrawingattributes-class">InkDrawingAttributes</a> of the strokes; otherwise, <b>VARIANT_FALSE</b>. The default is <b>VARIANT_FALSE</b>.
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
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-transform
     */
    Transform(Transform, ApplyOnPenWidth) {
        result := ComCall(19, this, "ptr", Transform, "short", ApplyOnPenWidth, "HRESULT")
        return result
    }

    /**
     * Scales the IInkStrokeDisp object or InkStrokes collection to fit in the specified InkRectangle object.
     * @param {IInkRectangle} Rectangle The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a> in ink space to which the stroke or collection of strokes is scaled. The strokes are scaled and translated to match the strokes' bounding box to the rectangle.
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
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-scaletorectangle
     */
    ScaleToRectangle(Rectangle) {
        result := ComCall(20, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * Applies a translation to the ink of an IInkStrokeDisp object or InkStrokes collection.
     * @param {Float} HorizontalComponent The distance in ink space coordinates to translate the view transform in the X dimension.
     * @param {Float} VerticalComponent The distance in ink space coordinates to translate the view transform in the Y dimension.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-move
     */
    Move(HorizontalComponent, VerticalComponent) {
        result := ComCall(21, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * Rotates the ink using an angle in degrees around a center point of the rotation.
     * @param {Float} Degrees The degrees by which to rotate clockwise.
     * @param {Float} x Optional. The x-coordinate of the point in ink space coordinates around which to rotate. Default is the origin.
     * @param {Float} y Optional. The y-coordinate of the point in ink space coordinates around which to rotate. Default is the origin.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-rotate
     */
    Rotate(Degrees, x, y) {
        result := ComCall(22, this, "float", Degrees, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * Shears the ink in the stroke or strokes by the specified horizontal and vertical factors.
     * @param {Float} HorizontalMultiplier The horizontal factor of the shear.
     * @param {Float} VerticalMultiplier The vertical factor of the shear.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-shear
     */
    Shear(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(23, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-scaletransform
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(24, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
        return result
    }

    /**
     * Removes portions of an IInkStrokeDisp object or InkStrokes collection that are outside a rectangle.
     * @param {IInkRectangle} Rectangle Specifies the rectangle outside of which the stroke or strokes are clipped. The rectangle is specified in ink space coordinates.
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
     * <dt><b>REGDB_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object is not registered.
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
     * Invalid clip rectangle.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-clip
     */
    Clip(Rectangle) {
        result := ComCall(25, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * Removes the RecognitionResult that is associated with the InkStrokes collection.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokes-removerecognitionresult
     */
    RemoveRecognitionResult() {
        result := ComCall(26, this, "HRESULT")
        return result
    }
}
