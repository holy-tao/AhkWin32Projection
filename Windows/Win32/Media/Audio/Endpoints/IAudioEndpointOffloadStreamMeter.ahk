#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioEndpointOffloadStreamMeter interface retrieves general information about the audio channels in the offloaded audio stream.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudioendpointoffloadstreammeter
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IAudioEndpointOffloadStreamMeter extends IUnknown {
    /**
     * The interface identifier for IAudioEndpointOffloadStreamMeter
     * @type {Guid}
     */
    static IID := Guid("{e1546dce-9dd1-418b-9ab2-348ced161c86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpointOffloadStreamMeter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMeterChannelCount : IntPtr
        GetMeteringData      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpointOffloadStreamMeter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of available audio channels in the offloaded stream that can be metered.
     * @returns {Integer} A Pointer to a variable that indicates the number of available audio channels in the offloaded stream that can be metered.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreammeter-getmeterchannelcount
     */
    GetMeterChannelCount() {
        result := ComCall(3, this, "uint*", &pu32ChannelCount := 0, "HRESULT")
        return pu32ChannelCount
    }

    /**
     * The GetMeteringData method retrieves general information about the available audio channels in the offloaded stream.
     * @param {Integer} u32ChannelCount Indicates the number of available audio channels in the offloaded audio stream.
     * @returns {Float} A pointer to the peak values for the audio channels in the offloaded audio stream.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreammeter-getmeteringdata
     */
    GetMeteringData(u32ChannelCount) {
        result := ComCall(4, this, "uint", u32ChannelCount, "float*", &pf32PeakValues := 0, "HRESULT")
        return pf32PeakValues
    }

    Query(iid) {
        if (IAudioEndpointOffloadStreamMeter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMeterChannelCount := CallbackCreate(GetMethod(implObj, "GetMeterChannelCount"), flags, 2)
        this.vtbl.GetMeteringData := CallbackCreate(GetMethod(implObj, "GetMeteringData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMeterChannelCount)
        CallbackFree(this.vtbl.GetMeteringData)
    }
}
