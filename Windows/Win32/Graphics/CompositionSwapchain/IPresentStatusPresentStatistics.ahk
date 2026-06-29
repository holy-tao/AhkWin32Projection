#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PresentStatus.ahk" { PresentStatus }
#Import ".\IPresentStatistics.ahk" { IPresentStatistics }

/**
 * Describes how a present was processed during a DWM-composed frame.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentstatuspresentstatistics
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct IPresentStatusPresentStatistics extends IPresentStatistics {
    /**
     * The interface identifier for IPresentStatusPresentStatistics
     * @type {Guid}
     */
    static IID := Guid("{c9ed2a41-79cb-435e-964e-c8553055420c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPresentStatusPresentStatistics interfaces
    */
    struct Vtbl extends IPresentStatistics.Vtbl {
        GetCompositionFrameId : IntPtr
        GetPresentStatus      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPresentStatusPresentStatistics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ID of the composition frame on which the present was processed, skipped, or canceled.
     * @returns {Integer} Type: **CompositionFrameId**
     * 
     * The ID of the composition frame on which the present was processed, skipped, or canceled.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentstatuspresentstatistics-getcompositionframeid
     */
    GetCompositionFrameId() {
        result := ComCall(5, this, Int64)
        return result
    }

    /**
     * Gets the status of the frame.
     * @returns {PresentStatus} Type: **[PresentStatus](ne-presentation-presentstatus.md)**
     * 
     * The status of the frame.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentstatuspresentstatistics-getpresentstatus
     */
    GetPresentStatus() {
        result := ComCall(6, this, PresentStatus)
        return result
    }

    Query(iid) {
        if (IPresentStatusPresentStatistics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCompositionFrameId := CallbackCreate(GetMethod(implObj, "GetCompositionFrameId"), flags, 1)
        this.vtbl.GetPresentStatus := CallbackCreate(GetMethod(implObj, "GetPresentStatus"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCompositionFrameId)
        CallbackFree(this.vtbl.GetPresentStatus)
    }
}
