#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioMeterInformation interface represents a peak meter on an audio stream to or from an audio endpoint device.
 * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nn-endpointvolume-iaudiometerinformation
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioMeterInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioMeterInformation
     * @type {Guid}
     */
    static IID => Guid("{c02216f6-8c67-4b5b-9d00-d008e73e0064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPeakValue", "GetMeteringChannelCount", "GetChannelsPeakValues", "QueryHardwareSupport"]

    /**
     * The GetPeakValue method gets the peak sample value for the channels in the audio stream.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the peak sample value for the audio stream. The peak value is a number in the normalized range from 0.0 to 1.0.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudiometerinformation-getpeakvalue
     */
    GetPeakValue() {
        result := ComCall(3, this, "float*", &pfPeak := 0, "HRESULT")
        return pfPeak
    }

    /**
     * The GetMeteringChannelCount method gets the number of channels in the audio stream that are monitored by peak meters.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the number of channels.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudiometerinformation-getmeteringchannelcount
     */
    GetMeteringChannelCount() {
        result := ComCall(4, this, "uint*", &pnChannelCount := 0, "HRESULT")
        return pnChannelCount
    }

    /**
     * The GetChannelsPeakValues method gets the peak sample values for all the channels in the audio stream.
     * @param {Integer} u32ChannelCount The channel count. This parameter also specifies the number of elements in the <i>afPeakValues</i> array. If the specified count does not match the number of channels in the stream, the method returns error code E_INVALIDARG.
     * @returns {Float} Pointer to an array of peak sample values. The method writes the peak values for the channels into the array. The array contains one element for each channel in the stream. The peak values are numbers in the normalized range from 0.0 to 1.0.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudiometerinformation-getchannelspeakvalues
     */
    GetChannelsPeakValues(u32ChannelCount) {
        result := ComCall(5, this, "uint", u32ChannelCount, "float*", &afPeakValues := 0, "HRESULT")
        return afPeakValues
    }

    /**
     * The QueryHardwareSupport method queries the audio endpoint device for its hardware-supported functions.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable into which the method writes a hardware support mask that indicates the hardware capabilities of the audio endpoint device. The method can set the mask to 0 or to the bitwise-OR combination of one or more <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-hardware-support-xxx-constants">ENDPOINT_HARDWARE_SUPPORT_XXX</a> constants.
     * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nf-endpointvolume-iaudiometerinformation-queryhardwaresupport
     */
    QueryHardwareSupport() {
        result := ComCall(6, this, "uint*", &pdwHardwareSupportMask := 0, "HRESULT")
        return pdwHardwareSupportMask
    }
}
