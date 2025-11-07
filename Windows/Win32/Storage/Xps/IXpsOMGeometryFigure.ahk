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
     * 
     * @returns {IXpsOMGeometry} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &owner := 0, "HRESULT")
        return IXpsOMGeometry(owner)
    }

    /**
     * 
     * @param {Pointer<Integer>} dataCount 
     * @param {Pointer<Float>} segmentData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdata
     */
    GetSegmentData(dataCount, segmentData) {
        dataCountMarshal := dataCount is VarRef ? "uint*" : "ptr"
        segmentDataMarshal := segmentData is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, dataCountMarshal, dataCount, segmentDataMarshal, segmentData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} segmentCount 
     * @param {Pointer<Integer>} segmentTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmenttypes
     */
    GetSegmentTypes(segmentCount, segmentTypes) {
        segmentCountMarshal := segmentCount is VarRef ? "uint*" : "ptr"
        segmentTypesMarshal := segmentTypes is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, segmentCountMarshal, segmentCount, segmentTypesMarshal, segmentTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} segmentCount 
     * @param {Pointer<BOOL>} segmentStrokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentstrokes
     */
    GetSegmentStrokes(segmentCount, segmentStrokes) {
        segmentCountMarshal := segmentCount is VarRef ? "uint*" : "ptr"
        segmentStrokesMarshal := segmentStrokes is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, segmentCountMarshal, segmentCount, segmentStrokesMarshal, segmentStrokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} segmentCount 
     * @param {Integer} segmentDataCount 
     * @param {Pointer<Integer>} segmentTypes 
     * @param {Pointer<Float>} segmentData 
     * @param {Pointer<BOOL>} segmentStrokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setsegments
     */
    SetSegments(segmentCount, segmentDataCount, segmentTypes, segmentData, segmentStrokes) {
        segmentTypesMarshal := segmentTypes is VarRef ? "int*" : "ptr"
        segmentDataMarshal := segmentData is VarRef ? "float*" : "ptr"
        segmentStrokesMarshal := segmentStrokes is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", segmentCount, "uint", segmentDataCount, segmentTypesMarshal, segmentTypes, segmentDataMarshal, segmentData, segmentStrokesMarshal, segmentStrokes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XPS_POINT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getstartpoint
     */
    GetStartPoint() {
        startPoint := XPS_POINT()
        result := ComCall(8, this, "ptr", startPoint, "HRESULT")
        return startPoint
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} startPoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setstartpoint
     */
    SetStartPoint(startPoint) {
        result := ComCall(9, this, "ptr", startPoint, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getisclosed
     */
    GetIsClosed() {
        result := ComCall(10, this, "int*", &isClosed := 0, "HRESULT")
        return isClosed
    }

    /**
     * 
     * @param {BOOL} isClosed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setisclosed
     */
    SetIsClosed(isClosed) {
        result := ComCall(11, this, "int", isClosed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getisfilled
     */
    GetIsFilled() {
        result := ComCall(12, this, "int*", &isFilled := 0, "HRESULT")
        return isFilled
    }

    /**
     * 
     * @param {BOOL} isFilled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-setisfilled
     */
    SetIsFilled(isFilled) {
        result := ComCall(13, this, "int", isFilled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentcount
     */
    GetSegmentCount() {
        result := ComCall(14, this, "uint*", &segmentCount := 0, "HRESULT")
        return segmentCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentdatacount
     */
    GetSegmentDataCount() {
        result := ComCall(15, this, "uint*", &segmentDataCount := 0, "HRESULT")
        return segmentDataCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-getsegmentstrokepattern
     */
    GetSegmentStrokePattern() {
        result := ComCall(16, this, "int*", &segmentStrokePattern := 0, "HRESULT")
        return segmentStrokePattern
    }

    /**
     * 
     * @returns {IXpsOMGeometryFigure} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigure-clone
     */
    Clone() {
        result := ComCall(17, this, "ptr*", &geometryFigure := 0, "HRESULT")
        return IXpsOMGeometryFigure(geometryFigure)
    }
}
