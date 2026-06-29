#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Geometry.ahk" { ID2D1Geometry }
#Import ".\D2D1_ELLIPSE.ahk" { D2D1_ELLIPSE }

/**
 * Represents an ellipse.
 * @remarks
 * <h3><a id="Creating_ID2D1EllipseGeometry_Objects"></a><a id="creating_id2d1ellipsegeometry_objects"></a><a id="CREATING_ID2D1ELLIPSEGEOMETRY_OBJECTS"></a>Creating ID2D1EllipseGeometry Objects</h3>
 * To create an ellipse geometry, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createellipsegeometry(constd2d1_ellipse_id2d1ellipsegeometry)">ID2D1Factory::CreateEllipseGeometry</a> method.
 * 
 * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1ellipsegeometry
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1EllipseGeometry extends ID2D1Geometry {
    /**
     * The interface identifier for ID2D1EllipseGeometry
     * @type {Guid}
     */
    static IID := Guid("{2cd906a4-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1EllipseGeometry interfaces
    */
    struct Vtbl extends ID2D1Geometry.Vtbl {
        GetEllipse : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1EllipseGeometry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the D2D1_ELLIPSE structure that describes this ellipse geometry.
     * @param {Pointer<D2D1_ELLIPSE>} ellipse Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_ellipse">D2D1_ELLIPSE</a>*</b>
     * 
     * When this method returns, contains the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_ellipse">D2D1_ELLIPSE</a> that describes the size and position of the ellipse. You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1ellipsegeometry-getellipse
     */
    GetEllipse(ellipse) {
        ComCall(17, this, D2D1_ELLIPSE.Ptr, ellipse)
    }

    Query(iid) {
        if (ID2D1EllipseGeometry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEllipse := CallbackCreate(GetMethod(implObj, "GetEllipse"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEllipse)
    }
}
