#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPPluginUI interface manages the connection to Windows Media Player.
 * @see https://docs.microsoft.com/windows/win32/api//wmpplug/nn-wmpplug-iwmppluginui
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
     * @param {IWMPCore} pCore Pointer to an <b>IWMPCore</b> interface.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpplug/nf-wmpplug-iwmppluginui-setcore
     */
    SetCore(pCore) {
        result := ComCall(3, this, "ptr", pCore, "HRESULT")
        return result
    }

    /**
     * The Create method is called by Windows Media Player to instantiate the plug-in user interface. This method is passed a handle to a parent window of the plug-in window. A handle to the newly created window is then passed back to the calling method.
     * @param {HWND} hwndParent <b>HWND</b> handle to a parent window of the plug-in window.
     * @param {Pointer<HWND>} phwndWindow Pointer to an <b>HWND</b> handle to the plug-in window after the content is filled in.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpplug/nf-wmpplug-iwmppluginui-create
     */
    Create(hwndParent, phwndWindow) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "ptr", phwndWindow, "HRESULT")
        return result
    }

    /**
     * The Destroy method is called by Windows Media Player to shut down the plug-in user interface.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpplug/nf-wmpplug-iwmppluginui-destroy
     */
    Destroy() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The DisplayPropertyPage method is called by Windows Media Player to request that the plug-in display its property page. This method is passed a handle to a parent window of the plug-in property page dialog box.
     * @param {HWND} hwndParent <b>HWND</b> handle to a parent window of the property page dialog box.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpplug/nf-wmpplug-iwmppluginui-displaypropertypage
     */
    DisplayPropertyPage(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "HRESULT")
        return result
    }

    /**
     * The GetProperty method is called by Windows Media Player to retrieve name/value property pairs from the plug-in.
     * @param {PWSTR} pwszName 
     * @param {Pointer<VARIANT>} pvarProperty Pointer to a <b>VARIANT</b> to contain the value of the property.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpplug/nf-wmpplug-iwmppluginui-getproperty
     */
    GetProperty(pwszName, pvarProperty) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "ptr", pvarProperty, "HRESULT")
        return result
    }

    /**
     * The SetProperty method is called by Windows Media Player to set name/value property pairs for the plug-in.
     * @param {PWSTR} pwszName 
     * @param {Pointer<VARIANT>} pvarProperty Pointer to a <b>VARIANT</b> containing the new value of the property.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpplug/nf-wmpplug-iwmppluginui-setproperty
     */
    SetProperty(pwszName, pvarProperty) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(8, this, "ptr", pwszName, "ptr", pvarProperty, "HRESULT")
        return result
    }

    /**
     * The TranslateAccelerator method is called as part of the Windows Media Player message loop to allow the plug-in to intercept and respond to keyboard events.
     * @param {Pointer<MSG>} lpmsg <b>LPMSG</b> structure containing message information from Windows Media Player that the plug-in can respond to.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpplug/nf-wmpplug-iwmppluginui-translateaccelerator
     */
    TranslateAccelerator(lpmsg) {
        result := ComCall(9, this, "ptr", lpmsg, "HRESULT")
        return result
    }
}
