#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class ICoreApplicationViewTitleBar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreApplicationViewTitleBar
     * @type {Guid}
     */
    static IID => Guid("{006d35e3-e1f1-431b-9508-29b96926ac53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ExtendViewIntoTitleBar", "get_ExtendViewIntoTitleBar", "get_SystemOverlayLeftInset", "get_SystemOverlayRightInset", "get_Height", "add_LayoutMetricsChanged", "remove_LayoutMetricsChanged", "get_IsVisible", "add_IsVisibleChanged", "remove_IsVisibleChanged"]

    /**
     * @type {Boolean} 
     */
    ExtendViewIntoTitleBar {
        get => this.get_ExtendViewIntoTitleBar()
        set => this.put_ExtendViewIntoTitleBar(value)
    }

    /**
     * @type {Float} 
     */
    SystemOverlayLeftInset {
        get => this.get_SystemOverlayLeftInset()
    }

    /**
     * @type {Float} 
     */
    SystemOverlayRightInset {
        get => this.get_SystemOverlayRightInset()
    }

    /**
     * @type {Float} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExtendViewIntoTitleBar(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExtendViewIntoTitleBar() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SystemOverlayLeftInset() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SystemOverlayRightInset() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Height() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<CoreApplicationViewTitleBar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LayoutMetricsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LayoutMetricsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<CoreApplicationViewTitleBar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsVisibleChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsVisibleChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
