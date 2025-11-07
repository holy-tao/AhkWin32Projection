#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Geometry.ahk

/**
 * Describes a rounded rectangle.
 * @remarks
 * 
 * <h3><a id="Creating_ID2D1RoundedRectangleGeometry_Objects"></a><a id="creating_id2d1roundedrectanglegeometry_objects"></a><a id="CREATING_ID2D1ROUNDEDRECTANGLEGEOMETRY_OBJECTS"></a>Creating ID2D1RoundedRectangleGeometry Objects</h3>
 * 
 * To create a rectangle geometry, use the <a href="https://docs.microsoft.com/windows/win32/direct2d/id2d1factory-createroundedrectanglegeometry">ID2D1Factory::CreateRoundedRectangleGeometry</a> method.
 * 
 * 
 * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1roundedrectanglegeometry
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1RoundedRectangleGeometry extends ID2D1Geometry{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1RoundedRectangleGeometry
     * @type {Guid}
     */
    static IID => Guid("{2cd906a3-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRoundedRect"]

    /**
     * 
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRect 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1roundedrectanglegeometry-getroundedrect
     */
    GetRoundedRect(roundedRect) {
        ComCall(17, this, "ptr", roundedRect)
    }
}
