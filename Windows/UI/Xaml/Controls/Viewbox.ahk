#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IViewbox.ahk
#Include .\IViewboxStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines a content decorator that can stretch and scale a single child to fill the available space.
 * @remarks
 * Viewbox is a container control that scales its content to a specified size.
 * 
 * <img alt="Viewbox control" src="images/controls/Viewbox.png" />
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.viewbox
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Viewbox extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IViewbox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IViewbox.IID

    /**
     * Identifies the [Stretch](viewbox_stretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.viewbox.stretchproperty
     * @type {DependencyProperty} 
     */
    static StretchProperty {
        get => Viewbox.get_StretchProperty()
    }

    /**
     * Identifies the [StretchDirection](viewbox_stretchdirection.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.viewbox.stretchdirectionproperty
     * @type {DependencyProperty} 
     */
    static StretchDirectionProperty {
        get => Viewbox.get_StretchDirectionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StretchProperty() {
        if (!Viewbox.HasProp("__IViewboxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Viewbox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IViewboxStatics.IID)
            Viewbox.__IViewboxStatics := IViewboxStatics(factoryPtr)
        }

        return Viewbox.__IViewboxStatics.get_StretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StretchDirectionProperty() {
        if (!Viewbox.HasProp("__IViewboxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Viewbox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IViewboxStatics.IID)
            Viewbox.__IViewboxStatics := IViewboxStatics(factoryPtr)
        }

        return Viewbox.__IViewboxStatics.get_StretchDirectionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the single child element of a [Viewbox](viewbox.md) element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.viewbox.child
     * @type {UIElement} 
     */
    Child {
        get => this.get_Child()
        set => this.put_Child(value)
    }

    /**
     * Gets or sets the [Stretch](../windows.ui.xaml.media/stretch.md) mode, which determines how content fits into the available space.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.viewbox.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * Gets or sets the [StretchDirection](stretchdirection.md), which determines how scaling is applied to the contents of a [Viewbox](viewbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.viewbox.stretchdirection
     * @type {Integer} 
     */
    StretchDirection {
        get => this.get_StretchDirection()
        set => this.put_StretchDirection(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Viewbox](viewbox.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Viewbox")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Child() {
        if (!this.HasProp("__IViewbox")) {
            if ((queryResult := this.QueryInterface(IViewbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewbox := IViewbox(outPtr)
        }

        return this.__IViewbox.get_Child()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Child(value) {
        if (!this.HasProp("__IViewbox")) {
            if ((queryResult := this.QueryInterface(IViewbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewbox := IViewbox(outPtr)
        }

        return this.__IViewbox.put_Child(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__IViewbox")) {
            if ((queryResult := this.QueryInterface(IViewbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewbox := IViewbox(outPtr)
        }

        return this.__IViewbox.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__IViewbox")) {
            if ((queryResult := this.QueryInterface(IViewbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewbox := IViewbox(outPtr)
        }

        return this.__IViewbox.put_Stretch(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StretchDirection() {
        if (!this.HasProp("__IViewbox")) {
            if ((queryResult := this.QueryInterface(IViewbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewbox := IViewbox(outPtr)
        }

        return this.__IViewbox.get_StretchDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StretchDirection(value) {
        if (!this.HasProp("__IViewbox")) {
            if ((queryResult := this.QueryInterface(IViewbox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewbox := IViewbox(outPtr)
        }

        return this.__IViewbox.put_StretchDirection(value)
    }

;@endregion Instance Methods
}
