#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that provide information about the status of a client connection and that perform actions for the client. This interface is implemented by the Remote Desktop Services service and called by the protocol.
 * @remarks
 * 
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocolconnectioncallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolConnectionCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsProtocolConnectionCallback
     * @type {Guid}
     */
    static IID => Guid("{f1d70332-d070-4ef1-a088-78313536c2d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnReady", "BrokenConnection", "StopScreenUpdates", "RedrawWindow", "GetConnectionId"]

    /**
     * Requests that the Remote Desktop Services service continue the connection process for that client.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnectioncallback-onready
     */
    OnReady() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Informs the Remote Desktop Services service that the client connection has been lost.
     * @param {Integer} Reason This parameter is not used.
     * @param {Integer} Source This parameter is not used.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnectioncallback-brokenconnection
     */
    BrokenConnection(Reason, Source) {
        result := ComCall(4, this, "uint", Reason, "uint", Source, "HRESULT")
        return result
    }

    /**
     * Requests that the Remote Desktop Services service stop updating the client screen.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnectioncallback-stopscreenupdates
     */
    StopScreenUpdates() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Requests that the Remote Desktop Services service redraw the client window.
     * @param {Pointer<WTS_SMALL_RECT>} rect A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_small_rect">WRDS_SMALL_RECT</a> structure that contains the x and y coordinates of the screen to redraw. A value of <b>NULL</b> requests that the entire screen be redrawn.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnectioncallback-redrawwindow
     */
    RedrawWindow(rect) {
        result := ComCall(6, this, "ptr", rect, "HRESULT")
        return result
    }

    /**
     * Retrieves the connection identifier.
     * @returns {Integer} The address of a <b>ULONG</b> variable that receives the connection identifier.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnectioncallback-getconnectionid
     */
    GetConnectionId() {
        result := ComCall(7, this, "uint*", &pConnectionId := 0, "HRESULT")
        return pConnectionId
    }
}
