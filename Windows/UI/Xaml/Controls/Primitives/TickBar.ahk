#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\FrameworkElement.ahk
#Include .\ITickBar.ahk
#Include .\ITickBarStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a tick mark on a [Slider](../windows.ui.xaml.controls/slider.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.tickbar
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class TickBar extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITickBar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITickBar.IID

    /**
     * Identifies the [Fill](tickbar_fill.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.tickbar.fillproperty
     * @type {DependencyProperty} 
     */
    static FillProperty {
        get => TickBar.get_FillProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FillProperty() {
        if (!TickBar.HasProp("__ITickBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.TickBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITickBarStatics.IID)
            TickBar.__ITickBarStatics := ITickBarStatics(factoryPtr)
        }

        return TickBar.__ITickBarStatics.get_FillProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) that draws on the background area of the [TickBar](tickbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.tickbar.fill
     * @type {Brush} 
     */
    Fill {
        get => this.get_Fill()
        set => this.put_Fill(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TickBar](tickbar.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.TickBar")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Fill() {
        if (!this.HasProp("__ITickBar")) {
            if ((queryResult := this.QueryInterface(ITickBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITickBar := ITickBar(outPtr)
        }

        return this.__ITickBar.get_Fill()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Fill(value) {
        if (!this.HasProp("__ITickBar")) {
            if ((queryResult := this.QueryInterface(ITickBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITickBar := ITickBar(outPtr)
        }

        return this.__ITickBar.put_Fill(value)
    }

;@endregion Instance Methods
}
