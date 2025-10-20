#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that send data about the session and that can terminate it.
 * @remarks
 * 
  * The instant messaging (IM) application implements this interface and passes the object that implements <b>IRendezvousSession</b> and supports the <a href="https://docs.microsoft.com/previous-versions/ms715092(v=vs.85)">DRendezvousSessionEvents</a> connection point. 
  * 
  * The Windows Remote Assistance application calls <b>IRendezvousSession</b>-&gt;<a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> to retain the session after the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/rendezvoussession/nf-rendezvoussession-irendezvousapplication-setrendezvoussession">SetRendezvousSession</a> completes. 
  * 
  * The Windows Remote Assistance application calls <b>IRendezvousSession</b>-&gt;<a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when the session is complete.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/nn-rendezvoussession-irendezvoussession
 * @namespace Windows.Win32.System.RemoteAssistance
 * @version v4.0.30319
 */
class IRendezvousSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRendezvousSession
     * @type {Guid}
     */
    static IID => Guid("{9ba4b1dd-8b0c-48b7-9e7c-2f25857c8df5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_State", "get_RemoteUser", "get_Flags", "SendContextData", "Terminate"]

    /**
     * 
     * @param {Pointer<Integer>} pSessionState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rendezvoussession/nf-rendezvoussession-irendezvoussession-get_state
     */
    get_State(pSessionState) {
        result := ComCall(3, this, "int*", pSessionState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rendezvoussession/nf-rendezvoussession-irendezvoussession-get_remoteuser
     */
    get_RemoteUser(bstrUserName) {
        result := ComCall(4, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rendezvoussession/nf-rendezvoussession-irendezvoussession-get_flags
     */
    get_Flags(pFlags) {
        result := ComCall(5, this, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rendezvoussession/nf-rendezvoussession-irendezvoussession-sendcontextdata
     */
    SendContextData(bstrData) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(6, this, "ptr", bstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {BSTR} bstrAppData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rendezvoussession/nf-rendezvoussession-irendezvoussession-terminate
     */
    Terminate(hr, bstrAppData) {
        bstrAppData := bstrAppData is String ? BSTR.Alloc(bstrAppData).Value : bstrAppData

        result := ComCall(7, this, "int", hr, "ptr", bstrAppData, "HRESULT")
        return result
    }
}
