#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWTSProtocolListenerCallback.ahk" { IWTSProtocolListenerCallback }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * IWTSProtocolListener is no longer available. Instead, use IWRdsProtocolListener.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollistener
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSProtocolListener extends IUnknown {
    /**
     * The interface identifier for IWTSProtocolListener
     * @type {Guid}
     */
    static IID := Guid("{23083765-45f0-4394-8f69-32b2bc0ef4ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSProtocolListener interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartListen : IntPtr
        StopListen  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSProtocolListener.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IWTSProtocolListener::StartListen is no longer available. Instead, use IWRdsProtocolListener::StartListen.
     * @remarks
     * The <b>StartListen</b> method is called when the Remote Desktop Services service starts.
     * 
     * <ol>
     * <li>The Remote Desktop Services service calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to create an  <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolmanager">IWTSProtocolManager</a> object.</li>
     * <li>The Remote Desktop Services service calls <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-createlistener">CreateListener</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolmanager">IWTSProtocolManager</a> interface. The protocol creates an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollistener">IWTSProtocolListener</a> object and passes it back to the Remote Desktop Services service.</li>
     * <li>The Remote Desktop Services service calls <b>StartListen</b> on the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollistener">IWTSProtocolListener</a> object.</li>
     * </ol>
     * @param {IWTSProtocolListenerCallback} pCallback A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollistenercallback">IWTSProtocolListenerCallback</a> object 
     * implemented by the Remote Desktop Servicesservice. The protocol uses the 
     * <b>IWTSProtocolListenerCallback</b> object to notify 
     * the 
     * 
     * Remote Desktop Services 
     * service about incoming connection requests. The protocol must add a reference to this object and release it when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollistener-stoplisten">StopListen</a> is called.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, 
     * return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, 
     * see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollistener-startlisten
     */
    StartListen(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolListener::StopListen is no longer available. Instead, use IWRdsProtocolListener::StopListen.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollistener-stoplisten
     */
    StopListen() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSProtocolListener.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartListen := CallbackCreate(GetMethod(implObj, "StartListen"), flags, 2)
        this.vtbl.StopListen := CallbackCreate(GetMethod(implObj, "StopListen"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartListen)
        CallbackFree(this.vtbl.StopListen)
    }
}
