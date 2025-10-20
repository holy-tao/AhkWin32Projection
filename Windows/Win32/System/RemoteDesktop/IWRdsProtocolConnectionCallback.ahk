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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnectioncallback-onready
     */
    OnReady() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Reason 
     * @param {Integer} Source 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnectioncallback-brokenconnection
     */
    BrokenConnection(Reason, Source) {
        result := ComCall(4, this, "uint", Reason, "uint", Source, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnectioncallback-stopscreenupdates
     */
    StopScreenUpdates() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The RedrawWindow function updates the specified rectangle or region in a window's client area.
     * @param {Pointer<WTS_SMALL_RECT>} rect 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-redrawwindow
     */
    RedrawWindow(rect) {
        result := ComCall(6, this, "ptr", rect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pConnectionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnectioncallback-getconnectionid
     */
    GetConnectionId(pConnectionId) {
        result := ComCall(7, this, "uint*", pConnectionId, "HRESULT")
        return result
    }
}
