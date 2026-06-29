#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINSAT_ASSESSMENT_STATE.ahk" { WINSAT_ASSESSMENT_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WINSAT_BITMAP_SIZE.ahk" { WINSAT_BITMAP_SIZE }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves elements that can be used in a user interface to graphically represent the WinSAT assessment.
 * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nn-winsatcominterfacei-iprovidewinsatvisuals
 * @namespace Windows.Win32.System.AssessmentTool
 */
export default struct IProvideWinSATVisuals extends IUnknown {
    /**
     * The interface identifier for IProvideWinSATVisuals
     * @type {Guid}
     */
    static IID := Guid("{a9f4ade0-871a-42a3-b813-3078d25162c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvideWinSATVisuals interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Bitmap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvideWinSATVisuals.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a bitmap for the WinSAT base score.
     * @remarks
     * The bitmap is returned only for the WINSAT_ASSESSMENT_STATE_VALID and WINSAT_ASSESSMENT_STATE_INCOHERENT_WITH_HARDWARE states. The method will succeed (return value is S_OK) if you pass another state value, but the <i>pBitmap</i> parameter will be <b>NULL</b>.
     * @param {WINSAT_BITMAP_SIZE} bitmapSize Determines the size of the bitmap that this method returns. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/winsatcominterfacei/ne-winsatcominterfacei-winsat_bitmap_size">WINSAT_BITMAP_SIZE</a> enumeration.
     * @param {WINSAT_ASSESSMENT_STATE} state The state of the assessment. To get this value, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentstate">IProvideWinSATResultsInfo::get_AssessmentState</a> method.
     * @param {Float} rating The base score for the computer. To get this value, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_systemrating">IProvideWinSATResultsInfo::get_SystemRating</a> method.
     * @returns {HBITMAP} The handle to the bitmap. To free the handle when finished, call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatvisuals-get_bitmap
     */
    get_Bitmap(bitmapSize, state, rating) {
        pBitmap := HBITMAP.Owned()
        result := ComCall(3, this, WINSAT_BITMAP_SIZE, bitmapSize, WINSAT_ASSESSMENT_STATE, state, "float", rating, HBITMAP.Ptr, pBitmap, "HRESULT")
        return pBitmap
    }

    Query(iid) {
        if (IProvideWinSATVisuals.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Bitmap := CallbackCreate(GetMethod(implObj, "get_Bitmap"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Bitmap)
    }
}
