#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Extends the IRealTimeStylus interface.
 * @remarks
 * This interface only exists in the Windows Vista <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus</a>. Flick notification is received via a <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-systemevent">IStylusPlugin::SystemEvent Method</a> plugin notification with event id equal to <b>ISG_Flick</b>. To obtain flick data look at the <b>SYSTEM_EVENT_DATA</b> struct: <i>xPos</i>/<i>yPos</i> contains the flick start location in Tablet coordinates, <i>wKey</i> contains the direction (a value where 90 is down, 180 is left, 270 is up), and <i>dwButtonState</i> contains the same data obtained from the <i>wParam</i> for the <a href="https://docs.microsoft.com/windows/desktop/tablet/wm-tablet-flick-message">WM_TABLET_FLICK Message</a>.
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/nn-rtscom-irealtimestylus2
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IRealTimeStylus2 extends IUnknown {
    /**
     * The interface identifier for IRealTimeStylus2
     * @type {Guid}
     */
    static IID := Guid("{b5f2a6cd-3179-4a3e-b9c4-bb5865962be2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRealTimeStylus2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_FlicksEnabled : IntPtr
        put_FlicksEnabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRealTimeStylus2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    FlicksEnabled {
        get => this.get_FlicksEnabled()
        set => this.put_FlicksEnabled(value)
    }

    /**
     * Returns a value indicating whether flick gestures are enabled for the RTS.
     * @returns {BOOL} <b>TRUE</b> if flick gestures have been enabled; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus2-get_flicksenabled
     */
    get_FlicksEnabled() {
        result := ComCall(3, this, BOOL.Ptr, &pfEnable := 0, "HRESULT")
        return pfEnable
    }

    /**
     * Indicates if flick gesture recognition is enabled.
     * @param {BOOL} fEnable <b>TRUE</b> to enable flicks gesture recognition; <b>FALSE</b> to disable flicks.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus2-put_flicksenabled
     */
    put_FlicksEnabled(fEnable) {
        result := ComCall(4, this, BOOL, fEnable, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRealTimeStylus2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FlicksEnabled := CallbackCreate(GetMethod(implObj, "get_FlicksEnabled"), flags, 2)
        this.vtbl.put_FlicksEnabled := CallbackCreate(GetMethod(implObj, "put_FlicksEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FlicksEnabled)
        CallbackFree(this.vtbl.put_FlicksEnabled)
    }
}
