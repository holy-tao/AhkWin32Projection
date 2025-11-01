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
     * 
     * @param {Pointer<Float>} pfPeak 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-getpeakvalue
     */
    GetPeakValue(pfPeak) {
        result := ComCall(3, this, "float*", pfPeak, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnChannelCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-getmeteringchannelcount
     */
    GetMeteringChannelCount(pnChannelCount) {
        result := ComCall(4, this, "uint*", pnChannelCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} u32ChannelCount 
     * @param {Pointer<Float>} afPeakValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-getchannelspeakvalues
     */
    GetChannelsPeakValues(u32ChannelCount, afPeakValues) {
        result := ComCall(5, this, "uint", u32ChannelCount, "float*", afPeakValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwHardwareSupportMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-queryhardwaresupport
     */
    QueryHardwareSupport(pdwHardwareSupportMask) {
        result := ComCall(6, this, "uint*", pdwHardwareSupportMask, "HRESULT")
        return result
    }
}
