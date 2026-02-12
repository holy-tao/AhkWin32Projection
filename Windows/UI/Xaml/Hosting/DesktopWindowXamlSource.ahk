#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDesktopWindowXamlSource.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IDesktopWindowXamlSourceFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\DesktopWindowXamlSource.ahk
#Include .\DesktopWindowXamlSourceTakeFocusRequestedEventArgs.ahk
#Include .\DesktopWindowXamlSourceGotFocusEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Enables a non-UWP desktop application (for example, a WPF or Windows Forms application) to host UWP controls in any UI element that is associated with a window handle (HWND).
 * @remarks
 * **DesktopWindowXamlSource** is the main class in the *UWP XAML hosting API*. This API enables non-UWP desktop applications to host any control that derives from [Windows.UI.Xaml.UIElement](../windows.ui.xaml/uielement.md)) in a UI element that is associated with a window handle (HWND). This API can be used by desktop applications built using WPF, Windows Forms, and the Windows API (Win32). For more information, see [Using the UWP XAML hosting API in a desktop application](/windows/uwp/xaml-platform/using-the-xaml-hosting-api).
 * 
 * If you create a **DesktopWindowXamlSource** object before you create the [Windows.UI.Xaml.UIElement](../windows.ui.xaml/uielement.md) objects that will be hosted in it, the framework for hosting [Windows.UI.Xaml.UIElement](../windows.ui.xaml/uielement.md) content makes sure all the objects are initialized to the same thread. If you create the [Windows.UI.Xaml.UIElement](../windows.ui.xaml/uielement.md) objects before you create the **DesktopWindowXamlSource** object in which they will be hosted, you must call [WindowsXamlManager.InitializeForCurrentThread](windowsxamlmanager_initializeforcurrentthread_14911797.md) before you instantiate the [Windows.UI.Xaml.UIElement](../windows.ui.xaml/uielement.md) objects.
 * 
 * Because **DesktopWindowXamlSource** derives from [IClosable](../windows.foundation/iclosable.md), so it is recommended that you **Close** it (**Dispose** it in .NET) when you’re finished with it.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class DesktopWindowXamlSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDesktopWindowXamlSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDesktopWindowXamlSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DesktopWindowXamlSource} 
     */
    static CreateInstance() {
        if (!DesktopWindowXamlSource.HasProp("__IDesktopWindowXamlSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.DesktopWindowXamlSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDesktopWindowXamlSourceFactory.IID)
            DesktopWindowXamlSource.__IDesktopWindowXamlSourceFactory := IDesktopWindowXamlSourceFactory(factoryPtr)
        }

        return DesktopWindowXamlSource.__IDesktopWindowXamlSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Windows.UI.Xaml.UIElement](../windows.ui.xaml/uielement.md) object that you want to host in the desktop application.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource.content
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets a value that indicates whether the [DesktopWindowXamlSource](desktopwindowxamlsource.md) currently has focus in the desktop application.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource.hasfocus
     * @type {Boolean} 
     */
    HasFocus {
        get => this.get_HasFocus()
    }

    /**
     * Occurs when the host desktop application receives a request take back focus from the [DesktopWindowXamlSource](desktopwindowxamlsource.md) object (for example, the user is on the last focusable element in the **DesktopWindowXamlSource** and presses **Tab**).
     * @remarks
     * When you add a **DesktopWindowXamlSource** to your desktop application, by default the **DesktopWindowXamlSource** does not automatically handle focus navigation via keyboard events such as the **Tab** or arrow keys. Handle this event to programmatically give focus to the next focusable element in the host application when the user navigates away from the **DesktopWindowXamlSource**.
     * @type {TypedEventHandler<DesktopWindowXamlSource, DesktopWindowXamlSourceTakeFocusRequestedEventArgs>}
    */
    OnTakeFocusRequested {
        get {
            if(!this.HasProp("__OnTakeFocusRequested")){
                this.__OnTakeFocusRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9e79eafe-c7fe-54a5-96ff-7abe02e05418}"),
                    DesktopWindowXamlSource,
                    DesktopWindowXamlSourceTakeFocusRequestedEventArgs
                )
                this.__OnTakeFocusRequestedToken := this.add_TakeFocusRequested(this.__OnTakeFocusRequested.iface)
            }
            return this.__OnTakeFocusRequested
        }
    }

    /**
     * Occurs when the [DesktopWindowXamlSource](desktopwindowxamlsource.md) gets focus in the desktop application (for example, the user presses the **Tab** key while focus is on the element just before the **DesktopWindowXamlSource**).
     * @remarks
     * When you add a **DesktopWindowXamlSource** to your desktop application, by default the **DesktopWindowXamlSource** does not automatically handle focus navigation via keyboard events such as the **Tab** or arrow keys. Call the [NavigateFocus](desktopwindowxamlsource_navigatefocus_659659671.md) method to programmatically give focus when the user navigates to the **DesktopWindowXamlSource**.
     * 
     * Handle **GotFocus** event to be notified when user enters the **DesktopWindowXamlSource** via some non-keyboard event, such as a mouse click, and you want to keep the state of the UI in the host desktop application up to date.
     * @type {TypedEventHandler<DesktopWindowXamlSource, DesktopWindowXamlSourceGotFocusEventArgs>}
    */
    OnGotFocus {
        get {
            if(!this.HasProp("__OnGotFocus")){
                this.__OnGotFocus := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a77f0e84-ced7-5681-b140-8c18a55ceb1d}"),
                    DesktopWindowXamlSource,
                    DesktopWindowXamlSourceGotFocusEventArgs
                )
                this.__OnGotFocusToken := this.add_GotFocus(this.__OnGotFocus.iface)
            }
            return this.__OnGotFocus
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTakeFocusRequestedToken")) {
            this.remove_TakeFocusRequested(this.__OnTakeFocusRequestedToken)
            this.__OnTakeFocusRequested.iface.Dispose()
        }

        if(this.HasProp("__OnGotFocusToken")) {
            this.remove_GotFocus(this.__OnGotFocusToken)
            this.__OnGotFocus.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        if (!this.HasProp("__IDesktopWindowXamlSource")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSource := IDesktopWindowXamlSource(outPtr)
        }

        return this.__IDesktopWindowXamlSource.get_Content()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IDesktopWindowXamlSource")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSource := IDesktopWindowXamlSource(outPtr)
        }

        return this.__IDesktopWindowXamlSource.put_Content(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasFocus() {
        if (!this.HasProp("__IDesktopWindowXamlSource")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSource := IDesktopWindowXamlSource(outPtr)
        }

        return this.__IDesktopWindowXamlSource.get_HasFocus()
    }

    /**
     * 
     * @param {TypedEventHandler<DesktopWindowXamlSource, DesktopWindowXamlSourceTakeFocusRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TakeFocusRequested(handler) {
        if (!this.HasProp("__IDesktopWindowXamlSource")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSource := IDesktopWindowXamlSource(outPtr)
        }

        return this.__IDesktopWindowXamlSource.add_TakeFocusRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TakeFocusRequested(token) {
        if (!this.HasProp("__IDesktopWindowXamlSource")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSource := IDesktopWindowXamlSource(outPtr)
        }

        return this.__IDesktopWindowXamlSource.remove_TakeFocusRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DesktopWindowXamlSource, DesktopWindowXamlSourceGotFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        if (!this.HasProp("__IDesktopWindowXamlSource")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSource := IDesktopWindowXamlSource(outPtr)
        }

        return this.__IDesktopWindowXamlSource.add_GotFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GotFocus(token) {
        if (!this.HasProp("__IDesktopWindowXamlSource")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSource := IDesktopWindowXamlSource(outPtr)
        }

        return this.__IDesktopWindowXamlSource.remove_GotFocus(token)
    }

    /**
     * Attempts to programmatically give focus to the [DesktopWindowXamlSource](desktopwindowxamlsource.md) in the desktop application.
     * @remarks
     * When you add a **DesktopWindowXamlSource** to your desktop application, by default the **DesktopWindowXamlSource** does not automatically handle focus navigation via keyboard events such as the **Tab** or arrow keys. Use this method in conjunction with the [GotFocus](desktopwindowxamlsource_gotfocus.md) event to programmatically give focus when the user navigates to the **DesktopWindowXamlSource**.
     * @param {XamlSourceFocusNavigationRequest} request An object that specifies the reason and other optional info for the focus navigation.
     * @returns {XamlSourceFocusNavigationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource.navigatefocus
     */
    NavigateFocus(request) {
        if (!this.HasProp("__IDesktopWindowXamlSource")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowXamlSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowXamlSource := IDesktopWindowXamlSource(outPtr)
        }

        return this.__IDesktopWindowXamlSource.NavigateFocus(request)
    }

    /**
     * Closes and releases any resources used by this [DesktopWindowXamlSource](desktopwindowxamlsource.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
