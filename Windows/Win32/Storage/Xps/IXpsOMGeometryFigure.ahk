#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IXpsOMGeometry>} owner 
     * @returns {HRESULT} 
     */
    GetOwner(owner) {
        result := ComCall(3, this, "ptr", owner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} dataCount 
     * @param {Pointer<Single>} segmentData 
     * @returns {HRESULT} 
     */
    GetSegmentData(dataCount, segmentData) {
        result := ComCall(4, this, "uint*", dataCount, "float*", segmentData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} segmentCount 
     * @param {Pointer<Int32>} segmentTypes 
     * @returns {HRESULT} 
     */
    GetSegmentTypes(segmentCount, segmentTypes) {
        result := ComCall(5, this, "uint*", segmentCount, "int*", segmentTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} segmentCount 
     * @param {Pointer<BOOL>} segmentStrokes 
     * @returns {HRESULT} 
     */
    GetSegmentStrokes(segmentCount, segmentStrokes) {
        result := ComCall(6, this, "uint*", segmentCount, "ptr", segmentStrokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} segmentCount 
     * @param {Integer} segmentDataCount 
     * @param {Pointer<Int32>} segmentTypes 
     * @param {Pointer<Single>} segmentData 
     * @param {Pointer<BOOL>} segmentStrokes 
     * @returns {HRESULT} 
     */
    SetSegments(segmentCount, segmentDataCount, segmentTypes, segmentData, segmentStrokes) {
        result := ComCall(7, this, "uint", segmentCount, "uint", segmentDataCount, "int*", segmentTypes, "float*", segmentData, "ptr", segmentStrokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} startPoint 
     * @returns {HRESULT} 
     */
    GetStartPoint(startPoint) {
        result := ComCall(8, this, "ptr", startPoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} startPoint 
     * @returns {HRESULT} 
     */
    SetStartPoint(startPoint) {
        result := ComCall(9, this, "ptr", startPoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isClosed 
     * @returns {HRESULT} 
     */
    GetIsClosed(isClosed) {
        result := ComCall(10, this, "ptr", isClosed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} isClosed 
     * @returns {HRESULT} 
     */
    SetIsClosed(isClosed) {
        result := ComCall(11, this, "int", isClosed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isFilled 
     * @returns {HRESULT} 
     */
    GetIsFilled(isFilled) {
        result := ComCall(12, this, "ptr", isFilled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} isFilled 
     * @returns {HRESULT} 
     */
    SetIsFilled(isFilled) {
        result := ComCall(13, this, "int", isFilled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} segmentCount 
     * @returns {HRESULT} 
     */
    GetSegmentCount(segmentCount) {
        result := ComCall(14, this, "uint*", segmentCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} segmentDataCount 
     * @returns {HRESULT} 
     */
    GetSegmentDataCount(segmentDataCount) {
        result := ComCall(15, this, "uint*", segmentDataCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} segmentStrokePattern 
     * @returns {HRESULT} 
     */
    GetSegmentStrokePattern(segmentStrokePattern) {
        result := ComCall(16, this, "int*", segmentStrokePattern, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGeometryFigure>} geometryFigure 
     * @returns {HRESULT} 
     */
    Clone(geometryFigure) {
        result := ComCall(17, this, "ptr", geometryFigure, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
