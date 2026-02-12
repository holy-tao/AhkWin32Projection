#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioChannelConfig interface provides access to a hardware channel-configuration control.
 * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nn-devicetopology-iaudiochannelconfig
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioChannelConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioChannelConfig
     * @type {Guid}
     */
    static IID => Guid("{bb11c46f-ec28-493c-b88a-5db88062ce98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetChannelConfig", "GetChannelConfig"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iaudiochannelconfig-setchannelconfig
     */
    SetChannelConfig(dwConfig, pguidEventContext) {
        result := ComCall(3, this, "uint", dwConfig, "ptr", pguidEventContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetChannelConfig method gets the current channel-configuration mask from a channel-configuration control.
     * @remarks
     * For information about channel-configuration masks, see the discussion of the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/ksproperty-audio-channel-config">KSPROPERTY_AUDIO_CHANNEL_CONFIG</a> property in the Windows DDK documentation.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable into which the method writes the current channel-configuration mask value.
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iaudiochannelconfig-getchannelconfig
     */
    GetChannelConfig() {
        result := ComCall(4, this, "uint*", &pdwConfig := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwConfig
    }
}
