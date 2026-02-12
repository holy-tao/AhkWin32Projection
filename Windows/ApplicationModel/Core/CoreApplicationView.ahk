#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreApplicationView.ahk
#Include .\ICoreApplicationView2.ahk
#Include .\ICoreApplicationView3.ahk
#Include .\ICoreApplicationView5.ahk
#Include .\ICoreApplicationView6.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreApplicationView.ahk
#Include ..\Activation\IActivatedEventArgs.ahk
#Include .\HostedViewClosingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an app window and its thread.
 * @remarks
 * The following code snippet demonstrates the activation of the CoreApplicationView and the associated CoreWindow in a view provider implementation.
 * 
 * ```cppwinrt
 * struct App : implements<App, IFrameworkViewSource, IFrameworkView>
 * {
 * ...
 *     void Initialize(CoreApplicationView const& applicationView)
 *     {
 *         applicationView.Activated({this, &App::OnActivated });
 *     }
 * 
 *     void OnActivated(CoreApplicationView const& // applicationView , IActivatedEventArgs const& // args )
 *     {
 *         // Activate the application window, making it visible and enabling it to receive events.
 *         CoreWindow::GetForCurrentThread().Activate();
 *     }
 * }
 * ```
 * 
 * ```cppcx
 * ref class MyFrameworkView : public IFrameworkView
 * {
 * // ...
 * virtual void Initialize(
 *         _In_ CoreApplicationView^ applicationView
 *         )
 *     {
 *         applicationView->Activated +=
 *             ref new TypedEventHandler<CoreApplicationView^, IActivatedEventArgs^>(this, &MyFrameworkView::OnActivated);
 *     }
 * 
 * // ...
 * 
 * void OnActivated(
 *         _In_ CoreApplicationView^ applicationView,
 *         _In_ IActivatedEventArgs^ args
 *         )
 *     {
 *         // Activate the application window, making it visible and enabling it to receive events.
 *         CoreWindow::GetForCurrentThread()->Activate();
 *     }
 * 
 * // ...
 * }
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationview
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class CoreApplicationView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreApplicationView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreApplicationView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the app window associated with the current view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationview.corewindow
     * @type {CoreWindow} 
     */
    CoreWindow {
        get => this.get_CoreWindow()
    }

    /**
     * Gets a value that indicates whether this app view is the main app view or not.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationview.ismain
     * @type {Boolean} 
     */
    IsMain {
        get => this.get_IsMain()
    }

    /**
     * Gets the value that indicates whether this app view is hosted.
     * @remarks
     * An app view is hosted when the process that launches it controls its lifetime. For example, the window that opens when a [FileOpenPicker](../windows.storage.pickers/fileopenpicker.md) is launched is hosted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationview.ishosted
     * @type {Boolean} 
     */
    IsHosted {
        get => this.get_IsHosted()
    }

    /**
     * Gets the event message dispatcher associated with the current view.
     * @remarks
     * There's one `CoreDispatcher` per thread.  
     * 
     * The `Dispatcher` property of any class within the `CoreApplicationView` namespace will refer to the same object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationview.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * Gets whether the app was launched as a component that is embedded in another app.
     * 
     * This property is reserved for internal use and is not intended to be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationview.iscomponent
     * @type {Boolean} 
     */
    IsComponent {
        get => this.get_IsComponent()
    }

    /**
     * Gets the title bar associated with the current view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationview.titlebar
     * @type {CoreApplicationViewTitleBar} 
     */
    TitleBar {
        get => this.get_TitleBar()
    }

    /**
     * Gets properties that the app can associate with the view.
     * @remarks
     * Properties stored here are guaranteed to have a lifetime equal to the **CoreApplicationView**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationview.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the **DispatcherQueue** for the window.
     * @remarks
     * The **DispatcherQueue** allows you to run your tasks on the thread associated with the **DispatcherQueue** instance. To make UI changes on a **CoreApplicationView** from a different thread, use the **DispatcherQueue** from that **CoreApplicationView**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationview.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * Occurs when the view is activated.
     * @type {TypedEventHandler<CoreApplicationView, IActivatedEventArgs>}
    */
    OnActivated {
        get {
            if(!this.HasProp("__OnActivated")){
                this.__OnActivated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cf193a96-eb13-5e3b-8bdf-87b6efae8339}"),
                    CoreApplicationView,
                    IActivatedEventArgs
                )
                this.__OnActivatedToken := this.add_Activated(this.__OnActivated.iface)
            }
            return this.__OnActivated
        }
    }

    /**
     * Indicates that the hosted view is closing. Provides an opportunity for hosted window scenarios to defer the tear down of the hosted view.
     * @remarks
     * Handling this event provides an opportunity to perform cleanup tasks such as closing files, flushing buffers to disk, and so on.
     * @type {TypedEventHandler<CoreApplicationView, HostedViewClosingEventArgs>}
    */
    OnHostedViewClosing {
        get {
            if(!this.HasProp("__OnHostedViewClosing")){
                this.__OnHostedViewClosing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d9a3f433-9bcc-54d6-b3cf-7b01f026d4cd}"),
                    CoreApplicationView,
                    HostedViewClosingEventArgs
                )
                this.__OnHostedViewClosingToken := this.add_HostedViewClosing(this.__OnHostedViewClosing.iface)
            }
            return this.__OnHostedViewClosing
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnActivatedToken")) {
            this.remove_Activated(this.__OnActivatedToken)
            this.__OnActivated.iface.Dispose()
        }

        if(this.HasProp("__OnHostedViewClosingToken")) {
            this.remove_HostedViewClosing(this.__OnHostedViewClosingToken)
            this.__OnHostedViewClosing.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {CoreWindow} 
     */
    get_CoreWindow() {
        if (!this.HasProp("__ICoreApplicationView")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView := ICoreApplicationView(outPtr)
        }

        return this.__ICoreApplicationView.get_CoreWindow()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreApplicationView, IActivatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
        if (!this.HasProp("__ICoreApplicationView")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView := ICoreApplicationView(outPtr)
        }

        return this.__ICoreApplicationView.add_Activated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Activated(token) {
        if (!this.HasProp("__ICoreApplicationView")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView := ICoreApplicationView(outPtr)
        }

        return this.__ICoreApplicationView.remove_Activated(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMain() {
        if (!this.HasProp("__ICoreApplicationView")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView := ICoreApplicationView(outPtr)
        }

        return this.__ICoreApplicationView.get_IsMain()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHosted() {
        if (!this.HasProp("__ICoreApplicationView")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView := ICoreApplicationView(outPtr)
        }

        return this.__ICoreApplicationView.get_IsHosted()
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        if (!this.HasProp("__ICoreApplicationView2")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView2 := ICoreApplicationView2(outPtr)
        }

        return this.__ICoreApplicationView2.get_Dispatcher()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComponent() {
        if (!this.HasProp("__ICoreApplicationView3")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView3 := ICoreApplicationView3(outPtr)
        }

        return this.__ICoreApplicationView3.get_IsComponent()
    }

    /**
     * 
     * @returns {CoreApplicationViewTitleBar} 
     */
    get_TitleBar() {
        if (!this.HasProp("__ICoreApplicationView3")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView3 := ICoreApplicationView3(outPtr)
        }

        return this.__ICoreApplicationView3.get_TitleBar()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreApplicationView, HostedViewClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HostedViewClosing(handler) {
        if (!this.HasProp("__ICoreApplicationView3")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView3 := ICoreApplicationView3(outPtr)
        }

        return this.__ICoreApplicationView3.add_HostedViewClosing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HostedViewClosing(token) {
        if (!this.HasProp("__ICoreApplicationView3")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView3 := ICoreApplicationView3(outPtr)
        }

        return this.__ICoreApplicationView3.remove_HostedViewClosing(token)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__ICoreApplicationView5")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView5 := ICoreApplicationView5(outPtr)
        }

        return this.__ICoreApplicationView5.get_Properties()
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        if (!this.HasProp("__ICoreApplicationView6")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationView6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationView6 := ICoreApplicationView6(outPtr)
        }

        return this.__ICoreApplicationView6.get_DispatcherQueue()
    }

;@endregion Instance Methods
}
