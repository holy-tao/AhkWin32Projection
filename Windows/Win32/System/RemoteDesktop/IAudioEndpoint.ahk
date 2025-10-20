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
     * 
     * @param {Pointer<WAVEFORMATEX>} ppFormat 
     * @returns {HRESULT} 
     */
    GetFrameFormat(ppFormat) {
        result := ComCall(3, this, "ptr", ppFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFramesPerPacket 
     * @returns {HRESULT} 
     */
    GetFramesPerPacket(pFramesPerPacket) {
        result := ComCall(4, this, "uint*", pFramesPerPacket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pLatency 
     * @returns {HRESULT} 
     */
    GetLatency(pLatency) {
        result := ComCall(5, this, "int64*", pLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} streamFlags 
     * @returns {HRESULT} 
     */
    SetStreamFlags(streamFlags) {
        result := ComCall(6, this, "uint", streamFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} eventHandle 
     * @returns {HRESULT} 
     */
    SetEventHandle(eventHandle) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(7, this, "ptr", eventHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
