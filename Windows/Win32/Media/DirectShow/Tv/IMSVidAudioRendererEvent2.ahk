#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidAudioRendererEvent.ahk" { IMSVidAudioRendererEvent }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implements an event system for the audio renderer associated with a Video Control.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidAudioRendererEvent2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidaudiorendererevent2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidAudioRendererEvent2 extends IMSVidAudioRendererEvent {
    /**
     * The interface identifier for IMSVidAudioRendererEvent2
     * @type {Guid}
     */
    static IID := Guid("{e3f55729-353b-4c43-a028-50f79aa9a907}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidAudioRendererEvent2 interfaces
    */
    struct Vtbl extends IMSVidAudioRendererEvent.Vtbl {
        AVDecAudioDualMono      : IntPtr
        AVAudioSampleRate       : IntPtr
        AVAudioChannelConfig    : IntPtr
        AVAudioChannelCount     : IntPtr
        AVDecCommonMeanBitRate  : IntPtr
        AVDDSurroundMode        : IntPtr
        AVDecCommonInputFormat  : IntPtr
        AVDecCommonOutputFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidAudioRendererEvent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates a change in the AVDecAudioDualMono codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorendererevent2-avdecaudiodualmono
     */
    AVDecAudioDualMono() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVAudioSampleRate codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorendererevent2-avaudiosamplerate
     */
    AVAudioSampleRate() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDecAudioDualMono codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorendererevent2-avaudiochannelconfig
     */
    AVAudioChannelConfig() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVAudioChannelCount codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorendererevent2-avaudiochannelcount
     */
    AVAudioChannelCount() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDecCommonMeanBitRate codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorendererevent2-avdeccommonmeanbitrate
     */
    AVDecCommonMeanBitRate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDDSurroundMode codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorendererevent2-avddsurroundmode
     */
    AVDDSurroundMode() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDecCommonInputFormat codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorendererevent2-avdeccommoninputformat
     */
    AVDecCommonInputFormat() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Indicates a change in the AVDecCommonOutput codec property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorendererevent2-avdeccommonoutputformat
     */
    AVDecCommonOutputFormat() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidAudioRendererEvent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AVDecAudioDualMono := CallbackCreate(GetMethod(implObj, "AVDecAudioDualMono"), flags, 1)
        this.vtbl.AVAudioSampleRate := CallbackCreate(GetMethod(implObj, "AVAudioSampleRate"), flags, 1)
        this.vtbl.AVAudioChannelConfig := CallbackCreate(GetMethod(implObj, "AVAudioChannelConfig"), flags, 1)
        this.vtbl.AVAudioChannelCount := CallbackCreate(GetMethod(implObj, "AVAudioChannelCount"), flags, 1)
        this.vtbl.AVDecCommonMeanBitRate := CallbackCreate(GetMethod(implObj, "AVDecCommonMeanBitRate"), flags, 1)
        this.vtbl.AVDDSurroundMode := CallbackCreate(GetMethod(implObj, "AVDDSurroundMode"), flags, 1)
        this.vtbl.AVDecCommonInputFormat := CallbackCreate(GetMethod(implObj, "AVDecCommonInputFormat"), flags, 1)
        this.vtbl.AVDecCommonOutputFormat := CallbackCreate(GetMethod(implObj, "AVDecCommonOutputFormat"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AVDecAudioDualMono)
        CallbackFree(this.vtbl.AVAudioSampleRate)
        CallbackFree(this.vtbl.AVAudioChannelConfig)
        CallbackFree(this.vtbl.AVAudioChannelCount)
        CallbackFree(this.vtbl.AVDecCommonMeanBitRate)
        CallbackFree(this.vtbl.AVDDSurroundMode)
        CallbackFree(this.vtbl.AVDecCommonInputFormat)
        CallbackFree(this.vtbl.AVDecCommonOutputFormat)
    }
}
