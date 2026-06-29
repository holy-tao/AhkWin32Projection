#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioLoudness interface provides access to a &quot;loudness&quot; compensation control.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iaudioloudness
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioLoudness extends IUnknown {
    /**
     * The interface identifier for IAudioLoudness
     * @type {Guid}
     */
    static IID := Guid("{7d8b1437-dd53-4350-9c1b-1ee2890bd938}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioLoudness interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEnabled : IntPtr
        SetEnabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioLoudness.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetEnabled method gets the current state (enabled or disabled) of the loudness control.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable into which the method writes the current loudness state. If the state is <b>TRUE</b>, loudness is enabled. If <b>FALSE</b>, loudness is disabled.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioloudness-getenabled
     */
    GetEnabled() {
        result := ComCall(3, this, BOOL.Ptr, &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * The SetEnabled method enables or disables the loudness control.
     * @param {BOOL} bEnable The new loudness state. If <i>bEnable</i> is <b>TRUE</b> (nonzero), the method enables loudness. If <b>FALSE</b>, it disables loudness.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetEnabled</b> call changes the state of the loudness control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioloudness-setenabled
     */
    SetEnabled(bEnable, pguidEventContext) {
        result := ComCall(4, this, BOOL, bEnable, Guid.Ptr, pguidEventContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioLoudness.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEnabled := CallbackCreate(GetMethod(implObj, "GetEnabled"), flags, 2)
        this.vtbl.SetEnabled := CallbackCreate(GetMethod(implObj, "SetEnabled"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEnabled)
        CallbackFree(this.vtbl.SetEnabled)
    }
}
