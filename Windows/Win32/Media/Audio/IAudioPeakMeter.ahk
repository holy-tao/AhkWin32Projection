#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioPeakMeter interface provides access to a hardware peak-meter control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudiopeakmeter
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioPeakMeter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioPeakMeter
     * @type {Guid}
     */
    static IID => Guid("{dd79923c-0599-45e0-b8b6-c8df7db6e796}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChannelCount", "GetLevel"]

    /**
     * The GetChannelCount method gets the number of channels in the audio stream.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the channel count.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iaudiopeakmeter-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(3, this, "uint*", &pcChannels := 0, "HRESULT")
        return pcChannels
    }

    /**
     * The GetLevel method gets the peak level that the peak meter recorded for the specified channel since the peak level for that channel was previously read.
     * @param {Integer} nChannel The channel number. If the audio stream has <i>N</i> channels, the channels are numbered from 0 to <i>N</i>– 1. To get the number of channels in the stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudiopeakmeter-getchannelcount">IAudioPeakMeter::GetChannelCount</a> method.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the peak meter level in decibels.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iaudiopeakmeter-getlevel
     */
    GetLevel(nChannel) {
        result := ComCall(4, this, "uint", nChannel, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }
}
