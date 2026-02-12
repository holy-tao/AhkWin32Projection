#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebUIActivationStatics4.ahk
#Include .\IWebUIActivationStatics.ahk
#Include .\IWebUIActivationStatics3.ahk
#Include .\IWebUIActivationStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables an app to receive notifications related to the lifetime of the app.
 * @remarks
 * The system creates this object when it runs the app.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiapplication
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUIApplication extends IInspectable {
;@region Static Methods
    /**
     * 
     * @param {EventHandler<NewWebUIViewCreatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_NewWebUIViewCreated(handler) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics4.IID)
            WebUIApplication.__IWebUIActivationStatics4 := IWebUIActivationStatics4(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics4.add_NewWebUIViewCreated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_NewWebUIViewCreated(token) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics4.IID)
            WebUIApplication.__IWebUIActivationStatics4 := IWebUIActivationStatics4(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics4.remove_NewWebUIViewCreated(token)
    }

    /**
     * 
     * @param {BackgroundActivatedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_BackgroundActivated(handler) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics4.IID)
            WebUIApplication.__IWebUIActivationStatics4 := IWebUIActivationStatics4(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics4.add_BackgroundActivated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_BackgroundActivated(token) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics4.IID)
            WebUIApplication.__IWebUIActivationStatics4 := IWebUIActivationStatics4(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics4.remove_BackgroundActivated(token)
    }

    /**
     * 
     * @param {ActivatedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Activated(handler) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics.IID)
            WebUIApplication.__IWebUIActivationStatics := IWebUIActivationStatics(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics.add_Activated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Activated(token) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics.IID)
            WebUIApplication.__IWebUIActivationStatics := IWebUIActivationStatics(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics.remove_Activated(token)
    }

    /**
     * 
     * @param {SuspendingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Suspending(handler) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics.IID)
            WebUIApplication.__IWebUIActivationStatics := IWebUIActivationStatics(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics.add_Suspending(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Suspending(token) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics.IID)
            WebUIApplication.__IWebUIActivationStatics := IWebUIActivationStatics(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics.remove_Suspending(token)
    }

    /**
     * 
     * @param {ResumingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Resuming(handler) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics.IID)
            WebUIApplication.__IWebUIActivationStatics := IWebUIActivationStatics(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics.add_Resuming(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Resuming(token) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics.IID)
            WebUIApplication.__IWebUIActivationStatics := IWebUIActivationStatics(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics.remove_Resuming(token)
    }

    /**
     * 
     * @param {NavigatedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Navigated(handler) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics.IID)
            WebUIApplication.__IWebUIActivationStatics := IWebUIActivationStatics(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics.add_Navigated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Navigated(token) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics.IID)
            WebUIApplication.__IWebUIActivationStatics := IWebUIActivationStatics(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics.remove_Navigated(token)
    }

    /**
     * Attempts to programatically restart the application.
     * @param {HSTRING} launchArguments 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiapplication.requestrestartasync
     */
    static RequestRestartAsync(launchArguments) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics3.IID)
            WebUIApplication.__IWebUIActivationStatics3 := IWebUIActivationStatics3(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics3.RequestRestartAsync(launchArguments)
    }

    /**
     * Requests that the system restarts the app in the context of a specific user.
     * @param {User} user_ The target user. The app will be restarted in the context of this user.
     * @param {HSTRING} launchArguments Launch arguments to pass to the app when it restarts.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiapplication.requestrestartforuserasync
     */
    static RequestRestartForUserAsync(user_, launchArguments) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics3.IID)
            WebUIApplication.__IWebUIActivationStatics3 := IWebUIActivationStatics3(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics3.RequestRestartForUserAsync(user_, launchArguments)
    }

    /**
     * 
     * @param {LeavingBackgroundEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_LeavingBackground(handler) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics2.IID)
            WebUIApplication.__IWebUIActivationStatics2 := IWebUIActivationStatics2(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics2.add_LeavingBackground(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_LeavingBackground(token) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics2.IID)
            WebUIApplication.__IWebUIActivationStatics2 := IWebUIActivationStatics2(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics2.remove_LeavingBackground(token)
    }

    /**
     * 
     * @param {EnteredBackgroundEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_EnteredBackground(handler) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics2.IID)
            WebUIApplication.__IWebUIActivationStatics2 := IWebUIActivationStatics2(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics2.add_EnteredBackground(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_EnteredBackground(token) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics2.IID)
            WebUIApplication.__IWebUIActivationStatics2 := IWebUIActivationStatics2(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics2.remove_EnteredBackground(token)
    }

    /**
     * Specifies whether pre-launching is enabled.
     * @param {Boolean} value **true** to enable pre-launching; otherwise, **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiapplication.enableprelaunch
     */
    static EnablePrelaunch(value) {
        if (!WebUIApplication.HasProp("__IWebUIActivationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIActivationStatics2.IID)
            WebUIApplication.__IWebUIActivationStatics2 := IWebUIActivationStatics2(factoryPtr)
        }

        return WebUIApplication.__IWebUIActivationStatics2.EnablePrelaunch(value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
