#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolConnectionCallback is no longer available. Instead, use IWRdsProtocolConnectionCallback.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocolconnectioncallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolConnectionCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSProtocolConnectionCallback
     * @type {Guid}
     */
    static IID => Guid("{23083765-75eb-41fe-b4fb-e086242afa0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnReady", "BrokenConnection", "StopScreenUpdates", "RedrawWindow", "DisplayIOCtl"]

    /**
     * IWTSProtocolConnectionCallback::OnReady is no longer available. Instead, use IWRdsProtocolConnectionCallback::OnReady.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-onready
     */
    OnReady() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnectionCallback::BrokenConnection is no longer available. Instead, use IWRdsProtocolConnectionCallback::BrokenConnection.
     * @param {Integer} Reason This parameter is not used.
     * @param {Integer} Source This parameter is not used.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-brokenconnection
     */
    BrokenConnection(Reason, Source) {
        result := ComCall(4, this, "uint", Reason, "uint", Source, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnectionCallback::StopScreenUpdates is no longer available. Instead, use IWRdsProtocolConnectionCallback::StopScreenUpdates.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-stopscreenupdates
     */
    StopScreenUpdates() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnectionCallback::RedrawWindow is no longer available. Instead, use IWRdsProtocolConnectionCallback::RedrawWindow.
     * @param {Pointer<WTS_SMALL_RECT>} rect A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_small_rect">WTS_SMALL_RECT</a> structure that contains the x and y coordinates of the screen to redraw. A value of <b>NULL</b> requests that the entire screen be redrawn.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-redrawwindow
     */
    RedrawWindow(rect) {
        result := ComCall(6, this, "ptr", rect, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnectionCallback::DisplayIOCtl is no longer available.
     * @param {Pointer<WTS_DISPLAY_IOCTL>} DisplayIOCtl A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_display_ioctl">WTS_DISPLAY_IOCTL</a> structure that contains data to be sent to the display driver loaded in the session.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-displayioctl
     */
    DisplayIOCtl(DisplayIOCtl) {
        result := ComCall(7, this, "ptr", DisplayIOCtl, "HRESULT")
        return result
    }
}
