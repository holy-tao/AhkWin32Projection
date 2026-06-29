#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IConsolePowerSink interface monitors and responds to power management messages.
 * @remarks
 * To receive power management notifications, your snap-in must use the <a href="https://docs.microsoft.com/previous-versions/26k10xyy(v=vs.140)">AtlAdvise</a> function to associate an instance of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsolepower">IConsolePower</a> interface with your implementation of the 
 * <b>IConsolePowerSink</b> interface. The following code example shows how to use the <a href="https://docs.microsoft.com/previous-versions/26k10xyy(v=vs.140)">AtlAdvise</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iconsolepowersink
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IConsolePowerSink extends IUnknown {
    /**
     * The interface identifier for IConsolePowerSink
     * @type {Guid}
     */
    static IID := Guid("{3333759f-fe4f-4975-b143-fec0a5dd6d65}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConsolePowerSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnPowerBroadcast : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConsolePowerSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnPowerBroadcast method processes WM_POWERBROADCAST notification messages related to the computer's power management.
     * @param {Integer} nEvent 
     * @param {LPARAM} _lParam Function-specific data. For most events, this parameter is reserved and not used. However, if <i>nEvent</i> is one of the resume events (PBT_APMRESUME*), the <i>lParam</i> parameter can specify the PBTF_APMRESUMEFROMFAILURE flag. This flag indicates that a suspend operation failed after the <a href="https://docs.microsoft.com/windows/desktop/Power/pbt-apmsuspend">PBT_APMSUSPEND</a> event was broadcast.
     * @returns {LRESULT} On return, the snap-in's response to the broadcast event. Generally, set *<i>plReturn</i> to <b>TRUE</b>. The exception is when <i>nEvent</i> is 
     * <a href="https://docs.microsoft.com/windows/desktop/Power/pbt-apmquerysuspend">PBT_APMQUERYSUSPEND</a>. To allow the computer suspension to continue in response to the PBT_APMQUERYSUSPEND event, set *<i>plReturn</i> to <b>TRUE</b>; to deny the computer suspension, set *<i>plReturn</i> to BROADCAST_QUERY_DENY. A snap-in that permits computer suspension should perform necessary suspension preparations before returning from this method.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolepowersink-onpowerbroadcast
     */
    OnPowerBroadcast(nEvent, _lParam) {
        result := ComCall(3, this, "uint", nEvent, LPARAM, _lParam, LRESULT.Ptr, &plReturn := 0, "HRESULT")
        return plReturn
    }

    Query(iid) {
        if (IConsolePowerSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnPowerBroadcast := CallbackCreate(GetMethod(implObj, "OnPowerBroadcast"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnPowerBroadcast)
    }
}
