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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMeterChannelCount", "GetMeteringData"]

    /**
     * 
     * @param {Pointer<Integer>} pu32ChannelCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreammeter-getmeterchannelcount
     */
    GetMeterChannelCount(pu32ChannelCount) {
        result := ComCall(3, this, "uint*", pu32ChannelCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} u32ChannelCount 
     * @param {Pointer<Float>} pf32PeakValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreammeter-getmeteringdata
     */
    GetMeteringData(u32ChannelCount, pf32PeakValues) {
        result := ComCall(4, this, "uint", u32ChannelCount, "float*", pf32PeakValues, "HRESULT")
        return result
    }
}
