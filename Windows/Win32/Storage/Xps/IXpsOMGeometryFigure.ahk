#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMGeometry.ahk
#Include .\XPS_POINT.ahk
#Include .\IXpsOMGeometryFigure.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes one portion of the path or clipping region that is specified by an IXpsOMGeometry interface.
 * @remarks
 * The <b>IXpsOMGeometryFigure</b> corresponds to the <b>PathFigure</b> element in XPS markup.
 * 
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMGeometryFigure    *newInterface;
 * // startPoint contains the starting point
 * // of the geometry figure being created
 * XPS_POINT                startPoint = {0,0};
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsOMObjectFactory),
 *     NULL,
 *     CLSCTX_INPROC_SERVER,
 *     _uuidof(IXpsOMObjectFactory),
 *     reinterpret_cast<LPVOID*>(&xpsFactory)
 *     );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = xpsFactory->CreateGeometryFigure (&startPoint, &newInterface);
 *     if (SUCCEEDED(hr))
 *     {
 *         // use newInterface
 * 
 *         newInterface->Release();
 *     }
 *     xpsFactory->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGeometryFigure extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMGeometryFigure
     * @type {Guid}
     */
    static IID => Guid("{d410dc83-908c-443e-8947-b1795d3c165a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetSegmentData", "GetSegmentTypes", "GetSegmentStrokes", "SetSegments", "GetStartPoint", "SetStartPoint", "GetIsClosed", "SetIsClosed", "GetIsFilled", "SetIsFilled", "GetSegmentCount", "GetSegmentDataCount", "GetSegmentStrokePattern", "Clone"]

    /**
     * Gets a pointer to the IXpsOMGeometry interface that contains the geometry figure.
     * @returns {IXpsOMGeometry} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface that contains the geometry figure. If the interface is not assigned to a geometry, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &owner := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMGeometry(owner)
    }

    /**
     * Gets the segment data points for the geometry figure.
     * @remarks
     * To determine the required size of the segment data array before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdatacount">GetSegmentDataCount</a>. 
     * 
     * A geometry segment is described by the start point, the segment type, and additional parameters whose values are determined by the segment type. The coordinates for the start point of the first segment are a property of the geometry figure and  are set by calling <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setstartpoint">SetStartPoint</a>. The start point of each subsequent segment is the end point of the preceding segment.
     * 
     * The values  in the array returned in the <i>segmentData</i>  parameter will  correspond with the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_type">XPS_SEGMENT_TYPE</a> values  in the array returned by the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmenttypes">GetSegmentTypes</a> method in the <i>segmentTypes</i>  parameter. To read the segment data values correctly, you will need to know the type of each segment in the geometry figure. For example, if the first line segment has a segment type value of <b>XPS_SEGMENT_TYPE_LINE</b>, the first two data values in the <i>segmentData</i> array will be the x and y coordinates of the end point of  that segment; if the next segment has a segment type value of <b>XPS_SEGMENT_TYPE_BEZIER</b>, the next six values in the <i>segmentData</i> array will describe the characteristics of that segment; and so on for each line segment in the geometry figure.
     * 
     * The table that follows describes the specific set of data values that are returned for each segment type. For an example of how to access this data in a program, see the code example that follows.
     * 
     * <table>
     * <tr>
     * <th>Segment type</th>
     * <th>Required data values </th>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_LINE
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_LINE figure segment" src="./images/segment_type_line.png"/>
     * 
     * </td>
     * <td>
     * Two data values:
     * 
     * <dl>
     * <dd>x-coordinate of the segment line's end point.</dd>
     * <dd>y-coordinate of the segment line's end point.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE
     * 
     * <img alt="Diagram of an XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE figure segment." src="./images/segment_type_arc_lc.png"/>
     * 
     * </td>
     * <td>
     * Five data values:
     * 
     * <dl>
     * <dd>x-coordinate of the arc's end point.</dd>
     * <dd>y-coordinate of the arc's end point.</dd>
     * <dd>Length of the ellipse's radius along the  x-axis.</dd>
     * <dd>Length of the ellipse's radius along the  y-axis.</dd>
     * <dd>Rotation angle.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE figure segment" src="./images/segment_type_arc_sc.png"/>
     * 
     * </td>
     * <td>
     * Five data values:
     * 
     * <dl>
     * <dd>x-coordinate of the arc's end point.</dd>
     * <dd>y-coordinate of the arc's end point.</dd>
     * <dd>Length of the ellipse's radius along the  x-axis.</dd>
     * <dd>Length of the ellipse's radius along the  y-axis.</dd>
     * <dd>Rotation angle.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE
     * 
     * <img alt="Diagram of an XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE figure segment." src="./images/segment_type_arc_lcc.png"/>
     * 
     * </td>
     * <td>
     * Five data values:
     * 
     * <dl>
     * <dd>x-coordinate of the arc's end point.</dd>
     * <dd>y-coordinate of the arc's end point.</dd>
     * <dd>Length of the ellipse's radius along the  x-axis.</dd>
     * <dd>Length of the ellipse's radius along the  y-axis.</dd>
     * <dd>Rotation angle.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE figure segment" src="./images/segment_type_arc_scc.png"/>
     * 
     * </td>
     * <td>
     * Five data values:
     * 
     * <dl>
     * <dd>x-coordinate of the arc's end point.</dd>
     * <dd>y-coordinate of the arc's end point.</dd>
     * <dd>Length of the ellipse's radius along the  x-axis.</dd>
     * <dd>Length of the ellipse's radius along the  y-axis.</dd>
     * <dd>Rotation angle.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_BEZIER
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_BEZIER figure segment" src="./images/segment_type_bezier.png"/>
     * 
     * </td>
     * <td>
     * Six data values:
     * 
     * <dl>
     * <dd>x-coordinate of the Bezier curve's first control point.</dd>
     * <dd>y-coordinate of the Bezier curve's first control point.</dd>
     * <dd>x-coordinate of the Bezier curve's second control point.</dd>
     * <dd>y-coordinate of the Bezier curve's second control point.</dd>
     * <dd>x-coordinate of the Bezier curve's end point.</dd>
     * <dd>y-coordinate of the Bezier curve's end point.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_QUADRATIC_BEZIER
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_QUADRATIC_BEZIER figure segment" src="./images/segment_type_quad_bezier.png"/>
     * 
     * </td>
     * <td>
     * Four data values:
     * 
     * <dl>
     * <dd>x-coordinate of the Quad Bezier curve's control point.</dd>
     * <dd>y-coordinate of the Quad Bezier curve's control point.</dd>
     * <dd>x-coordinate of the Quad Bezier curve's end point.</dd>
     * <dd>y-coordinate of the Quad Bezier curve's end point.</dd>
     * </dl>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following code example accesses the different data points of each segment type  in a geometry figure.
     * 
     * 
     * ```cpp
     *     // currentFigure is the pointer to an IXpsOMGeometryFigure
     *     // that contains the segment data to examine
     * 
     *     HRESULT             hr = S_OK;
     *     UINT32              numSegments = 0;
     *     UINT32              numSegmentDataPoints = 0;
     *     XPS_SEGMENT_TYPE    *segmentTypes = NULL;
     *     FLOAT               *segmentDataPoints = NULL;
     *     BOOL                *segmentStrokes = NULL;
     * 
     *     // get number of segments in this figure
     *     hr = currentFigure->GetSegmentCount (&numSegments);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // allocate array for segment data types
     *         segmentTypes = new (std::nothrow) XPS_SEGMENT_TYPE[numSegments];
     *         if (segmentTypes == NULL) { hr = E_OUTOFMEMORY; }
     *     }
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // allocate array for segment strokes
     *         segmentStrokes = new (std::nothrow) BOOL[numSegments];
     *         if (segmentStrokes == NULL) { hr = E_OUTOFMEMORY; }
     *     }
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // get array of segment data types
     *         hr = currentFigure->GetSegmentTypes (&numSegments, segmentTypes);
     *     }
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // get size of segment data array
     *         hr = currentFigure->GetSegmentDataCount (&numSegmentDataPoints);
     *     }
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // get array to hold segment data points
     *         segmentDataPoints = new (std::nothrow) FLOAT[numSegmentDataPoints];
     *         if (segmentDataPoints == NULL) { hr = E_OUTOFMEMORY; }
     *     }
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // get segment data points
     *         hr = currentFigure->GetSegmentData (
     *             &numSegmentDataPoints, segmentDataPoints);
     *     }
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // process segment data
     *         UINT32           thisSegment = 0;
     *         XPS_SEGMENT_TYPE *thisSegmentType = segmentTypes;
     *         XPS_SEGMENT_TYPE *lastSegmentType = NULL;
     *         FLOAT            *thisSegmentDataPoint = segmentDataPoints;
     *         FLOAT            *lastSegmentsDataPoint = NULL;
     * 
     *         // points to element just after valid array
     *         // valid pointers are < this value and  >= &segmentTypes[0]
     *         lastSegmentType = &segmentTypes[numSegments]; 
     *         // points to element just after valid array
     *         // valid pointers are < this value and >= &segmentDataPoints[0]
     *         lastSegmentsDataPoint = &segmentDataPoints[numSegmentDataPoints];
     * 
     *         // look at each segment that was returned
     *         while (thisSegment < numSegments)
     *         {
     *             if ((thisSegmentType >= lastSegmentType) || 
     *                 (thisSegmentDataPoint >= lastSegmentsDataPoint))
     *             {
     *                 // the array data is not correct.
     *                 hr = E_UNEXPECTED;
     *                 break; // out of loop
     *             } 
     *             else
     *             {
     *                 // process the data based on the segment type
     *                 switch (*thisSegmentType) 
     *                 {
     *                     case    XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE:
     *                     case    XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE:
     *                     case    XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE:
     *                     case    XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE:
     *                         {
     *                         // 5 data points
     *                         FLOAT    arcEndPoint_x = *thisSegmentDataPoint++;
     *                         FLOAT    arcEndPoint_y = *thisSegmentDataPoint++;
     *                         FLOAT    radius_x = *thisSegmentDataPoint++;
     *                         FLOAT    radius_y = *thisSegmentDataPoint++;
     *                         FLOAT    angle = *thisSegmentDataPoint++;
     *                         // do something with these points
     *                         }
     *                         break;
     *                     case    XPS_SEGMENT_TYPE_BEZIER:
     *                         {
     *                         // 6 data points
     *                         FLOAT    controlPoint1_x = *thisSegmentDataPoint++;
     *                         FLOAT    controlPoint1_y = *thisSegmentDataPoint++;
     *                         FLOAT    controlPoint2_x = *thisSegmentDataPoint++;
     *                         FLOAT    controlPoint2_y = *thisSegmentDataPoint++;
     *                         FLOAT    endPoint_x = *thisSegmentDataPoint++;
     *                         FLOAT    endPoint_y = *thisSegmentDataPoint++;
     *                         // do something with these points
     *                         }
     *                         break;
     *                     case    XPS_SEGMENT_TYPE_LINE:
     *                         {
     *                         // 2 data points
     *                         FLOAT    endPoint_x = *thisSegmentDataPoint++;
     *                         FLOAT    endPoint_y = *thisSegmentDataPoint++;
     *                         // do something with these points
     *                         }
     *                         break;
     *                     case    XPS_SEGMENT_TYPE_QUADRATIC_BEZIER:
     *                         {
     *                         // 4 data points
     *                         FLOAT    controlPoint_x = *thisSegmentDataPoint++;
     *                         FLOAT    controlPoint_y = *thisSegmentDataPoint++;
     *                         FLOAT    endPoint_x = *thisSegmentDataPoint++;
     *                         FLOAT    endPoint_y = *thisSegmentDataPoint++;
     *                         // do something with these points
     *                         }
     *                         break;
     *                     default:
     *                         // unrecognized segment type
     *                         break;
     *                 }
     *                 // 
     *                 thisSegment++;
     *                 thisSegmentType++;
     *             }
     *         }
     *     }
     * 
     *     delete[] segmentTypes; segmentTypes = NULL;
     *     delete[] segmentStrokes; segmentStrokes = NULL;
     *     delete[] segmentDataPoints; segmentDataPoints = NULL;
     * 
     * ```
     * @param {Pointer<Integer>} dataCount The size of the array referenced by the <i>segmentData</i> parameter.
     * 
     * If the method returns successfully, <i>dataCount</i> will contain the number of elements returned in the array that is referenced by <i>segmentData</i>.
     * 
     * If <i>segmentData</i> is set to <b>NULL</b> when the method is called,   <i>dataCount</i> must be set to zero.
     * 
     *   If a <b>NULL</b> pointer is returned in <i>segmentData</i>, <i>dataCount</i> will contain the required buffer size as the number of elements.
     * @param {Pointer<Float>} segmentData The address of an array that has the same number of elements as specified in <i>dataCount</i>. This value can be set to <b>NULL</b> if the caller requires that the method return only the required buffer size in <i>dataCount</i>.
     * 
     * If the array is large enough, this method copies the segment data points into the array and  returns, in <i>dataCount</i>, the number of data points that are copied. If <i>segmentData</i> is set to <b>NULL</b> or references a buffer that is not large enough, a <b>NULL</b> pointer will be returned, no data will be copied, and <i>dataCount</i> will contain the  required buffer size specified as the number of elements.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The method succeeded.
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
     * <i>dataCount</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>segmentData</i> is <b>NULL</b> or references a buffer that is not large enough to receive the segment data. <i>dataCount</i> contains the required number of elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdata
     */
    GetSegmentData(dataCount, segmentData) {
        dataCountMarshal := dataCount is VarRef ? "uint*" : "ptr"
        segmentDataMarshal := segmentData is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, dataCountMarshal, dataCount, segmentDataMarshal, segmentData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the types of segments in the figure.
     * @remarks
     * For an example of how to use this method in a program, see the code example in <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdata">GetSegmentData</a>.
     * @param {Pointer<Integer>} segmentCount The size of the array that is referenced by <i>segmentTypes</i> (see below). This parameter must not be <b>NULL</b>.
     * 
     * If the method returns successfully, <i>segmentCount</i> will contain the number of elements that are returned in the array referenced by <i>segmentTypes</i>.
     * 
     * If <i>segmentTypes</i> is <b>NULL</b> when the method is called, <i>segmentCount</i> must be set to zero.
     * 
     *  If a <b>NULL</b> pointer is returned in <i>segmentTypes</i>, the value of  <i>segmentCount</i> will contain the required buffer size, specified as the number of elements.
     * @param {Pointer<Integer>} segmentTypes An array of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_type">XPS_SEGMENT_TYPE</a> values that has the same number of elements as specified in <i>segmentCount</i>. If the caller requires that only the specified buffer size be returned, set this value to <b>NULL</b>.
     * 
     * If the array is large enough, this method will copy the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_type">XPS_SEGMENT_TYPE</a> values into the array and return, in <i>segmentCount</i>, the number of the copied values. If <i>segmentTypes</i> is <b>NULL</b> or references a buffer that is  not large enough, a <b>NULL</b> pointer will be returned, no data will be copied, and  <i>segmentCount</i> will contain the required buffer size, which is specified as the number of elements.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
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
     * The method succeeded.
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
     * <i>segmentCount</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>segmentTypes</i> is <b>NULL</b> or references a buffer that is not large enough to receive the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_type">XPS_SEGMENT_TYPE</a> data. <i>segmentCount</i> contains the required number of elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmenttypes
     */
    GetSegmentTypes(segmentCount, segmentTypes) {
        segmentCountMarshal := segmentCount is VarRef ? "uint*" : "ptr"
        segmentTypesMarshal := segmentTypes is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, segmentCountMarshal, segmentCount, segmentTypesMarshal, segmentTypes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets stroke definitions for the figure's segments.
     * @param {Pointer<Integer>} segmentCount The size of the array that is referenced by <i>segmentStrokes</i>. This parameter must not be <b>NULL</b>.
     * 
     * If the method returns successfully, <i>segmentCount</i> will contain the number of elements that are returned in the array referenced by <i>segmentStrokes</i>.
     * 
     * If <i>segmentStrokes</i> is <b>NULL</b> when the method is called,   <i>segmentCount</i> must be set to zero.
     * 
     *   If a <b>NULL</b> pointer is returned in <i>segmentStrokes</i>, the value of  <i>segmentCount</i> will contain the required buffer size, specified as the number of elements.
     * @param {Pointer<BOOL>} segmentStrokes An array that has the same number of elements as specified in <i>segmentCount</i>. If the caller requires that this method return only the required buffer size, set this value to <b>NULL</b>.
     * 
     * If the array is large enough, this method copies the segment stroke values into the array and returns, in <i>segmentCount</i>, the number of copied segment stroke values. If <i>segmentData</i> is <b>NULL</b> or references a buffer that is  not large enough, a <b>NULL</b> pointer will be returned, no data will be copied, and  <i>segmentCount</i> will contain the required buffer size that is specified as the number of elements.
     * 
     * The following table shows the possible values of an element in the array that is referenced by <i>segmentStrokes</i>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The segment is stroked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The segment is not stroked.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
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
     * The method succeeded.
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
     * <i>segmentCount</i> is  <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>segmentStrokes</i> is <b>NULL</b> or references a buffer that is not large enough to receive the segment stroke data. <i>segmentCount</i> contains the required number of elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentstrokes
     */
    GetSegmentStrokes(segmentCount, segmentStrokes) {
        segmentCountMarshal := segmentCount is VarRef ? "uint*" : "ptr"
        segmentStrokesMarshal := segmentStrokes is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, segmentCountMarshal, segmentCount, segmentStrokesMarshal, segmentStrokes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the segment information and data points for segments in the figure.
     * @remarks
     * A geometry segment is described by the start point, the segment type, and additional parameters whose values are determined by the segment type. The coordinates for the start point of the first segment are a property of the geometry figure and are set by calling <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setstartpoint">SetStartPoint</a>. The start point of each subsequent segment is the end point of the preceding segment.
     * 
     * The number of data values that define a line segment depends on the segment type. The table that follows describes the specific set of required data values that must be used for each segment type. The values in the segment data array that is passed in the <i>segmentData</i>  parameter must correspond with the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_type">XPS_SEGMENT_TYPE</a> values in the array that is passed in the <i>segmentTypes</i> parameter. For example, if the first line segment has a segment type value of <b>XPS_SEGMENT_TYPE_LINE</b>, the first two data values in the <i>segmentData</i> array will be the x and y coordinates of the end point of  that segment; if the next segment has a segment type value of <b>XPS_SEGMENT_TYPE_BEZIER</b>, the next six values in the <i>segmentData</i> array will describe the characteristics of that segment; and so on for each line segment in the geometry figure.
     * 
     * <table>
     * <tr>
     * <th>Segment type</th>
     * <th>Required data values </th>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_LINE
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_LINE figure segment" src="./images/segment_type_line.png"/>
     * 
     * </td>
     * <td>
     * Two data values:
     * 
     * <dl>
     * <dd>x-coordinate of the segment line's end point.</dd>
     * <dd>y-coordinate of the segment line's end point.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE
     * 
     * <img alt="Diagram of an XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE figure segment." src="./images/segment_type_arc_lc.png"/>
     * 
     * </td>
     * <td>
     * Five data values:
     * 
     * <dl>
     * <dd>x-coordinate of the arc's end point.</dd>
     * <dd>y-coordinate of the arc's end point.</dd>
     * <dd>Length of the ellipse's radius along the  x-axis.</dd>
     * <dd>Length of the ellipse's radius along the  y-axis.</dd>
     * <dd>Rotation angle.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE figure segment" src="./images/segment_type_arc_sc.png"/>
     * 
     * </td>
     * <td>
     * Five data values:
     * 
     * <dl>
     * <dd>x-coordinate of the arc's end point.</dd>
     * <dd>y-coordinate of the arc's end point.</dd>
     * <dd>Length of the ellipse's radius along the  x-axis.</dd>
     * <dd>Length of the ellipse's radius along the  y-axis.</dd>
     * <dd>Rotation angle.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE
     * 
     * <img alt="Diagram of an XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE figure segment." src="./images/segment_type_arc_lcc.png"/>
     * 
     * </td>
     * <td>
     * Five data values:
     * 
     * <dl>
     * <dd>x-coordinate of the arc's end point.</dd>
     * <dd>y-coordinate of the arc's end point.</dd>
     * <dd>Length of the ellipse's radius along the  x-axis.</dd>
     * <dd>Length of the ellipse's radius along the  y-axis.</dd>
     * <dd>Rotation angle.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE figure segment" src="./images/segment_type_arc_scc.png"/>
     * 
     * </td>
     * <td>
     * Five data values:
     * 
     * <dl>
     * <dd>x-coordinate of the arc's end point.</dd>
     * <dd>y-coordinate of the arc's end point.</dd>
     * <dd>Length of the ellipse's radius along the  x-axis.</dd>
     * <dd>Length of the ellipse's radius along the  y-axis.</dd>
     * <dd>Rotation angle.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_BEZIER
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_BEZIER figure segment" src="./images/segment_type_bezier.png"/>
     * 
     * </td>
     * <td>
     * Six data values:
     * 
     * <dl>
     * <dd>x-coordinate of the Bezier curve's first control point.</dd>
     * <dd>y-coordinate of the Bezier curve's first control point.</dd>
     * <dd>x-coordinate of the Bezier curve's second control point.</dd>
     * <dd>y-coordinate of the Bezier curve's second control point.</dd>
     * <dd>x-coordinate of the Bezier curve's end point.</dd>
     * <dd>y-coordinate of the Bezier curve's end point.</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_SEGMENT_TYPE_QUADRATIC_BEZIER
     * 
     * <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_QUADRATIC_BEZIER figure segment" src="./images/segment_type_quad_bezier.png"/>
     * 
     * </td>
     * <td>
     * Four data values:
     * 
     * <dl>
     * <dd>x-coordinate of the Quad Bezier curve's control point.</dd>
     * <dd>y-coordinate of the Quad Bezier curve's control point.</dd>
     * <dd>x-coordinate of the Quad Bezier curve's end point.</dd>
     * <dd>y-coordinate of the Quad Bezier curve's end point.</dd>
     * </dl>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * To get the segment types in the figure, call <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmenttypes">GetSegmentTypes</a>.
     * 
     * The following code examples demonstrate one way to create and populate the buffers required by <b>SetSegments</b>.
     * 
     * In the first code example, the <b>AddSegmentDataToArrays</b> method takes the data points that describe a single segment and stores them in the three different data buffers required by the <b>SetSegments</b> method. The data buffers that are passed as arguments to  <b>AddSegmentDataToArrays</b> are managed by the calling method as shown in the code example that follows <b>AddSegmentDataToArrays</b>.
     * 
     * 
     * ```cpp
     * HRESULT
     * AddSegmentDataToArrays(
     *     XPS_SEGMENT_TYPE        segmentType,
     *     BOOL                    segmentStroke,
     *     FLOAT                   *segmentPoints,
     *     UINT32                  *segmentsAvailable,
     *     UINT32                  *segmentPointsAvailable,
     *     XPS_SEGMENT_TYPE        **segmentTypeBuffer,
     *     BOOL                    **segmentStrokeBuffer,
     *     FLOAT                   **segmentPointBuffer
     * )
     * //
     * Description:
     * 
     * Populates the buffers required by IXpsOMGeometryFigure::SetSegmentData
     * using data and buffers provided by the calling method.
     * 
     * Parameters:
     * 
     * segmentType
     *     IN: XPS_SEGMENT_TYPE value that specifies the segment type for
     *         the current segment.
     * 
     * segmentStroke
     *     IN: BOOL value that specifies whether the current segment 
     *         is stroked.
     * 
     * *segmentPoints
     *     IN: pointer to an array of FLOAT values that specify the 
     *         segment's data points. The number of values in the array
     *         depend on the value of the segmentType parameter.
     * 
     * *segmentsAvailable
     *     IN: the number of values that remain unused in the
     *         segmentTypeBuffer and the segmentStrokeBuffer.
     *         This value must be >= 1 when calling the method.
     *     OUT:  the number of values that remain unused in the
     *         segmentTypeBuffer and the segmentStrokeBuffer after
     *         segmentType and segmentStroke have been added. If the 
     *         method was successful, the returned value is one less 
     *         than the value passed in to the method.
     * 
     * *segmentPointsAvailable
     *     IN: the number of values that remain unused in the
     *         segmentPointBuffer.    This value must be greater-than or equal
     *         to the number of points required by the segmentType value.
     *     OUT:  the number of values that remain unused in the
     *         segmentPointBuffer after the segmentPoints have been added.
     *         The returned value depends on the segmentType value.
     * 
     * **segmentTypeBuffer
     *     IN: the first free element in the buffer that receives the segment
     *         type values.
     *     OUT: the first free element in the buffer that receives the segment
     *         type values. If the method is successful, this will be the element
     *         after the element pointed to by this value before the method 
     *         was called.
     * 
     * **segmentStrokeBuffer
     *     IN: the first free element in the buffer that receives the segment
     *         stroke values.
     *     OUT: the first free element in the buffer that receives the segment
     *         stroke values. If the method is successful, this will be the element
     *         after the element pointed to by this value before the method 
     *         was called.
     * 
     * **segmentPointBuffer
     *     IN: the first free element in the buffer that receives the segment
     *         point values.
     *     OUT: the first free element in the buffer that receives the segment
     *         point values. If the method is successful, the element referenced
     *         by this value will depend on the segment type.
     * 
     * Remarks.
     * 1) the buffers and values passed into this method are managed by
     *     the calling method.
     * 
     * 2) if the value returned in segmentsAvailable is 0, segmentTypeBuffer
     *     and segmentStrokeBuffer point to invalid memory.
     * 
     * 3) if the value returned in segmentPointsAvailable is 0, segmentPointBuffer
     *     point to invalid memory.
     * 
     * 
     * {
     *     HRESULT hr = S_OK;
     * 
     *     // test to see if there is sufficient space in the 
     *     // segmentTypeBuffer and the segmentStrokeBuffer before
     *     // proceeding
     *     if (*segmentsAvailable == 0)
     *     {
     *         hr = HRESULT_FROM_WIN32(ERROR_MORE_DATA);
     *     }
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // process the data based on the segment type
     *         switch (segmentType) 
     *         {
     *             case    XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE:
     *             case    XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE:
     *             case    XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE:
     *             case    XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE:
     *                 if (*segmentPointsAvailable >= 5) 
     *                 {
     *                     // 5 data points
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<arc end point (x)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<arc end point (y)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<arc radius (x)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<arc radius (y)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<arc angle
     *                     *segmentPointsAvailable -= 5;
     *                 }
     *                 else
     *                 {
     *                     hr = HRESULT_FROM_WIN32(ERROR_MORE_DATA);
     *                 }
     *                 break;
     *             case    XPS_SEGMENT_TYPE_BEZIER:
     *                 if (*segmentPointsAvailable >= 6) 
     *                 {
     *                     // 6 data points
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<control point 1 (x)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<control point 1 (y)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<control point 2 (x)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<control point 2 (y)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<end point (x)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<end point (y)
     *                     *segmentPointsAvailable -= 6;
     *                 }
     *                 else
     *                 {
     *                     hr = HRESULT_FROM_WIN32(ERROR_MORE_DATA);
     *                 }
     *                 break;
     *             case    XPS_SEGMENT_TYPE_LINE:
     *                 if (*segmentPointsAvailable >= 2) 
     *                 {
     *                     // 2 data points
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<end point (x)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<end point (y)
     *                     *segmentPointsAvailable -= 2;
     *                 }
     *                 else
     *                 {
     *                     hr = HRESULT_FROM_WIN32(ERROR_MORE_DATA);
     *                 }
     *                 break;
     *             case    XPS_SEGMENT_TYPE_QUADRATIC_BEZIER:
     *                 if (*segmentPointsAvailable >= 4) 
     *                 {
     *                     // 4 data points
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<control point 2 (x)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<control point 2 (y)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<end point (x)
     *                     *(*segmentPointBuffer)++ = *segmentPoints++; //<end point (y)
     *                     *segmentPointsAvailable -= 4;
     *                 }
     *                 else
     *                 {
     *                     hr = HRESULT_FROM_WIN32(ERROR_MORE_DATA);
     *                 }
     *                 break;
     *             default:
     *                 // unrecognized segment type
     *                 hr = E_UNEXPECTED;
     *                 break;
     *         }
     * 
     *     }
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // Copy segment type and segment stroke values
     *         // to array and decrement number of array values
     *         // that remain unused.
     *         //
     *         // The space available for these operations was
     *         // tested at the beginning of the method.
     *         *(*segmentTypeBuffer)++ = segmentType;
     *         *(*segmentStrokeBuffer)++ = segmentStroke;
     *         *segmentsAvailable--;
     *     } 
     * 
     *     return hr;
     * }
     * 
     * ```
     * 
     * 
     * In this code example, <b>UpdateSegmentData</b> creates the data buffers required by the <b>SetSegments</b> method and calls the <b>AddSegmentDataToArrays</b> method from the preceding code example to populate them with the segment data. After the buffers have been populated, <b>SetSegments</b> is called to add this data to the geometry figure. <div class="alert"><b>Note</b>  The actual segment data is not shown in these code examples.</div>
     * <div> </div>
     * 
     * 
     * 
     * ```cpp
     * HRESULT
     * UpdateSegmentData (
     *     IXpsOMGeometryFigure    *geometryFigure,
     *     UINT32                  segmentCount,
     *     UINT32                  segmentDataCount
     * )
     * //
     *     Note that this method is not complete and only includes
     *     the code necessary to show how the SetSegments call is used.
     * 
     *     In this sample, the geometryFigure, segmentCount, and
     *     segmentDataCount values are assumed to have been initialized
     *     outside of this example.
     * 
     * {
     *     HRESULT             hr = S_OK;
     *     XPS_SEGMENT_TYPE    segmentType = (XPS_SEGMENT_TYPE)0;
     *     BOOL                segmentStroke = FALSE;
     *     FLOAT               segmentPoints = 0;
     *     UINT32              segmentsAvailable = 0;
     *     UINT32              segmentPointsAvailable = 0;
     *     // these buffers are sized and allocated based on 
     *     //    the segment data to store.
     *     XPS_SEGMENT_TYPE    *segmentTypeBuffer = NULL;
     *     BOOL                *segmentStrokeBuffer = NULL;
     *     FLOAT               *segmentPointBuffer = NULL;
     * 
     *     XPS_SEGMENT_TYPE    *nextSegmentTypeValue = NULL;
     *     BOOL                *nextSegmentStrokeValue = NULL;
     *     FLOAT               *nextSegmentPointValue = NULL;
     * 
     *     // segment data is created outside of this example
     * 
     *     // allocate buffers as required using information 
     *     // from segment data. This can be dynamic or static
     *     // depending on how the segment information is managed.
     *     // This example assumes that the segment information 
     *     // does not change during this method.
     * 
     *     // initialize "next" pointers to point to the first
     *     // element in each array.
     *     nextSegmentTypeValue = segmentTypeBuffer;
     *     nextSegmentStrokeValue = segmentStrokeBuffer;
     *     nextSegmentPointValue = segmentPointBuffer;
     * 
     *     // for each segment in the figure, add the 
     *     // segment data to the buffers
     * 
     *         hr = AddSegmentDataToArrays(
     *                 segmentType,
     *                 segmentStroke,
     *                 &segmentPoints,
     *                 &segmentsAvailable,
     *                 &segmentPointsAvailable,
     *                 &nextSegmentTypeValue,
     *                 &nextSegmentStrokeValue,
     *                 &nextSegmentPointValue);
     *         
     *     if (SUCCEEDED(hr))
     *     {
     *         // set segment data
     *         hr = geometryFigure->SetSegments (
     *             segmentCount,
     *             segmentDataCount,
     *             segmentTypeBuffer,
     *             segmentPointBuffer,
     *             segmentStrokeBuffer);
     *     }
     *     // clean up buffers
     * 
     *     return hr;
     * }
     * 
     * ```
     * @param {Integer} segmentCount The number of segments.
     * 
     * This value is also the number of elements in the arrays that are referenced by <i>segmentTypes</i> and <i>segmentStrokes</i>.
     * @param {Integer} segmentDataCount The number of segment data points.
     * 
     * This value is also the number of elements in the array that is referenced by <i>segmentData</i>.
     * @param {Pointer<Integer>} segmentTypes An array of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_type">XPS_SEGMENT_TYPE</a> variables. The value of <i>segmentCount</i> specifies the number of elements in this array.
     * @param {Pointer<Float>} segmentData An array of segment data values. The value of <i>segmentDataCount</i> specifies the number of elements in this array.
     * @param {Pointer<BOOL>} segmentStrokes An array of segment stroke values. The value of <i>segmentCount</i> specifies the number of elements in this array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The method succeeded.
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
     * <i>segmentTypes</i> contains a value of unrecognized type. 
     * 
     * Alternatively, the number of entries in the <i>segmentData</i> array is greater than the number  of entries in the <i>segmentTypes</i> array.
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
     * <i>segmentTypes</i>, <i>segmentData</i>, or <i>segmentStrokes</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_FLOAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>segmentData</i> contains a <b>FLOAT</b> value that is infinite or is not a number (NAN).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_MISSING_SEGMENT_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array that is passed in <i>segmentData</i> has fewer entries than the array passed in <i>segmentTypes</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NEGATIVE_FLOAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry in the array that is passed in <i>segmentData</i> contains a negative value, but it must contain a  non-negative value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setsegments
     */
    SetSegments(segmentCount, segmentDataCount, segmentTypes, segmentData, segmentStrokes) {
        segmentTypesMarshal := segmentTypes is VarRef ? "int*" : "ptr"
        segmentDataMarshal := segmentData is VarRef ? "float*" : "ptr"
        segmentStrokesMarshal := segmentStrokes is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", segmentCount, "uint", segmentDataCount, segmentTypesMarshal, segmentTypes, segmentDataMarshal, segmentData, segmentStrokesMarshal, segmentStrokes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the starting point of the figure.
     * @remarks
     * In the document markup, the value returned in <i>startPoint</i> corresponds to that of the <b>StartPoint</b> attribute of the <b>PathFigure</b> element.
     * @returns {XPS_POINT} The coordinates of the starting point of the figure.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getstartpoint
     */
    GetStartPoint() {
        startPoint := XPS_POINT()
        result := ComCall(8, this, "ptr", startPoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return startPoint
    }

    /**
     * Sets the starting point of the figure.
     * @param {Pointer<XPS_POINT>} startPoint The coordinates of the starting point of the figure.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The method succeeded.
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
     * <i>startPoint</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_FLOAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the fields in  the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure that is passed in <i>startPoint</i> contains a value that is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setstartpoint
     */
    SetStartPoint(startPoint) {
        result := ComCall(9, this, "ptr", startPoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a value that indicates whether the figure is closed.
     * @remarks
     * This value only applies if the <b>PathFigure</b> attribute is used in the <b>Path</b> element that specifies a stroke.
     * 
     *  A closed figure adds  a line segment between the start point and the end point of the figure to close the shape.
     * 
     * This value corresponds to that of the <b>IsClosed</b> element   of the <b>PathFigure</b> element in the document markup.
     * @returns {BOOL} The Boolean value that indicates whether the figure is closed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The figure is closed. The line segment between the start and end points  of the figure will be stroked to close the shape.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The figure is open.  No line segment will be stroked between the start and end points  of the figure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getisclosed
     */
    GetIsClosed() {
        result := ComCall(10, this, "int*", &isClosed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isClosed
    }

    /**
     * Sets a value that indicates whether the figure is closed.
     * @remarks
     * This value only applies if the <b>PathFigure</b> attribute is used in the <b>Path</b> element that specifies a stroke.
     * 
     *  A closed figure adds  a line segment between the start point and the end point of the figure to close the shape.
     * 
     * This value corresponds to that of the <b>IsClosed</b> element   of the <b>PathFigure</b> element in the document markup.
     * @param {BOOL} isClosed The value to be set.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The figure is closed. A line segment between the start point and the last point defined in the figure will be stroked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The figure is open. There is no line segment between the start point and the last point defined in the figure.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setisclosed
     */
    SetIsClosed(isClosed) {
        result := ComCall(11, this, "int", isClosed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a value that indicates whether the figure is filled.
     * @remarks
     * This value corresponds to that of the <b>IsFilled</b> attribute of the <b>PathFigure</b> element in the document markup.
     * @returns {BOOL} The Boolean value that indicates whether the figure is filled.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The figure is filled by a brush.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The figure is not filled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getisfilled
     */
    GetIsFilled() {
        result := ComCall(12, this, "int*", &isFilled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isFilled
    }

    /**
     * Sets a value that indicates whether the figure is filled.
     * @remarks
     * In the document markup, the value returned in <i>isFilled</i>  corresponds to that of the <b>IsFilled</b> attribute of the <b>PathFigure</b> element.
     * @param {BOOL} isFilled The value to be set.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The figure is filled by a brush.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The figure is not filled.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setisfilled
     */
    SetIsFilled(isFilled) {
        result := ComCall(13, this, "int", isFilled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the number of segments in the figure.
     * @remarks
     * For an example of how to use this method in a program, see the code example in <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdata">GetSegmentData</a>.
     * @returns {Integer} The number of segments in the figure.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentcount
     */
    GetSegmentCount() {
        result := ComCall(14, this, "uint*", &segmentCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return segmentCount
    }

    /**
     * Gets the number of segment data points in the figure.
     * @remarks
     * To get the segment data points, call <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdata">GetSegmentData</a>.
     * 
     * For an example of how to use this method in a program, see the code example in <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdata">GetSegmentData</a>.
     * @returns {Integer} The number of segment data points. <i>segmentDataCount</i> must not be <b>NULL</b> when the method is called.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdatacount
     */
    GetSegmentDataCount() {
        result := ComCall(15, this, "uint*", &segmentDataCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return segmentDataCount
    }

    /**
     * Gets the XPS_SEGMENT_STROKE_PATTERN value that indicates whether the segments in the figure are stroked.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_stroke_pattern">XPS_SEGMENT_STROKE_PATTERN</a> value that indicates whether the segments in the figure are stroked.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentstrokepattern
     */
    GetSegmentStrokePattern() {
        result := ComCall(16, this, "int*", &segmentStrokePattern := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return segmentStrokePattern
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMGeometryFigure.Clone)
     * @remarks
     * The owner of the copy is <b>NULL</b>.
     * @returns {IXpsOMGeometryFigure} A pointer to the copy of the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-clone
     */
    Clone() {
        result := ComCall(17, this, "ptr*", &geometryFigure := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMGeometryFigure(geometryFigure)
    }
}
