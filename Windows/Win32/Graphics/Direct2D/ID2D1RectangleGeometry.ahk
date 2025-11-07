#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Geometry.ahk

/**
 * Describes a two-dimensional rectangle.
 * @remarks
 * 
 * <h3><a id="Creating_ID2D1RectangleGeometry_Objects"></a><a id="creating_id2d1rectanglegeometry_objects"></a><a id="CREATING_ID2D1RECTANGLEGEOMETRY_OBJECTS"></a>Creating ID2D1RectangleGeometry Objects</h3>
 * 
 * To create a rectangle geometry, use the <a href="https://docs.microsoft.com/windows/win32/direct2d/id2d1factory-createrectanglegeometry">ID2D1Factory::CreateRectangleGeometry</a> method.
 * 
 * 
 * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1rectanglegeometry
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1RectangleGeometry extends ID2D1Geometry{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1RectangleGeometry
     * @type {Guid}
     */
    static IID => Guid("{2cd906a2-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRect"]

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} rect 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rectanglegeometry-getrect
     */
    GetRect(rect) {
        ComCall(17, this, "ptr", rect)
    }
}
