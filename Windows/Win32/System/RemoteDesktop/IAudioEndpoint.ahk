#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides information to the audio engine about an audio endpoint. This interface is implemented by an audio endpoint.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
 *     applications.
 * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nn-audioengineendpoint-iaudioendpoint
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IAudioEndpoint extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpoint
     * @type {Guid}
     */
    static IID => Guid("{30a99515-1527-4451-af9f-00c5f0234daf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrameFormat", "GetFramesPerPacket", "GetLatency", "SetStreamFlags", "SetEventHandle"]

    /**
     * Retrieves the format of the audio endpoint.
     * @remarks
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {Pointer<WAVEFORMATEX>} Receives a pointer to a <b>WAVEFORMATEX</b> structure that contains the  format information for the device that the audio endpoint represents. The implementation must allocate memory for the structure by using <b>CoTaskMemAlloc</b>. The caller must free the buffer by using <b>CoTaskMemFree</b>. For information about <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getframeformat
     */
    GetFrameFormat() {
        result := ComCall(3, this, "ptr*", &ppFormat := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppFormat
    }

    /**
     * Gets the maximum number of frames per packet that the audio endpoint can support, based on the endpoint's period and the sample rate.
     * @returns {Integer} Receives the maximum number of frames per packet  that the endpoint can support.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getframesperpacket
     */
    GetFramesPerPacket() {
        result := ComCall(4, this, "uint*", &pFramesPerPacket := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getlatency
     */
    GetLatency() {
        result := ComCall(5, this, "int64*", &pLatency := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-setstreamflags
     */
    SetStreamFlags(streamFlags) {
        result := ComCall(6, this, "uint", streamFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-seteventhandle
     */
    SetEventHandle(eventHandle) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(7, this, "ptr", eventHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
