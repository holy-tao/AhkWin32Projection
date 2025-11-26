#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioEndpointVolume interface represents the volume controls on the audio stream to or from an audio endpoint device.
 * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nn-endpointvolume-iaudioendpointvolume
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpointVolume
     * @type {Guid}
     */
    static IID => Guid("{5cdf2c82-841e-4546-9722-0cf74078229a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterControlChangeNotify", "UnregisterControlChangeNotify", "GetChannelCount", "SetMasterVolumeLevel", "SetMasterVolumeLevelScalar", "GetMasterVolumeLevel", "GetMasterVolumeLevelScalar", "SetChannelVolumeLevel", "SetChannelVolumeLevelScalar", "GetChannelVolumeLevel", "GetChannelVolumeLevelScalar", "SetMute", "GetMute", "GetVolumeStepInfo", "VolumeStepUp", "VolumeStepDown", "QueryHardwareSupport", "GetVolumeRange"]

    /**
     * The RegisterControlChangeNotify method registers a client's notification callback interface.
     * @param {IAudioEndpointVolumeCallback} pNotify Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback">IAudioEndpointVolumeCallback</a> interface that the client is registering for notification callbacks. If the <b>RegisterControlChangeNotify</b> method succeeds, it calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the client's <b>IAudioEndpointVolumeCallback</b> interface.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pNotify</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-registercontrolchangenotify
     */
    RegisterControlChangeNotify(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * The UnregisterControlChangeNotify method deletes the registration of a client's notification callback interface that the client registered in a previous call to the IAudioEndpointVolume::RegisterControlChangeNotify method.
     * @param {IAudioEndpointVolumeCallback} pNotify Pointer to the client's <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback">IAudioEndpointVolumeCallback</a> interface. The client passed this same interface pointer to the endpoint volume object in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-registercontrolchangenotify">IAudioEndpointVolume::RegisterControlChangeNotify</a> method. If the <b>UnregisterControlChangeNotify</b> method succeeds, it calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method on the client's <b>IAudioEndpointVolumeCallback</b> interface.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pNotify</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-unregistercontrolchangenotify
     */
    UnregisterControlChangeNotify(pNotify) {
        result := ComCall(4, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * The GetChannelCount method gets a count of the channels in the audio stream that enters or leaves the audio endpoint device.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the channel count.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(5, this, "uint*", &pnChannelCount := 0, "HRESULT")
        return pnChannelCount
    }

    /**
     * The SetMasterVolumeLevel method sets the master volume level, in decibels, of the audio stream that enters or leaves the audio endpoint device.
     * @param {Float} fLevelDB The new master volume level in decibels. To obtain the range and granularity of the volume levels that can be set by this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getvolumerange">IAudioEndpointVolume::GetVolumeRange</a> method.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify">IAudioEndpointVolumeCallback::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetMasterVolumeLevel</b> call changes the volume level of the endpoint, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback">IAudioEndpointVolumeCallback</a> interfaces with that endpoint will receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the volume-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the notification routine receives the context GUID value GUID_NULL.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>fLevelDB</i> lies outside of the volume range supported by the device.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-setmastervolumelevel
     */
    SetMasterVolumeLevel(fLevelDB, pguidEventContext) {
        result := ComCall(6, this, "float", fLevelDB, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The SetMasterVolumeLevelScalar method sets the master volume level of the audio stream that enters or leaves the audio endpoint device. The volume level is expressed as a normalized, audio-tapered value in the range from 0.0 to 1.0.
     * @param {Float} fLevel The new master volume level. The level is expressed as a normalized value in the range from 0.0 to 1.0.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify">IAudioEndpointVolumeCallback::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetMasterVolumeLevelScalar</b> call changes the volume level of the endpoint, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback">IAudioEndpointVolumeCallback</a> interfaces with that endpoint will receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the volume-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the notification routine receives the context GUID value GUID_NULL.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>fLevel</i> is outside the range from 0.0 to 1.0.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-setmastervolumelevelscalar
     */
    SetMasterVolumeLevelScalar(fLevel, pguidEventContext) {
        result := ComCall(7, this, "float", fLevel, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The GetMasterVolumeLevel method gets the master volume level, in decibels, of the audio stream that enters or leaves the audio endpoint device.
     * @returns {Float} Pointer to the master volume level. This parameter points to a <b>float</b> variable into which the method writes the volume level in decibels. To get the range of volume levels obtained from this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getvolumerange">IAudioEndpointVolume::GetVolumeRange</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-getmastervolumelevel
     */
    GetMasterVolumeLevel() {
        result := ComCall(8, this, "float*", &pfLevelDB := 0, "HRESULT")
        return pfLevelDB
    }

    /**
     * The GetMasterVolumeLevelScalar method gets the master volume level of the audio stream that enters or leaves the audio endpoint device. The volume level is expressed as a normalized, audio-tapered value in the range from 0.0 to 1.0.
     * @returns {Float} Pointer to the master volume level. This parameter points to a <b>float</b> variable into which the method writes the volume level. The level is expressed as a normalized value in the range from 0.0 to 1.0.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-getmastervolumelevelscalar
     */
    GetMasterVolumeLevelScalar() {
        result := ComCall(9, this, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * The SetChannelVolumeLevel method sets the volume level, in decibels, of the specified channel of the audio stream that enters or leaves the audio endpoint device.
     * @param {Integer} nChannel The channel number. If the audio stream contains <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. To obtain the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelcount">IAudioEndpointVolume::GetChannelCount</a> method.
     * @param {Float} fLevelDB The new volume level in decibels. To obtain the range and granularity of the volume levels that can be set by this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getvolumerange">IAudioEndpointVolume::GetVolumeRange</a> method.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify">IAudioEndpointVolumeCallback::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetChannelVolumeLevel</b> call changes the volume level of the endpoint, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback">IAudioEndpointVolumeCallback</a> interfaces with that endpoint will receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the volume-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the notification routine receives the context GUID value GUID_NULL.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the method fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>nChannel</i> is greater than or equal to the number of channels in the stream; or parameter <i>fLevelDB</i> lies outside of the volume range supported by the device.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-setchannelvolumelevel
     */
    SetChannelVolumeLevel(nChannel, fLevelDB, pguidEventContext) {
        result := ComCall(10, this, "uint", nChannel, "float", fLevelDB, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The SetChannelVolumeLevelScalar method sets the normalized, audio-tapered volume level of the specified channel in the audio stream that enters or leaves the audio endpoint device.
     * @param {Integer} nChannel The channel number. If the audio stream contains <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. To obtain the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelcount">IAudioEndpointVolume::GetChannelCount</a> method.
     * @param {Float} fLevel The volume level. The volume level is expressed as a normalized value in the range from 0.0 to 1.0.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify">IAudioEndpointVolumeCallback::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetChannelVolumeLevelScalar</b> call changes the volume level of the endpoint, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback">IAudioEndpointVolumeCallback</a> interfaces with that endpoint will receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the volume-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the notification routine receives the context GUID value GUID_NULL.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the method fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>nChannel</i> is greater than or equal to the number of channels in the stream; or parameter <i>fLevel</i> is outside the range from 0.0 to 1.0.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-setchannelvolumelevelscalar
     */
    SetChannelVolumeLevelScalar(nChannel, fLevel, pguidEventContext) {
        result := ComCall(11, this, "uint", nChannel, "float", fLevel, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The GetChannelVolumeLevel method gets the volume level, in decibels, of the specified channel in the audio stream that enters or leaves the audio endpoint device.
     * @param {Integer} nChannel The channel number. If the audio stream has <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. To obtain the number of channels in the stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelcount">IAudioEndpointVolume::GetChannelCount</a> method.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the volume level in decibels. To get the range of volume levels obtained from this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getvolumerange">IAudioEndpointVolume::GetVolumeRange</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelvolumelevel
     */
    GetChannelVolumeLevel(nChannel) {
        result := ComCall(12, this, "uint", nChannel, "float*", &pfLevelDB := 0, "HRESULT")
        return pfLevelDB
    }

    /**
     * The GetChannelVolumeLevelScalar method gets the normalized, audio-tapered volume level of the specified channel of the audio stream that enters or leaves the audio endpoint device.
     * @param {Integer} nChannel The channel number. If the audio stream contains <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. To obtain the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelcount">IAudioEndpointVolume::GetChannelCount</a> method.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the volume level. The level is expressed as a normalized value in the range from 0.0 to 1.0.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelvolumelevelscalar
     */
    GetChannelVolumeLevelScalar(nChannel) {
        result := ComCall(13, this, "uint", nChannel, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * The SetMute method sets the muting state of the audio stream that enters or leaves the audio endpoint device.
     * @param {BOOL} bMute The new muting state. If <i>bMute</i> is <b>TRUE</b>, the method mutes the stream. If <b>FALSE</b>, the method turns off muting.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify">IAudioEndpointVolumeCallback::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetMute</b> call changes the muting state of the endpoint, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback">IAudioEndpointVolumeCallback</a> interfaces with that endpoint will receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the notification routine receives the context GUID value GUID_NULL.
     * @returns {HRESULT} If the method succeeds and the muting state changes, the method returns S_OK. If the method succeeds and the new muting state is the same as the previous muting state, the method returns S_FALSE. If the method fails, possible return codes include, but are not limited to, the values shown in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-setmute
     */
    SetMute(bMute, pguidEventContext) {
        result := ComCall(14, this, "int", bMute, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The GetMute method gets the muting state of the audio stream that enters or leaves the audio endpoint device.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable into which the method writes the muting state. If <i>*pbMute</i> is <b>TRUE</b>, the stream is muted. If <b>FALSE</b>, the stream is not muted.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-getmute
     */
    GetMute() {
        result := ComCall(15, this, "int*", &pbMute := 0, "HRESULT")
        return pbMute
    }

    /**
     * The GetVolumeStepInfo method gets information about the current step in the volume range.
     * @param {Pointer<Integer>} pnStep Pointer to a <b>UINT</b> variable into which the method writes the current step index. This index is a value in the range from 0 to <i>*pStepCount</i>– 1, where 0 represents the minimum volume level and <i>*pStepCount</i>– 1 represents the maximum level.
     * @param {Pointer<Integer>} pnStepCount Pointer to a <b>UINT</b> variable into which the method writes the number of steps in the volume range. This number remains constant for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolume">IAudioEndpointVolume</a> interface instance.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pnStep</i> and <i>pnStepCount</i> are both <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-getvolumestepinfo
     */
    GetVolumeStepInfo(pnStep, pnStepCount) {
        pnStepMarshal := pnStep is VarRef ? "uint*" : "ptr"
        pnStepCountMarshal := pnStepCount is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pnStepMarshal, pnStep, pnStepCountMarshal, pnStepCount, "HRESULT")
        return result
    }

    /**
     * The VolumeStepUp method increments, by one step, the volume level of the audio stream that enters or leaves the audio endpoint device.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify">IAudioEndpointVolumeCallback::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>VolumeStepUp</b> call changes the volume level of the endpoint, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback">IAudioEndpointVolumeCallback</a> interfaces with that endpoint will receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the volume-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-volumestepup
     */
    VolumeStepUp(pguidEventContext) {
        result := ComCall(17, this, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The VolumeStepDown method decrements, by one step, the volume level of the audio stream that enters or leaves the audio endpoint device.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify">IAudioEndpointVolumeCallback::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>VolumeStepDown</b> call changes the volume level of the endpoint, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback">IAudioEndpointVolumeCallback</a> interfaces with that endpoint will receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the volume-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-volumestepdown
     */
    VolumeStepDown(pguidEventContext) {
        result := ComCall(18, this, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The QueryHardwareSupport method queries the audio endpoint device for its hardware-supported functions.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable into which the method writes a hardware support mask that indicates the hardware capabilities of the audio endpoint device. The method can set the mask to 0 or to the bitwise-OR combination of one or more <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-hardware-support-xxx-constants">ENDPOINT_HARDWARE_SUPPORT_XXX</a> constants.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-queryhardwaresupport
     */
    QueryHardwareSupport() {
        result := ComCall(19, this, "uint*", &pdwHardwareSupportMask := 0, "HRESULT")
        return pdwHardwareSupportMask
    }

    /**
     * The GetVolumeRange method gets the volume range, in decibels, of the audio stream that enters or leaves the audio endpoint device.
     * @param {Pointer<Float>} pflVolumeMindB Pointer to the minimum volume level. This parameter points to a <b>float</b> variable into which the method writes the minimum volume level in decibels. This value remains constant for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolume">IAudioEndpointVolume</a> interface instance.
     * @param {Pointer<Float>} pflVolumeMaxdB Pointer to the maximum volume level. This parameter points to a <b>float</b> variable into which the method writes the maximum volume level in decibels. This value remains constant for the lifetime of the <b>IAudioEndpointVolume</b> interface instance.
     * @param {Pointer<Float>} pflVolumeIncrementdB Pointer to the volume increment. This parameter points to a <b>float</b> variable into which the method writes the volume increment in decibels. This increment remains constant for the lifetime of the <b>IAudioEndpointVolume</b> interface instance.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pfLevelMinDB</i>, <i>pfLevelMaxDB</i>, or <i>pfVolumeIncrementDB</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolume-getvolumerange
     */
    GetVolumeRange(pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB) {
        pflVolumeMindBMarshal := pflVolumeMindB is VarRef ? "float*" : "ptr"
        pflVolumeMaxdBMarshal := pflVolumeMaxdB is VarRef ? "float*" : "ptr"
        pflVolumeIncrementdBMarshal := pflVolumeIncrementdB is VarRef ? "float*" : "ptr"

        result := ComCall(20, this, pflVolumeMindBMarshal, pflVolumeMindB, pflVolumeMaxdBMarshal, pflVolumeMaxdB, pflVolumeIncrementdBMarshal, pflVolumeIncrementdB, "HRESULT")
        return result
    }
}
