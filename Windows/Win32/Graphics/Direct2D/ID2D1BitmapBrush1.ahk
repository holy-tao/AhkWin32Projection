#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_INTERPOLATION_MODE.ahk" { D2D1_INTERPOLATION_MODE }
#Import ".\ID2D1BitmapBrush.ahk" { ID2D1BitmapBrush }

/**
 * Paints an area with a bitmap. (ID2D1BitmapBrush1)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1bitmapbrush1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1BitmapBrush1 extends ID2D1BitmapBrush {
    /**
     * The interface identifier for ID2D1BitmapBrush1
     * @type {Guid}
     */
    static IID := Guid("{41343a53-e41a-49a2-91cd-21793bbb62e5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1BitmapBrush1 interfaces
    */
    struct Vtbl extends ID2D1BitmapBrush.Vtbl {
        SetInterpolationMode1 : IntPtr
        GetInterpolationMode1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1BitmapBrush1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the interpolation mode for the brush.
     * @param {D2D1_INTERPOLATION_MODE} _interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The mode to use.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1bitmapbrush1-setinterpolationmode1
     */
    SetInterpolationMode1(_interpolationMode) {
        ComCall(16, this, D2D1_INTERPOLATION_MODE, _interpolationMode)
    }

    /**
     * Returns the current interpolation mode of the brush.
     * @returns {D2D1_INTERPOLATION_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The current interpolation mode.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1bitmapbrush1-getinterpolationmode1
     */
    GetInterpolationMode1() {
        result := ComCall(17, this, D2D1_INTERPOLATION_MODE)
        return result
    }

    Query(iid) {
        if (ID2D1BitmapBrush1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInterpolationMode1 := CallbackCreate(GetMethod(implObj, "SetInterpolationMode1"), flags, 2)
        this.vtbl.GetInterpolationMode1 := CallbackCreate(GetMethod(implObj, "GetInterpolationMode1"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInterpolationMode1)
        CallbackFree(this.vtbl.GetInterpolationMode1)
    }
}
