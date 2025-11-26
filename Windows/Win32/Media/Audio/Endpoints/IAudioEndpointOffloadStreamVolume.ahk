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
     * The GetVolumeChannelCount method retrieves the number of available audio channels in the offloaded stream.
     * @returns {Integer} A pointer to the number of available audio channels in the offloaded stream.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreamvolume-getvolumechannelcount
     */
    GetVolumeChannelCount() {
        result := ComCall(3, this, "uint*", &pu32ChannelCount := 0, "HRESULT")
        return pu32ChannelCount
    }

    /**
     * The SetChannelVolumes method sets the volume levels for the various audio channels in the offloaded stream.
     * @param {Integer} u32ChannelCount Indicates the number of available audio channels in the offloaded stream.
     * @param {Pointer<Float>} pf32Volumes A pointer to the volume levels for the various audio channels in the offloaded stream.
     * @param {Integer} u32CurveType A value from the [AUDIO_CURVE_TYPE](/windows-hardware/drivers/ddi/content/ksmedia/ne-ksmedia-audio_curve_type) enumeration specifying the curve to use when changing the channel volumes.
     * @param {Pointer<Integer>} pCurveDuration A **LONGLONG** value specifying the curve duration in hundred nanosecond units.
     * @returns {HRESULT} The <b>SetChannelVolumes</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreamvolume-setchannelvolumes
     */
    SetChannelVolumes(u32ChannelCount, pf32Volumes, u32CurveType, pCurveDuration) {
        pf32VolumesMarshal := pf32Volumes is VarRef ? "float*" : "ptr"
        pCurveDurationMarshal := pCurveDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(4, this, "uint", u32ChannelCount, pf32VolumesMarshal, pf32Volumes, "int", u32CurveType, pCurveDurationMarshal, pCurveDuration, "HRESULT")
        return result
    }

    /**
     * The GetChannelVolumes method retrieves the volume levels for the various audio channels in the offloaded stream.
     * @param {Integer} u32ChannelCount Indicates the numer of available audio channels in the offloaded stream.
     * @returns {Float} A pointer to the volume levels for the various  audio channels in the offloaded stream.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreamvolume-getchannelvolumes
     */
    GetChannelVolumes(u32ChannelCount) {
        result := ComCall(5, this, "uint", u32ChannelCount, "float*", &pf32Volumes := 0, "HRESULT")
        return pf32Volumes
    }
}
