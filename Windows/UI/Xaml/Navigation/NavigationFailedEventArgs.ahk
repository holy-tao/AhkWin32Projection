#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INavigationFailedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [WebView.NavigationFailed](../windows.ui.xaml.controls/webview_navigationfailed.md) and [Frame.NavigationFailed](../windows.ui.xaml.controls/frame_navigationfailed.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationfailedeventargs
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class NavigationFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result code for the exception that is associated with the failed navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationfailedeventargs.exception
     * @type {HRESULT} 
     */
    Exception {
        get => this.get_Exception()
    }

    /**
     * Gets or sets a value that indicates whether the failure event has been handled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationfailedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the value of the `sourcePageType` parameter (the page being navigated to) from the originating [Navigate](/uwp/api/windows.ui.xaml.controls.frame.navigate) call.
     * @remarks
     * During a navigation event, the `sourcePageType` parameter is the page that is being navigated to. For more info, see [Frame.SourcePageType](/uwp/api/windows.ui.xaml.controls.frame.sourcepagetype).
     * 
     * > [!NOTE]
     * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](/uwp/api/windows.ui.xaml.interop.typename) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). If you're using C++/WinRT), this is a [TypeName](/uwp/api/windows.ui.xaml.interop.typename) helper struct.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationfailedeventargs.sourcepagetype
     * @type {TypeName} 
     */
    SourcePageType {
        get => this.get_SourcePageType()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_Exception() {
        if (!this.HasProp("__INavigationFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationFailedEventArgs := INavigationFailedEventArgs(outPtr)
        }

        return this.__INavigationFailedEventArgs.get_Exception()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__INavigationFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationFailedEventArgs := INavigationFailedEventArgs(outPtr)
        }

        return this.__INavigationFailedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__INavigationFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationFailedEventArgs := INavigationFailedEventArgs(outPtr)
        }

        return this.__INavigationFailedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_SourcePageType() {
        if (!this.HasProp("__INavigationFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationFailedEventArgs := INavigationFailedEventArgs(outPtr)
        }

        return this.__INavigationFailedEventArgs.get_SourcePageType()
    }

;@endregion Instance Methods
}
