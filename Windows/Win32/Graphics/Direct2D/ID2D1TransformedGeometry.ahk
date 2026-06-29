#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import ".\ID2D1Geometry.ahk" { ID2D1Geometry }

/**
 * Represents a geometry that has been transformed.
 * @remarks
 * Using an <b>ID2D1TransformedGeometry</b> rather than transforming a geometry by using a render target's transform enables you to transform a geometry without transforming its stroke.
 * 
 * <h3><a id="Creating_ID2D1TransformedGeometry_Objects"></a><a id="creating_id2d1transformedgeometry_objects"></a><a id="CREATING_ID2D1TRANSFORMEDGEOMETRY_OBJECTS"></a>Creating ID2D1TransformedGeometry Objects</h3>
 * To create an <b>ID2D1TransformedGeometry</b>, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createtransformedgeometry(id2d1geometry_constd2d1_matrix_3x2_f_id2d1transformedgeometry)">ID2D1Factory::CreateTransformedGeometry</a> method.
 * 
 * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1transformedgeometry
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1TransformedGeometry extends ID2D1Geometry {
    /**
     * The interface identifier for ID2D1TransformedGeometry
     * @type {Guid}
     */
    static IID := Guid("{2cd906bb-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1TransformedGeometry interfaces
    */
    struct Vtbl extends ID2D1Geometry.Vtbl {
        GetSourceGeometry : IntPtr
        GetTransform      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1TransformedGeometry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the source geometry of this transformed geometry object.
     * @param {Pointer<ID2D1Geometry>} sourceGeometry Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>**</b>
     * 
     * When this method returns, contains a pointer to a pointer to the source geometry for this transformed geometry object. This parameter is passed uninitialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1transformedgeometry-getsourcegeometry
     */
    GetSourceGeometry(sourceGeometry) {
        ComCall(17, this, ID2D1Geometry.Ptr, sourceGeometry)
    }

    /**
     * Retrieves the matrix used to transform the ID2D1TransformedGeometry object's source geometry.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * A pointer that receives the matrix used to transform the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1transformedgeometry">ID2D1TransformedGeometry</a> object's source geometry. You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1transformedgeometry-gettransform
     */
    GetTransform(transform) {
        ComCall(18, this, D2D_MATRIX_3X2_F.Ptr, transform)
    }

    Query(iid) {
        if (ID2D1TransformedGeometry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSourceGeometry := CallbackCreate(GetMethod(implObj, "GetSourceGeometry"), flags, 2)
        this.vtbl.GetTransform := CallbackCreate(GetMethod(implObj, "GetTransform"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSourceGeometry)
        CallbackFree(this.vtbl.GetTransform)
    }
}
