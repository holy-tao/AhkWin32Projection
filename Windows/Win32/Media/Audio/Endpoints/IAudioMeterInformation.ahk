#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioMeterInformation interface represents a peak meter on an audio stream to or from an audio endpoint device.
 * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nn-endpointvolume-iaudiometerinformation
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IAudioMeterInformation extends IUnknown {
    /**
     * The interface identifier for IAudioMeterInformation
     * @type {Guid}
     */
    static IID := Guid("{c02216f6-8c67-4b5b-9d00-d008e73e0064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioMeterInformation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPeakValue            : IntPtr
        GetMeteringChannelCount : IntPtr
        GetChannelsPeakValues   : IntPtr
        QueryHardwareSupport    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioMeterInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPeakValue method gets the peak sample value for the channels in the audio stream.
     * @remarks
     * This method retrieves the peak sample value recorded across all of the channels in the stream. The peak value for each channel is recorded over one device period and made available during the subsequent device period. Thus, this method always retrieves the peak value recorded during the previous device period. To obtain the device period, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getdeviceperiod">IAudioClient::GetDevicePeriod</a> method.
     * 
     * For a code example that uses the <b>GetPeakValue</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/peak-meters">Peak Meters</a>.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the peak sample value for the audio stream. The peak value is a number in the normalized range from 0.0 to 1.0.
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-getpeakvalue
     */
    GetPeakValue() {
        result := ComCall(3, this, "float*", &pfPeak := 0, "HRESULT")
        return pfPeak
    }

    /**
     * The GetMeteringChannelCount method gets the number of channels in the audio stream that are monitored by peak meters.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the number of channels.
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-getmeteringchannelcount
     */
    GetMeteringChannelCount() {
        result := ComCall(4, this, "uint*", &pnChannelCount := 0, "HRESULT")
        return pnChannelCount
    }

    /**
     * The GetChannelsPeakValues method gets the peak sample values for all the channels in the audio stream.
     * @remarks
     * This method retrieves the peak sample values for the channels in the stream. The peak value for each channel is recorded over one device period and made available during the subsequent device period. Thus, this method always retrieves the peak values recorded during the previous device period. To obtain the device period, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getdeviceperiod">IAudioClient::GetDevicePeriod</a> method.
     * 
     * Parameter <i>afPeakValues</i> points to a caller-allocated <b>float</b> array. If the stream contains <i>n</i> channels, the channels are numbered 0 to <i>n</i>– 1. The method stores the peak value for each channel in the array element whose array index matches the channel number. To get the number of channels in the audio stream that are monitored by peak meters, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-getmeteringchannelcount">IAudioMeterInformation::GetMeteringChannelCount</a> method.
     * @param {Integer} u32ChannelCount The channel count. This parameter also specifies the number of elements in the <i>afPeakValues</i> array. If the specified count does not match the number of channels in the stream, the method returns error code E_INVALIDARG.
     * @returns {Float} Pointer to an array of peak sample values. The method writes the peak values for the channels into the array. The array contains one element for each channel in the stream. The peak values are numbers in the normalized range from 0.0 to 1.0.
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-getchannelspeakvalues
     */
    GetChannelsPeakValues(u32ChannelCount) {
        result := ComCall(5, this, "uint", u32ChannelCount, "float*", &afPeakValues := 0, "HRESULT")
        return afPeakValues
    }

    /**
     * The QueryHardwareSupport method queries the audio endpoint device for its hardware-supported functions. (IAudioMeterInformation.QueryHardwareSupport)
     * @remarks
     * This method indicates whether the audio endpoint device implements the following functions in hardware:
     * 
     * <ul>
     * <li>Volume control</li>
     * <li>Mute control</li>
     * <li>Peak meter</li>
     * </ul>
     * The system automatically substitutes a software implementation for any function in the preceding list that the endpoint devices does not implement in hardware.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable into which the method writes a hardware support mask that indicates the hardware capabilities of the audio endpoint device. The method can set the mask to 0 or to the bitwise-OR combination of one or more <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-hardware-support-xxx-constants">ENDPOINT_HARDWARE_SUPPORT_XXX</a> constants.
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-queryhardwaresupport
     */
    QueryHardwareSupport() {
        result := ComCall(6, this, "uint*", &pdwHardwareSupportMask := 0, "HRESULT")
        return pdwHardwareSupportMask
    }

    Query(iid) {
        if (IAudioMeterInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPeakValue := CallbackCreate(GetMethod(implObj, "GetPeakValue"), flags, 2)
        this.vtbl.GetMeteringChannelCount := CallbackCreate(GetMethod(implObj, "GetMeteringChannelCount"), flags, 2)
        this.vtbl.GetChannelsPeakValues := CallbackCreate(GetMethod(implObj, "GetChannelsPeakValues"), flags, 3)
        this.vtbl.QueryHardwareSupport := CallbackCreate(GetMethod(implObj, "QueryHardwareSupport"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPeakValue)
        CallbackFree(this.vtbl.GetMeteringChannelCount)
        CallbackFree(this.vtbl.GetChannelsPeakValues)
        CallbackFree(this.vtbl.QueryHardwareSupport)
    }
}
