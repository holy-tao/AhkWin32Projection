#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1StrokeStyle.ahk" { ID2D1StrokeStyle }
#Import ".\D2D1_STROKE_TRANSFORM_TYPE.ahk" { D2D1_STROKE_TRANSFORM_TYPE }

/**
 * Describes the caps, miter limit, line join, and dash information for a stroke. (ID2D1StrokeStyle1)
 * @remarks
 * This interface adds functionality to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1strokestyle1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1StrokeStyle1 extends ID2D1StrokeStyle {
    /**
     * The interface identifier for ID2D1StrokeStyle1
     * @type {Guid}
     */
    static IID := Guid("{10a72a66-e91c-43f4-993f-ddf4b82b0b4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1StrokeStyle1 interfaces
    */
    struct Vtbl extends ID2D1StrokeStyle.Vtbl {
        GetStrokeTransformType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1StrokeStyle1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the stroke transform type.
     * @returns {D2D1_STROKE_TRANSFORM_TYPE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_stroke_transform_type">D2D1_STROKE_TRANSFORM_TYPE</a></b>
     * 
     * This method returns the stroke transform type.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1strokestyle1-getstroketransformtype
     */
    GetStrokeTransformType() {
        result := ComCall(13, this, D2D1_STROKE_TRANSFORM_TYPE)
        return result
    }

    Query(iid) {
        if (ID2D1StrokeStyle1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStrokeTransformType := CallbackCreate(GetMethod(implObj, "GetStrokeTransformType"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStrokeTransformType)
    }
}
