#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods and properties used to configure and use the Remote Desktop Protocol (RDP) app container client control.
 * @see https://docs.microsoft.com/windows/win32/api//rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclient
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-connect
     */
    Connect() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-disconnect
     */
    Disconnect() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-reconnect
     */
    Reconnect(width, height) {
        result := ComCall(9, this, "uint", width, "uint", height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDesktopClientSettings>} settings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-get_settings
     */
    get_Settings(settings) {
        result := ComCall(10, this, "ptr*", settings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDesktopClientActions>} actions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-get_actions
     */
    get_Actions(actions) {
        result := ComCall(11, this, "ptr*", actions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDesktopClientTouchPointer>} touchPointer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-get_touchpointer
     */
    get_TouchPointer(touchPointer) {
        result := ComCall(12, this, "ptr*", touchPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} serverName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-deletesavedcredentials
     */
    DeleteSavedCredentials(serverName) {
        serverName := serverName is String ? BSTR.Alloc(serverName).Value : serverName

        result := ComCall(13, this, "ptr", serverName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-updatesessiondisplaysettings
     */
    UpdateSessionDisplaySettings(width, height) {
        result := ComCall(14, this, "uint", width, "uint", height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} eventName 
     * @param {IDispatch} callback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-attachevent
     */
    attachEvent(eventName, callback) {
        eventName := eventName is String ? BSTR.Alloc(eventName).Value : eventName

        result := ComCall(15, this, "ptr", eventName, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} eventName 
     * @param {IDispatch} callback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclient-detachevent
     */
    detachEvent(eventName, callback) {
        eventName := eventName is String ? BSTR.Alloc(eventName).Value : eventName

        result := ComCall(16, this, "ptr", eventName, "ptr", callback, "HRESULT")
        return result
    }
}
