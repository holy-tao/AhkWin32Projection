#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRemoteDesktopClientSettings.ahk
#Include .\IRemoteDesktopClientActions.ahk
#Include .\IRemoteDesktopClientTouchPointer.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods and properties used to configure and use the Remote Desktop Protocol (RDP) app container client control.
 * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclient
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IRemoteDesktopClient extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDesktopClient
     * @type {Guid}
     */
    static IID => Guid("{57d25668-625a-4905-be4e-304caa13f89c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "Reconnect", "get_Settings", "get_Actions", "get_TouchPointer", "DeleteSavedCredentials", "UpdateSessionDisplaySettings", "attachEvent", "detachEvent"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-connect
     */
    Connect() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disconnects the active connection.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-disconnect
     */
    Disconnect() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates an automatic reconnection of the Remote Desktop Protocol (RDP) app container client control to fit the session to the new width and height.
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-reconnect
     */
    Reconnect(width, height) {
        result := ComCall(9, this, "uint", width, "uint", height, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the settings object for the Remote Desktop Protocol (RDP) app container client.
     * @returns {IRemoteDesktopClientSettings} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-get_settings
     */
    get_Settings() {
        result := ComCall(10, this, "ptr*", &settings := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRemoteDesktopClientSettings(settings)
    }

    /**
     * Retrieves the actions object for the Remote Desktop Protocol (RDP) app container client.
     * @returns {IRemoteDesktopClientActions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-get_actions
     */
    get_Actions() {
        result := ComCall(11, this, "ptr*", &actions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRemoteDesktopClientActions(actions)
    }

    /**
     * Contains the RemoteDesktopClientTouchPointer object for the Remote Desktop Protocol (RDP) app container client.
     * @returns {IRemoteDesktopClientTouchPointer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-get_touchpointer
     */
    get_TouchPointer() {
        result := ComCall(12, this, "ptr*", &touchPointer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRemoteDesktopClientTouchPointer(touchPointer)
    }

    /**
     * Deletes saved credentials for the specified remote computer.
     * @param {BSTR} serverName The name of the remote computer. This can be a DNS name or an IP address.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-deletesavedcredentials
     */
    DeleteSavedCredentials(serverName) {
        if(serverName is String) {
            pin := BSTR.Alloc(serverName)
            serverName := pin.Value
        }

        result := ComCall(13, this, "ptr", serverName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Updates the width and height settings for the Remote Desktop Protocol (RDP) app container client control.
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-updatesessiondisplaysettings
     */
    UpdateSessionDisplaySettings(width, height) {
        result := ComCall(14, this, "uint", width, "uint", height, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Attaches an event handler to an event.
     * @param {BSTR} eventName 
     * @param {IDispatch} callback 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-attachevent
     */
    attachEvent(eventName, callback) {
        if(eventName is String) {
            pin := BSTR.Alloc(eventName)
            eventName := pin.Value
        }

        result := ComCall(15, this, "ptr", eventName, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Detaches an event handler from an event.
     * @param {BSTR} eventName 
     * @param {IDispatch} callback 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-detachevent
     */
    detachEvent(eventName, callback) {
        if(eventName is String) {
            pin := BSTR.Alloc(eventName)
            eventName := pin.Value
        }

        result := ComCall(16, this, "ptr", eventName, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
