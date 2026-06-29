#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOverlayNotify.ahk" { IOverlayNotify }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * The IOverlayNotify2 interface derives from the IOverlayNotify interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ioverlaynotify2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IOverlayNotify2 extends IOverlayNotify {
    /**
     * The interface identifier for IOverlayNotify2
     * @type {Guid}
     */
    static IID := Guid("{680efa10-d535-11d1-87c8-00a0c9223196}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOverlayNotify2 interfaces
    */
    struct Vtbl extends IOverlayNotify.Vtbl {
        OnDisplayChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOverlayNotify2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnDisplayChange method provides notification that the exposed window area has changed.
     * @param {HMONITOR} _hMonitor Handle to the monitor used for displaying the overlay.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlaynotify2-ondisplaychange
     */
    OnDisplayChange(_hMonitor) {
        result := ComCall(7, this, HMONITOR, _hMonitor, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOverlayNotify2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDisplayChange := CallbackCreate(GetMethod(implObj, "OnDisplayChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDisplayChange)
    }
}
