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
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {BSTR} 
     */
    RemoteUser {
        get => this.get_RemoteUser()
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
    }

    /**
     * Retrieves a value that indicates the session state.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/nf-rendezvoussession-irendezvoussession-get_state
     */
    get_State() {
        result := ComCall(3, this, "int*", &pSessionState := 0, "HRESULT")
        return pSessionState
    }

    /**
     * Retrieves a pointer to a BSTR that contains the Windows Messenger contact name.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/nf-rendezvoussession-irendezvoussession-get_remoteuser
     */
    get_RemoteUser() {
        bstrUserName := BSTR()
        result := ComCall(4, this, "ptr", bstrUserName, "HRESULT")
        return bstrUserName
    }

    /**
     * Retrieves a value that indicates session information. For example, the session flag can indicate whether the user is the inviter or the invitee.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/nf-rendezvoussession-irendezvoussession-get_flags
     */
    get_Flags() {
        result := ComCall(5, this, "int*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Sends the context data to the remote RendezvousApplication.
     * @param {BSTR} bstrData A <b>BSTR</b> specifying context data for the application.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context data was sent successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context data passed to the method is not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to send the context data. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/nf-rendezvoussession-irendezvoussession-sendcontextdata
     */
    SendContextData(bstrData) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(6, this, "ptr", bstrData, "HRESULT")
        return result
    }

    /**
     * Terminates the remote RendezvousApplication.
     * @param {HRESULT} hr The <b>HRESULT</b> from the application termination.
     * @param {BSTR} bstrAppData Application data.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/nf-rendezvoussession-irendezvoussession-terminate
     */
    Terminate(hr, bstrAppData) {
        bstrAppData := bstrAppData is String ? BSTR.Alloc(bstrAppData).Value : bstrAppData

        result := ComCall(7, this, "int", hr, "ptr", bstrAppData, "HRESULT")
        return result
    }
}
