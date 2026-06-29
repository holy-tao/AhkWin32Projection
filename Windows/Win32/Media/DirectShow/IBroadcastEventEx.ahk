#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBroadcastEvent.ahk" { IBroadcastEvent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBroadcastEventEx)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ibroadcasteventex
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBroadcastEventEx extends IBroadcastEvent {
    /**
     * The interface identifier for IBroadcastEventEx
     * @type {Guid}
     */
    static IID := Guid("{3d9e3887-1929-423f-8021-43682de95448}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBroadcastEventEx interfaces
    */
    struct Vtbl extends IBroadcastEvent.Vtbl {
        FireEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBroadcastEventEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @remarks
     * This method is similar to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ibroadcastevent-fire">IBroadcastEvent::Fire</a>, but it includes four additional parameters for passing implementation-dependent information between the object that fires the event and the objects that wait on the event. The designer who implements the objects must determine what meaning, if any, to assign to these parameters.
     * @param {Guid} EventID GUID that specifies the event.
     * @param {Integer} Param1 Specifies the first implementation-dependent parameter.
     * @param {Integer} Param2 Specifies the second implementation-dependent parameter.
     * @param {Integer} Param3 Specifies the third implementation-dependent parameter.
     * @param {Integer} Param4 Specifies the fourth implementation-dependent parameter.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibroadcasteventex-fireex
     */
    FireEx(EventID, Param1, Param2, Param3, Param4) {
        result := ComCall(4, this, Guid, EventID, "uint", Param1, "uint", Param2, "uint", Param3, "uint", Param4, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBroadcastEventEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FireEx := CallbackCreate(GetMethod(implObj, "FireEx"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FireEx)
    }
}
