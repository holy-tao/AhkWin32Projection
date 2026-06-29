#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\WTS_SMALL_RECT.ahk" { WTS_SMALL_RECT }
#Import ".\WTS_DISPLAY_IOCTL.ahk" { WTS_DISPLAY_IOCTL }

/**
 * IWTSProtocolConnectionCallback is no longer available. Instead, use IWRdsProtocolConnectionCallback.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolconnectioncallback
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSProtocolConnectionCallback extends IUnknown {
    /**
     * The interface identifier for IWTSProtocolConnectionCallback
     * @type {Guid}
     */
    static IID := Guid("{23083765-75eb-41fe-b4fb-e086242afa0f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSProtocolConnectionCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnReady           : IntPtr
        BrokenConnection  : IntPtr
        StopScreenUpdates : IntPtr
        RedrawWindow      : IntPtr
        DisplayIOCtl      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSProtocolConnectionCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IWTSProtocolConnectionCallback::OnReady is no longer available. Instead, use IWRdsProtocolConnectionCallback::OnReady.
     * @remarks
     * The protocol must call this method after the Remote Desktop Services service calls <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sendpolicydata">SendPolicyData</a>. The Remote Desktop Services service will not call <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-acceptconnection">AcceptConnection</a> to continue the connection process until <b>OnReady</b> has been called.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-onready
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
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-brokenconnection
     */
    BrokenConnection(Reason, Source) {
        result := ComCall(4, this, "uint", Reason, "uint", Source, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnectionCallback::StopScreenUpdates is no longer available. Instead, use IWRdsProtocolConnectionCallback::StopScreenUpdates.
     * @remarks
     * To avoid deadlocks when calling this method:
     * 
     * <ul>
     * <li>Create a separate thread on which to make the call. Do not make the call from inside of any protocol method that you are implementing.</li>
     * <li>Do not block on this method before replying to another call by the Remote Desktop Services service.</li>
     * </ul>
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-stopscreenupdates
     */
    StopScreenUpdates() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnectionCallback::RedrawWindow is no longer available. Instead, use IWRdsProtocolConnectionCallback::RedrawWindow.
     * @remarks
     * This method is typically called after the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-stopscreenupdates">StopScreenUpdates</a> method.
     * 
     * To avoid deadlocks when calling this method:
     * 
     * <ul>
     * <li>Create a separate thread on which to make the call. Do not make the call from inside of any protocol method that you are implementing.</li>
     * <li>Do not block on this method before replying to another call by the Remote Desktop Services service.</li>
     * </ul>
     * @param {Pointer<WTS_SMALL_RECT>} _rect A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_small_rect">WTS_SMALL_RECT</a> structure that contains the x and y coordinates of the screen to redraw. A value of <b>NULL</b> requests that the entire screen be redrawn.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-redrawwindow
     */
    RedrawWindow(_rect) {
        result := ComCall(6, this, WTS_SMALL_RECT.Ptr, _rect, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnectionCallback::DisplayIOCtl is no longer available.
     * @remarks
     * To avoid deadlocks when calling this method:
     * 
     * <ul>
     * <li>Create a separate thread on which to make the call. Do not make the call from inside of any protocol method that you are implementing.</li>
     * <li>Do not block on this method before replying to another call by the Remote Desktop Services service.</li>
     * </ul>
     * @param {Pointer<WTS_DISPLAY_IOCTL>} DisplayIOCtl A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_display_ioctl">WTS_DISPLAY_IOCTL</a> structure that contains data to be sent to the display driver loaded in the session.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-displayioctl
     */
    DisplayIOCtl(DisplayIOCtl) {
        result := ComCall(7, this, WTS_DISPLAY_IOCTL.Ptr, DisplayIOCtl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSProtocolConnectionCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnReady := CallbackCreate(GetMethod(implObj, "OnReady"), flags, 1)
        this.vtbl.BrokenConnection := CallbackCreate(GetMethod(implObj, "BrokenConnection"), flags, 3)
        this.vtbl.StopScreenUpdates := CallbackCreate(GetMethod(implObj, "StopScreenUpdates"), flags, 1)
        this.vtbl.RedrawWindow := CallbackCreate(GetMethod(implObj, "RedrawWindow"), flags, 2)
        this.vtbl.DisplayIOCtl := CallbackCreate(GetMethod(implObj, "DisplayIOCtl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnReady)
        CallbackFree(this.vtbl.BrokenConnection)
        CallbackFree(this.vtbl.StopScreenUpdates)
        CallbackFree(this.vtbl.RedrawWindow)
        CallbackFree(this.vtbl.DisplayIOCtl)
    }
}
