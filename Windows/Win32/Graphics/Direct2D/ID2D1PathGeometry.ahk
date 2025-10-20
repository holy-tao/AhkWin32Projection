#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Geometry.ahk

/**
 * Represents a complex shape that may be composed of arcs, curves, and lines.
 * @remarks
 * 
  * An <b>ID2D1PathGeometry</b> object enables you to describe a geometric path. To describe an <b>ID2D1PathGeometry</b>  object's path, use the object's  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1pathgeometry-open">Open</a> method to retrieve an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometrysink">ID2D1GeometrySink</a>. Use the sink to populate the path geometry with figures and segments. 
  * 
  * <h3><a id="Creating_ID2D1PathGeometry_Objects"></a><a id="creating_id2d1pathgeometry_objects"></a><a id="CREATING_ID2D1PATHGEOMETRY_OBJECTS"></a>Creating ID2D1PathGeometry Objects</h3>
  * To create a path geometry, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createpathgeometry">ID2D1Factory::CreatePathGeometry</a>  method.   
  * 
  * <b>ID2D1PathGeometry</b> objects are device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>. 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1pathgeometry
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1PathGeometry extends ID2D1Geometry{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1PathGeometry
     * @type {Guid}
     */
    static IID => Guid("{2cd906a5-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Stream", "GetSegmentCount", "GetFigureCount"]

    /**
     * 
     * @param {Pointer<ID2D1GeometrySink>} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1pathgeometry-open
     */
    Open(geometrySink) {
        result := ComCall(17, this, "ptr*", geometrySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1GeometrySink} geometrySink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1pathgeometry-stream
     */
    Stream(geometrySink) {
        result := ComCall(18, this, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1pathgeometry-getsegmentcount
     */
    GetSegmentCount(count) {
        result := ComCall(19, this, "uint*", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1pathgeometry-getfigurecount
     */
    GetFigureCount(count) {
        result := ComCall(20, this, "uint*", count, "HRESULT")
        return result
    }
}
