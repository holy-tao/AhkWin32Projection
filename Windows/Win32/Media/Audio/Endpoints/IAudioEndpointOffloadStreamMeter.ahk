#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioEndpointOffloadStreamMeter interface retrieves general information about the audio channels in the offloaded audio stream.
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudioendpointoffloadstreammeter
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointOffloadStreamMeter extends IUnknown{
    /**
     * The interface identifier for IAudioEndpointOffloadStreamMeter
     * @type {Guid}
     */
    static IID => Guid("{e1546dce-9dd1-418b-9ab2-348ced161c86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pu32ChannelCount 
     * @returns {HRESULT} 
     */
    GetMeterChannelCount(pu32ChannelCount) {
        result := ComCall(3, this, "uint*", pu32ChannelCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} u32ChannelCount 
     * @param {Pointer<Single>} pf32PeakValues 
     * @returns {HRESULT} 
     */
    GetMeteringData(u32ChannelCount, pf32PeakValues) {
        result := ComCall(4, this, "uint", u32ChannelCount, "float*", pf32PeakValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
