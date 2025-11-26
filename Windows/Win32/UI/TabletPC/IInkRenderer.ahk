#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkRectangle.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @remarks
 * 
 * Printing is also done through the InkRenderer object.
 * 
 * This object can be instantiated by calling the [CoCreateInstance](../combaseapi/nf-combaseapi-cocreateinstance.md) method in C++.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrenderer
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRenderer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRenderer
     * @type {Guid}
     */
    static IID => Guid("{e6257a9c-b511-4f4c-a8b0-a7dbc9506b83}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetViewTransform", "SetViewTransform", "GetObjectTransform", "SetObjectTransform", "Draw", "DrawStroke", "PixelToInkSpace", "InkSpaceToPixel", "PixelToInkSpaceFromPoints", "InkSpaceToPixelFromPoints", "Measure", "MeasureStroke", "Move", "Rotate", "ScaleTransform"]

    /**
     * Gets the InkTransform object that represents the view transform that is used to render ink.
     * @param {IInkTransform} ViewTransform The matrix that represents the geometric transformation - rotation, scaling, shear, and reflection - values to use to transform the stroke coordinates within the ink space. The transformation applies to both the points and pen width. View transformation occurs after object transformation.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-getviewtransform
     */
    GetViewTransform(ViewTransform) {
        result := ComCall(7, this, "ptr", ViewTransform, "HRESULT")
        return result
    }

    /**
     * Sets the InkTransform object that represents the view transform that is used to render ink.
     * @param {IInkTransform} ViewTransform The <a href="https://docs.microsoft.com/windows/desktop/tablet/inktransform-class">InkTransform</a> object that represents the geometric transformation - rotation, scaling, shear, and reflection - values to use to transform the stroke coordinates within the ink space.
     * 
     * A <b>NULL</b> value for the <i>viewTransform</i> parameter correlates to the identity transform.
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
     * <i>viewTransform</i> does not point to a compatible <a href="/windows/desktop/tablet/inktransform-class">InkTransform</a> object.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-setviewtransform
     */
    SetViewTransform(ViewTransform) {
        result := ComCall(8, this, "ptr", ViewTransform, "HRESULT")
        return result
    }

    /**
     * Gets the InkTransform object that represents the object transform that was used to render ink.
     * @param {IInkTransform} ObjectTransform The <a href="https://docs.microsoft.com/windows/desktop/tablet/inktransform-class">InkTransform</a> object that represents the geometric transformation - rotation, scaling, shear, and reflection - values to use to transform the stroke coordinates within the ink space.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-getobjecttransform
     */
    GetObjectTransform(ObjectTransform) {
        result := ComCall(9, this, "ptr", ObjectTransform, "HRESULT")
        return result
    }

    /**
     * Sets the InkTransform object that represents the object transform that is used to render ink.
     * @param {IInkTransform} ObjectTransform The <a href="https://docs.microsoft.com/windows/desktop/tablet/inktransform-class">InkTransform</a> object that represents the geometric transformation - rotation, scaling, shear, and reflection - values to use to transform the stroke coordinates within the ink space.
     * 
     * A <b>NULL</b> value for the <i>objectTransform</i> parameter correlates to the identity transform.
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
     * <i>objectTransform</i> does not point to a compatible <a href="/windows/desktop/tablet/inktransform-class">InkTransform</a> object.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-setobjecttransform
     */
    SetObjectTransform(ObjectTransform) {
        result := ComCall(10, this, "ptr", ObjectTransform, "HRESULT")
        return result
    }

    /**
     * Draws ink strokes using the known device context.
     * @param {Pointer} hDC Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd">hWnd</a> of the device context on which to draw.
     * @param {IInkStrokes} Strokes Specifies the strokes to draw.
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
     * <dt><b>E_INK_MISMATCHED_INK_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The strokes parameter is associated with a different <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
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
     * An argument is invalid.
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
     * The <i>hdc</i> or the <i>strokes</i> parameter does not point to a valid object.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-draw
     */
    Draw(hDC, Strokes) {
        result := ComCall(11, this, "ptr", hDC, "ptr", Strokes, "HRESULT")
        return result
    }

    /**
     * Draws the IInkStrokeDisp object using the known device context, and optionally draws the IInkStrokeDisp object with the known InkDrawingAttributes object.
     * @param {Pointer} hDC The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd">hWnd</a> of the device context on which to draw.
     * @param {IInkStrokeDisp} Stroke The stroke to draw.
     * @param {IInkDrawingAttributes} DrawingAttributes Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdrawingattributes-class">InkDrawingAttributes</a> to use on the drawing. The default value is <b>NULL</b>. If <b>InkDrawingAttributes</b> is specified, they override the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a>.
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
     * <dt><b>E_INK_MISMATCHED_INK_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The strokes parameter is associated with a different <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
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
     * Invalid display handle.
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
     * The <i>stroke</i> or the <i>drawingAttributes</i> parameter does not point to a valid object.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-drawstroke
     */
    DrawStroke(hDC, Stroke, DrawingAttributes) {
        result := ComCall(12, this, "ptr", hDC, "ptr", Stroke, "ptr", DrawingAttributes, "HRESULT")
        return result
    }

    /**
     * Converts a location in pixel space coordinates to be a location in ink space coordinates.
     * @param {Pointer} hDC The handle of the device context for the containing control or form.
     * @param {Pointer<Integer>} x The x coordinate of the point to convert into an ink location.
     * @param {Pointer<Integer>} y The y coordinate of the point to convert into an ink location.
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
     * Invalid display handle.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-pixeltoinkspace
     */
    PixelToInkSpace(hDC, x, y) {
        xMarshal := x is VarRef ? "int*" : "ptr"
        yMarshal := y is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "ptr", hDC, xMarshal, x, yMarshal, y, "HRESULT")
        return result
    }

    /**
     * Converts a location in ink space coordinates to a location in pixel space using a handle for the conversion.
     * @param {Pointer} hdcDisplay The handle of the device context.
     * @param {Pointer<Integer>} x The X-coordinate of the point to convert into a pixel location.
     * @param {Pointer<Integer>} y The Y-coordinate of the point to convert into a pixel location.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid display handle.
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
     * Coordinates overflowed during operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-inkspacetopixel
     */
    InkSpaceToPixel(hdcDisplay, x, y) {
        xMarshal := x is VarRef ? "int*" : "ptr"
        yMarshal := y is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "ptr", hdcDisplay, xMarshal, x, yMarshal, y, "HRESULT")
        return result
    }

    /**
     * Converts an array of locations in pixel space coordinates to an array of locations in ink space coordinates.
     * @param {Pointer} hDC The handle of the device context for the containing control or form.
     * @param {Pointer<VARIANT>} Points The Variant array of points, as alternating Long x and y values of the form x0, y0, x1, y1, x2, y2, and so on, to convert from a pixel location to ink space coordinates.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
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
     * Invalid display handle.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-pixeltoinkspacefrompoints
     */
    PixelToInkSpaceFromPoints(hDC, Points) {
        result := ComCall(15, this, "ptr", hDC, "ptr", Points, "HRESULT")
        return result
    }

    /**
     * Converts an array of points in ink space coordinates to an array of points in pixel space.
     * @param {Pointer} hDC The handle of the device context on which to draw.
     * @param {Pointer<VARIANT>} Points The array of points in ink space coordinates to convert into pixel locations. This should be an array of 32-bit integer values, passed within a VARIANT.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {HRESULT} <table>
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
     * Invalid display handle.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-inkspacetopixelfrompoints
     */
    InkSpaceToPixelFromPoints(hDC, Points) {
        result := ComCall(16, this, "ptr", hDC, "ptr", Points, "HRESULT")
        return result
    }

    /**
     * Calculates the rectangle on the device context that would contain a collection of strokes if the strokes were drawn with the InkRenderer object using the DrawStroke method.
     * @param {IInkStrokes} Strokes The collection of strokes to measure.
     * @returns {IInkRectangle} When this method returns, contains a pointer to the rectangle on the device context that would contain the strokes if they were drawn with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrenderer-drawstroke">DrawStroke</a> method of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrenderer-class">InkRenderer</a> object. The strokes must contain x- and y-coordinates to calculate the rectangle. Otherwise, the method returns an empty rectangle.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-measure
     */
    Measure(Strokes) {
        result := ComCall(17, this, "ptr", Strokes, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * Calculates the rectangle on the device context that would contain a stroke if it were drawn with the InkRenderer object using the DrawStroke method.
     * @param {IInkStrokeDisp} Stroke The stroke to measure.
     * @param {IInkDrawingAttributes} DrawingAttributes Optional. The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdrawingattributes-class">InkDrawingAttributes</a> to use when calculating the rectangle, which override the drawing attributes on the stroke. The default value is <b>NULL</b>, which means the stroke is measured by using its own drawing attributes.
     * @returns {IInkRectangle} When this method returns, contains a pointer to the rectangle on the device context that would contain the stroke if the stroke were drawn with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrenderer-drawstroke">DrawStroke</a> method of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrenderer-class">InkRenderer</a> object. The stroke must contain x- and y-coordinates to calculate the rectangle. Otherwise, the method returns an empty rectangle.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-measurestroke
     */
    MeasureStroke(Stroke, DrawingAttributes) {
        result := ComCall(18, this, "ptr", Stroke, "ptr", DrawingAttributes, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * Applies a translation to the view transform in ink space coordinates.
     * @param {Float} HorizontalComponent The amount in ink space coordinates to translate the view transform in the X dimension.
     * @param {Float} VerticalComponent The amount in ink space coordinates to translate the view transform in the Y dimension.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-move
     */
    Move(HorizontalComponent, VerticalComponent) {
        result := ComCall(19, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * Applies a rotation to a InkRenderer's view transform.
     * @param {Float} Degrees The degrees by which to rotate clockwise.
     * @param {Float} x Optional. The x-coordinate of the point in ink space coordinates around which to rotate. The default is zero.
     * @param {Float} y Optional. The y-coordinate of the point in ink space coordinates around which to rotate. The default is zero.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-rotate
     */
    Rotate(Degrees, x, y) {
        result := ComCall(20, this, "float", Degrees, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * Scales the view transform in the X and Y dimension.
     * @param {Float} HorizontalMultiplier The factor to scale the X dimension in the view transform.
     * @param {Float} VerticalMultiplier The factor to scale the Y dimension in the view transform.
     * @param {VARIANT_BOOL} ApplyOnPenWidth Optional. <b>VARIANT_TRUE</b> to apply the scale factors to the pen width; otherwise, <b>VARIANT_FALSE</b>. The default is <b>VARIANT_TRUE</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrenderer-scaletransform
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier, ApplyOnPenWidth) {
        result := ComCall(21, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "short", ApplyOnPenWidth, "HRESULT")
        return result
    }
}
