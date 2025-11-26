#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Geometry.ahk

/**
 * Represents a composite geometry, composed of other ID2D1Geometry objects.
 * @remarks
 * 
 * Geometry groups are a convenient way to group several geometries simultaneously so all figures of several distinct geometries are concatenated into one. 
 * 
 * <h3><a id="Creating_ID2D1GeometryGroup_Objects"></a><a id="creating_id2d1geometrygroup_objects"></a><a id="CREATING_ID2D1GEOMETRYGROUP_OBJECTS"></a>Creating ID2D1GeometryGroup Objects</h3>
 * To create a  <b>ID2D1GeometryGroup</b> object, call  the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-creategeometrygroup">ID2D1Factory::CreateGeometryGroup</a> method, passing in the <i>fillMode</i> with possible values of   <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_fill_mode">D2D1_FILL_MODE_ALTERNATE</a> (alternate) and <b>D2D1_FILL_MODE_WINDING</b>, an array of geometry objects to add to the geometry group, and the number of elements in this array. 
 * 
 * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1geometrygroup
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GeometryGroup extends ID2D1Geometry{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GeometryGroup
     * @type {Guid}
     */
    static IID => Guid("{2cd906a6-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFillMode", "GetSourceGeometryCount", "GetSourceGeometries"]

    /**
     * Indicates how the intersecting areas of the geometries contained in this geometry group are combined.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_fill_mode">D2D1_FILL_MODE</a></b>
     * 
     *  A value that indicates how the intersecting areas of the geometries contained in this geometry group are combined.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1geometrygroup-getfillmode
     */
    GetFillMode() {
        result := ComCall(17, this, "int")
        return result
    }

    /**
     * Indicates the number of geometry objects in the geometry group.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of geometries in the <a href="/windows/win32/api/d2d1/nn-d2d1-id2d1geometrygroup">ID2D1GeometryGroup</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1geometrygroup-getsourcegeometrycount
     */
    GetSourceGeometryCount() {
        result := ComCall(18, this, "uint")
        return result
    }

    /**
     * Retrieves the geometries in the geometry group.
     * @remarks
     * 
     * The returned geometries are referenced and  counted, and the caller must release them.
     * 
     * 
     * @param {Pointer<ID2D1Geometry>} geometries Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an array of geometries to be filled by this method. The length of the array is specified by the <i>geometryCount</i> parameter. If the array is <b>NULL</b>, then this method performs no operation. You must allocate the memory for this array.
     * @param {Integer} geometriesCount Type: <b>UINT</b>
     * 
     * A value indicating the number of geometries to return in the <i>geometries</i> array. If this value is less than the number of geometries in the geometry group, the remaining geometries are omitted. If this value is larger than the number of geometries in the geometry group, the extra geometries are set to <b>NULL</b>. To obtain the number of geometries currently in the geometry group, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1geometrygroup-getsourcegeometrycount">GetSourceGeometryCount</a> method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1geometrygroup-getsourcegeometries
     */
    GetSourceGeometries(geometries, geometriesCount) {
        ComCall(19, this, "ptr*", geometries, "uint", geometriesCount)
    }
}
