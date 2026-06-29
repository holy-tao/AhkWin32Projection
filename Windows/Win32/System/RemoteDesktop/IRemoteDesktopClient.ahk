#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRemoteDesktopClientActions.ahk" { IRemoteDesktopClientActions }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IRemoteDesktopClientSettings.ahk" { IRemoteDesktopClientSettings }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRemoteDesktopClientTouchPointer.ahk" { IRemoteDesktopClientTouchPointer }

/**
 * Provides methods and properties used to configure and use the Remote Desktop Protocol (RDP) app container client control.
 * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclient
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IRemoteDesktopClient extends IDispatch {
    /**
     * The interface identifier for IRemoteDesktopClient
     * @type {Guid}
     */
    static IID := Guid("{57d25668-625a-4905-be4e-304caa13f89c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDesktopClient interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Connect                      : IntPtr
        Disconnect                   : IntPtr
        Reconnect                    : IntPtr
        get_Settings                 : IntPtr
        get_Actions                  : IntPtr
        get_TouchPointer             : IntPtr
        DeleteSavedCredentials       : IntPtr
        UpdateSessionDisplaySettings : IntPtr
        attachEvent                  : IntPtr
        detachEvent                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDesktopClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRemoteDesktopClientSettings} 
     */
    Settings {
        get => this.get_Settings()
    }

    /**
     * @type {IRemoteDesktopClientActions} 
     */
    Actions {
        get => this.get_Actions()
    }

    /**
     * @type {IRemoteDesktopClientTouchPointer} 
     */
    TouchPointer {
        get => this.get_TouchPointer()
    }

    /**
     * Initiates a connection by using the properties currently set on the Remote Desktop Protocol (RDP) app container client control.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-connect
     */
    Connect() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Disconnects the active connection.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-disconnect
     */
    Disconnect() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Initiates an automatic reconnection of the Remote Desktop Protocol (RDP) app container client control to fit the session to the new width and height.
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-reconnect
     */
    Reconnect(width, height) {
        result := ComCall(9, this, "uint", width, "uint", height, "HRESULT")
        return result
    }

    /**
     * Retrieves the settings object for the Remote Desktop Protocol (RDP) app container client.
     * @returns {IRemoteDesktopClientSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-get_settings
     */
    get_Settings() {
        result := ComCall(10, this, "ptr*", &settings := 0, "HRESULT")
        return IRemoteDesktopClientSettings(settings)
    }

    /**
     * Retrieves the actions object for the Remote Desktop Protocol (RDP) app container client.
     * @returns {IRemoteDesktopClientActions} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-get_actions
     */
    get_Actions() {
        result := ComCall(11, this, "ptr*", &actions := 0, "HRESULT")
        return IRemoteDesktopClientActions(actions)
    }

    /**
     * Contains the RemoteDesktopClientTouchPointer object for the Remote Desktop Protocol (RDP) app container client.
     * @returns {IRemoteDesktopClientTouchPointer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-get_touchpointer
     */
    get_TouchPointer() {
        result := ComCall(12, this, "ptr*", &touchPointer := 0, "HRESULT")
        return IRemoteDesktopClientTouchPointer(touchPointer)
    }

    /**
     * Deletes saved credentials for the specified remote computer.
     * @param {BSTR} serverName The name of the remote computer. This can be a DNS name or an IP address.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-deletesavedcredentials
     */
    DeleteSavedCredentials(serverName) {
        serverName := serverName is String ? BSTR.Alloc(serverName).Value : serverName

        result := ComCall(13, this, BSTR, serverName, "HRESULT")
        return result
    }

    /**
     * Updates the width and height settings for the Remote Desktop Protocol (RDP) app container client control.
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-updatesessiondisplaysettings
     */
    UpdateSessionDisplaySettings(width, height) {
        result := ComCall(14, this, "uint", width, "uint", height, "HRESULT")
        return result
    }

    /**
     * Attaches an event handler to an event.
     * @param {BSTR} eventName 
     * @param {IDispatch} callback 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-attachevent
     */
    attachEvent(eventName, callback) {
        eventName := eventName is String ? BSTR.Alloc(eventName).Value : eventName

        result := ComCall(15, this, BSTR, eventName, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * Detaches an event handler from an event.
     * @param {BSTR} eventName 
     * @param {IDispatch} callback 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-detachevent
     */
    detachEvent(eventName, callback) {
        eventName := eventName is String ? BSTR.Alloc(eventName).Value : eventName

        result := ComCall(16, this, BSTR, eventName, "ptr", callback, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRemoteDesktopClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 1)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
        this.vtbl.Reconnect := CallbackCreate(GetMethod(implObj, "Reconnect"), flags, 3)
        this.vtbl.get_Settings := CallbackCreate(GetMethod(implObj, "get_Settings"), flags, 2)
        this.vtbl.get_Actions := CallbackCreate(GetMethod(implObj, "get_Actions"), flags, 2)
        this.vtbl.get_TouchPointer := CallbackCreate(GetMethod(implObj, "get_TouchPointer"), flags, 2)
        this.vtbl.DeleteSavedCredentials := CallbackCreate(GetMethod(implObj, "DeleteSavedCredentials"), flags, 2)
        this.vtbl.UpdateSessionDisplaySettings := CallbackCreate(GetMethod(implObj, "UpdateSessionDisplaySettings"), flags, 3)
        this.vtbl.attachEvent := CallbackCreate(GetMethod(implObj, "attachEvent"), flags, 3)
        this.vtbl.detachEvent := CallbackCreate(GetMethod(implObj, "detachEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
        CallbackFree(this.vtbl.Reconnect)
        CallbackFree(this.vtbl.get_Settings)
        CallbackFree(this.vtbl.get_Actions)
        CallbackFree(this.vtbl.get_TouchPointer)
        CallbackFree(this.vtbl.DeleteSavedCredentials)
        CallbackFree(this.vtbl.UpdateSessionDisplaySettings)
        CallbackFree(this.vtbl.attachEvent)
        CallbackFree(this.vtbl.detachEvent)
    }
}
