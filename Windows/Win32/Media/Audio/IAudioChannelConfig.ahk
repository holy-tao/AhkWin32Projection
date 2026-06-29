#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioChannelConfig interface provides access to a hardware channel-configuration control.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iaudiochannelconfig
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioChannelConfig extends IUnknown {
    /**
     * The interface identifier for IAudioChannelConfig
     * @type {Guid}
     */
    static IID := Guid("{bb11c46f-ec28-493c-b88a-5db88062ce98}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioChannelConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetChannelConfig : IntPtr
        GetChannelConfig : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioChannelConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetChannelConfig method sets the channel-configuration mask in a channel-configuration control.
     * @remarks
     * For information about channel-configuration masks, see the discussion of the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/ksproperty-audio-channel-config">KSPROPERTY_AUDIO_CHANNEL_CONFIG</a> property in the Windows DDK documentation.
     * @param {Integer} dwConfig The channel-configuration mask.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetChannelConfig</b> call changes the state of the channel-configuration control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiochannelconfig-setchannelconfig
     */
    SetChannelConfig(dwConfig, pguidEventContext) {
        result := ComCall(3, this, "uint", dwConfig, Guid.Ptr, pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The GetChannelConfig method gets the current channel-configuration mask from a channel-configuration control.
     * @remarks
     * For information about channel-configuration masks, see the discussion of the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/ksproperty-audio-channel-config">KSPROPERTY_AUDIO_CHANNEL_CONFIG</a> property in the Windows DDK documentation.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable into which the method writes the current channel-configuration mask value.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiochannelconfig-getchannelconfig
     */
    GetChannelConfig() {
        result := ComCall(4, this, "uint*", &pdwConfig := 0, "HRESULT")
        return pdwConfig
    }

    Query(iid) {
        if (IAudioChannelConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetChannelConfig := CallbackCreate(GetMethod(implObj, "SetChannelConfig"), flags, 3)
        this.vtbl.GetChannelConfig := CallbackCreate(GetMethod(implObj, "GetChannelConfig"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetChannelConfig)
        CallbackFree(this.vtbl.GetChannelConfig)
    }
}
