#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\ApplicationModel\DataTransfer\DataPackage.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\Color.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebView2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebView2
     * @type {Guid}
     */
    static IID => Guid("{d481759e-3eff-4462-823d-fd52f9ba4cc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanGoBack", "get_CanGoForward", "get_DocumentTitle", "add_NavigationStarting", "remove_NavigationStarting", "add_ContentLoading", "remove_ContentLoading", "add_DOMContentLoaded", "remove_DOMContentLoaded", "GoForward", "GoBack", "Refresh", "Stop", "CapturePreviewToStreamAsync", "InvokeScriptAsync", "CaptureSelectedContentToDataPackageAsync", "NavigateToLocalStreamUri", "BuildLocalStreamUri", "get_DefaultBackgroundColor", "put_DefaultBackgroundColor", "add_NavigationCompleted", "remove_NavigationCompleted", "add_FrameNavigationStarting", "remove_FrameNavigationStarting", "add_FrameContentLoading", "remove_FrameContentLoading", "add_FrameDOMContentLoaded", "remove_FrameDOMContentLoaded", "add_FrameNavigationCompleted", "remove_FrameNavigationCompleted", "add_LongRunningScriptDetected", "remove_LongRunningScriptDetected", "add_UnsafeContentWarningDisplaying", "remove_UnsafeContentWarningDisplaying", "add_UnviewableContentIdentified", "remove_UnviewableContentIdentified", "NavigateWithHttpRequestMessage", "Focus"]

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
     * @type {HSTRING} 
     */
    DocumentTitle {
        get => this.get_DocumentTitle()
    }

    /**
     * @type {Color} 
     */
    DefaultBackgroundColor {
        get => this.get_DefaultBackgroundColor()
        set => this.put_DefaultBackgroundColor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoBack() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DocumentTitle() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNavigationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_NavigationStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewContentLoadingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentLoading(handler) {
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
    remove_ContentLoading(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewDOMContentLoadedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DOMContentLoaded(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_DOMContentLoaded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
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
        result := ComCall(15, this, "int")
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
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Refresh Method (RDS)
     * @remarks
     * You must set the [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties before you use the **Refresh** method. All data-bound controls on the form associated with an **RDS.DataControl** object will reflect the new set of records. Any pre-existing [Recordset](../ado-api/recordset-object-ado.md) object is released, and any unsaved changes are discarded. The **Refresh** method automatically makes the first record the current record.  
     *   
     *  It is a good idea to call the **Refresh** method periodically when you work with data. If you retrieve data, and then leave it on a client computer for a while, it is likely to become out of date. It is possible that any changes that you make will fail, because someone else might have changed the record and submitted changes before you.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/refresh-method-rds
     */
    Refresh() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @returns {IAsyncAction} 
     */
    CapturePreviewToStreamAsync(stream) {
        result := ComCall(19, this, "ptr", stream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} scriptName 
     * @param {IIterable<HSTRING>} arguments 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    InvokeScriptAsync(scriptName, arguments) {
        if(scriptName is String) {
            pin := HSTRING.Create(scriptName)
            scriptName := pin.Value
        }
        scriptName := scriptName is Win32Handle ? NumGet(scriptName, "ptr") : scriptName

        result := ComCall(20, this, "ptr", scriptName, "ptr", arguments, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<DataPackage>} 
     */
    CaptureSelectedContentToDataPackageAsync() {
        result := ComCall(21, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DataPackage, operation)
    }

    /**
     * 
     * @param {Uri} source 
     * @param {IUriToStreamResolver} streamResolver 
     * @returns {HRESULT} 
     */
    NavigateToLocalStreamUri(source, streamResolver) {
        result := ComCall(22, this, "ptr", source, "ptr", streamResolver, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} contentIdentifier 
     * @param {HSTRING} relativePath 
     * @returns {Uri} 
     */
    BuildLocalStreamUri(contentIdentifier, relativePath) {
        if(contentIdentifier is String) {
            pin := HSTRING.Create(contentIdentifier)
            contentIdentifier := pin.Value
        }
        contentIdentifier := contentIdentifier is Win32Handle ? NumGet(contentIdentifier, "ptr") : contentIdentifier
        if(relativePath is String) {
            pin := HSTRING.Create(relativePath)
            relativePath := pin.Value
        }
        relativePath := relativePath is Win32Handle ? NumGet(relativePath, "ptr") : relativePath

        result := ComCall(23, this, "ptr", contentIdentifier, "ptr", relativePath, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(result_)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DefaultBackgroundColor() {
        value := Color()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_DefaultBackgroundColor(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNavigationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(26, this, "ptr", handler, "ptr", token, "int")
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
    remove_NavigationCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(27, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNavigationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameNavigationStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(28, this, "ptr", handler, "ptr", token, "int")
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
    remove_FrameNavigationStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(29, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewContentLoadingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameContentLoading(handler) {
        token := EventRegistrationToken()
        result := ComCall(30, this, "ptr", handler, "ptr", token, "int")
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
    remove_FrameContentLoading(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(31, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewDOMContentLoadedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameDOMContentLoaded(handler) {
        token := EventRegistrationToken()
        result := ComCall(32, this, "ptr", handler, "ptr", token, "int")
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
    remove_FrameDOMContentLoaded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(33, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNavigationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameNavigationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(34, this, "ptr", handler, "ptr", token, "int")
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
    remove_FrameNavigationCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(35, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewLongRunningScriptDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LongRunningScriptDetected(handler) {
        token := EventRegistrationToken()
        result := ComCall(36, this, "ptr", handler, "ptr", token, "int")
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
    remove_LongRunningScriptDetected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(37, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnsafeContentWarningDisplaying(handler) {
        token := EventRegistrationToken()
        result := ComCall(38, this, "ptr", handler, "ptr", token, "int")
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
    remove_UnsafeContentWarningDisplaying(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(39, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewUnviewableContentIdentifiedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnviewableContentIdentified(handler) {
        token := EventRegistrationToken()
        result := ComCall(40, this, "ptr", handler, "ptr", token, "int")
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
    remove_UnviewableContentIdentified(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(41, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HttpRequestMessage} requestMessage 
     * @returns {HRESULT} 
     */
    NavigateWithHttpRequestMessage(requestMessage) {
        result := ComCall(42, this, "ptr", requestMessage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Configures the [FocusControl](focuscontrol.md) object with values specified in the provided [FocusSettings](focussettings.md) object.
     * @remarks
     * Autofocus mode, enabled by using the [FocusMode.Continuous](focusmode.md) value in the [FocusSettings](focussettings.md) object supplied to this method, is only supported while the preview stream is running. Check to make sure that the preview stream is running before turning on continuous autofocus.
     * @param {Integer} value 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.configure
     */
    Focus(value) {
        result := ComCall(43, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
