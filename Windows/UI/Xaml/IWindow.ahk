#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include .\UIElement.ahk
#Include ..\Core\CoreWindow.ahk
#Include ..\Core\CoreDispatcher.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to the fundamental window-based functionality of a control.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must support the [Window Control Pattern](/windows/win32/winauto/uiauto-implementingwindow) control pattern.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nn-uiautomationcore-iwindowprovider
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IWindow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindow
     * @type {Guid}
     */
    static IID => Guid("{3276167d-c9f6-462d-9de2-ae4c1fd8c2e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bounds", "get_Visible", "get_Content", "put_Content", "get_CoreWindow", "get_Dispatcher", "add_Activated", "remove_Activated", "add_Closed", "remove_Closed", "add_SizeChanged", "remove_SizeChanged", "add_VisibilityChanged", "remove_VisibilityChanged", "Activate", "Close"]

    /**
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
    }

    /**
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
    }

    /**
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * @type {CoreWindow} 
     */
    CoreWindow {
        get => this.get_CoreWindow()
    }

    /**
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CoreWindow} 
     */
    get_CoreWindow() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreWindow(value)
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreDispatcher(value)
    }

    /**
     * 
     * @param {WindowActivatedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_Activated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {WindowClosedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
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
    remove_Closed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {WindowSizeChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SizeChanged(handler) {
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
    remove_SizeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {WindowVisibilityChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisibilityChanged(handler) {
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
    remove_VisibilityChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ActivateActCtx function activates the specified activation context.
     * @remarks
     * The <i>lpCookie</i> parameter is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-deactivateactctx">DeactivateActCtx</a>, which verifies the pairing of calls to 
     * <b>ActivateActCtx</b> and 
     * <b>DeactivateActCtx</b> and ensures that the appropriate activation context is being deactivated. This is done because the deactivation of activation contexts must occur in the reverse order of activation.
     * 
     * The activation of activation contexts can be understood as pushing an activation context onto a stack of activation contexts. The activation context you activate through this function  redirects any binding to DLLs, window classes, COM servers, type libraries, and mutexes for any side-by-side APIs you call.
     * 
     * The top item of an activation context stack is the active, default-activation context of the current thread. If a null activation context handle is pushed onto the stack, thereby activating it, the default settings in the original manifest override all activation contexts that are lower on the stack.
     * @returns {HRESULT} If the function succeeds, it returns <b>TRUE</b>. Otherwise, it returns <b>FALSE</b>.
     * 
     * This function sets errors that can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. For an example, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/retrieving-the-last-error-code">Retrieving the Last-Error Code</a>. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-activateactctx
     */
    Activate() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * MSSQLSERVER_4064
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
