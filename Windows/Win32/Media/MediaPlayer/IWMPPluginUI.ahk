#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPPluginUI interface manages the connection to Windows Media Player.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmpplug/nn-wmpplug-iwmppluginui
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPluginUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPluginUI
     * @type {Guid}
     */
    static IID => Guid("{4c5e8f9f-ad3e-4bf9-9753-fcd30d6d38dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCore", "Create", "Destroy", "DisplayPropertyPage", "GetProperty", "SetProperty", "TranslateAccelerator"]

    /**
     * The SetCore method is called by Windows Media Player to provide plug-in access to the core Windows Media Player APIs.
     * @remarks
     * This method is called by Windows Media Player to allow the plug-in to set or release a pointer to the <b>IWMPCore</b> interface. If <i>pCore</i> is <b>NULL</b>, the plug-in is being shut down and all stored references to the core should be released.
     * 
     * This method is not called when Windows Media Player instantiates the plug-in for the purpose of displaying its property page. This method can therefore be used as an entry point that will only be called when the plug-in is enabled and Windows Media Player loads it normally.
     * @param {IWMPCore} pCore Pointer to an <b>IWMPCore</b> interface.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpplug/nf-wmpplug-iwmppluginui-setcore
     */
    SetCore(pCore) {
        result := ComCall(3, this, "ptr", pCore, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Create method is called by Windows Media Player to instantiate the plug-in user interface. This method is passed a handle to a parent window of the plug-in window. A handle to the newly created window is then passed back to the calling method.
     * @remarks
     * This method is called by Windows Media Player for all user interface plug-in types except the background type.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {HWND} hwndParent <b>HWND</b> handle to a parent window of the plug-in window.
     * @param {Pointer<HWND>} phwndWindow Pointer to an <b>HWND</b> handle to the plug-in window after the content is filled in.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpplug/nf-wmpplug-iwmppluginui-create
     */
    Create(hwndParent, phwndWindow) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "ptr", phwndWindow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Destroy method is called by Windows Media Player to shut down the plug-in user interface.
     * @remarks
     * This method is called by Windows Media Player for all user interface plug-in types except the background type.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpplug/nf-wmpplug-iwmppluginui-destroy
     */
    Destroy() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DisplayPropertyPage method is called by Windows Media Player to request that the plug-in display its property page. This method is passed a handle to a parent window of the plug-in property page dialog box.
     * @remarks
     * This method is called by Windows Media Player only for plug-ins that provide a property page.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {HWND} hwndParent <b>HWND</b> handle to a parent window of the property page dialog box.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpplug/nf-wmpplug-iwmppluginui-displaypropertypage
     */
    DisplayPropertyPage(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetProperty method is called by Windows Media Player to retrieve name/value property pairs from the plug-in.
     * @remarks
     * Windows Media Player determines the type and capabilities of a plug-in by checking the Windows registry, and will retrieve only properties that the plug-in supports.
     * 
     * When a user attempts to close a separate window or background UI plug-in, or to close Windows Media Player when one of these plug-in types is active, this method is called with the <b>PLUGIN_MISC_QUERYDESTROY</b> property specified. If the plug-in is engaged in an operation that cannot be interrupted, such as reading or writing a file or waiting for user input in a modal dialog box, set the out parameter of this method to a non-empty value. This value is displayed to the user to indicate the problem. A user who is attempting to close Windows Media Player is then given the option of overriding the plug-in and closing the Player anyway.
     * 
     * When the plug-in is ready to close, set the out parameter to "" (empty string). When Windows Media Player calls this method and receives an empty value in the out parameter, it closes the plug-in without further delay.
     * 
     * This method is not called when a display area, settings area, or metadata area plug-in is closed. Because these plug-in types are displayed in the <b>Now Playing</b> pane, they must be ready to close at any time, such as when a user switches to another pane.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {PWSTR} pwszName 
     * @param {Pointer<VARIANT>} pvarProperty Pointer to a <b>VARIANT</b> to contain the value of the property.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpplug/nf-wmpplug-iwmppluginui-getproperty
     */
    GetProperty(pwszName, pvarProperty) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "ptr", pvarProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetProperty method is called by Windows Media Player to set name/value property pairs for the plug-in.
     * @remarks
     * Windows Media Player determines the type and capabilities of a plug-in by checking the Windows registry, and will specify only properties that the plug-in supports.
     * 
     * <b>Media</b> and <b>Playlist</b> objects are sent to the plug-in as arrays of <b>IUnknown</b> pointers. The plug-in can call <b>QueryInterface</b> on these pointers to retrieve <b>IWMPMedia</b> or <b>IWMPPlaylist</b> interfaces.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {PWSTR} pwszName 
     * @param {Pointer<VARIANT>} pvarProperty Pointer to a <b>VARIANT</b> containing the new value of the property.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpplug/nf-wmpplug-iwmppluginui-setproperty
     */
    SetProperty(pwszName, pvarProperty) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(8, this, "ptr", pwszName, "ptr", pvarProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The TranslateAccelerator method is called as part of the Windows Media Player message loop to allow the plug-in to intercept and respond to keyboard events.
     * @remarks
     * The plug-in can set up an accelerator table to reroute specific keyboard events to appropriate handler methods. If the plug-in chooses not to respond to keyboard events, it should return <b>S_FALSE</b>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<MSG>} lpmsg <b>LPMSG</b> structure containing message information from Windows Media Player that the plug-in can respond to.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpplug/nf-wmpplug-iwmppluginui-translateaccelerator
     */
    TranslateAccelerator(lpmsg) {
        result := ComCall(9, this, "ptr", lpmsg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
