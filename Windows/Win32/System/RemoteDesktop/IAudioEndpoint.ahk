#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides information to the audio engine about an audio endpoint. This interface is implemented by an audio endpoint.
 * @remarks
 * 
  * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
  *     applications.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudioendpoint
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
     * 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getframeformat
     */
    GetFrameFormat(ppFormat) {
        result := ComCall(3, this, "ptr*", ppFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFramesPerPacket 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getframesperpacket
     */
    GetFramesPerPacket(pFramesPerPacket) {
        pFramesPerPacketMarshal := pFramesPerPacket is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pFramesPerPacketMarshal, pFramesPerPacket, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLatency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getlatency
     */
    GetLatency(pLatency) {
        pLatencyMarshal := pLatency is VarRef ? "int64*" : "ptr"

        result := ComCall(5, this, pLatencyMarshal, pLatency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} streamFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-setstreamflags
     */
    SetStreamFlags(streamFlags) {
        result := ComCall(6, this, "uint", streamFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} eventHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-seteventhandle
     */
    SetEventHandle(eventHandle) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(7, this, "ptr", eventHandle, "HRESULT")
        return result
    }
}
