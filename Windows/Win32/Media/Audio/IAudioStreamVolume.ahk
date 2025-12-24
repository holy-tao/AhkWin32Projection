#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioStreamVolume interface enables a client to control and monitor the volume levels for all of the channels in an audio stream.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudiostreamvolume
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioStreamVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioStreamVolume
     * @type {Guid}
     */
    static IID => Guid("{93014887-242d-4068-8a15-cf5e93b90fe3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChannelCount", "SetChannelVolume", "GetChannelVolume", "SetAllVolumes", "GetAllVolumes"]

    /**
     * The GetChannelCount method retrieves the number of channels in the audio stream.
     * @returns {Integer} Pointer to a <b>UINT32</b> variable into which the method writes the channel count.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiostreamvolume-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * The SetChannelVolume method sets the volume level for the specified channel in the audio stream.
     * @param {Integer} dwIndex The channel number. If the stream format has <i>N</i> channels, the channels are numbered from 0 to <i>N</i>– 1. To get the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiostreamvolume-getchannelcount">IAudioStreamVolume::GetChannelCount</a> method.
     * @param {Float} fLevel The volume level for the channel. Valid volume levels are in the range 0.0 to 1.0.
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
     * Parameter <i>dwIndex</i> is set to an invalid channel number, or parameter <i>fLevel</i> is not in the range 0.0 to 1.0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_DEVICE_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio endpoint device has been unplugged, or the audio hardware or associated hardware resources have been reconfigured, disabled, removed, or otherwise made unavailable for use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_SERVICE_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows audio service is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiostreamvolume-setchannelvolume
     */
    SetChannelVolume(dwIndex, fLevel) {
        result := ComCall(4, this, "uint", dwIndex, "float", fLevel, "HRESULT")
        return result
    }

    /**
     * The GetChannelVolume method retrieves the volume level for the specified channel in the audio stream.
     * @param {Integer} dwIndex The channel number. If the stream format has <i>N</i> channels, then the channels are numbered from 0 to <i>N</i>– 1. To get the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiostreamvolume-getchannelcount">IAudioStreamVolume::GetChannelCount</a> method.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the volume level of the specified channel. The volume level is in the range 0.0 to 1.0.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiostreamvolume-getchannelvolume
     */
    GetChannelVolume(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * The SetAllVolumes method sets the individual volume levels for all the channels in the audio stream.
     * @param {Integer} dwCount The number of elements in the <i>pfVolumes</i> array. This parameter must equal the number of channels in the stream format. To get the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiostreamvolume-getchannelcount">IAudioStreamVolume::GetChannelCount</a> method.
     * @param {Pointer<Float>} pfVolumes Pointer to an array of volume levels for the channels in the audio stream. The number of elements in the <i>pfVolumes</i> array is specified by the <i>dwCount</i> parameter. The caller writes the volume level for each channel to the array element whose index matches the channel number. If the stream format has <i>N</i> channels, the channels are numbered from 0 to <i>N</i>– 1. Valid volume levels are in the range 0.0 to 1.0.
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
     * Parameter <i>dwCount</i> does not equal the number of channels in the stream, or the value of a <i>pfVolumes</i> array element is not in the range 0.0 to 1.0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pfVolumes</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_DEVICE_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio endpoint device has been unplugged, or the audio hardware or associated hardware resources have been reconfigured, disabled, removed, or otherwise made unavailable for use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_SERVICE_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows audio service is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiostreamvolume-setallvolumes
     */
    SetAllVolumes(dwCount, pfVolumes) {
        pfVolumesMarshal := pfVolumes is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, "uint", dwCount, pfVolumesMarshal, pfVolumes, "HRESULT")
        return result
    }

    /**
     * The GetAllVolumes method retrieves the volume levels for all the channels in the audio stream.
     * @param {Integer} dwCount The number of elements in the <i>pfVolumes</i> array. The <i>dwCount</i> parameter must equal the number of channels in the stream format. To get the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiostreamvolume-getchannelcount">IAudioStreamVolume::GetChannelCount</a> method.
     * @returns {Float} Pointer to an array of volume levels for the channels in the audio stream. This parameter points to a caller-allocated <b>float</b> array into which the method writes the volume levels for the individual channels. Volume levels are in the range 0.0 to 1.0.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudiostreamvolume-getallvolumes
     */
    GetAllVolumes(dwCount) {
        result := ComCall(7, this, "uint", dwCount, "float*", &pfVolumes := 0, "HRESULT")
        return pfVolumes
    }
}
