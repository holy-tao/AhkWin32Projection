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
     * 
     * @param {Pointer<IWMPCore>} pCore 
     * @returns {HRESULT} 
     */
    SetCore(pCore) {
        result := ComCall(3, this, "ptr", pCore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<HWND>} phwndWindow 
     * @returns {HRESULT} 
     */
    Create(hwndParent, phwndWindow) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "ptr", phwndWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Destroy() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     */
    DisplayPropertyPage(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<VARIANT>} pvarProperty 
     * @returns {HRESULT} 
     */
    GetProperty(pwszName, pvarProperty) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "ptr", pvarProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<VARIANT>} pvarProperty 
     * @returns {HRESULT} 
     */
    SetProperty(pwszName, pvarProperty) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(8, this, "ptr", pwszName, "ptr", pvarProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} lpmsg 
     * @returns {HRESULT} 
     */
    TranslateAccelerator(lpmsg) {
        result := ComCall(9, this, "ptr", lpmsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
