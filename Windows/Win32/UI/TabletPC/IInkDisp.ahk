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
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkdisp
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
     * Gets the collection of strokes that are contained in an object or used to create an object.
     * @remarks
     * 
     * The collection of strokes may be the copies of the strokes contained in an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object or the strokes that were used to create the object or collection.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes">Strokes</a> property for the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object does not return the actual collection that the <b>InkDisp</b> object works with, but instead returns a copy. For example, this means that adding or removing strokes to this collection does not affect the <b>InkDisp</b> object's strokes; to add or remove strokes, use <b>InkDisp</b> methods such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle">AddStrokesAtRectangle</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke">DeleteStroke</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes">DeleteStrokes</a>. However, each stroke in the collection is a reference to the original <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkStrokes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Gets the collection of application-defined data that are stored in an object.
     * @remarks
     * 
     * Applications can use the ExtendedProperties property to access the custom data that is stored on an object. This custom data is automatically serialized with the object.
     * 
     * 
     * @returns {IInkExtendedProperties} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-get_extendedproperties
     */
    get_ExtendedProperties() {
        result := ComCall(8, this, "ptr*", &Properties := 0, "HRESULT")
        return IInkExtendedProperties(Properties)
    }

    /**
     * Gets or sets the value that specifies whether the strokes of an InkDisp Class object have been modified since the last time the ink was saved.
     * @remarks
     * 
     * After ink is saved, the dirty flag is automatically cleared and the value of this property is <b>VARIANT_FALSE</b>. To save ink, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-save">Save Method</a> method.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-get_dirty
     */
    get_Dirty() {
        result := ComCall(9, this, "short*", &Dirty := 0, "HRESULT")
        return Dirty
    }

    /**
     * Gets or sets the value that specifies whether the strokes of an InkDisp Class object have been modified since the last time the ink was saved.
     * @remarks
     * 
     * After ink is saved, the dirty flag is automatically cleared and the value of this property is <b>VARIANT_FALSE</b>. To save ink, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-save">Save Method</a> method.
     * 
     * 
     * @param {VARIANT_BOOL} Dirty 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-put_dirty
     */
    put_Dirty(Dirty) {
        result := ComCall(10, this, "short", Dirty, "HRESULT")
        return result
    }

    /**
     * Gets the collection of custom strokes to be persisted with the ink.
     * @returns {IInkCustomStrokes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-get_customstrokes
     */
    get_CustomStrokes() {
        result := ComCall(11, this, "ptr*", &ppunkInkCustomStrokes := 0, "HRESULT")
        return IInkCustomStrokes(ppunkInkCustomStrokes)
    }

    /**
     * Retrieves the bounding box in ink space coordinates for either all of the strokes in an InkDisp object, an individual stroke, or an InkStrokes collection.
     * @param {Integer} BoundingBoxMode Optional. Specifies the stroke characteristics to use to calculate the bounding box. For more details about the use of stroke characteristics to calculate a bounding box, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkboundingboxmode">BoundingBoxMode</a> enumeration type. 
     * 
     * The  default value is -1 (IBBM_DEFAULT), which means that all characteristics of a stroke are used to specify the bounding box.
     * @returns {IInkRectangle} When this method returns, contains the rectangle that defines the bounding box of an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object, an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, or an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * 
     * <div class="alert"><b>Note</b>  For an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, the returned bounding box is a copy of the strokes bounding box, so altering the returned bounding box does not affect the strokes location.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-getboundingbox
     */
    GetBoundingBox(BoundingBoxMode) {
        result := ComCall(12, this, "int", BoundingBoxMode, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * Deletes an InkStrokes collection from the Strokes collection of the InkDisp object.
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
     * The <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object of the strokes must match the known <b>InkDisp</b> object.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-deletestrokes
     */
    DeleteStrokes(Strokes) {
        result := ComCall(13, this, "ptr", Strokes, "HRESULT")
        return result
    }

    /**
     * Deletes a IInkStrokeDisp object from the InkDisp object.
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
     * The <a href="/windows/desktop/tablet/inkdisp-class">InkDisp</a> object of the strokes must match the known <b>InkDisp</b> object.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-deletestroke
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-extractstrokes
     */
    ExtractStrokes(Strokes, ExtractFlags) {
        result := ComCall(15, this, "ptr", Strokes, "int", ExtractFlags, "ptr*", &ExtractedInk := 0, "HRESULT")
        return IInkDisp(ExtractedInk)
    }

    /**
     * Cuts or copies strokes from an existing InkDisp object and pastes them into a new InkDisp object, by using the known rectangle to determine which strokes to extract.
     * @param {IInkRectangle} Rectangle Specifies the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a> object which delimits the ink to extract from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @param {Integer} extractFlags Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkextractflags">InkExtractFlags</a> enumeration type, which determines whether the ink should be cut or copied from the existing <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is IEF_DEFAULT, which cuts the strokes from the existing <b>InkDisp</b> object.
     * @returns {IInkDisp} When this method returns, contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object that contains the extracted collection of strokes.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-extractwithrectangle
     */
    ExtractWithRectangle(Rectangle, extractFlags) {
        result := ComCall(16, this, "ptr", Rectangle, "int", extractFlags, "ptr*", &ExtractedInk := 0, "HRESULT")
        return IInkDisp(ExtractedInk)
    }

    /**
     * Removes portions of an IInkStrokeDisp object or InkStrokes collection that are outside a rectangle.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-clip
     */
    Clip(Rectangle) {
        result := ComCall(17, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * Creates a duplicate InkDisp object.
     * @returns {IInkDisp} When this method returns, contains a pointer to the newly created <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-clone
     */
    Clone() {
        result := ComCall(18, this, "ptr*", &NewInk := 0, "HRESULT")
        return IInkDisp(NewInk)
    }

    /**
     * Retrieves the InkStrokes collection that are either completely inside or intersected by a known circle.
     * @param {Integer} X The x-position of the center of the hit test circle in ink space units.
     * @param {Integer} Y The y-position of the center of the hit test circle in ink space units.
     * @param {Float} radius The radius of the circle to use in the hit test, in ink space units.
     * @returns {IInkStrokes} When this method returns, contains the collection of strokes that are either completely inside or intersected by the specified circle.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-hittestcircle
     */
    HitTestCircle(X, Y, radius) {
        result := ComCall(19, this, "int", X, "int", Y, "float", radius, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Retrieves the strokes that are contained within a specified rectangle.
     * @param {IInkRectangle} SelectionRectangle The selection rectangle, of type <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrectangle-class">InkRectangle</a>, in ink space coordinates.
     * @param {Float} IntersectPercent The float or single percentage value that determines which strokes are included in the collection. Strokes that intersect the rectangle are included in the collection if the percentage of points in those strokes contained within the rectangle is greater than or equal to the <i>IntersectPercent</i> percentage.
     * @returns {IInkStrokes} When this method returns, contains a pointer to the collection of strokes that makes up the ink.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-hittestwithrectangle
     */
    HitTestWithRectangle(SelectionRectangle, IntersectPercent) {
        result := ComCall(20, this, "ptr", SelectionRectangle, "float", IntersectPercent, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Retrieves the strokes within a polyline selection area.
     * @param {VARIANT} Points The points that are used in the selection tool to select the strokes. The selection area is the area inside the selection boundary in which the boundary first intersects itself. If the boundary does not intersect itself, the method adds a point to the end of the array to create a straight line from the first point to the last point. If the boundary is a straight line (no area within the selection boundary), no strokes are selected.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @param {Float} IntersectPercent The percentage of stroke points that must be contained within the selection tool to include the stroke in the resulting collection of strokes. If zero (<c>0</c>), all strokes that are contained within or intersected by the selection tool are included in the resulting collection of strokes. If 100, only strokes fully contained in the selection tool are included in the collection. Strokes that intersect the selection tool are included in the collection if the percentage of points in those strokes contained within the selection tool is greater than or equal to the <i>percentIntersect</i> percentage. Fractional percentages are rounded up.
     * @param {Pointer<VARIANT>} LassoPoints Optional. Retrieves the specific portion of the selection tool that is used for the selection. Because a user can draw many different types of selection tools, some of which overlap multiple times, this can be useful for illustrating which portion of the selection tool was used for selection. The default value is a <b>NULL</b> pointer, which means no information is returned.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {IInkStrokes} When this method returns, contains a pointer to the collection of strokes that makes up the ink.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-hittestwithlasso
     */
    HitTestWithLasso(Points, IntersectPercent, LassoPoints) {
        result := ComCall(21, this, "ptr", Points, "float", IntersectPercent, "ptr", LassoPoints, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Retrieves the IInkStrokeDisp within the InkDisp object that is nearest to a known point, optionally providing the index of the nearest point and the distance to the stroke from the specified point.
     * @param {Integer} X The <c>x-</c>position in ink space of the point.
     * @param {Integer} Y Specifies the <c>y-</c>position in ink space of the point.
     * @param {Pointer<Float>} PointOnStroke Optional. Retrieves the point on the line of the stroke that is closest to the specified point within the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. For example, a value of 1.5 indicates that the point falls halfway between the first and second packets of the stroke. This parameter can be <b>NULL</b>. The default value is 0.
     * @param {Pointer<Float>} DistanceFromPacket Optional. Retrieves the distance between the specified point in ink space and the nearest stroke in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. This parameter can be <b>NULL</b>. the default value is 0.
     * @returns {IInkStrokeDisp} When this method returns, contains the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> that contains a point that is closest to the specified point in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. If more than one stroke contains a point that is the same distance from the specified point, the value of this result is arbitrary.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-nearestpoint
     */
    NearestPoint(X, Y, PointOnStroke, DistanceFromPacket) {
        PointOnStrokeMarshal := PointOnStroke is VarRef ? "float*" : "ptr"
        DistanceFromPacketMarshal := DistanceFromPacket is VarRef ? "float*" : "ptr"

        result := ComCall(22, this, "int", X, "int", Y, PointOnStrokeMarshal, PointOnStroke, DistanceFromPacketMarshal, DistanceFromPacket, "ptr*", &Stroke := 0, "HRESULT")
        return IInkStrokeDisp(Stroke)
    }

    /**
     * Creates a new InkStrokes collection from existing IInkStrokeDisp objects.
     * @param {VARIANT} StrokeIds Optional. Specifies an array of stroke IDs that exist in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The strokes with these IDs are added to a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection. The default value is <b>NULL</b>.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {IInkStrokes} When this method returns, contains a pointer to a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-createstrokes
     */
    CreateStrokes(StrokeIds) {
        result := ComCall(23, this, "ptr", StrokeIds, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * Adds a specified Strokes collection into this InkDisp object at a specified rectangle.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle
     */
    AddStrokesAtRectangle(SourceStrokes, TargetRectangle) {
        result := ComCall(24, this, "ptr", SourceStrokes, "ptr", TargetRectangle, "HRESULT")
        return result
    }

    /**
     * Converts the ink to the specified InkPersistenceFormat, saves the ink by using the specified InkPersistenceCompressionMode, and returns the binary data in an array of bytes.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-save
     */
    Save(PersistenceFormat, CompressionMode) {
        Data := VARIANT()
        result := ComCall(25, this, "int", PersistenceFormat, "int", CompressionMode, "ptr", Data, "HRESULT")
        return Data
    }

    /**
     * Populates a new InkDisp object with known binary data.
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-load
     */
    Load(Data) {
        result := ComCall(26, this, "ptr", Data, "HRESULT")
        return result
    }

    /**
     * Creates an IInkStrokeDisp object from an array of packet data input values.
     * @param {VARIANT} PacketData Specifies the array of packet data. The data is an array of Int32 values which, taken in order, form the array of points (x0, y0), (x1, y1), which is passed into the method within a Variant.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @param {VARIANT} PacketDescription Is a reserved parameter that is currently not implemented.
     * @returns {IInkStrokeDisp} When this method returns, contains a pointer to the newly-created stroke.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-createstroke
     */
    CreateStroke(PacketData, PacketDescription) {
        result := ComCall(27, this, "ptr", PacketData, "ptr", PacketDescription, "ptr*", &Stroke := 0, "HRESULT")
        return IInkStrokeDisp(Stroke)
    }

    /**
     * Copies the IInkStrokeDisp objects that are contained within the known rectangle to the Clipboard.
     * @param {IInkRectangle} Rectangle Specifies the rectangle that contains the strokes to copy to the Clipboard.
     * @param {Integer} ClipboardFormats Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardformats">InkClipboardFormats</a> enumeration value of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is <b>ICF_Default</b>.
     * @param {Integer} ClipboardModes Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardmodes">InkClipboardModes Enumeration</a> value of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp Class</a> object. The default value is <b>ICB_Default</b>.
     * @returns {IDataObject} When this method returns, contains a pointer to the newly create data object.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-clipboardcopywithrectangle
     */
    ClipboardCopyWithRectangle(Rectangle, ClipboardFormats, ClipboardModes) {
        result := ComCall(28, this, "ptr", Rectangle, "int", ClipboardFormats, "int", ClipboardModes, "ptr*", &DataObject := 0, "HRESULT")
        return IDataObject(DataObject)
    }

    /**
     * Copies the InkStrokes collection to the Clipboard.
     * @param {IInkStrokes} strokes Optional. Specifies the strokes to copy. If the strokes parameter is <b>NULL</b>, the <b>ClipboardCopy</b> method copies the entire <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is <b>NULL</b>.
     * @param {Integer} ClipboardFormats Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardformats">InkClipboardFormats</a> enumeration value of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is <b>ICF_Default</b>.
     * @param {Integer} ClipboardModes Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkclipboardmodes">InkClipboardModes</a> enumeration value of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object. The default value is <b>ICB_Default</b>.
     * @returns {IDataObject} When this method returns, contains a pointer to the newly create data object.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-clipboardcopy
     */
    ClipboardCopy(strokes, ClipboardFormats, ClipboardModes) {
        result := ComCall(29, this, "ptr", strokes, "int", ClipboardFormats, "int", ClipboardModes, "ptr*", &DataObject := 0, "HRESULT")
        return IDataObject(DataObject)
    }

    /**
     * Indicates whether the IDataObject can be converted to an InkDisp object.
     * @param {IDataObject} DataObject Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> to inspect. The default value is <b>NULL</b>, which means the data object on the Clipboard is used.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the data object can be converted to an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-canpaste
     */
    CanPaste(DataObject) {
        result := ComCall(30, this, "ptr", DataObject, "short*", &CanPaste := 0, "HRESULT")
        return CanPaste
    }

    /**
     * Copies the IDataObject from the Clipboard to the InkDisp object.
     * @param {Integer} x Optional. Specifies the x-coordinate to paste to in <b>ink space</b> coordinates. The default value is 0.
     * @param {Integer} y Optional. Specifies the y-coordinate to paste to in ink space coordinates. The default value is 0.
     * @param {IDataObject} DataObject Optional. Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> to be used. To paste from the Clipboard, set to <b>NULL</b>. The default value is <b>NULL</b>.
     * @returns {IInkStrokes} When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkdisp-clipboardpaste
     */
    ClipboardPaste(x, y, DataObject) {
        result := ComCall(31, this, "int", x, "int", y, "ptr", DataObject, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }
}
