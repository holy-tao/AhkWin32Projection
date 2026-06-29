#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Media\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides information to the audio engine about an audio endpoint. This interface is implemented by an audio endpoint.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
 *     applications.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudioendpoint
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IAudioEndpoint extends IUnknown {
    /**
     * The interface identifier for IAudioEndpoint
     * @type {Guid}
     */
    static IID := Guid("{30a99515-1527-4451-af9f-00c5f0234daf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpoint interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFrameFormat     : IntPtr
        GetFramesPerPacket : IntPtr
        GetLatency         : IntPtr
        SetStreamFlags     : IntPtr
        SetEventHandle     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpoint.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the format of the audio endpoint.
     * @remarks
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {Pointer<WAVEFORMATEX>} Receives a pointer to a <b>WAVEFORMATEX</b> structure that contains the  format information for the device that the audio endpoint represents. The implementation must allocate memory for the structure by using <b>CoTaskMemAlloc</b>. The caller must free the buffer by using <b>CoTaskMemFree</b>. For information about <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getframeformat
     */
    GetFrameFormat() {
        result := ComCall(3, this, "ptr*", &ppFormat := 0, "HRESULT")
        return ppFormat
    }

    /**
     * Gets the maximum number of frames per packet that the audio endpoint can support, based on the endpoint's period and the sample rate.
     * @returns {Integer} Receives the maximum number of frames per packet  that the endpoint can support.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getframesperpacket
     */
    GetFramesPerPacket() {
        result := ComCall(4, this, "uint*", &pFramesPerPacket := 0, "HRESULT")
        return pFramesPerPacket
    }

    /**
     * Gets the latency of the audio endpoint.
     * @remarks
     * There is some latency for an endpoint so that the buffer can stay ahead of the data already committed for input/output (I/O) transfer (playback or capture). For example, if an audio endpoint is using 5-millisecond buffers to stay ahead of the I/O transfer, the latency returned by this method is 5 milliseconds.
     * 
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {Integer} A pointer to an <b>HNSTIME</b> variable that receives the latency that is added to the stream by the audio endpoint.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getlatency
     */
    GetLatency() {
        result := ComCall(5, this, "int64*", &pLatency := 0, "HRESULT")
        return pLatency
    }

    /**
     * Sets the stream configuration flags on the audio endpoint.
     * @remarks
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @param {Integer} streamFlags A bitwise <b>OR</b> of one or more of the AUDCLNT_STREAMFLAGS_XXX constants.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-setstreamflags
     */
    SetStreamFlags(streamFlags) {
        result := ComCall(6, this, "uint", streamFlags, "HRESULT")
        return result
    }

    /**
     * Sets the handle for the event that the endpoint uses to signal that it has completed processing of a buffer.
     * @remarks
     * The <b>SetEventHandle</b> method sets the audio engine event handle on the endpoint. In this implementation, the caller should receive an error response of <b>AEERR_NOT_INITIALIZED</b> if the audio endpoint is not initialized or the buffer is not set by the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-setbuffer">SetBuffer</a> method.
     * 
     * To get event notifications, the audio engine will have  set the <b>AUDCLNT_STREAMFLAGS_EVENTCALLBACK</b> flag on the endpoint. To set this flag, the audio engine calls  the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-setstreamflags">IAudioEndpoint::SetStreamFlags</a> method.
     * 
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @param {HANDLE} eventHandle The event handle used to invoke a buffer completion
     *     callback.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. If it fails, possible return codes include, but are not limited to, the following.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-seteventhandle
     */
    SetEventHandle(eventHandle) {
        result := ComCall(7, this, HANDLE, eventHandle, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioEndpoint.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFrameFormat := CallbackCreate(GetMethod(implObj, "GetFrameFormat"), flags, 2)
        this.vtbl.GetFramesPerPacket := CallbackCreate(GetMethod(implObj, "GetFramesPerPacket"), flags, 2)
        this.vtbl.GetLatency := CallbackCreate(GetMethod(implObj, "GetLatency"), flags, 2)
        this.vtbl.SetStreamFlags := CallbackCreate(GetMethod(implObj, "SetStreamFlags"), flags, 2)
        this.vtbl.SetEventHandle := CallbackCreate(GetMethod(implObj, "SetEventHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFrameFormat)
        CallbackFree(this.vtbl.GetFramesPerPacket)
        CallbackFree(this.vtbl.GetLatency)
        CallbackFree(this.vtbl.SetStreamFlags)
        CallbackFree(this.vtbl.SetEventHandle)
    }
}
