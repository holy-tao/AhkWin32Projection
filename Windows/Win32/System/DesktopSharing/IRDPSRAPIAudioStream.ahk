#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables sending an audio stream from the collaboration sharer Microsoft ActiveX control to collaboration viewer controls.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiaudiostream
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIAudioStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIAudioStream
     * @type {Guid}
     */
    static IID => Guid("{e3e30ef9-89c6-4541-ba3b-19336ac6d31c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Start", "Stop", "GetBuffer", "FreeBuffer"]

    /**
     * Initializes the audio stream.
     * @returns {Integer} On return, indicates the stream period in 100 nanosecond intervals. The collaboration sharer calculates how frequently to call the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-getbuffer">GetBuffer</a> method from this value.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-initialize
     */
    Initialize() {
        result := ComCall(3, this, "int64*", &pnPeriodInHundredNsIntervals := 0, "HRESULT")
        return pnPeriodInHundredNsIntervals
    }

    /**
     * Starts the audio stream.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-start
     */
    Start() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Stops the audio stream.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-stop
     */
    Stop() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Gets audio data from the buffer.
     * @param {Pointer<Pointer<Integer>>} ppbData A pointer to the current location in the buffer.
     * @param {Pointer<Integer>} pcbData The size in bytes of the available data in the buffer.
     * @param {Pointer<Integer>} pTimestamp The time-based location of the location pointer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-getbuffer
     */
    GetBuffer(ppbData, pcbData, pTimestamp) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        pTimestampMarshal := pTimestamp is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, pTimestampMarshal, pTimestamp, "HRESULT")
        return result
    }

    /**
     * Releases the hold on the buffer after the GetBuffer method is called.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-freebuffer
     */
    FreeBuffer() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
