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
     * 
     * @param {IWMPCore} pCore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpplug/nf-wmpplug-iwmppluginui-setcore
     */
    SetCore(pCore) {
        result := ComCall(3, this, "ptr", pCore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<HWND>} phwndWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpplug/nf-wmpplug-iwmppluginui-create
     */
    Create(hwndParent, phwndWindow) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "ptr", phwndWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpplug/nf-wmpplug-iwmppluginui-destroy
     */
    Destroy() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpplug/nf-wmpplug-iwmppluginui-displaypropertypage
     */
    DisplayPropertyPage(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<VARIANT>} pvarProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpplug/nf-wmpplug-iwmppluginui-getproperty
     */
    GetProperty(pwszName, pvarProperty) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "ptr", pvarProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<VARIANT>} pvarProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpplug/nf-wmpplug-iwmppluginui-setproperty
     */
    SetProperty(pwszName, pvarProperty) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(8, this, "ptr", pwszName, "ptr", pvarProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} lpmsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpplug/nf-wmpplug-iwmppluginui-translateaccelerator
     */
    TranslateAccelerator(lpmsg) {
        result := ComCall(9, this, "ptr", lpmsg, "HRESULT")
        return result
    }
}
