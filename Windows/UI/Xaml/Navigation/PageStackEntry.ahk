#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IPageStackEntry.ahk
#Include .\IPageStackEntryStatics.ahk
#Include .\IPageStackEntryFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an entry in the [BackStack](../windows.ui.xaml.controls/frame_backstack.md) or [ForwardStack](../windows.ui.xaml.controls/frame_forwardstack.md) of a [Frame](../windows.ui.xaml.controls/frame.md).
 * @remarks
 * This class contains info about a specific navigation in the history of a [Frame](../windows.ui.xaml.controls/frame.md). It typically represents entries in the [BackStack](../windows.ui.xaml.controls/frame_backstack.md) and [ForwardStack](../windows.ui.xaml.controls/frame_forwardstack.md) as a result of previous [Frame](../windows.ui.xaml.controls/frame.md) navigations. You can also use this class to add new entries to the navigation history for special purposes. For example, when the user navigates to a specific page using a secondary tile, you can add an entry for the app's main page to the [BackStack](../windows.ui.xaml.controls/frame_backstack.md). This will enable the back button on the secondary tile's page so that the user can easily navigate from there to the home page.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.pagestackentry
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class PageStackEntry extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPageStackEntry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPageStackEntry.IID

    /**
     * Identifies the [SourcePageType](pagestackentry_sourcepagetype.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.pagestackentry.sourcepagetypeproperty
     * @type {DependencyProperty} 
     */
    static SourcePageTypeProperty {
        get => PageStackEntry.get_SourcePageTypeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourcePageTypeProperty() {
        if (!PageStackEntry.HasProp("__IPageStackEntryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Navigation.PageStackEntry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPageStackEntryStatics.IID)
            PageStackEntry.__IPageStackEntryStatics := IPageStackEntryStatics(factoryPtr)
        }

        return PageStackEntry.__IPageStackEntryStatics.get_SourcePageTypeProperty()
    }

    /**
     * Initializes a new instance of the [PageStackEntry](pagestackentry.md) class.
     * @remarks
     * > [!NOTE]
     * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](../windows.ui.xaml.interop/typename.md) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). When programming using C#, it is common to use the **typeof** operator to get references to the [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) of a type. In Microsoft Visual Basic, use **GetType**. If you're using Visual C++ component extensions (C++/CX)), where you'll need to create a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct, you can use the [typeid component extension](/cpp/windows/typeid-cpp-component-extensions).
     * @param {TypeName} sourcePageType The type of page associated with the navigation entry, as a type reference ([System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @param {IInspectable} parameter The navigation parameter associated with the navigation entry.
     * @param {NavigationTransitionInfo} navigationTransitionInfo_ Info about the animated transition associated with the navigation entry.
     * @returns {PageStackEntry} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.pagestackentry.#ctor
     */
    static CreateInstance(sourcePageType, parameter, navigationTransitionInfo_) {
        if (!PageStackEntry.HasProp("__IPageStackEntryFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Navigation.PageStackEntry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPageStackEntryFactory.IID)
            PageStackEntry.__IPageStackEntryFactory := IPageStackEntryFactory(factoryPtr)
        }

        return PageStackEntry.__IPageStackEntryFactory.CreateInstance(sourcePageType, parameter, navigationTransitionInfo_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the type of page associated with this navigation entry.
     * @remarks
     * > [!NOTE]
     * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](../windows.ui.xaml.interop/typename.md) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). If you're using C++/WinRT, this is a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.pagestackentry.sourcepagetype
     * @type {TypeName} 
     */
    SourcePageType {
        get => this.get_SourcePageType()
    }

    /**
     * Gets the navigation parameter associated with this navigation entry.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.pagestackentry.parameter
     * @type {IInspectable} 
     */
    Parameter {
        get => this.get_Parameter()
    }

    /**
     * Gets a value that indicates the animated transition associated with the navigation entry.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.pagestackentry.navigationtransitioninfo
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
     * @returns {TypeName} 
     */
    get_SourcePageType() {
        if (!this.HasProp("__IPageStackEntry")) {
            if ((queryResult := this.QueryInterface(IPageStackEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageStackEntry := IPageStackEntry(outPtr)
        }

        return this.__IPageStackEntry.get_SourcePageType()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Parameter() {
        if (!this.HasProp("__IPageStackEntry")) {
            if ((queryResult := this.QueryInterface(IPageStackEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageStackEntry := IPageStackEntry(outPtr)
        }

        return this.__IPageStackEntry.get_Parameter()
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_NavigationTransitionInfo() {
        if (!this.HasProp("__IPageStackEntry")) {
            if ((queryResult := this.QueryInterface(IPageStackEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageStackEntry := IPageStackEntry(outPtr)
        }

        return this.__IPageStackEntry.get_NavigationTransitionInfo()
    }

;@endregion Instance Methods
}
