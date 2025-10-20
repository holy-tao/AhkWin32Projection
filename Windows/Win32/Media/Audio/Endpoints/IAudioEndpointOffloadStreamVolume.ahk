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
     * 
     * @param {Pointer<UInt32>} pu32ChannelCount 
     * @returns {HRESULT} 
     */
    GetVolumeChannelCount(pu32ChannelCount) {
        result := ComCall(3, this, "uint*", pu32ChannelCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} u32ChannelCount 
     * @param {Pointer<Single>} pf32Volumes 
     * @param {Integer} u32CurveType 
     * @param {Pointer<Int64>} pCurveDuration 
     * @returns {HRESULT} 
     */
    SetChannelVolumes(u32ChannelCount, pf32Volumes, u32CurveType, pCurveDuration) {
        result := ComCall(4, this, "uint", u32ChannelCount, "float*", pf32Volumes, "int", u32CurveType, "int64*", pCurveDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} u32ChannelCount 
     * @param {Pointer<Single>} pf32Volumes 
     * @returns {HRESULT} 
     */
    GetChannelVolumes(u32ChannelCount, pf32Volumes) {
        result := ComCall(5, this, "uint", u32ChannelCount, "float*", pf32Volumes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
