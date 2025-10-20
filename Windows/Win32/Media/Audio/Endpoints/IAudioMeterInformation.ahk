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
     * 
     * @param {Pointer<Single>} pfPeak 
     * @returns {HRESULT} 
     */
    GetPeakValue(pfPeak) {
        result := ComCall(3, this, "float*", pfPeak, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnChannelCount 
     * @returns {HRESULT} 
     */
    GetMeteringChannelCount(pnChannelCount) {
        result := ComCall(4, this, "uint*", pnChannelCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} u32ChannelCount 
     * @param {Pointer<Single>} afPeakValues 
     * @returns {HRESULT} 
     */
    GetChannelsPeakValues(u32ChannelCount, afPeakValues) {
        result := ComCall(5, this, "uint", u32ChannelCount, "float*", afPeakValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwHardwareSupportMask 
     * @returns {HRESULT} 
     */
    QueryHardwareSupport(pdwHardwareSupportMask) {
        result := ComCall(6, this, "uint*", pdwHardwareSupportMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
