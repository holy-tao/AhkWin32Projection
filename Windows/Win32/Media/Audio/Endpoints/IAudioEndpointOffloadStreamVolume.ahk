#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\AUDIO_CURVE_TYPE.ahk" { AUDIO_CURVE_TYPE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioEndpointOffloadStreamVolume interface allows the client application to manipulate the volume level of the offloaded audio stream.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudioendpointoffloadstreamvolume
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IAudioEndpointOffloadStreamVolume extends IUnknown {
    /**
     * The interface identifier for IAudioEndpointOffloadStreamVolume
     * @type {Guid}
     */
    static IID := Guid("{64f1dd49-71ca-4281-8672-3a9eddd1d0b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpointOffloadStreamVolume interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetVolumeChannelCount : IntPtr
        SetChannelVolumes     : IntPtr
        GetChannelVolumes     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpointOffloadStreamVolume.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetVolumeChannelCount method retrieves the number of available audio channels in the offloaded stream.
     * @returns {Integer} A pointer to the number of available audio channels in the offloaded stream.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreamvolume-getvolumechannelcount
     */
    GetVolumeChannelCount() {
        result := ComCall(3, this, "uint*", &pu32ChannelCount := 0, "HRESULT")
        return pu32ChannelCount
    }

    /**
     * The SetChannelVolumes method sets the volume levels for the various audio channels in the offloaded stream.
     * @param {Integer} u32ChannelCount Indicates the number of available audio channels in the offloaded stream.
     * @param {Pointer<Float>} pf32Volumes A pointer to the volume levels for the various audio channels in the offloaded stream.
     * @param {AUDIO_CURVE_TYPE} u32CurveType A value from the [AUDIO_CURVE_TYPE](/windows-hardware/drivers/ddi/content/ksmedia/ne-ksmedia-audio_curve_type) enumeration specifying the curve to use when changing the channel volumes.
     * @param {Pointer<Integer>} pCurveDuration A **LONGLONG** value specifying the curve duration in hundred nanosecond units.
     * @returns {HRESULT} The <b>SetChannelVolumes</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreamvolume-setchannelvolumes
     */
    SetChannelVolumes(u32ChannelCount, pf32Volumes, u32CurveType, pCurveDuration) {
        pf32VolumesMarshal := pf32Volumes is VarRef ? "float*" : "ptr"
        pCurveDurationMarshal := pCurveDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(4, this, "uint", u32ChannelCount, pf32VolumesMarshal, pf32Volumes, AUDIO_CURVE_TYPE, u32CurveType, pCurveDurationMarshal, pCurveDuration, "HRESULT")
        return result
    }

    /**
     * The GetChannelVolumes method retrieves the volume levels for the various audio channels in the offloaded stream.
     * @param {Integer} u32ChannelCount Indicates the number of available audio channels in the offloaded stream.
     * @returns {Float} A pointer to the volume levels for the various  audio channels in the offloaded stream.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreamvolume-getchannelvolumes
     */
    GetChannelVolumes(u32ChannelCount) {
        result := ComCall(5, this, "uint", u32ChannelCount, "float*", &pf32Volumes := 0, "HRESULT")
        return pf32Volumes
    }

    Query(iid) {
        if (IAudioEndpointOffloadStreamVolume.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVolumeChannelCount := CallbackCreate(GetMethod(implObj, "GetVolumeChannelCount"), flags, 2)
        this.vtbl.SetChannelVolumes := CallbackCreate(GetMethod(implObj, "SetChannelVolumes"), flags, 5)
        this.vtbl.GetChannelVolumes := CallbackCreate(GetMethod(implObj, "GetChannelVolumes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVolumeChannelCount)
        CallbackFree(this.vtbl.SetChannelVolumes)
        CallbackFree(this.vtbl.GetChannelVolumes)
    }
}
