#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_ROUNDED_RECT.ahk" { D2D1_ROUNDED_RECT }
#Import ".\ID2D1Geometry.ahk" { ID2D1Geometry }

/**
 * Describes a rounded rectangle.
 * @remarks
 * <h3><a id="Creating_ID2D1RoundedRectangleGeometry_Objects"></a><a id="creating_id2d1roundedrectanglegeometry_objects"></a><a id="CREATING_ID2D1ROUNDEDRECTANGLEGEOMETRY_OBJECTS"></a>Creating ID2D1RoundedRectangleGeometry Objects</h3>
 * 
 * To create a rectangle geometry, use the <a href="https://docs.microsoft.com/windows/win32/direct2d/id2d1factory-createroundedrectanglegeometry">ID2D1Factory::CreateRoundedRectangleGeometry</a> method.
 * 
 * 
 * Direct2D geometries are immutable and device-independent resources created by <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.  In general, you should create geometries once and retain them for the life of the application, or until they need to be modified. For more information about device-independent and device-dependent resources, see  the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1roundedrectanglegeometry
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1RoundedRectangleGeometry extends ID2D1Geometry {
    /**
     * The interface identifier for ID2D1RoundedRectangleGeometry
     * @type {Guid}
     */
    static IID := Guid("{2cd906a3-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1RoundedRectangleGeometry interfaces
    */
    struct Vtbl extends ID2D1Geometry.Vtbl {
        GetRoundedRect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1RoundedRectangleGeometry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a rounded rectangle that describes this rounded rectangle geometry.
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRect Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_rounded_rect">D2D1_ROUNDED_RECT</a>*</b>
     * 
     * A pointer that receives a rounded rectangle that describes this rounded rectangle geometry. You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1roundedrectanglegeometry-getroundedrect
     */
    GetRoundedRect(roundedRect) {
        ComCall(17, this, D2D1_ROUNDED_RECT.Ptr, roundedRect)
    }

    Query(iid) {
        if (ID2D1RoundedRectangleGeometry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRoundedRect := CallbackCreate(GetMethod(implObj, "GetRoundedRect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRoundedRect)
    }
}
