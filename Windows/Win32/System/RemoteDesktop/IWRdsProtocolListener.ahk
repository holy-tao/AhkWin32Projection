#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WRDS_LISTENER_SETTING_LEVEL.ahk" { WRDS_LISTENER_SETTING_LEVEL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWRdsProtocolListenerCallback.ahk" { IWRdsProtocolListenerCallback }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\WRDS_LISTENER_SETTINGS.ahk" { WRDS_LISTENER_SETTINGS }

/**
 * Exposes methods that request that the protocol start and stop listening for client connection requests.
 * @remarks
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollistener
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsProtocolListener extends IUnknown {
    /**
     * The interface identifier for IWRdsProtocolListener
     * @type {Guid}
     */
    static IID := Guid("{fcbc131b-c686-451d-a773-e279e230f540}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsProtocolListener interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSettings : IntPtr
        StartListen : IntPtr
        StopListen  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsProtocolListener.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the listener setting information for client connection requests.
     * @param {WRDS_LISTENER_SETTING_LEVEL} WRdsListenerSettingLevel The listener setting level to use.
     * @returns {WRDS_LISTENER_SETTINGS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_listener_settings">WRDS_LISTENER_SETTINGS</a> structure that contains the returned listener settings.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollistener-getsettings
     */
    GetSettings(WRdsListenerSettingLevel) {
        pWRdsListenerSettings := WRDS_LISTENER_SETTINGS()
        result := ComCall(3, this, WRDS_LISTENER_SETTING_LEVEL, WRdsListenerSettingLevel, WRDS_LISTENER_SETTINGS.Ptr, pWRdsListenerSettings, "HRESULT")
        return pWRdsListenerSettings
    }

    /**
     * Notifies the protocol to start listening for client connection requests.
     * @remarks
     * The <b>StartListen</b> method is called when the Remote Desktop Services service starts.
     * 
     * <ol>
     * <li>The Remote Desktop Services service calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to create an  <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolmanager">IWRdsProtocolManager</a> object.</li>
     * <li>The Remote Desktop Services service calls <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolmanager-createlistener">CreateListener</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolmanager">IWRdsProtocolManager</a> interface. The protocol creates an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollistener">IWRdsProtocolListener</a> object and passes it back to the Remote Desktop Services service.</li>
     * <li>The Remote Desktop Services service calls <b>StartListen</b> on the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollistener">IWRdsProtocolListener</a> object.</li>
     * </ol>
     * @param {IWRdsProtocolListenerCallback} pCallback A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollistenercallback">IWRdsProtocolListenerCallback</a> object 
     * implemented by the Remote Desktop Servicesservice. The protocol uses the 
     * <b>IWRdsProtocolListenerCallback</b> object to notify 
     * the 
     * 
     * Remote Desktop Services 
     * service about incoming connection requests. The protocol must add a reference to this object and release it when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollistener-stoplisten">StopListen</a> is called.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, 
     * return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, 
     * see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollistener-startlisten
     */
    StartListen(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol to stop listening for client connection requests.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollistener-stoplisten
     */
    StopListen() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWRdsProtocolListener.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSettings := CallbackCreate(GetMethod(implObj, "GetSettings"), flags, 3)
        this.vtbl.StartListen := CallbackCreate(GetMethod(implObj, "StartListen"), flags, 2)
        this.vtbl.StopListen := CallbackCreate(GetMethod(implObj, "StopListen"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSettings)
        CallbackFree(this.vtbl.StartListen)
        CallbackFree(this.vtbl.StopListen)
    }
}
