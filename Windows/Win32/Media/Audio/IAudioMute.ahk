#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioMute interface provides access to a hardware mute control.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iaudiomute
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioMute extends IUnknown {
    /**
     * The interface identifier for IAudioMute
     * @type {Guid}
     */
    static IID := Guid("{df45aeea-b74a-4b6b-afad-2366b6aa012e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioMute interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMute : IntPtr
        GetMute : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioMute.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetMute method enables or disables the mute control.
     * @param {BOOL} bMuted The new muting state. If <i>bMuted</i> is <b>TRUE</b> (nonzero), the method enables muting. If <b>FALSE</b>, the method disables muting.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetMute</b> call changes the state of the mute control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiomute-setmute
     */
    SetMute(bMuted, pguidEventContext) {
        result := ComCall(3, this, BOOL, bMuted, Guid.Ptr, pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The GetMute method gets the current state (enabled or disabled) of the mute control.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable into which the method writes the current state of the mute control. If the state is <b>TRUE</b>, muting is enabled. If <b>FALSE</b>, it is disabled.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiomute-getmute
     */
    GetMute() {
        result := ComCall(4, this, BOOL.Ptr, &pbMuted := 0, "HRESULT")
        return pbMuted
    }

    Query(iid) {
        if (IAudioMute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMute := CallbackCreate(GetMethod(implObj, "SetMute"), flags, 3)
        this.vtbl.GetMute := CallbackCreate(GetMethod(implObj, "GetMute"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMute)
        CallbackFree(this.vtbl.GetMute)
    }
}
