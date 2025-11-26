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
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &owner := 0, "HRESULT")
        return IXpsOMGeometry(owner)
    }

    /**
     * Gets the segment data points for the geometry figure.
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
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdata
     */
    GetSegmentData(dataCount, segmentData) {
        dataCountMarshal := dataCount is VarRef ? "uint*" : "ptr"
        segmentDataMarshal := segmentData is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, dataCountMarshal, dataCount, segmentDataMarshal, segmentData, "HRESULT")
        return result
    }

    /**
     * Gets the types of segments in the figure.
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
     * <i>segmentTypes</i> is <b>NULL</b> or references a buffer that is not large enough to receive the <a href="/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_type">XPS_SEGMENT_TYPE</a> data. <i>segmentCount</i> contains the required number of elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmenttypes
     */
    GetSegmentTypes(segmentCount, segmentTypes) {
        segmentCountMarshal := segmentCount is VarRef ? "uint*" : "ptr"
        segmentTypesMarshal := segmentTypes is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, segmentCountMarshal, segmentCount, segmentTypesMarshal, segmentTypes, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentstrokes
     */
    GetSegmentStrokes(segmentCount, segmentStrokes) {
        segmentCountMarshal := segmentCount is VarRef ? "uint*" : "ptr"
        segmentStrokesMarshal := segmentStrokes is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, segmentCountMarshal, segmentCount, segmentStrokesMarshal, segmentStrokes, "HRESULT")
        return result
    }

    /**
     * Sets the segment information and data points for segments in the figure.
     * @param {Integer} segmentCount The number of segments.
     * 
     * This value is also the number of elements in the arrays that are referenced by <i>segmentTypes</i> and <i>segmentStrokes</i>.
     * @param {Integer} segmentDataCount The number of segment data points.
     * 
     * This value is also the number of elements in the array that is referenced by <i>segmentData</i>.
     * @param {Pointer<Integer>} segmentTypes An array of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_type">XPS_SEGMENT_TYPE</a> variables. The value of <i>segmentCount</i> specifies the number of elements in this array.
     * @param {Pointer<Float>} segmentData An array of segment data values. The value of <i>segmentDataCount</i> specifies the number of elements in this array.
     * @param {Pointer<BOOL>} segmentStrokes An array of segment stroke values. The value of <i>segmentCount</i> specifies the number of elements in this array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setsegments
     */
    SetSegments(segmentCount, segmentDataCount, segmentTypes, segmentData, segmentStrokes) {
        segmentTypesMarshal := segmentTypes is VarRef ? "int*" : "ptr"
        segmentDataMarshal := segmentData is VarRef ? "float*" : "ptr"
        segmentStrokesMarshal := segmentStrokes is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", segmentCount, "uint", segmentDataCount, segmentTypesMarshal, segmentTypes, segmentDataMarshal, segmentData, segmentStrokesMarshal, segmentStrokes, "HRESULT")
        return result
    }

    /**
     * Gets the starting point of the figure.
     * @returns {XPS_POINT} The coordinates of the starting point of the figure.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getstartpoint
     */
    GetStartPoint() {
        startPoint := XPS_POINT()
        result := ComCall(8, this, "ptr", startPoint, "HRESULT")
        return startPoint
    }

    /**
     * Sets the starting point of the figure.
     * @param {Pointer<XPS_POINT>} startPoint The coordinates of the starting point of the figure.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * One of the fields in  the <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure that is passed in <i>startPoint</i> contains a value that is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setstartpoint
     */
    SetStartPoint(startPoint) {
        result := ComCall(9, this, "ptr", startPoint, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the figure is closed.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getisclosed
     */
    GetIsClosed() {
        result := ComCall(10, this, "int*", &isClosed := 0, "HRESULT")
        return isClosed
    }

    /**
     * Sets a value that indicates whether the figure is closed.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setisclosed
     */
    SetIsClosed(isClosed) {
        result := ComCall(11, this, "int", isClosed, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the figure is filled.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getisfilled
     */
    GetIsFilled() {
        result := ComCall(12, this, "int*", &isFilled := 0, "HRESULT")
        return isFilled
    }

    /**
     * Sets a value that indicates whether the figure is filled.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setisfilled
     */
    SetIsFilled(isFilled) {
        result := ComCall(13, this, "int", isFilled, "HRESULT")
        return result
    }

    /**
     * Gets the number of segments in the figure.
     * @returns {Integer} The number of segments in the figure.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentcount
     */
    GetSegmentCount() {
        result := ComCall(14, this, "uint*", &segmentCount := 0, "HRESULT")
        return segmentCount
    }

    /**
     * Gets the number of segment data points in the figure.
     * @returns {Integer} The number of segment data points. <i>segmentDataCount</i> must not be <b>NULL</b> when the method is called.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdatacount
     */
    GetSegmentDataCount() {
        result := ComCall(15, this, "uint*", &segmentDataCount := 0, "HRESULT")
        return segmentDataCount
    }

    /**
     * Gets the XPS_SEGMENT_STROKE_PATTERN value that indicates whether the segments in the figure are stroked.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_stroke_pattern">XPS_SEGMENT_STROKE_PATTERN</a> value that indicates whether the segments in the figure are stroked.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentstrokepattern
     */
    GetSegmentStrokePattern() {
        result := ComCall(16, this, "int*", &segmentStrokePattern := 0, "HRESULT")
        return segmentStrokePattern
    }

    /**
     * Makes a deep copy of the interface.
     * @returns {IXpsOMGeometryFigure} A pointer to the copy of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-clone
     */
    Clone() {
        result := ComCall(17, this, "ptr*", &geometryFigure := 0, "HRESULT")
        return IXpsOMGeometryFigure(geometryFigure)
    }
}
