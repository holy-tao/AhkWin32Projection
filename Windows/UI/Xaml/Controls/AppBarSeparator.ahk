#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IAppBarSeparator.ahk
#Include .\ICommandBarElement.ahk
#Include .\ICommandBarElement2.ahk
#Include .\IAppBarSeparatorStatics3.ahk
#Include .\IAppBarSeparatorFactory.ahk
#Include .\IAppBarSeparatorStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a line that separates items in an [AppBar](appbar.md) or [CommandBar](commandbar.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarseparator
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AppBarSeparator extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBarSeparator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBarSeparator.IID

    /**
     * Identifies the [IsInOverflow](appbarseparator_isinoverflow.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarseparator.isinoverflowproperty
     * @type {DependencyProperty} 
     */
    static IsInOverflowProperty {
        get => AppBarSeparator.get_IsInOverflowProperty()
    }

    /**
     * Identifies the [DynamicOverflowOrder](appbarseparator_dynamicoverfloworder.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarseparator.dynamicoverfloworderproperty
     * @type {DependencyProperty} 
     */
    static DynamicOverflowOrderProperty {
        get => AppBarSeparator.get_DynamicOverflowOrderProperty()
    }

    /**
     * Identifies the [IsCompact](appbarseparator_iscompact.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarseparator.iscompactproperty
     * @type {DependencyProperty} 
     */
    static IsCompactProperty {
        get => AppBarSeparator.get_IsCompactProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsInOverflowProperty() {
        if (!AppBarSeparator.HasProp("__IAppBarSeparatorStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarSeparator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarSeparatorStatics3.IID)
            AppBarSeparator.__IAppBarSeparatorStatics3 := IAppBarSeparatorStatics3(factoryPtr)
        }

        return AppBarSeparator.__IAppBarSeparatorStatics3.get_IsInOverflowProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DynamicOverflowOrderProperty() {
        if (!AppBarSeparator.HasProp("__IAppBarSeparatorStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarSeparator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarSeparatorStatics3.IID)
            AppBarSeparator.__IAppBarSeparatorStatics3 := IAppBarSeparatorStatics3(factoryPtr)
        }

        return AppBarSeparator.__IAppBarSeparatorStatics3.get_DynamicOverflowOrderProperty()
    }

    /**
     * 
     * @returns {AppBarSeparator} 
     */
    static CreateInstance() {
        if (!AppBarSeparator.HasProp("__IAppBarSeparatorFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarSeparator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarSeparatorFactory.IID)
            AppBarSeparator.__IAppBarSeparatorFactory := IAppBarSeparatorFactory(factoryPtr)
        }

        return AppBarSeparator.__IAppBarSeparatorFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCompactProperty() {
        if (!AppBarSeparator.HasProp("__IAppBarSeparatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarSeparator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarSeparatorStatics.IID)
            AppBarSeparator.__IAppBarSeparatorStatics := IAppBarSeparatorStatics(factoryPtr)
        }

        return AppBarSeparator.__IAppBarSeparatorStatics.get_IsCompactProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the separator is shown with reduced padding.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarseparator.iscompact
     * @type {Boolean} 
     */
    IsCompact {
        get => this.get_IsCompact()
        set => this.put_IsCompact(value)
    }

    /**
     * Gets a value that indicates whether this item is in the overflow menu.
     * @remarks
     * For more info and guidelines, see the [App bar and command bar](/windows/uwp/controls-and-patterns/app-bars) article.
     * 
     * Starting in Windows 10, version 1607, [CommandBar](commandbar.md) introduces a dynamic overflow feature. By default, [PrimaryCommands](commandbar_primarycommands.md) automatically move in or out of the overflow area as the command bar width changes, for example, when users resize their app window. You can set the [IsDynamicOverflowEnabled](commandbar_isdynamicoverflowenabled.md) property to **false** to disable this behavior.
     * 
     * Dynamic overflow affects only the UI presentation of the commands, it doesn’t move commands from the [PrimaryCommands](commandbar_primarycommands.md) collection to [SecondaryCommands](commandbar_secondarycommands.md).
     * 
     * When IsInOverflow is **true** for an [AppBarSeparator](appbarseparator.md), the separator bar is hidden rather than being shown in the overflow area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarseparator.isinoverflow
     * @type {Boolean} 
     */
    IsInOverflow {
        get => this.get_IsInOverflow()
    }

    /**
     * Gets or sets the order in which this item is moved to the [CommandBar](commandbar.md) overflow menu.
     * @remarks
     * For more info and guidelines, see the [App bar and command bar](/windows/uwp/controls-and-patterns/app-bars) article.
     * 
     * Starting in Windows 10, version 1607, [CommandBar](commandbar.md) introduces a dynamic overflow feature. By default, [PrimaryCommands](commandbar_primarycommands.md) automatically move in or out of the overflow area as the command bar width changes, for example, when users resize their app window. You can set the [IsDynamicOverflowEnabled](commandbar_isdynamicoverflowenabled.md) property to **false** to disable this behavior.
     * 
     * Dynamic overflow affects only the UI presentation of the commands, it doesn’t move commands from the [PrimaryCommands](commandbar_primarycommands.md) collection to [SecondaryCommands](commandbar_secondarycommands.md).
     * 
     * This property has an effect only when this element is in the [CommandBar.PrimaryCommands](commandbar_primarycommands.md) collection and [CommandBar.IsDynamicOverflowEnabled](commandbar_isdynamicoverflowenabled.md) is **true**.
     * 
     * You can assign the same DynamicOverflowOrder value to more than one element. Elements with the same value move in and out of the overflow area at the same time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarseparator.dynamicoverfloworder
     * @type {Integer} 
     */
    DynamicOverflowOrder {
        get => this.get_DynamicOverflowOrder()
        set => this.put_DynamicOverflowOrder(value)
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
    get_IsCompact() {
        if (!this.HasProp("__ICommandBarElement")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement := ICommandBarElement(outPtr)
        }

        return this.__ICommandBarElement.get_IsCompact()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCompact(value) {
        if (!this.HasProp("__ICommandBarElement")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement := ICommandBarElement(outPtr)
        }

        return this.__ICommandBarElement.put_IsCompact(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInOverflow() {
        if (!this.HasProp("__ICommandBarElement2")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement2 := ICommandBarElement2(outPtr)
        }

        return this.__ICommandBarElement2.get_IsInOverflow()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DynamicOverflowOrder() {
        if (!this.HasProp("__ICommandBarElement2")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement2 := ICommandBarElement2(outPtr)
        }

        return this.__ICommandBarElement2.get_DynamicOverflowOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DynamicOverflowOrder(value) {
        if (!this.HasProp("__ICommandBarElement2")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement2 := ICommandBarElement2(outPtr)
        }

        return this.__ICommandBarElement2.put_DynamicOverflowOrder(value)
    }

;@endregion Instance Methods
}
