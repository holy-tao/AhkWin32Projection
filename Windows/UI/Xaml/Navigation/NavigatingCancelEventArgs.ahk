#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INavigatingCancelEventArgs.ahk
#Include .\INavigatingCancelEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [OnNavigatingFrom](../windows.ui.xaml.controls/page_onnavigatingfrom_425696585.md) callback that can be used to cancel a navigation request from origination.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigatingcanceleventargs
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class NavigatingCancelEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigatingCancelEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigatingCancelEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies whether a pending navigation should be canceled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigatingcanceleventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * Gets the value of the *mode* parameter from the originating [Navigate](/uwp/api/windows.ui.xaml.controls.frame.navigate) call.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigatingcanceleventargs.navigationmode
     * @type {Integer} 
     */
    NavigationMode {
        get => this.get_NavigationMode()
    }

    /**
     * Gets the value of the `sourcePageType` parameter (the page being navigated to) from the originating [Navigate](/uwp/api/windows.ui.xaml.controls.frame.navigate) call.
     * @remarks
     * During a navigation event, the `sourcePageType` parameter is the page that is being navigated to. For more info, see [Frame.SourcePageType](/uwp/api/windows.ui.xaml.controls.frame.sourcepagetype).
     * 
     * > [!NOTE]
     * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](/uwp/api/windows.ui.xaml.interop.typename) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). If you're using C++/WinRT), this is a [TypeName](/uwp/api/windows.ui.xaml.interop.typename) helper struct.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigatingcanceleventargs.sourcepagetype
     * @type {TypeName} 
     */
    SourcePageType {
        get => this.get_SourcePageType()
    }

    /**
     * Gets the navigation parameter associated with this navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigatingcanceleventargs.parameter
     * @type {IInspectable} 
     */
    Parameter {
        get => this.get_Parameter()
    }

    /**
     * Gets a value that indicates the animated transition associated with the navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigatingcanceleventargs.navigationtransitioninfo
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
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__INavigatingCancelEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigatingCancelEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigatingCancelEventArgs := INavigatingCancelEventArgs(outPtr)
        }

        return this.__INavigatingCancelEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__INavigatingCancelEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigatingCancelEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigatingCancelEventArgs := INavigatingCancelEventArgs(outPtr)
        }

        return this.__INavigatingCancelEventArgs.put_Cancel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NavigationMode() {
        if (!this.HasProp("__INavigatingCancelEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigatingCancelEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigatingCancelEventArgs := INavigatingCancelEventArgs(outPtr)
        }

        return this.__INavigatingCancelEventArgs.get_NavigationMode()
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_SourcePageType() {
        if (!this.HasProp("__INavigatingCancelEventArgs")) {
            if ((queryResult := this.QueryInterface(INavigatingCancelEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigatingCancelEventArgs := INavigatingCancelEventArgs(outPtr)
        }

        return this.__INavigatingCancelEventArgs.get_SourcePageType()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Parameter() {
        if (!this.HasProp("__INavigatingCancelEventArgs2")) {
            if ((queryResult := this.QueryInterface(INavigatingCancelEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigatingCancelEventArgs2 := INavigatingCancelEventArgs2(outPtr)
        }

        return this.__INavigatingCancelEventArgs2.get_Parameter()
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_NavigationTransitionInfo() {
        if (!this.HasProp("__INavigatingCancelEventArgs2")) {
            if ((queryResult := this.QueryInterface(INavigatingCancelEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigatingCancelEventArgs2 := INavigatingCancelEventArgs2(outPtr)
        }

        return this.__INavigatingCancelEventArgs2.get_NavigationTransitionInfo()
    }

;@endregion Instance Methods
}
