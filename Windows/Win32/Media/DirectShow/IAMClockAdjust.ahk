#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMClockAdjust interface adjusts the reference clock. The System Reference Clock exposes this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamclockadjust
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMClockAdjust extends IUnknown {
    /**
     * The interface identifier for IAMClockAdjust
     * @type {Guid}
     */
    static IID := Guid("{4d5466b0-a49c-11d1-abe8-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMClockAdjust interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetClockDelta : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMClockAdjust.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetClockDelta method adjusts the clock time.
     * @remarks
     * The time values returned by <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ireferenceclock-gettime">IReferenceClock::GetTime</a> are monotonically increasing. If you set the clock back, <b>GetTime</b> continues to report the old time until the internal clock catches up.
     * @param {Integer} rtDelta Specifies the amount by which to adjust the clock, as a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> value. A positive value moves the clock forward, and a negative value moves the clock backward.
     * @returns {HRESULT} Returns S_OK or an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamclockadjust-setclockdelta
     */
    SetClockDelta(rtDelta) {
        result := ComCall(3, this, "int64", rtDelta, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMClockAdjust.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetClockDelta := CallbackCreate(GetMethod(implObj, "SetClockDelta"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetClockDelta)
    }
}
