#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioPeakMeter interface provides access to a hardware peak-meter control.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iaudiopeakmeter
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioPeakMeter extends IUnknown {
    /**
     * The interface identifier for IAudioPeakMeter
     * @type {Guid}
     */
    static IID := Guid("{dd79923c-0599-45e0-b8b6-c8df7db6e796}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioPeakMeter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetChannelCount : IntPtr
        GetLevel        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioPeakMeter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetChannelCount method gets the number of channels in the audio stream. (IAudioPeakMeter.GetChannelCount)
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the channel count.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiopeakmeter-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(3, this, "uint*", &pcChannels := 0, "HRESULT")
        return pcChannels
    }

    /**
     * The GetLevel method gets the peak level that the peak meter recorded for the specified channel since the peak level for that channel was previously read.
     * @param {Integer} nChannel The channel number. If the audio stream has <i>N</i> channels, the channels are numbered from 0 to <i>N</i>– 1. To get the number of channels in the stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudiopeakmeter-getchannelcount">IAudioPeakMeter::GetChannelCount</a> method.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the peak meter level in decibels.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiopeakmeter-getlevel
     */
    GetLevel(nChannel) {
        result := ComCall(4, this, "uint", nChannel, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    Query(iid) {
        if (IAudioPeakMeter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetChannelCount := CallbackCreate(GetMethod(implObj, "GetChannelCount"), flags, 2)
        this.vtbl.GetLevel := CallbackCreate(GetMethod(implObj, "GetLevel"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetChannelCount)
        CallbackFree(this.vtbl.GetLevel)
    }
}
