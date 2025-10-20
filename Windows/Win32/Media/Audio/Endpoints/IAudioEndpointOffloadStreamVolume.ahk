#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioEndpointOffloadStreamVolume interface allows the client application to manipulate the volume level of the offloaded audio stream.
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudioendpointoffloadstreamvolume
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointOffloadStreamVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpointOffloadStreamVolume
     * @type {Guid}
     */
    static IID => Guid("{64f1dd49-71ca-4281-8672-3a9eddd1d0b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVolumeChannelCount", "SetChannelVolumes", "GetChannelVolumes"]

    /**
     * 
     * @param {Pointer<Integer>} pu32ChannelCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreamvolume-getvolumechannelcount
     */
    GetVolumeChannelCount(pu32ChannelCount) {
        result := ComCall(3, this, "uint*", pu32ChannelCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} u32ChannelCount 
     * @param {Pointer<Float>} pf32Volumes 
     * @param {Integer} u32CurveType 
     * @param {Pointer<Integer>} pCurveDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreamvolume-setchannelvolumes
     */
    SetChannelVolumes(u32ChannelCount, pf32Volumes, u32CurveType, pCurveDuration) {
        result := ComCall(4, this, "uint", u32ChannelCount, "float*", pf32Volumes, "int", u32CurveType, "int64*", pCurveDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} u32ChannelCount 
     * @param {Pointer<Float>} pf32Volumes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreamvolume-getchannelvolumes
     */
    GetChannelVolumes(u32ChannelCount, pf32Volumes) {
        result := ComCall(5, this, "uint", u32ChannelCount, "float*", pf32Volumes, "HRESULT")
        return result
    }
}
