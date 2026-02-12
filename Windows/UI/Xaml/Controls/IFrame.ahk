#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Interop\TypeName.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Callback to return a render target. The format of the returned render target is R8G8B8A8\_UNORM regardless of the format of the in-engine rendertarget.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dtools/iframebuffercallback
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrame
     * @type {Guid}
     */
    static IID => Guid("{68ea500b-3fe9-4735-b6a0-e7601933b089}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CacheSize", "put_CacheSize", "get_CanGoBack", "get_CanGoForward", "get_CurrentSourcePageType", "get_SourcePageType", "put_SourcePageType", "get_BackStackDepth", "add_Navigated", "remove_Navigated", "add_Navigating", "remove_Navigating", "add_NavigationFailed", "remove_NavigationFailed", "add_NavigationStopped", "remove_NavigationStopped", "GoBack", "GoForward", "Navigate", "GetNavigationState", "SetNavigationState"]

    /**
     * @type {Integer} 
     */
    CacheSize {
        get => this.get_CacheSize()
        set => this.put_CacheSize(value)
    }

    /**
     * @type {Boolean} 
     */
    CanGoBack {
        get => this.get_CanGoBack()
    }

    /**
     * @type {Boolean} 
     */
    CanGoForward {
        get => this.get_CanGoForward()
    }

    /**
     * @type {TypeName} 
     */
    CurrentSourcePageType {
        get => this.get_CurrentSourcePageType()
    }

    /**
     * @type {TypeName} 
     */
    SourcePageType {
        get => this.get_SourcePageType()
        set => this.put_SourcePageType(value)
    }

    /**
     * @type {Integer} 
     */
    BackStackDepth {
        get => this.get_BackStackDepth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CacheSize() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CacheSize(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoBack() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoForward() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_CurrentSourcePageType() {
        value := TypeName()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_SourcePageType() {
        value := TypeName()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypeName} value 
     * @returns {HRESULT} 
     */
    put_SourcePageType(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackStackDepth() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {NavigatedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Navigated(handler) {
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
    remove_Navigated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {NavigatingCancelEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Navigating(handler) {
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
    remove_Navigating(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {NavigationFailedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationFailed(handler) {
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
    remove_NavigationFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {NavigationStoppedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationStopped(handler) {
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
    remove_NavigationStopped(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoBack() {
        result := ComCall(22, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoForward() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {TypeName} sourcePageType 
     * @param {IInspectable} parameter 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/navigate-element
     */
    Navigate(sourcePageType, parameter) {
        result := ComCall(24, this, "ptr", sourcePageType, "ptr", parameter, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetNavigationState() {
        result_ := HSTRING()
        result := ComCall(25, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} navigationState 
     * @returns {HRESULT} 
     */
    SetNavigationState(navigationState) {
        if(navigationState is String) {
            pin := HSTRING.Create(navigationState)
            navigationState := pin.Value
        }
        navigationState := navigationState is Win32Handle ? NumGet(navigationState, "ptr") : navigationState

        result := ComCall(26, this, "ptr", navigationState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
