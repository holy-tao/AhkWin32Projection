#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include Controls\Primitives\FlyoutBase.ahk
#Include .\DependencyObject.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElement4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElement4
     * @type {Guid}
     */
    static IID => Guid("{69145cd4-199a-4657-9e57-e99e8f136712}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContextFlyout", "put_ContextFlyout", "get_ExitDisplayModeOnAccessKeyInvoked", "put_ExitDisplayModeOnAccessKeyInvoked", "get_IsAccessKeyScope", "put_IsAccessKeyScope", "get_AccessKeyScopeOwner", "put_AccessKeyScopeOwner", "get_AccessKey", "put_AccessKey", "add_ContextRequested", "remove_ContextRequested", "add_ContextCanceled", "remove_ContextCanceled", "add_AccessKeyDisplayRequested", "remove_AccessKeyDisplayRequested", "add_AccessKeyDisplayDismissed", "remove_AccessKeyDisplayDismissed", "add_AccessKeyInvoked", "remove_AccessKeyInvoked"]

    /**
     * @type {FlyoutBase} 
     */
    ContextFlyout {
        get => this.get_ContextFlyout()
        set => this.put_ContextFlyout(value)
    }

    /**
     * @type {Boolean} 
     */
    ExitDisplayModeOnAccessKeyInvoked {
        get => this.get_ExitDisplayModeOnAccessKeyInvoked()
        set => this.put_ExitDisplayModeOnAccessKeyInvoked(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAccessKeyScope {
        get => this.get_IsAccessKeyScope()
        set => this.put_IsAccessKeyScope(value)
    }

    /**
     * @type {DependencyObject} 
     */
    AccessKeyScopeOwner {
        get => this.get_AccessKeyScopeOwner()
        set => this.put_AccessKeyScopeOwner(value)
    }

    /**
     * @type {HSTRING} 
     */
    AccessKey {
        get => this.get_AccessKey()
        set => this.put_AccessKey(value)
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_ContextFlyout() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FlyoutBase(value)
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_ContextFlyout(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExitDisplayModeOnAccessKeyInvoked() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExitDisplayModeOnAccessKeyInvoked(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAccessKeyScope() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAccessKeyScope(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_AccessKeyScopeOwner() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_AccessKeyScopeOwner(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccessKey() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AccessKey(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, ContextRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_ContextRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, RoutedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextCanceled(handler) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", token, "int")
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
    remove_ContextCanceled(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, AccessKeyDisplayRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyDisplayRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", token, "int")
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
    remove_AccessKeyDisplayRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, AccessKeyDisplayDismissedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyDisplayDismissed(handler) {
        token := EventRegistrationToken()
        result := ComCall(22, this, "ptr", handler, "ptr", token, "int")
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
    remove_AccessKeyDisplayDismissed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, AccessKeyInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyInvoked(handler) {
        token := EventRegistrationToken()
        result := ComCall(24, this, "ptr", handler, "ptr", token, "int")
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
    remove_AccessKeyInvoked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(25, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
