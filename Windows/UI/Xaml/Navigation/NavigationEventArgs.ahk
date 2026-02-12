#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INavigationEventArgs.ahk
#Include .\INavigationEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for navigation methods and event handlers that cannot cancel the navigation request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationeventargs
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class NavigationEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the root node of the target page's content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationeventargs.content
     * @type {IInspectable} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets any "Parameter" object passed to the target page for the navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationeventargs.parameter
     * @type {IInspectable} 
     */
    Parameter {
        get => this.get_Parameter()
    }

    /**
     * Gets the value of the `sourcePageType` parameter (the page being navigated to) from the originating [Navigate](/uwp/api/windows.ui.xaml.controls.frame.navigate) call.
     * @remarks
     * During a navigation event, the `sourcePageType` parameter is the page that is being navigated to. For more info, see [Frame.SourcePageType](/uwp/api/windows.ui.xaml.controls.frame.sourcepagetype).
     * 
     * > [!NOTE]
     * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](/uwp/api/windows.ui.xaml.interop.typename) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). If you're using C++/WinRT), this is a [TypeName](/uwp/api/windows.ui.xaml.interop.typename) helper struct.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationeventargs.sourcepagetype
     * @type {TypeName} 
     */
    SourcePageType {
        get => this.get_SourcePageType()
    }

    /**
     * Gets a value that indicates the direction of movement during navigation
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationeventargs.navigationmode
     * @type {Integer} 
     */
    NavigationMode {
        get => this.get_NavigationMode()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of the target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets a value that indicates the animated transition associated with the navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationeventargs.navigationtransitioninfo
     * @type {NavigationTransitionInfo} 
     */
    NavigationTransitionInfo {
        get => this.get_NavigationTransitionInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Content() {
        if (!this.HasProp("__INavigationEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationEventArgs := INavigationEventArgs(outPtr)
        }

        return this.__INavigationEventArgs.get_Content()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Parameter() {
        if (!this.HasProp("__INavigationEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationEventArgs := INavigationEventArgs(outPtr)
        }

        return this.__INavigationEventArgs.get_Parameter()
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_SourcePageType() {
        if (!this.HasProp("__INavigationEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationEventArgs := INavigationEventArgs(outPtr)
        }

        return this.__INavigationEventArgs.get_SourcePageType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NavigationMode() {
        if (!this.HasProp("__INavigationEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationEventArgs := INavigationEventArgs(outPtr)
        }

        return this.__INavigationEventArgs.get_NavigationMode()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__INavigationEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationEventArgs := INavigationEventArgs(outPtr)
        }

        return this.__INavigationEventArgs.get_Uri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__INavigationEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationEventArgs := INavigationEventArgs(outPtr)
        }

        return this.__INavigationEventArgs.put_Uri(value)
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_NavigationTransitionInfo() {
        if (!this.HasProp("__INavigationEventArgs2")) {
            if ((queryResult := this.QueryInterface(INavigationEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationEventArgs2 := INavigationEventArgs2(outPtr)
        }

        return this.__INavigationEventArgs2.get_NavigationTransitionInfo()
    }

;@endregion Instance Methods
}
