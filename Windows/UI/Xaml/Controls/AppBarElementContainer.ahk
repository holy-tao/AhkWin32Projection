#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IAppBarElementContainer.ahk
#Include .\ICommandBarElement.ahk
#Include .\ICommandBarElement2.ahk
#Include .\IAppBarElementContainerStatics.ahk
#Include .\IAppBarElementContainerFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a container that allows an element that doesn't implement ICommandBarElement to be displayed in a command bar.
 * @remarks
 * In order to be added to the primary or secondary command collections of a command bar, an element must implement the [ICommandBarElement](icommandbarelement.md) interface. AppBarElementContainer is a wrapper that implements this interface so you can add an element to a command bar even if it doesn't implement the interface itself.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarelementcontainer
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AppBarElementContainer extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBarElementContainer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBarElementContainer.IID

    /**
     * Identifies the IsCompact dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarelementcontainer.iscompactproperty
     * @type {DependencyProperty} 
     */
    static IsCompactProperty {
        get => AppBarElementContainer.get_IsCompactProperty()
    }

    /**
     * Identifies the IsInOverflow dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarelementcontainer.isinoverflowproperty
     * @type {DependencyProperty} 
     */
    static IsInOverflowProperty {
        get => AppBarElementContainer.get_IsInOverflowProperty()
    }

    /**
     * Identifies the DynamicOverflowOrder dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarelementcontainer.dynamicoverfloworderproperty
     * @type {DependencyProperty} 
     */
    static DynamicOverflowOrderProperty {
        get => AppBarElementContainer.get_DynamicOverflowOrderProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCompactProperty() {
        if (!AppBarElementContainer.HasProp("__IAppBarElementContainerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarElementContainer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarElementContainerStatics.IID)
            AppBarElementContainer.__IAppBarElementContainerStatics := IAppBarElementContainerStatics(factoryPtr)
        }

        return AppBarElementContainer.__IAppBarElementContainerStatics.get_IsCompactProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsInOverflowProperty() {
        if (!AppBarElementContainer.HasProp("__IAppBarElementContainerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarElementContainer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarElementContainerStatics.IID)
            AppBarElementContainer.__IAppBarElementContainerStatics := IAppBarElementContainerStatics(factoryPtr)
        }

        return AppBarElementContainer.__IAppBarElementContainerStatics.get_IsInOverflowProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DynamicOverflowOrderProperty() {
        if (!AppBarElementContainer.HasProp("__IAppBarElementContainerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarElementContainer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarElementContainerStatics.IID)
            AppBarElementContainer.__IAppBarElementContainerStatics := IAppBarElementContainerStatics(factoryPtr)
        }

        return AppBarElementContainer.__IAppBarElementContainerStatics.get_DynamicOverflowOrderProperty()
    }

    /**
     * 
     * @returns {AppBarElementContainer} 
     */
    static CreateInstance() {
        if (!AppBarElementContainer.HasProp("__IAppBarElementContainerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarElementContainer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarElementContainerFactory.IID)
            AppBarElementContainer.__IAppBarElementContainerFactory := IAppBarElementContainerFactory(factoryPtr)
        }

        return AppBarElementContainer.__IAppBarElementContainerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the element is shown in its compact state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarelementcontainer.iscompact
     * @type {Boolean} 
     */
    IsCompact {
        get => this.get_IsCompact()
        set => this.put_IsCompact(value)
    }

    /**
     * Gets a value that indicates whether this item is in the overflow menu.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarelementcontainer.isinoverflow
     * @type {Boolean} 
     */
    IsInOverflow {
        get => this.get_IsInOverflow()
    }

    /**
     * Gets or sets the order in which this item is moved to the [CommandBar](commandbar.md) overflow menu.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarelementcontainer.dynamicoverfloworder
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
