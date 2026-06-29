#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Transform.ahk" { ID2D1Transform }
#Import ".\ID2D1DrawInfo.ahk" { ID2D1DrawInfo }

/**
 * A specialized implementation of the Shantzis calculations to a transform implemented on the GPU.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1drawtransform
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1DrawTransform extends ID2D1Transform {
    /**
     * The interface identifier for ID2D1DrawTransform
     * @type {Guid}
     */
    static IID := Guid("{36bfdcb6-9739-435d-a30d-a653beff6a6f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1DrawTransform interfaces
    */
    struct Vtbl extends ID2D1Transform.Vtbl {
        SetDrawInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1DrawTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides the GPU render info interface to the transform implementation.
     * @remarks
     * The transform can maintain a  reference to this interface for its lifetime. If any properties change on the transform, it can apply these changes to the corresponding <i>drawInfo</i> interface. 
     * 
     * This is also used to determine that the corresponding nodes in the graph are dirty.
     * @param {ID2D1DrawInfo} drawInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1drawinfo">ID2D1DrawInfo</a>*</b>
     * 
     * The interface supplied back to the calling method to allow it to specify the GPU based transform pass.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Any HRESULT value can be returned when implementing this method. A failure will be returned from the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1DeviceContext::EndDraw</a> call.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1drawtransform-setdrawinfo
     */
    SetDrawInfo(drawInfo) {
        result := ComCall(7, this, "ptr", drawInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1DrawTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDrawInfo := CallbackCreate(GetMethod(implObj, "SetDrawInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDrawInfo)
    }
}
