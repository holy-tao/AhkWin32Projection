#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import ".\ID2D1Geometry.ahk" { ID2D1Geometry }

/**
 * Describes a two-dimensional rectangle.
 * @remarks
 * <h3><a id="Creating_ID2D1RectangleGeometry_Objects"></a><a id="creating_id2d1rectanglegeometry_objects"></a><a id="CREATING_ID2D1RECTANGLEGEOMETRY_OBJECTS"></a>Creating ID2D1RectangleGeometry Objects</h3>
 * 
 * To create a rectangle geometry, use the <a href="https://docs.microsoft.com/windows/win32/direct2d/id2d1factory-createrectanglegeometry">ID2D1Factory::CreateRectangleGeometry</a> method.
 * 
 * 
 * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rectanglegeometry
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1RectangleGeometry extends ID2D1Geometry {
    /**
     * The interface identifier for ID2D1RectangleGeometry
     * @type {Guid}
     */
    static IID := Guid("{2cd906a2-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1RectangleGeometry interfaces
    */
    struct Vtbl extends ID2D1Geometry.Vtbl {
        GetRect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1RectangleGeometry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the rectangle that describes the rectangle geometry's dimensions.
     * @param {Pointer<D2D_RECT_F>} _rect Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * Contains a pointer to a rectangle that describes the rectangle geometry's dimensions when this method returns. You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rectanglegeometry-getrect
     */
    GetRect(_rect) {
        ComCall(17, this, D2D_RECT_F.Ptr, _rect)
    }

    Query(iid) {
        if (ID2D1RectangleGeometry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRect := CallbackCreate(GetMethod(implObj, "GetRect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRect)
    }
}
