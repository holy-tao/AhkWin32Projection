#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioEndpointVolume.ahk

/**
 * The IAudioEndpointVolumeEx interface provides volume controls on the audio stream to or from a device endpoint.
 * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nn-endpointvolume-iaudioendpointvolumeex
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointVolumeEx extends IAudioEndpointVolume{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpointVolumeEx
     * @type {Guid}
     */
    static IID => Guid("{66e11784-f695-4f28-a505-a7080081a78f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVolumeRangeChannel"]

    /**
     * The GetVolumeRangeChannel method gets the volume range for a specified channel.
     * @param {Integer} iChannel The channel number for which to get the volume range. If the audio stream has <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. To obtain the number of channels in the stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelcount">IAudioEndpointVolume::GetChannelCount</a> method.
     * @param {Pointer<Float>} pflVolumeMindB Receives  the minimum volume level for the channel, in decibels.
     * @param {Pointer<Float>} pflVolumeMaxdB Receives  the maximum volume level for the channel, in decibels.
     * @param {Pointer<Float>} pflVolumeIncrementdB Receives the volume increment for the channel, in decibels.
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
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudioendpointvolumeex-getvolumerangechannel
     */
    GetVolumeRangeChannel(iChannel, pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB) {
        pflVolumeMindBMarshal := pflVolumeMindB is VarRef ? "float*" : "ptr"
        pflVolumeMaxdBMarshal := pflVolumeMaxdB is VarRef ? "float*" : "ptr"
        pflVolumeIncrementdBMarshal := pflVolumeIncrementdB is VarRef ? "float*" : "ptr"

        result := ComCall(21, this, "uint", iChannel, pflVolumeMindBMarshal, pflVolumeMindB, pflVolumeMaxdBMarshal, pflVolumeMaxdB, pflVolumeIncrementdBMarshal, pflVolumeIncrementdB, "HRESULT")
        return result
    }
}
