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
        pfPeakMarshal := pfPeak is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, pfPeakMarshal, pfPeak, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnChannelCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-getmeteringchannelcount
     */
    GetMeteringChannelCount(pnChannelCount) {
        pnChannelCountMarshal := pnChannelCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pnChannelCountMarshal, pnChannelCount, "HRESULT")
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
        afPeakValuesMarshal := afPeakValues is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, "uint", u32ChannelCount, afPeakValuesMarshal, afPeakValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwHardwareSupportMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudiometerinformation-queryhardwaresupport
     */
    QueryHardwareSupport(pdwHardwareSupportMask) {
        pdwHardwareSupportMaskMarshal := pdwHardwareSupportMask is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwHardwareSupportMaskMarshal, pdwHardwareSupportMask, "HRESULT")
        return result
    }
}
