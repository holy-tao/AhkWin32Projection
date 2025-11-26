#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkDisp.ahk
#Include .\IInkExtendedProperties.ahk
#Include .\IInkRectangle.ahk
#Include .\IInkStrokeDisp.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a single ink stroke.A stroke is a set of properties and point data that the digitizer captures that represent the coordinates and properties of a known ink mark.
 * @remarks
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkstrokedisp
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkStrokeDisp extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokeDisp
     * @type {Guid}
     */
    static IID => Guid("{43242fea-91d1-4a72-963e-fbb91829cfa2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ID", "get_BezierPoints", "get_DrawingAttributes", "putref_DrawingAttributes", "get_Ink", "get_ExtendedProperties", "get_PolylineCusps", "get_BezierCusps", "get_SelfIntersections", "get_PacketCount", "get_PacketSize", "get_PacketDescription", "get_Deleted", "GetBoundingBox", "FindIntersections", "GetRectangleIntersections", "Clip", "HitTestCircle", "NearestPoint", "Split", "GetPacketDescriptionPropertyMetrics", "GetPoints", "SetPoints", "GetPacketData", "GetPacketValuesByProperty", "SetPacketValuesByProperty", "GetFlattenedBezierPoints", "Transform", "ScaleToRectangle", "Move", "Rotate", "Shear", "ScaleTransform"]

    /**
     * @type {Integer} 
     */
    ID {
        get => this.get_ID()
    }

    /**
     * @type {VARIANT} 
     */
    BezierPoints {
        get => this.get_BezierPoints()
    }

    /**
     * @type {IInkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
    }

    /**
     * @type {IInkDisp} 
     */
    Ink {
        get => this.get_Ink()
    }

    /**
     * @type {IInkExtendedProperties} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * @type {VARIANT} 
     */
    PolylineCusps {
        get => this.get_PolylineCusps()
    }

    /**
     * @type {VARIANT} 
     */
    BezierCusps {
        get => this.get_BezierCusps()
    }

    /**
     * @type {VARIANT} 
     */
    SelfIntersections {
        get => this.get_SelfIntersections()
    }

    /**
     * @type {Integer} 
     */
    PacketCount {
        get => this.get_PacketCount()
    }

    /**
     * @type {Integer} 
     */
    PacketSize {
        get => this.get_PacketSize()
    }

    /**
     * @type {VARIANT} 
     */
    PacketDescription {
        get => this.get_PacketDescription()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Deleted {
        get => this.get_Deleted()
    }

    /**
     * Gets the identifier of an object.
     * @remarks
     * 
     * An object's identifier never changes.
     * 
     * <div class="alert"><b>Note</b>  Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to <b>SC_HOTKEY</b> or <b>SC_TASKLIST</b>; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_id
     */
    get_ID() {
        result := ComCall(7, this, "int*", &ID := 0, "HRESULT")
        return ID
    }

    /**
     * Gets the array of control points that represent the Bezier approximation of the stroke.
     * @remarks
     * 
     * The control points that the <b>BezierPoints</b> property returns provide a smooth approximation of the original stroke and do not necessarily lie on the stroke.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_bezierpoints
     */
    get_BezierPoints() {
        Points := VARIANT()
        result := ComCall(8, this, "ptr", Points, "HRESULT")
        return Points
    }

    /**
     * Gets or sets the drawing attributes to apply to ink as it is drawn.
     * @remarks
     * 
     * The drawing attributes specify the appearance of the stroke. For example, you can specify the style and color of a pen.
     * 
     * A cursor can have different drawing attributes for each <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> with which it comes in contact. If you do not specify drawing attributes for a cursor, it uses the default drawing attributes of the <b>InkCollector</b> object. These default attributes are set with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_defaultdrawingattributes">DefaultDrawingAttributes</a> property of the <b>InkCollector</b> object.
     * 
     * Successive calls to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property change only the drawing attributes of new strokes. They do not apply to strokes that are already collected or being collected.
     * 
     * <div class="alert"><b>Note</b>  This property behaves differently than the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_defaultdrawingattributes">DefaultDrawingAttributes</a> property. Although the <b>DefaultDrawingAttributes</b> property specifies the drawing attributes that are applied to a new cursor, the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property specifies the drawing attributes for ink that is yet to be collected.</div>
     * <div> </div>
     * 
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_drawingattributes
     */
    get_DrawingAttributes() {
        result := ComCall(9, this, "ptr*", &DrawAttrs := 0, "HRESULT")
        return IInkDrawingAttributes(DrawAttrs)
    }

    /**
     * 
     * @param {IInkDrawingAttributes} DrawAttrs 
     * @returns {HRESULT} 
     */
    putref_DrawingAttributes(DrawAttrs) {
        result := ComCall(10, this, "ptr", DrawAttrs, "HRESULT")
        return result
    }

    /**
     * Gets the parent InkDisp object of a stroke.
     * @remarks
     * 
     * The stroke must be contained in one and only one <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * 
     * 
     * @returns {IInkDisp} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_ink
     */
    get_Ink() {
        result := ComCall(11, this, "ptr*", &Ink := 0, "HRESULT")
        return IInkDisp(Ink)
    }

    /**
     * Gets the collection of application-defined data that are stored in an object.
     * @remarks
     * 
     * Applications can use the ExtendedProperties property to access the custom data that is stored on an object. This custom data is automatically serialized with the object.
     * 
     * 
     * @returns {IInkExtendedProperties} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_extendedproperties
     */
    get_ExtendedProperties() {
        result := ComCall(12, this, "ptr*", &Properties := 0, "HRESULT")
        return IInkExtendedProperties(Properties)
    }

    /**
     * Gets an array that contains the indices of the cusps of the IInkStrokeDisp object.
     * @remarks
     * 
     * The array returned by the <b>PolylineCusps</b> property is an index into the array returned by the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpoints">GetPoints</a> method. Each index in the <b>PolylineCusps</b> property corresponds to a point in the array returned by the <b>GetPoints</b> method that is a cusp of the points of the stroke.
     * 
     * A cusp is a point on the stroke where the direction of writing changes in a discontinuous fashion. For example, if the stroke represents the capital letter "L", this property returns three cusps: two corresponding to the first and last control points on the stroke and the third representing the corner of the "L".
     * 
     * The location of a cusp can be determined by using the cusp as an index into the array returned by the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpoints">GetPoints</a> method.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_polylinecusps
     */
    get_PolylineCusps() {
        Cusps := VARIANT()
        result := ComCall(13, this, "ptr", Cusps, "HRESULT")
        return Cusps
    }

    /**
     * Gets an array that contains the indices of the cusps of the Bezier approximation of the stroke.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The array of Bezier control points that the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_bezierpoints">BezierPoints</a> property returns are made up of x and y values. The <b>BezierCusps</b> property refers only to the x values in this array. The y values can be retrieved by an action similar to the following below.</div>
     * <div> </div>
     * A cusp is a point on the stroke where the direction of writing changes in a discontinuous fashion. For example, if the stroke represents the capital letter "L", this property returns three cusps: two corresponding to the first and last control points on the stroke and the third representing the corner of the "L".
     * 
     * The following code extracts the x and y values of the Bezier cusps of an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a>, <c>theStroke</code>, and stores them in a two-dimensional array called <code>BezierCuspValues</c>.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_beziercusps
     */
    get_BezierCusps() {
        Cusps := VARIANT()
        result := ComCall(14, this, "ptr", Cusps, "HRESULT")
        return Cusps
    }

    /**
     * Gets the self-intersections of the stroke.
     * @remarks
     * 
     * A self-intersection is the point of a stroke where the stroke crosses over itself.
     * 
     * A floating point index is a float value that represents a location somewhere between two points in the stroke. As examples, if 0.0 is the first point in the stroke and 1.0 is the second point in the stroke, 0.5 is halfway between the first and second points. Similarly, a floating point index value of 37.25 represents a location that is 25 percent along the line between points 37 and 38 of the stroke.
     * 
     * <div class="alert"><b>Note</b>  A floating point index is returned for each intersection and line segment combination. If a stroke has one intersection, this property returns two self intersections, one for each line segment that is part of the intersection.</div>
     * <div> </div>
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_selfintersections
     */
    get_SelfIntersections() {
        Intersections := VARIANT()
        result := ComCall(15, this, "ptr", Intersections, "HRESULT")
        return Intersections
    }

    /**
     * Gets the number of packets received for an IInkStrokeDisp object.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_packetcount
     */
    get_PacketCount() {
        result := ComCall(16, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * Gets the size, in bytes, of a packet.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_packetsize
     */
    get_PacketSize() {
        result := ComCall(17, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * Gets an array of globally unique identifiers (GUIDs) that describes the types of packet data stored in the IInkStrokeDisp object.
     * @remarks
     * 
     * For a complete list of available packet properties, see the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketProperty</a> constants.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_packetdescription
     */
    get_PacketDescription() {
        PacketDescription := VARIANT()
        result := ComCall(18, this, "ptr", PacketDescription, "HRESULT")
        return PacketDescription
    }

    /**
     * Gets a value that specifies whether a known stroke is deleted from the ink.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-get_deleted
     */
    get_Deleted() {
        result := ComCall(19, this, "short*", &Deleted := 0, "HRESULT")
        return Deleted
    }

    /**
     * Retrieves the bounding box in ink space coordinates for either all of the strokes in an InkDisp object, an individual stroke, or an InkStrokes collection.
     * @param {Integer} BoundingBoxMode Optional. Specifies the stroke characteristics to use to calculate the bounding box. The default value is -1, indicating that all characteristics of a stroke are used to specify the bounding box. 
     * 
     * For more details about the use of stroke characteristics to calculate a bounding box, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkboundingboxmode">BoundingBoxMode</a> enumeration type.
     * @returns {IInkRectangle} When this method returns, contains a pointer to the rectangle that defines the bounding box of an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object, an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, or an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * 
     * <div class="alert"><b>Note</b>  For an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object, the returned bounding box is a copy of the strokes bounding box, so altering the returned bounding box does not affect the strokes location.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-getboundingbox
     */
    GetBoundingBox(BoundingBoxMode) {
        result := ComCall(20, this, "int", BoundingBoxMode, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * Retrieves the points where this IInkStrokeDisp object intersects other IInkStrokeDisp objects within a known InkStrokes collection.
     * @param {IInkStrokes} Strokes The known collection of strokes that are used to calculate the points where this stroke intersects strokes in the collection. If <b>NULL</b>, use all strokes in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * 
     * <div class="alert"><b>Note</b>  The known collection of strokes must come from the same <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object as the stroke being tested for intersection. If it is not from the same <b>InkDisp</b> object, <b>E_INK_MISMATCHED_INK_OBJECT</b> is returned (see "HRESULT value" below). The <b>FindIntersections</b> method is the only Tablet PC application programming interface (API) that requires that the known collection of strokes come from the same <b>InkDisp</b> object.</div>
     * <div> </div>
     * @returns {VARIANT} When this method returns, contains an array of floating point index values that indicate the locations where this stroke intersects strokes within a known collection of strokes.
     * 
     * A floating point index is a float value that represents a location somewhere between two points in the stroke. As examples, if 0.0 is the first point in the stroke and 1.0 is the second point in the stroke, 0.5 is halfway between the first and second points. Similarly, a floating point index value of 37.25 represents a location that is 25 percent along the line between points 37 and 38 of the stroke.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-findintersections
     */
    FindIntersections(Strokes) {
        Intersections := VARIANT()
        result := ComCall(21, this, "ptr", Strokes, "ptr", Intersections, "HRESULT")
        return Intersections
    }

    /**
     * Finds the points where a IInkStrokeDisp object intersects a given rectangle.
     * @param {IInkRectangle} Rectangle The rectangle in <b>ink space</b> coordinates, that describes the hit test area.
     * @returns {VARIANT} When this method returns, contains a VARIANT array that indicates where the stroke intersects the <i>rectangle</i>. The beginning floating point indices are stored in the even indices. The ending floating point indices are stored in the odd indices. The first pair of indices represents the first intersection.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-getrectangleintersections
     */
    GetRectangleIntersections(Rectangle) {
        Intersections := VARIANT()
        result := ComCall(22, this, "ptr", Rectangle, "ptr", Intersections, "HRESULT")
        return Intersections
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-clip
     */
    Clip(Rectangle) {
        result := ComCall(23, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * Determines whether a stroke is either completely inside or intersected by a given circle.
     * @param {Integer} X The x-position of the center of the hit-test circle in ink space coordinates.
     * @param {Integer} Y The y-position of the center of the hit-test circle in ink space coordinates.
     * @param {Float} Radius The radius of the circle to use in the hit test.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the stroke intersects or is inside the circle; otherwise, <b>VARIANT_FALSE</b>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-hittestcircle
     */
    HitTestCircle(X, Y, Radius) {
        result := ComCall(24, this, "int", X, "int", Y, "float", Radius, "short*", &Intersects := 0, "HRESULT")
        return Intersects
    }

    /**
     * Finds the location on the stroke nearest to a known point and returns the distance that point is from the stroke. Everything is in ink space coordinates.
     * @param {Integer} X The x-position in ink space of the point to test.
     * @param {Integer} Y The y-position in ink space of the point to test.
     * @param {Pointer<Float>} Distance Optional. The distance from the point to the stroke. This parameter can be <b>NULL</b>. The default value is 0.
     * @returns {Float} When this method returns, contains the floating point index value that represents the closest location on the stroke.
     * 
     * A floating point index is a float value that represents a location somewhere between two points in the stroke. As examples, if 0.0 is the first point in the stroke and 1.0 is the second point in the stroke, 0.5 is halfway between the first and second points. Similarly, a floating point index value of 37.25 represents a location that is 25 percent along the line between points 37 and 38 of the stroke.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-nearestpoint
     */
    NearestPoint(X, Y, Distance) {
        DistanceMarshal := Distance is VarRef ? "float*" : "ptr"

        result := ComCall(25, this, "int", X, "int", Y, DistanceMarshal, Distance, "float*", &Point := 0, "HRESULT")
        return Point
    }

    /**
     * Splits the stroke at the specified location on the stroke.
     * @param {Float} SplitAt The floating point index value that represents where to split the stroke.
     * 
     * <div class="alert"><b>Note</b>  A floating point index is a float value that represents a location somewhere between two points in the stroke. As examples, if 0.0 is the first point in the stroke and 1.0 is the second point in the stroke, 0.5 is halfway between the first and second points. Similarly, a floating point index value of 37.25 represents a location that is 25 percent along the line between points 37 and 38 of the stroke.</div>
     * <div> </div>
     * @returns {IInkStrokeDisp} When this method returns, contains a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object that is created from the split operation.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-split
     */
    Split(SplitAt) {
        result := ComCall(26, this, "float", SplitAt, "ptr*", &NewStroke := 0, "HRESULT")
        return IInkStrokeDisp(NewStroke)
    }

    /**
     * Retrieves the metrics for a given packet description type.
     * @param {BSTR} PropertyName The globally unique identifier (GUID) from the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketProperty</a> constants that identifies the property for which to obtain metrics.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @param {Pointer<Integer>} Minimum The minimum value, in logical units, that the tablet reports for this property. For example, a tablet reporting x-values from 0 to 9000 would have a logical minimum of 0.
     * @param {Pointer<Integer>} Maximum The maximum value, in logical units, that the tablet reports for this property. For example, a tablet reporting x-values from 0 to 9000 would have a logical maximum of 9000.
     * @param {Pointer<Integer>} Units The physical units of the property, such as inches or degrees. For a list of property units, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-tabletpropertymetricunit">TabletPropertyMetricUnit</a> enumeration type.
     * @param {Pointer<Float>} Resolution The resolution or increment value for the <i>units</i> member. For example, a tablet that reports 400 dots per inch (dpi) would have a <i>resolution</i> value of 400.
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
     * Cannot allocate memory necessary to complete this request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CLASSSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid GUID format.
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
     * The property does not exist in the collection.
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
     * An exception occurred while processing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-getpacketdescriptionpropertymetrics
     */
    GetPacketDescriptionPropertyMetrics(PropertyName, Minimum, Maximum, Units, Resolution) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        MinimumMarshal := Minimum is VarRef ? "int*" : "ptr"
        MaximumMarshal := Maximum is VarRef ? "int*" : "ptr"
        UnitsMarshal := Units is VarRef ? "int*" : "ptr"
        ResolutionMarshal := Resolution is VarRef ? "float*" : "ptr"

        result := ComCall(27, this, "ptr", PropertyName, MinimumMarshal, Minimum, MaximumMarshal, Maximum, UnitsMarshal, Units, ResolutionMarshal, Resolution, "HRESULT")
        return result
    }

    /**
     * Retrieves the points that make up a stroke.
     * @param {Integer} Index Optional. The starting index within the array of points that make up the stroke. The default value ISC_FirstElement, defined in the <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">InkSelectionConstants</a> enumeration type, specifies the first point.
     * @param {Integer} Count Optional. The number of points to return. The default value ISC_AllElements, defined in the <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">InkSelectionConstants</a> enumeration type, specifies all of the points that make up the stroke data.
     * @returns {VARIANT} Whent this method returns, contains the array of points from the stroke.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-getpoints
     */
    GetPoints(Index, Count) {
        Points := VARIANT()
        result := ComCall(28, this, "int", Index, "int", Count, "ptr", Points, "HRESULT")
        return Points
    }

    /**
     * Sets the points of the IInkStrokeDisp using an array of X, Y values.
     * @param {VARIANT} Points The array of new points to replace the points in the stroke beginning at <i>index</i>. This is a VARIANT containing an array of Long with the points represented by alternating values of the form x0, y0, x1, y1, x2, y2, and so on.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @param {Integer} Index Optional. The zero-based index of the first point in the stroke to be modified. The default value <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">ISC_FirstElement</a>, defined in the <b>ItemSelectionConstants</b> enumeration type, specifies that the first point in the stroke is modified.
     * @param {Integer} Count Optional. The count of points in the stroke to be modified. The default value <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">ISC_AllElements</a>, defined in the <b>ItemSelectionConstants</b> enumeration type, specifies that all points in the stroke are modified.
     * @returns {Integer} When this method returns, contains the actual number of packets set.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-setpoints
     */
    SetPoints(Points, Index, Count) {
        result := ComCall(29, this, "ptr", Points, "int", Index, "int", Count, "int*", &NumberOfPointsSet := 0, "HRESULT")
        return NumberOfPointsSet
    }

    /**
     * Retrieves the packet data for a range of packets within the IInkStrokeDisp object.
     * @param {Integer} Index Optional. The starting point of the zero-based index to a packet within the stroke. The default value ISC_FirstElement, defined in the <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">InkSelectionConstants</a> enumeration type, specifies the first packet.
     * @param {Integer} Count Optional. The number of point packet data sets that should be returned, starting with the packet specified in the <i>startingIndex</i> parameter. The default value ISC_AllElements, defined in the <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">InkSelectionConstants</a> enumeration type, specifies all of the points that make up the stroke data.
     * @returns {VARIANT} When this method returns, contains a signed 32-bit integer array containing the packet data for the requested points in the stroke. The array contains the data for the first point, then the data for the second point, and so on.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-getpacketdata
     */
    GetPacketData(Index, Count) {
        PacketData := VARIANT()
        result := ComCall(30, this, "int", Index, "int", Count, "ptr", PacketData, "HRESULT")
        return PacketData
    }

    /**
     * Retrieves the data for a known packet property from one or more packets in the stroke.
     * @param {BSTR} PropertyName The identifier from the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketProperty</a> constants that was used to select which packet data is retrieved.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @param {Integer} Index Optional. The starting point of the zero-based index to a packet within the stroke. The default value ISC_FirstElement, defined in the <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">InkSelectionConstants</a> enumeration type, specifies the first packet.
     * @param {Integer} Count Optional. The number of points that make up the stroke data. The default value ISC_AllElements, defined in the <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">InkSelectionConstants</a> enumeration type, specifies all of the points that make up the stroke data.
     * @returns {VARIANT} When this method returns, contains an array of signed 32-bit integers that specifies the value of the requested <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketProperty</a> for each point requested from the stroke.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-getpacketvaluesbyproperty
     */
    GetPacketValuesByProperty(PropertyName, Index, Count) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        PacketValues := VARIANT()
        result := ComCall(31, this, "ptr", PropertyName, "int", Index, "int", Count, "ptr", PacketValues, "HRESULT")
        return PacketValues
    }

    /**
     * Modifies the packet values for a particular property.
     * @param {BSTR} bstrPropertyName The globally unique identifier (GUID) identifier from the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketProperty</a> constants that is used to select which packet data is set. Use <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_packetdescription">PacketDescription</a> to determine the defined properties for this stroke.
     * @param {VARIANT} PacketValues The array of packet data values. The method fails if any of the values in the array are outside the minimum or maximum value of the property. To determine the range of values in the property, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpacketdescriptionpropertymetrics">GetPacketDescriptionPropertyMetrics</a> method.
     * @param {Integer} Index Optional. The starting index of the packet to be modified. The default value <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">ISC_FirstElement</a>, defined in the <b>ItemSelectionConstants</b> enumeration type, specifies the first packet.
     * @param {Integer} Count Optional. Specifies the number of packets in the stroke to modify and the number of values in <i>PacketValues</i>. The default value <a href="https://docs.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants">ISC_AllElements</a>, defined in the <b>ItemSelectionConstants</b> enumeration type, specifies that all packets are modified.
     * @returns {Integer} When this method returns, contains the actual number of packets set.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-setpacketvaluesbyproperty
     */
    SetPacketValuesByProperty(bstrPropertyName, PacketValues, Index, Count) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(32, this, "ptr", bstrPropertyName, "ptr", PacketValues, "int", Index, "int", Count, "int*", &NumberOfPacketsSet := 0, "HRESULT")
        return NumberOfPacketsSet
    }

    /**
     * Retrieves the bounding box in ink space coordinates for either all of the strokes in an InkDisp object, an individual stroke, or a InkStrokes collection.
     * @param {Integer} FittingError Optional. The maximum distance (accuracy), using ink space units, between the Bezier control points and the points of the stroke. This is also known as the curve fitting error level. The default value is 0.
     * @returns {VARIANT} When this method returns, contains a point array that indicates the points that were used to draw the Bezier curve representation of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object. The Variant result contains an array in the form x1, y1, x2, y2, and so on, of the Bezier points.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-getflattenedbezierpoints
     */
    GetFlattenedBezierPoints(FittingError) {
        FlattenedBezierPoints := VARIANT()
        result := ComCall(33, this, "int", FittingError, "ptr", FlattenedBezierPoints, "HRESULT")
        return FlattenedBezierPoints
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-transform
     */
    Transform(Transform, ApplyOnPenWidth) {
        result := ComCall(34, this, "ptr", Transform, "short", ApplyOnPenWidth, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-scaletorectangle
     */
    ScaleToRectangle(Rectangle) {
        result := ComCall(35, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * Applies a translation to the ink of an IInkStrokeDisp object or InkStrokes collection.
     * @param {Float} HorizontalComponent The distance in ink space coordinates to translate the view transform in the X dimension.
     * @param {Float} VerticalComponent The distance in ink space coordinates to translate the view transform in the Y dimension.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-move
     */
    Move(HorizontalComponent, VerticalComponent) {
        result := ComCall(36, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * Rotates the ink using an angle in degrees around a center point of the rotation.
     * @param {Float} Degrees The degrees by which to rotate clockwise.
     * @param {Float} x Optional. The x-coordinate of the point in ink space coordinates around which to rotate. Default is the origin. The default value is the origin (0).
     * @param {Float} y Optional. The y-coordinate of the point in ink space coordinates around which to rotate. The default value is the origin (0).
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-rotate
     */
    Rotate(Degrees, x, y) {
        result := ComCall(37, this, "float", Degrees, "float", x, "float", y, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-shear
     */
    Shear(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(38, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkstrokedisp-scaletransform
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(39, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
        return result
    }
}
