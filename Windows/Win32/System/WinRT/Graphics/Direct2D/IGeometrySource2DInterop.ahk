#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Graphics\Direct2D\ID2D1Factory.ahk" { ID2D1Factory }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Graphics\Direct2D\ID2D1Geometry.ahk" { ID2D1Geometry }

/**
 * @namespace Windows.Win32.System.WinRT.Graphics.Direct2D
 */
export default struct IGeometrySource2DInterop extends IUnknown {
    /**
     * The interface identifier for IGeometrySource2DInterop
     * @type {Guid}
     */
    static IID := Guid("{0657af73-53fd-47cf-84ff-c8492d2a80a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGeometrySource2DInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGeometry                : IntPtr
        TryGetGeometryUsingFactory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGeometrySource2DInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ID2D1Geometry} 
     */
    GetGeometry() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return ID2D1Geometry(value)
    }

    /**
     * 
     * @param {ID2D1Factory} factory 
     * @returns {ID2D1Geometry} 
     */
    TryGetGeometryUsingFactory(factory) {
        result := ComCall(4, this, "ptr", factory, "ptr*", &value := 0, "HRESULT")
        return ID2D1Geometry(value)
    }

    Query(iid) {
        if (IGeometrySource2DInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGeometry := CallbackCreate(GetMethod(implObj, "GetGeometry"), flags, 2)
        this.vtbl.TryGetGeometryUsingFactory := CallbackCreate(GetMethod(implObj, "TryGetGeometryUsingFactory"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGeometry)
        CallbackFree(this.vtbl.TryGetGeometryUsingFactory)
    }
}
