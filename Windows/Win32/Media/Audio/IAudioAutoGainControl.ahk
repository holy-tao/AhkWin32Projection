#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioAutoGainControl interface provides access to a hardware automatic gain control (AGC).
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iaudioautogaincontrol
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioAutoGainControl extends IUnknown {
    /**
     * The interface identifier for IAudioAutoGainControl
     * @type {Guid}
     */
    static IID := Guid("{85401fd4-6de4-4b9d-9869-2d6753a82f3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioAutoGainControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEnabled : IntPtr
        SetEnabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioAutoGainControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetEnabled method gets the current state (enabled or disabled) of the AGC.
     * @remarks
     * A disabled AGC operates in pass-through mode. In this mode, the audio stream passes through the AGC without modification.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable into which the method writes the current AGC state. If the state is <b>TRUE</b>, AGC is enabled. If <b>FALSE</b>, AGC is disabled.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioautogaincontrol-getenabled
     */
    GetEnabled() {
        result := ComCall(3, this, BOOL.Ptr, &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * The SetEnabled method enables or disables the AGC.
     * @remarks
     * A disabled AGC control operates in pass-through mode. In this mode, the audio stream passes through the control without modification.
     * @param {BOOL} bEnable The new AGC state. If this parameter is <b>TRUE</b> (nonzero), the method enables AGC. If <b>FALSE</b>, it disables AGC.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetEnabled</b> call changes the state of the AGC control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioautogaincontrol-setenabled
     */
    SetEnabled(bEnable, pguidEventContext) {
        result := ComCall(4, this, BOOL, bEnable, Guid.Ptr, pguidEventContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioAutoGainControl.IID.Equals(iid)) {
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
