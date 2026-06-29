#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAudioEndpointVolume.ahk" { IAudioEndpointVolume }

/**
 * The IAudioEndpointVolumeEx interface provides volume controls on the audio stream to or from a device endpoint.
 * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumeex
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IAudioEndpointVolumeEx extends IAudioEndpointVolume {
    /**
     * The interface identifier for IAudioEndpointVolumeEx
     * @type {Guid}
     */
    static IID := Guid("{66e11784-f695-4f28-a505-a7080081a78f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpointVolumeEx interfaces
    */
    struct Vtbl extends IAudioEndpointVolume.Vtbl {
        GetVolumeRangeChannel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpointVolumeEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetVolumeRangeChannel method gets the volume range for a specified channel.
     * @param {Integer} iChannel The channel number for which to get the volume range. If the audio stream has <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. To obtain the number of channels in the stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nf-endpointvolume-iaudioendpointvolume-getchannelcount">IAudioEndpointVolume::GetChannelCount</a> method.
     * @param {Pointer<Float>} pflVolumeMindB Receives  the minimum volume level for the channel, in decibels.
     * @param {Pointer<Float>} pflVolumeMaxdB Receives  the maximum volume level for the channel, in decibels.
     * @param {Pointer<Float>} pflVolumeIncrementdB Receives the volume increment for the channel, in decibels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pfLevelMinDB</i>, <i>pfLevelMaxDB</i>, or <i>pfVolumeIncrementDB</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumeex-getvolumerangechannel
     */
    GetVolumeRangeChannel(iChannel, pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB) {
        pflVolumeMindBMarshal := pflVolumeMindB is VarRef ? "float*" : "ptr"
        pflVolumeMaxdBMarshal := pflVolumeMaxdB is VarRef ? "float*" : "ptr"
        pflVolumeIncrementdBMarshal := pflVolumeIncrementdB is VarRef ? "float*" : "ptr"

        result := ComCall(21, this, "uint", iChannel, pflVolumeMindBMarshal, pflVolumeMindB, pflVolumeMaxdBMarshal, pflVolumeMaxdB, pflVolumeIncrementdBMarshal, pflVolumeIncrementdB, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioEndpointVolumeEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVolumeRangeChannel := CallbackCreate(GetMethod(implObj, "GetVolumeRangeChannel"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVolumeRangeChannel)
    }
}
