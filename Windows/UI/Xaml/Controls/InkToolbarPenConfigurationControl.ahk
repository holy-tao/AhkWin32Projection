#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IInkToolbarPenConfigurationControl.ahk
#Include .\IInkToolbarPenConfigurationControlStatics.ahk
#Include .\IInkToolbarPenConfigurationControlFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an object used to configure an optional flyout associated with an [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md). An "extension glyph" is displayed on the button to indicate the existence of the flyout.
 * @remarks
 * The InkToolbarPenConfigurationControl is configured by default for built-in pen buttons derived from [InkToolbarPenButton](inktoolbarpenbutton.md). Custom pen buttons can use these default settings or fully customize them (see examples).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenconfigurationcontrol
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarPenConfigurationControl extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarPenConfigurationControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarPenConfigurationControl.IID

    /**
     * Identifies the [PenButton](inktoolbarpenconfigurationcontrol_penbutton.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenconfigurationcontrol.penbuttonproperty
     * @type {DependencyProperty} 
     */
    static PenButtonProperty {
        get => InkToolbarPenConfigurationControl.get_PenButtonProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PenButtonProperty() {
        if (!InkToolbarPenConfigurationControl.HasProp("__IInkToolbarPenConfigurationControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarPenConfigurationControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarPenConfigurationControlStatics.IID)
            InkToolbarPenConfigurationControl.__IInkToolbarPenConfigurationControlStatics := IInkToolbarPenConfigurationControlStatics(factoryPtr)
        }

        return InkToolbarPenConfigurationControl.__IInkToolbarPenConfigurationControlStatics.get_PenButtonProperty()
    }

    /**
     * 
     * @returns {InkToolbarPenConfigurationControl} 
     */
    static CreateInstance() {
        if (!InkToolbarPenConfigurationControl.HasProp("__IInkToolbarPenConfigurationControlFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarPenConfigurationControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarPenConfigurationControlFactory.IID)
            InkToolbarPenConfigurationControl.__IInkToolbarPenConfigurationControlFactory := IInkToolbarPenConfigurationControlFactory(factoryPtr)
        }

        return InkToolbarPenConfigurationControl.__IInkToolbarPenConfigurationControlFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [InkToolbarPenButton](inktoolbarpenbutton.md) from which to derive the [ConfigurationContent](inktoolbarcustompenbutton_configurationcontent.md) for the optional flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenconfigurationcontrol.penbutton
     * @type {InkToolbarPenButton} 
     */
    PenButton {
        get => this.get_PenButton()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {InkToolbarPenButton} 
     */
    get_PenButton() {
        if (!this.HasProp("__IInkToolbarPenConfigurationControl")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenConfigurationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenConfigurationControl := IInkToolbarPenConfigurationControl(outPtr)
        }

        return this.__IInkToolbarPenConfigurationControl.get_PenButton()
    }

;@endregion Instance Methods
}
