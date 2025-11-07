#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Geometry.ahk

/**
 * Represents a geometry that has been transformed.
 * @remarks
 * 
 * Using an <b>ID2D1TransformedGeometry</b> rather than transforming a geometry by using a render target's transform enables you to transform a geometry without transforming its stroke.
 * 
 * <h3><a id="Creating_ID2D1TransformedGeometry_Objects"></a><a id="creating_id2d1transformedgeometry_objects"></a><a id="CREATING_ID2D1TRANSFORMEDGEOMETRY_OBJECTS"></a>Creating ID2D1TransformedGeometry Objects</h3>
 * To create an <b>ID2D1TransformedGeometry</b>, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createtransformedgeometry(id2d1geometry_constd2d1_matrix_3x2_f_id2d1transformedgeometry)">ID2D1Factory::CreateTransformedGeometry</a> method.
 * 
 * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1transformedgeometry
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1TransformedGeometry extends ID2D1Geometry{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1TransformedGeometry
     * @type {Guid}
     */
    static IID => Guid("{2cd906bb-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSourceGeometry", "GetTransform"]

    /**
     * 
     * @param {Pointer<ID2D1Geometry>} sourceGeometry 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1transformedgeometry-getsourcegeometry
     */
    GetSourceGeometry(sourceGeometry) {
        ComCall(17, this, "ptr*", sourceGeometry)
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1transformedgeometry-gettransform
     */
    GetTransform(transform) {
        ComCall(18, this, "ptr", transform)
    }
}
