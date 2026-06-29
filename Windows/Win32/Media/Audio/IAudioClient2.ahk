#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\AudioClientProperties.ahk" { AudioClientProperties }
#Import ".\IAudioClient.ahk" { IAudioClient }
#Import ".\AUDIO_STREAM_CATEGORY.ahk" { AUDIO_STREAM_CATEGORY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The IAudioClient2 interface is derived from the IAudioClient interface, with a set of additional methods that enable a Windows Audio Session API (WASAPI) audio client to do the following:\_opt in for offloading, query stream properties, and get information from the hardware that handles offloading.The audio client can be successful in creating an offloaded stream if the underlying endpoint supports the hardware audio engine, the endpoint has been enumerated and discovered by the audio system, and there are still offload pin instances available on the endpoint.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudioclient2
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioClient2 extends IAudioClient {
    /**
     * The interface identifier for IAudioClient2
     * @type {Guid}
     */
    static IID := Guid("{726778cd-f60a-4eda-82de-e47610cd78aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioClient2 interfaces
    */
    struct Vtbl extends IAudioClient.Vtbl {
        IsOffloadCapable    : IntPtr
        SetClientProperties : IntPtr
        GetBufferSizeLimits : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioClient2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IsOffloadCapable method retrieves information about whether or not the endpoint on which a stream is created is capable of supporting an offloaded audio stream.
     * @param {AUDIO_STREAM_CATEGORY} Category An enumeration that specifies the category of an audio stream.
     * @returns {BOOL} A pointer to a Boolean value. <b>TRUE</b> indicates that the endpoint is offload-capable. <b>FALSE</b> indicates that the endpoint is not offload-capable.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient2-isoffloadcapable
     */
    IsOffloadCapable(Category) {
        result := ComCall(15, this, AUDIO_STREAM_CATEGORY, Category, BOOL.Ptr, &pbOffloadCapable := 0, "HRESULT")
        return pbOffloadCapable
    }

    /**
     * Sets the properties of the audio stream by populating an AudioClientProperties structure.
     * @remarks
     * Starting with Windows 10, hardware-offloaded audio streams must be event driven. This means that if you call <b>IAudioClient2::SetClientProperties</b> and set the <i>bIsOffload</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audioclientproperties~r1">AudioClientProperties</a> to TRUE, you must specify the <b>AUDCLNT_STREAMFLAGS_EVENTCALLBACK</b> flag in the <i>StreamFlags</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a>.
     * @param {Pointer<AudioClientProperties>} pProperties Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audioclientproperties-r1">AudioClientProperties</a> structure.
     * @returns {HRESULT} The <b>SetClientProperties</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient2-setclientproperties
     */
    SetClientProperties(pProperties) {
        result := ComCall(16, this, AudioClientProperties.Ptr, pProperties, "HRESULT")
        return result
    }

    /**
     * The GetBufferSizeLimits method returns the buffer size limits of the hardware audio engine in 100-nanosecond units.
     * @remarks
     * The <b>GetBufferSizeLimits</b> method is a device-facing method    
     * and does not require prior audio stream initialization.
     * @param {Pointer<WAVEFORMATEX>} pFormat A pointer to the target format that is being queried for the buffer size limit.
     * @param {BOOL} bEventDriven Boolean value to indicate whether or not the stream can be event-driven.
     * @param {Pointer<Integer>} phnsMinBufferDuration Returns a pointer to the minimum buffer size (in 100-nanosecond units) that is 
     * required for the underlying hardware audio engine to operate at the format specified  in the <i>pFormat</i> parameter,  without frequent audio glitching.
     * @param {Pointer<Integer>} phnsMaxBufferDuration Returns a pointer to the maximum buffer size (in 100-nanosecond units) that the underlying hardware 
     * audio engine can support for the format specified  in the <i>pFormat</i> parameter.
     * @returns {HRESULT} The <b>GetBufferSizeLimits</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code. For example, it can return <b>AUDCLNT_E_DEVICE_INVALIDATED</b>, if the device was removed and the method is called.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient2-getbuffersizelimits
     */
    GetBufferSizeLimits(pFormat, bEventDriven, phnsMinBufferDuration, phnsMaxBufferDuration) {
        phnsMinBufferDurationMarshal := phnsMinBufferDuration is VarRef ? "int64*" : "ptr"
        phnsMaxBufferDurationMarshal := phnsMaxBufferDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(17, this, WAVEFORMATEX.Ptr, pFormat, BOOL, bEventDriven, phnsMinBufferDurationMarshal, phnsMinBufferDuration, phnsMaxBufferDurationMarshal, phnsMaxBufferDuration, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioClient2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsOffloadCapable := CallbackCreate(GetMethod(implObj, "IsOffloadCapable"), flags, 3)
        this.vtbl.SetClientProperties := CallbackCreate(GetMethod(implObj, "SetClientProperties"), flags, 2)
        this.vtbl.GetBufferSizeLimits := CallbackCreate(GetMethod(implObj, "GetBufferSizeLimits"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsOffloadCapable)
        CallbackFree(this.vtbl.SetClientProperties)
        CallbackFree(this.vtbl.GetBufferSizeLimits)
    }
}
