#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkExtendedProperties.ahk
#Include .\IInkCustomStrokes.ahk
#Include .\IInkRectangle.ahk
#Include .\IInkDisp.ahk
#Include .\IInkStrokeDisp.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * . (IInkDisp)
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkdisp
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDisp extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDisp
     * @type {Guid}
     */
    static IID => Guid("{9d398fa0-c4e2-4fcd-9973-975caaf47ea6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Strokes", "get_ExtendedProperties", "get_Dirty", "put_Dirty", "get_CustomStrokes", "GetBoundingBox", "DeleteStrokes", "DeleteStroke", "ExtractStrokes", "ExtractWithRectangle", "Clip", "Clone", "HitTestCircle", "HitTestWithRectangle", "HitTestWithLasso", "NearestPoint", "CreateStrokes", "AddStrokesAtRectangle", "Save", "Load", "CreateStroke", "ClipboardCopyWithRectangle", "ClipboardCopy", "CanPaste", "ClipboardPaste"]

    /**
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * @type {IInkExtendedProperties} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Dirty {
        get => this.get_Dirty()
        set => this.put_Dirty(value)
    }

    /**
     * @type {IInkCustomStrokes} 
     */
    CustomStrokes {
        get => this.get_CustomStrokes()
    }

    /**
     * Gets the collection of strokes that are contained in an object or used to create an object. (IInkDisp.get_Strokes)
     * @remarks
     * The collection of strokes may be the copies of the strokes contained in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object or the strokes that were used to create the object or collection.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes">Strokes</a> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object does not return the actual collection that the <b>InkDisp</b> object works with, but instead returns a copy. For example, this means that adding or removing strokes to this collection does not affect the <b>InkDisp</b> object's strokes; to add or remove strokes, use <b>InkDisp</b> methods such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle">AddStrokesAtRectangle</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke">DeleteStroke</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes">DeleteStrokes</a>. However, each stroke in the collection is a reference to the original <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.</div>
     * <div> </div>
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Gets the collection of application-defined data that are stored in an object. (IInkDisp.get_ExtendedProperties)
     * @remarks
     * Applications can use the ExtendedProperties property to access the custom data that is stored on an object. This custom data is automatically serialized with the object.
     * @returns {IInkExtendedProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_extendedproperties
     */
    get_ExtendedProperties() {
        result := ComCall(8, this, "ptr*", &_Properties := 0, "HRESULT")
        return IInkExtendedProperties(_Properties)
    }

    /**
     * Gets or sets the value that specifies whether the strokes of an InkDisp Class object have been modified since the last time the ink was saved. (Get)
     * @remarks
     * After ink is saved, the dirty flag is automatically cleared and the value of this property is <b>VARIANT_FALSE</b>. To save ink, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-save">Save Method</a> method.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_dirty
     */
    get_Dirty() {
        result := ComCall(9, this, "short*", &Dirty := 0, "HRESULT")
        return Dirty
    }

    /**
     * Gets or sets the value that specifies whether the strokes of an InkDisp Class object have been modified since the last time the ink was saved. (Put)
     * @remarks
     * After ink is saved, the dirty flag is automatically cleared and the value of this property is <b>VARIANT_FALSE</b>. To save ink, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-save">Save Method</a> method.
     * @param {VARIANT_BOOL} Dirty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-put_dirty
     */
    put_Dirty(Dirty) {
        result := ComCall(10, this, "short", Dirty, "HRESULT")
        return result
    }

    /**
     * Gets the collection of custom strokes to be persisted with the ink.
     * @returns {IInkCustomStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_customstrokes
     */
    get_CustomStrokes() {
        result := ComCall(11, this, "ptr*", &ppunkInkCustomStrokes := 0, "HRESULT")
        return IInkCustomStrokes(ppunkInkCustomStrokes)
    }

    /**
     * Retrieves the bounding box in ink space coordinates for either all of the strokes in an InkDisp object, an individual stroke, or an InkStrokes collection. (IInkDisp.GetBoundingBox)
     * @remarks
     * When the bounding box is affected by the pen width, then this width is scaled appropriately for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrenderer-class">InkRenderer</a> 's view transform. To do this, the pen width is multiplied by the square root of the determinant of the view transform.
     * 
     * <div class="alert"><b>Note</b>  In Windows Vista and later versions, <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-getboundingbox">GetBoundingBox Method</a> does not take the width of the stroke into account.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  If you have not set the pen width explicitly, it is 53 by default. You must multiply the pen width by the square root of the determinant to yield the correct bounding box. The height and width of the bounding box are expanded by half this amount in each direction. For example, consider that the pen width is 53, the square root of the determinant is 50, and the bounding box is (0, 0, 1000, 1000). The pen width adjustment to the bounding box in each direction is calculated as (53 * 50) / 2, and the right and bottom sides are incremented by one. This results in a rendered bounding box of (-1325, -1325, 2326, 2326).</div>
     * <div> </div>
     * @param {Integer} BoundingBoxMode Optional. Specifies the stroke characteristics to use to calculate the bounding box. For more details about the use of stroke characteristics to calculate a bounding box, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkboundingboxmode">BoundingBoxMode</a> enumeration type. 
     * 
     * The  default value is -1 (IBBM_DEFAULT), which means that all characteristics of a stroke are used to specify the bounding box.
     * @returns {IInkRectangle} When this method returns, contains the rectangle that defines the bounding box of an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object, an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, or an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * 
     * <div class="alert"><b>Note</b>  For an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, the returned bounding box is a copy of the strokes bounding box, so altering the returned bounding box does not affect the strokes location.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-getboundingbox
     */
    GetBoundingBox(BoundingBoxMode) {
        result := ComCall(12, this, "int", BoundingBoxMode, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * Deletes an InkStrokes collection from the Strokes collection of the InkDisp object.
     * @remarks
     * This method deletes all of the strokes in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object if no <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection is passed in. To delete only one stroke at a time, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke">DeleteStroke</a> method.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object renumbers the indices of the remaining strokes in the <b>InkDisp</b> object if the strokes that were deleted do not fall at the end of the <b>InkDisp</b> object's collection of strokes.
     * 
     * <div class="alert"><b>Note</b>  The contents of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection become invalid when strokes that are contained in the collection are deleted from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.</div>
     * <div> </div>
     * <b>DeleteStrokes</b> can result in an error if called while the user is actively laying down ink.
     * @param {IInkStrokes} Strokes Optional. Specifies the collection of strokes to delete from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is <b>NULL</b>.
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
     * Cannot allocate memory that is used to perform the operation.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_MISMATCHED_INK_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object of the strokes must match the known <b>InkDisp</b> object.
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes
     */
    DeleteStrokes(Strokes) {
        result := ComCall(13, this, "ptr", Strokes, "HRESULT")
        return result
    }

    /**
     * Deletes a IInkStrokeDisp object from the InkDisp object.
     * @remarks
     * This method deletes only a single stroke. To delete a collection of strokes, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes">DeleteStrokes</a> method.
     * @param {IInkStrokeDisp} Stroke The stroke to delete from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object of the strokes must match the known <b>InkDisp</b> object.
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke
     */
    DeleteStroke(Stroke) {
        result := ComCall(14, this, "ptr", Stroke, "HRESULT")
        return result
    }

    /**
     * Specifies the strokes to extract from an InkDisp Class and cut or copy into a new InkDisp Class, by using the known collection of strokes to determine which strokes to extract.
     * @param {IInkStrokes} Strokes Optional. Specifies the collection of strokes to extract. The default value is 0, which specifies that all strokes are extracted.
     * @param {Integer} ExtractFlags Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkextractflags">InkExtractFlags Enumeration</a> type, which specifies whether the ink is cut or copied into the new Ink object. The default value is IEF_DEFAULT, which cuts the strokes.
     * @returns {IInkDisp} When this method returns, contains a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp Class</a> object that contains the extracted collection of cut or copied strokes.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-extractstrokes
     */
    ExtractStrokes(Strokes, ExtractFlags) {
        result := ComCall(15, this, "ptr", Strokes, "int", ExtractFlags, "ptr*", &ExtractedInk := 0, "HRESULT")
        return IInkDisp(ExtractedInk)
    }

    /**
     * Cuts or copies strokes from an existing InkDisp object and pastes them into a new InkDisp object, by using the known rectangle to determine which strokes to extract.
     * @remarks
     * The new <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object retains the drawing attributes, properties, and coordinates of the original <b>InkDisp</b> object.
     * 
     * This method is useful for creating a new <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object without the deleted or cut strokes from the original object.
     * 
     * To extract strokes from a known collection of strokes, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-extractstrokes">ExtractStrokes Method</a>.
     * 
     * Only the portion of a stroke that is within the rectangle is added to the new <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * 
     * When the <i>extractFlags</i> parameter is <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkextractflags">RemoveFromOriginal</a> or <b>Default</b>, any strokes that cross the rectangle are split and the portion within the rectangle removed from the existing <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @param {IInkRectangle} Rectangle Specifies the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a> object which delimits the ink to extract from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @param {Integer} extractFlags Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkextractflags">InkExtractFlags</a> enumeration type, which determines whether the ink should be cut or copied from the existing <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is IEF_DEFAULT, which cuts the strokes from the existing <b>InkDisp</b> object.
     * @returns {IInkDisp} When this method returns, contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object that contains the extracted collection of strokes.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-extractwithrectangle
     */
    ExtractWithRectangle(Rectangle, extractFlags) {
        result := ComCall(16, this, "ptr", Rectangle, "int", extractFlags, "ptr*", &ExtractedInk := 0, "HRESULT")
        return IInkDisp(ExtractedInk)
    }

    /**
     * Removes portions of an IInkStrokeDisp object or InkStrokes collection that are outside a rectangle. (IInkDisp.Clip)
     * @remarks
     * For an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object, all strokes intersected by the rectangle are split at the intersection points. All portions of strokes outside the rectangle are removed from the <b>InkDisp</b> object. The method may add new points to a stroke at the point where the stroke intersects the rectangle. After you call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-clip">Clip</a> method on an <b>InkDisp</b> object, the IDs of the strokes in the <b>InkDisp</b> object's strokes collection are guaranteed to be unique, but not guaranteed to preserve other information.
     * 
     * This method does not take the pen width into account when clipping. It clips only the actual <b>ink</b> or stroke data.
     * 
     * For an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-clip">Clip</a> method updates the parent <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. Whenever ink is removed from an <b>InkDisp</b> object, any <b>IInkStrokeDisp</b> objects or InkStrokes collections defined for that <b>InkDisp</b> object may be invalidated.
     * 
     * For more information on ink data, see <a href="https://docs.microsoft.com/windows/desktop/tablet/ink-data">Ink Data</a>.
     * @param {IInkRectangle} Rectangle Specifies the rectangle outside of which the stroke or strokes are clipped. The rectangle is specified in ink space  coordinates.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object is not registered.
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clip
     */
    Clip(Rectangle) {
        result := ComCall(17, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * Creates a duplicate InkDisp object.
     * @remarks
     * The <b>Clone</b> method is defined for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a>, <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdrawingattributes-class">InkDrawingAttributes</a>, and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> objects. The <b>Clone</b> method returns an exact copy of the original object.
     * 
     * In most scenarios, the duplicate object is an exact copy of the original object, but no relation between the two objects exists. See the remarks section of this topic for details on exceptions to this.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object: The only scenario in which the duplicate <b>InkDisp</b> object is not an exact copy of the original object is when a dirty <b>InkDisp</b> object is cloned. In this case, the duplicate <b>InkDisp</b> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-get_dirty">Dirty</a> property is <b>FALSE</b>. All other properties of the cloned <b>InkDisp</b> object are exact copies.
     * @returns {IInkDisp} When this method returns, contains a pointer to the newly created <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clone
     */
    Clone() {
        result := ComCall(18, this, "ptr*", &NewInk := 0, "HRESULT")
        return IInkDisp(NewInk)
    }

    /**
     * Retrieves the InkStrokes collection that are either completely inside or intersected by a known circle.
     * @remarks
     * If a stroke intersects the circle, the complete stroke is returned.
     * 
     * The method computes the intersection, considering the full set of drawing attributes that apply to the stroke, including the full pen width, Bezier smoothing (if present), and shape of the pen tip.
     * 
     * After a rotation or shear transform has been performed on a stroke or a collection of strokes, the transformed <c>x-</code> and <code>y-</code> coordinates are no longer concentric with the original coordinates. Because of this, the <code>radius</code> argument should not be calculated from the <code>x-</code> or <code>y-</c> coordinates.
     * 
     * To determine which points of a known stroke intersect the test area, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-hittestcircle">HitTest</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.
     * 
     * The application must always pass in a destination pointer for the resulting collection of strokes. If there are no intersections, the collection has a count of zero.
     * @param {Integer} X The x-position of the center of the hit test circle in ink space units.
     * @param {Integer} Y The y-position of the center of the hit test circle in ink space units.
     * @param {Float} radius The radius of the circle to use in the hit test, in ink space units.
     * @returns {IInkStrokes} When this method returns, contains the collection of strokes that are either completely inside or intersected by the specified circle.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-hittestcircle
     */
    HitTestCircle(X, Y, radius) {
        result := ComCall(19, this, "int", X, "int", Y, "float", radius, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Retrieves the strokes that are contained within a specified rectangle.
     * @remarks
     * To determine which points of a known stroke intersect the test area, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-getrectangleintersections">GetRectangleIntersections</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, which retrieves the points where a stroke intersects a known rectangle.
     * @param {IInkRectangle} SelectionRectangle The selection rectangle, of type <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a>, in ink space coordinates.
     * @param {Float} IntersectPercent The float or single percentage value that determines which strokes are included in the collection. Strokes that intersect the rectangle are included in the collection if the percentage of points in those strokes contained within the rectangle is greater than or equal to the <i>IntersectPercent</i> percentage.
     * @returns {IInkStrokes} When this method returns, contains a pointer to the collection of strokes that makes up the ink.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-hittestwithrectangle
     */
    HitTestWithRectangle(SelectionRectangle, IntersectPercent) {
        result := ComCall(20, this, "ptr", SelectionRectangle, "float", IntersectPercent, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Retrieves the strokes within a polyline selection area.
     * @param {VARIANT} _Points 
     * @param {Float} IntersectPercent The percentage of stroke points that must be contained within the selection tool to include the stroke in the resulting collection of strokes. If zero (<c>0</c>), all strokes that are contained within or intersected by the selection tool are included in the resulting collection of strokes. If 100, only strokes fully contained in the selection tool are included in the collection. Strokes that intersect the selection tool are included in the collection if the percentage of points in those strokes contained within the selection tool is greater than or equal to the <i>percentIntersect</i> percentage. Fractional percentages are rounded up.
     * @param {Pointer<VARIANT>} LassoPoints Optional. Retrieves the specific portion of the selection tool that is used for the selection. Because a user can draw many different types of selection tools, some of which overlap multiple times, this can be useful for illustrating which portion of the selection tool was used for selection. The default value is a <b>NULL</b> pointer, which means no information is returned.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {IInkStrokes} When this method returns, contains a pointer to the collection of strokes that makes up the ink.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-hittestwithlasso
     */
    HitTestWithLasso(_Points, IntersectPercent, LassoPoints) {
        result := ComCall(21, this, "ptr", _Points, "float", IntersectPercent, "ptr", LassoPoints, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Retrieves the IInkStrokeDisp within the InkDisp object that is nearest to a known point, optionally providing the index of the nearest point and the distance to the stroke from the specified point.
     * @remarks
     * The output <i>point</i> parameter is defined as a floating-point number because the point on the line of the stroke can fall between two physical coordinate points. Use this value to split the stroke with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-split">Split</a> method, or round the value up or down to index a packet in the stroke.
     * 
     * The <i>distanceFromPacket</i> parameter describes the distance from the point to the envelope of the stroke. This is the distance between the two points minus half the width of the stroke.
     * @param {Integer} X The <c>x-</c> position in ink space of the point.
     * @param {Integer} Y Specifies the <c>y-</c> position in ink space of the point.
     * @param {Pointer<Float>} PointOnStroke Optional. Retrieves the point on the line of the stroke that is closest to the specified point within the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. For example, a value of 1.5 indicates that the point falls halfway between the first and second packets of the stroke. This parameter can be <b>NULL</b>. The default value is 0.
     * @param {Pointer<Float>} DistanceFromPacket Optional. Retrieves the distance between the specified point in ink space and the nearest stroke in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. This parameter can be <b>NULL</b>. the default value is 0.
     * @returns {IInkStrokeDisp} When this method returns, contains the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> that contains a point that is closest to the specified point in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. If more than one stroke contains a point that is the same distance from the specified point, the value of this result is arbitrary.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-nearestpoint
     */
    NearestPoint(X, Y, PointOnStroke, DistanceFromPacket) {
        PointOnStrokeMarshal := PointOnStroke is VarRef ? "float*" : "ptr"
        DistanceFromPacketMarshal := DistanceFromPacket is VarRef ? "float*" : "ptr"

        result := ComCall(22, this, "int", X, "int", Y, PointOnStrokeMarshal, PointOnStroke, DistanceFromPacketMarshal, DistanceFromPacket, "ptr*", &Stroke := 0, "HRESULT")
        return IInkStrokeDisp(Stroke)
    }

    /**
     * Creates a new InkStrokes collection from existing IInkStrokeDisp objects.
     * @remarks
     * If the <i>ids</i> parameter is <b>NULL</b> or an empty array, then an empty <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection is created.
     * @param {VARIANT} StrokeIds Optional. Specifies an array of stroke IDs that exist in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The strokes with these IDs are added to a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection. The default value is <b>NULL</b>.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {IInkStrokes} When this method returns, contains a pointer to a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-createstrokes
     */
    CreateStrokes(StrokeIds) {
        result := ComCall(23, this, "ptr", StrokeIds, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Adds a specified Strokes collection into this InkDisp object at a specified rectangle.
     * @remarks
     * When inserted, the strokes are scaled from the bounding box of the strokes to the rectangle.
     * 
     * This method can be used to copy strokes within a single <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The source ink strokes do not have to come from another <b>InkDisp</b> object.
     * @param {IInkStrokes} SourceStrokes The strokes to add to the ink. These source strokes are appended to this <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @param {IInkRectangle} TargetRectangle The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a> in ink space coordinates where the strokes are added. A run-time error occurs if the coordinates of the rectangle are {0,0,0,0}.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * A pointer does not point at a valid object.
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
     * The rectangle's top and bottom are equal.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle
     */
    AddStrokesAtRectangle(SourceStrokes, TargetRectangle) {
        result := ComCall(24, this, "ptr", SourceStrokes, "ptr", TargetRectangle, "HRESULT")
        return result
    }

    /**
     * Converts the ink to the specified InkPersistenceFormat, saves the ink by using the specified InkPersistenceCompressionMode, and returns the binary data in an array of bytes.
     * @remarks
     * Attempting to save an empty <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object in GIF format generates an error.
     *           
     * 
     * <div class="alert"><b>Note</b>  When calling the <b>Save</b> method with an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpersistenceformat">InkPersistenceFormat</a> value of <b>Base64InkSerializedFormat</b>, the return value is a <b>NULL</b> -terminated byte array. To write the saved ink to an XML file, first remove the last byte from the array before converting the array to 8-bit Unicode Transformation Format (UTF-8) encoded string.
     *           </div>
     * <div> </div>
     * @param {Integer} PersistenceFormat Optional. Sets one of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpersistenceformat">InkPersistenceFormat</a> values that indicates the format of the persisted ink. The default value is InkSerializedFormat.
     *             
     * 
     * <table>
     * <tr>
     * <th>Name
     *               </th>
     * <th>Description
     *               </th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="InkSerializedFormat"></a><a id="inkserializedformat"></a><a id="INKSERIALIZEDFORMAT"></a><dl>
     * <dt><b>InkSerializedFormat</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ink is persisted using ink serialized format (ISF).
     *                 
     * 
     * This is the most compact persistent representation of ink. It can be embedded within a binary document format or placed directly on the Clipboard. This is the default value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Base64InkSerializedFormat"></a><a id="base64inkserializedformat"></a><a id="BASE64INKSERIALIZEDFORMAT"></a><dl>
     * <dt><b>Base64InkSerializedFormat</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ink is persisted by encoding the ISF as a base64 stream.
     * 
     * This format is provided so that ink can be encoded directly in an Extensible Markup Language (XML) or HTML file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Gif"></a><a id="gif"></a><a id="GIF"></a><dl>
     * <dt><b>Gif</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ink is persisted by using a Graphics Interchange Format (GIF) file that contains ISF as metadata that is embedded within the file. 
     * 
     * This allows ink to be viewed in applications that are not ink-enabled and maintain its full ink fidelity when it returns to an ink-enabled application. This format is ideal when transporting ink content within an HTML file and making it usable by ink-enabled and ink-unaware applications.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Base64Gif"></a><a id="base64gif"></a><a id="BASE64GIF"></a><dl>
     * <dt><b>Base64Gif</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ink is persisted by using a base64 encoded fortified. 
     * 
     * This GIFformat is provided when ink is to be encoded directly in an XML or HTML file with later conversion into an image. A possible use of this would be in an XML format that is generated to contain all ink information and used as a way to generate HTML through Extensible Stylesheet Language Transformations (XSLT).
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} CompressionMode Optional. One of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpersistencecompressionmode">InkPersistenceCompressionMode</a> values that specifies the compression mode of the persisted ink.
     *             The default value is IPCM_Default.
     * 
     * <table>
     * <tr>
     * <th>Name
     *               </th>
     * <th>Description
     *               </th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPCM_Default"></a><a id="ipcm_default"></a><a id="IPCM_DEFAULT"></a><dl>
     * <dt><b>IPCM_Default</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Is used when  the best tradeoff between save-time and storage for the typical application is needed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPCM_MaximumCompression"></a><a id="ipcm_maximumcompression"></a><a id="IPCM_MAXIMUMCOMPRESSION"></a><dl>
     * <dt><b>IPCM_MaximumCompression</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Is used when minimizing storage space is more important than how fast the ink is saved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPCM_NoCompression"></a><a id="ipcm_nocompression"></a><a id="IPCM_NOCOMPRESSION"></a><dl>
     * <dt><b>IPCM_NoCompression</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Is used when save-time is more important than the amount of storage space used and when compatibility between versions is important.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {VARIANT} When this method returns, contains the byte array that contains the persisted ink.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-save
     */
    Save(PersistenceFormat, CompressionMode) {
        Data := VARIANT()
        result := ComCall(25, this, "int", PersistenceFormat, "int", CompressionMode, "ptr", Data, "HRESULT")
        return Data
    }

    /**
     * Populates a new InkDisp object with known binary data.
     * @remarks
     * You can load ink  only into a new, empty <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object - one that hasn't collected any strokes or doesn't have any attached properties. If you try to load ink into an <b>InkDisp</b> object that has collected strokes or attached properties, even if the strokes or properties have been deleted from the <b>InkDisp</b> object, an exception is thrown. This occurs because of how stroke IDs are assigned. A stroke is assigned a unique ID, and this ID is not reused, even if the stroke has been deleted from an Ink object. This means that, if an <b>InkDisp</b> object contained a stroke with an ID of 1 and you deleted the stroke and loaded another <b>InkDisp</b> object into this <b>InkDisp</b> object, stroke IDs would start at 2. This would be confusing and therefore is not allowed.
     * 
     * <div class="alert"><b>Note</b>  If you do attempt to load ink into an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object that is not empty, all data in the <b>InkDisp</b> object, including any custom strokes or extended properties, is lost when you call <b>Load</b>.</div>
     * <div> </div>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-save">Save</a> method allows you to persist the ink in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object in Graphics Interchange Format (GIF) format, which consists of an array of byte data (the tla_gif persistence format is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkpersistenceformat">InkPersistenceFormat</a> enumeration type). After you have the array of byte data, you can load the array of byte data into another <b>InkDisp</b> object. This means that you can load GIF-compatible byte array data into another <b>InkDisp</b> object in the same way as if you had called the <b>Save</b> method and received a byte array that was not in GIF format.
     * 
     * <div class="alert"><b>Note</b>  You cannot create an image, persist that image as a byte array, and then load that byte array into another <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. This is because, after you load byte array data as a GIF, Tablet PC cannot control the format of that data. So, after you persist the image into a byte array again, you cannot call <b>Load</b> on that data.</div>
     * <div> </div>
     * @param {VARIANT} Data The stream that contains the ink data.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VARIANT was not of correct type (byte array).
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
     * Cannot allocate memory for Stream.
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
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-load
     */
    Load(Data) {
        result := ComCall(26, this, "ptr", Data, "HRESULT")
        return result
    }

    /**
     * Creates an IInkStrokeDisp object from an array of packet data input values.
     * @remarks
     * The minimum and maximum values of any point in the points array are LONG_MIN and LONG_MAX, respectively. However, these points define an ink space rectangle whose maximum width or height cannot exceed LONG_MAX. Because of this, the difference between the minimum and maximum x-coordinates, or the minimum and maximum y-coordinates, cannot exceed LONG_MAX.
     * @param {VARIANT} PacketData Specifies the array of packet data. The data is an array of Int32 values which, taken in order, form the array of points (x0, y0), (x1, y1), which is passed into the method within a Variant.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @param {VARIANT} PacketDescription Is a reserved parameter that is currently not implemented.
     * @returns {IInkStrokeDisp} When this method returns, contains a pointer to the newly-created stroke.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-createstroke
     */
    CreateStroke(PacketData, PacketDescription) {
        result := ComCall(27, this, "ptr", PacketData, "ptr", PacketDescription, "ptr*", &Stroke := 0, "HRESULT")
        return IInkStrokeDisp(Stroke)
    }

    /**
     * Copies the IInkStrokeDisp objects that are contained within the known rectangle to the Clipboard.
     * @remarks
     * If the rectangle clips strokes, those strokes are clipped in the copied data.
     * 
     * It may be useful to copy an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object to the Clipboard when you only want to copy the properties of the <b>InkDisp</b> object. To copy an <b>InkDisp</b> object to the Clipboard, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-clipboardcopy">ClipboardCopy</a> method with the <i>strokes</i> parameter set to <b>NULL</b>.
     * 
     * <div class="alert"><b>Caution</b>  To avoid potential memory leaks as a result of using the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardmodes">ICB_DelayedCopy</a> flag, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleflushclipboard">OleFlushClipboard</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a> method. This must be done before the application exits if the last call to the <b>ClipboardCopyWithRectangle</b> method used the <b>ICB_DelayedCopy</b> flag.</div>
     * <div> </div>
     * When <b>ClipboardCopyWithRectangle</b> is used in <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardmodes">ICB_Cut</a> mode, a stroke that gets split into two or more strokes is deleted and new strokes are added in its place.
     * 
     * In addition, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkadded">InkAdded</a> and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkdeleted">InkDeleted</a> events are generated based on the indices of the strokes. For example, if the strokes at indices 0,1,3,5, and 6 are to be deleted, two events will be generated; one for strokes with indices 0123 and one for strokes with indices 5 and 6. That is, one event for each contiguous set.
     * 
     * This also applies to <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-inkadded">InkAdded</a> events. An internal algorithm determines the indices of the newly added strokes in the stroke collection and this has an impact on how the <b>InkAdded</b> events are fired as described above.
     * 
     * If the strokes count is queried within the event handler, the result is the total number of strokes added by the whole operation including the strokes that have not yet generated events.
     * @param {IInkRectangle} Rectangle Specifies the rectangle that contains the strokes to copy to the Clipboard.
     * @param {Integer} ClipboardFormats Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardformats">InkClipboardFormats</a> enumeration value of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is <b>ICF_Default</b>.
     * @param {Integer} ClipboardModes Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardmodes">InkClipboardModes Enumeration</a> value of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp Class</a> object. The default value is <b>ICB_Default</b>.
     * @returns {IDataObject} When this method returns, contains a pointer to the newly create data object.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clipboardcopywithrectangle
     */
    ClipboardCopyWithRectangle(Rectangle, ClipboardFormats, ClipboardModes) {
        result := ComCall(28, this, "ptr", Rectangle, "int", ClipboardFormats, "int", ClipboardModes, "ptr*", &DataObject := 0, "HRESULT")
        return IDataObject(DataObject)
    }

    /**
     * Copies the InkStrokes collection to the Clipboard.
     * @remarks
     * This method copies all properties of the stroke, including recognition results. Setting the <i>strokes</i> parameter to <b>NULL</b> copies the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object to the Clipboard, including the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-get_customstrokes">CustomStrokes</a> property, and recognition results for strokes in the <b>InkDisp</b> object's <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcustomstrokes">IInkCustomStrokes</a> collection are maintained.
     * 
     * If an empty <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection is passed, the method returns <b>NULL</b> and the contents of the Clipboard are not modified.
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize(NULL)</a> must be called before the clipboard APIs can work.</div>
     * <div> </div>
     * <div class="alert"><b>Caution</b>  To avoid potential memory leaks as a result of using the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardmodes">ICB_DelayedCopy</a> flag, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleflushclipboard">OleFlushClipboard</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a> method. This must be done before the application exits if the last call to the <b>ClipboardCopy</b> method used the <b>ICB_DelayedCopy</b> flag.</div>
     * <div> </div>
     * @param {IInkStrokes} strokes Optional. Specifies the strokes to copy. If the strokes parameter is <b>NULL</b>, the <b>ClipboardCopy</b> method copies the entire <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is <b>NULL</b>.
     * @param {Integer} ClipboardFormats Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardformats">InkClipboardFormats</a> enumeration value of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is <b>ICF_Default</b>.
     * @param {Integer} ClipboardModes Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardmodes">InkClipboardModes</a> enumeration value of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is <b>ICB_Default</b>.
     * @returns {IDataObject} When this method returns, contains a pointer to the newly create data object.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clipboardcopy
     */
    ClipboardCopy(strokes, ClipboardFormats, ClipboardModes) {
        result := ComCall(29, this, "ptr", strokes, "int", ClipboardFormats, "int", ClipboardModes, "ptr*", &DataObject := 0, "HRESULT")
        return IDataObject(DataObject)
    }

    /**
     * Indicates whether the IDataObject can be converted to an InkDisp object.
     * @remarks
     * If the supplied <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> is <b>NULL</b>, then the data object on the Clipboard is used.
     * @param {IDataObject} DataObject Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> to inspect. The default value is <b>NULL</b>, which means the data object on the Clipboard is used.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the data object can be converted to an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-canpaste
     */
    CanPaste(DataObject) {
        result := ComCall(30, this, "ptr", DataObject, "short*", &CanPaste := 0, "HRESULT")
        return CanPaste
    }

    /**
     * Copies the IDataObject from the Clipboard to the InkDisp object.
     * @remarks
     * An error is returned if an unexpected error occurs while accessing the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard">Clipboard</a>. If no error occurs but the Clipboard does not contain a format that can be pasted into <b>ink</b> -either <b>ink serialized format (ISF)</b> or a <b>text ink object (tInk)</b> -then <b>NULL</b> is returned and no exception is thrown. For more information about the Clipboard, see Clipboard in MSDN&lt;entity type="reg"/&gt;
     * @param {Integer} x Optional. Specifies the x-coordinate to paste to in <b>ink space</b> coordinates. The default value is 0.
     * @param {Integer} y Optional. Specifies the y-coordinate to paste to in ink space coordinates. The default value is 0.
     * @param {IDataObject} DataObject Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> to be used. To paste from the Clipboard, set to <b>NULL</b>. The default value is <b>NULL</b>.
     * @returns {IInkStrokes} When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clipboardpaste
     */
    ClipboardPaste(x, y, DataObject) {
        result := ComCall(31, this, "int", x, "int", y, "ptr", DataObject, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }
}
