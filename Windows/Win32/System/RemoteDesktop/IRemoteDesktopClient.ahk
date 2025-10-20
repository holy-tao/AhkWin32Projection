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
     * 
     * @returns {HRESULT} 
     */
    Connect() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} 
     */
    Reconnect(width, height) {
        result := ComCall(9, this, "uint", width, "uint", height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDesktopClientSettings>} settings 
     * @returns {HRESULT} 
     */
    get_Settings(settings) {
        result := ComCall(10, this, "ptr", settings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDesktopClientActions>} actions 
     * @returns {HRESULT} 
     */
    get_Actions(actions) {
        result := ComCall(11, this, "ptr", actions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDesktopClientTouchPointer>} touchPointer 
     * @returns {HRESULT} 
     */
    get_TouchPointer(touchPointer) {
        result := ComCall(12, this, "ptr", touchPointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} serverName 
     * @returns {HRESULT} 
     */
    DeleteSavedCredentials(serverName) {
        serverName := serverName is String ? BSTR.Alloc(serverName).Value : serverName

        result := ComCall(13, this, "ptr", serverName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} 
     */
    UpdateSessionDisplaySettings(width, height) {
        result := ComCall(14, this, "uint", width, "uint", height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} eventName 
     * @param {Pointer<IDispatch>} callback 
     * @returns {HRESULT} 
     */
    attachEvent(eventName, callback) {
        eventName := eventName is String ? BSTR.Alloc(eventName).Value : eventName

        result := ComCall(15, this, "ptr", eventName, "ptr", callback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} eventName 
     * @param {Pointer<IDispatch>} callback 
     * @returns {HRESULT} 
     */
    detachEvent(eventName, callback) {
        eventName := eventName is String ? BSTR.Alloc(eventName).Value : eventName

        result := ComCall(16, this, "ptr", eventName, "ptr", callback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
