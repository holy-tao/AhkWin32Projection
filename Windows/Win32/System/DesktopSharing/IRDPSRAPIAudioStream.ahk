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
     * Initializes a thread to use Windows Runtime APIs.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize() {
        result := ComCall(3, this, "int64*", &pnPeriodInHundredNsIntervals := 0, "HRESULT")
        return pnPeriodInHundredNsIntervals
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-start
     */
    Start() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-stop
     */
    Stop() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbData 
     * @param {Pointer<Integer>} pTimestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-getbuffer
     */
    GetBuffer(ppbData, pcbData, pTimestamp) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        pTimestampMarshal := pTimestamp is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, pTimestampMarshal, pTimestamp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-freebuffer
     */
    FreeBuffer() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
