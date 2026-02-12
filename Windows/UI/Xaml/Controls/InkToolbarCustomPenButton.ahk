#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InkToolbarPenButton.ahk
#Include .\IInkToolbarCustomPenButton.ahk
#Include .\IInkToolbarCustomPenButtonStatics.ahk
#Include .\IInkToolbarCustomPenButtonFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) button that activates a pen for which the ink color palette and pen tip properties, such as shape, rotation, and size, are defined by the host app.
 * @remarks
 * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
 * 
 * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools (InkToolbarCustomPenButton and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * 
 * 
 * Built-in buttons can be displayed by default, or you can specify which should be displayed by your app. 
 * 
 * You cannot change the display order of the built-in buttons. The default display order is: [InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md), [InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md), [InkToolbarEraserButton](inktoolbareraserbutton.md), and [InkToolbarRulerButton](inktoolbarrulerbutton.md), with custom tool buttons appended to the radio button group and custom toggle buttons appended to the toggle button group.
 * 
 * You can use the built-in [InkToolbarPenConfigurationControl](inktoolbarpenconfigurationcontrol.md) or you can specify a custom [InkToolbarPenConfigurationControl](inktoolbarpenconfigurationcontrol.md) definition in the standard [InkToolbar](inktoolbar.md) pen declaration.
 * 
 * For custom configurations, your pen class must derive from [InkToolbarCustomPen](inktoolbarcustompen.md), and override the [CreateInkDrawingAttributesCore](inktoolbarcustompen_createinkdrawingattributescore_257776854.md) method. You can then set an instance of the derived class into [InkToolbarCustomPenButton.CustomPen](inktoolbarcustompenbutton_custompen.md) and provide the custom configuration UI elements.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustompenbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarCustomPenButton extends InkToolbarPenButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarCustomPenButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarCustomPenButton.IID

    /**
     * Identifies the [CustomPen](inktoolbarcustompenbutton_custompen.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustompenbutton.custompenproperty
     * @type {DependencyProperty} 
     */
    static CustomPenProperty {
        get => InkToolbarCustomPenButton.get_CustomPenProperty()
    }

    /**
     * Identifies the [ConfigurationContent](inktoolbarcustompenbutton_configurationcontent.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustompenbutton.configurationcontentproperty
     * @type {DependencyProperty} 
     */
    static ConfigurationContentProperty {
        get => InkToolbarCustomPenButton.get_ConfigurationContentProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CustomPenProperty() {
        if (!InkToolbarCustomPenButton.HasProp("__IInkToolbarCustomPenButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarCustomPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarCustomPenButtonStatics.IID)
            InkToolbarCustomPenButton.__IInkToolbarCustomPenButtonStatics := IInkToolbarCustomPenButtonStatics(factoryPtr)
        }

        return InkToolbarCustomPenButton.__IInkToolbarCustomPenButtonStatics.get_CustomPenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ConfigurationContentProperty() {
        if (!InkToolbarCustomPenButton.HasProp("__IInkToolbarCustomPenButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarCustomPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarCustomPenButtonStatics.IID)
            InkToolbarCustomPenButton.__IInkToolbarCustomPenButtonStatics := IInkToolbarCustomPenButtonStatics(factoryPtr)
        }

        return InkToolbarCustomPenButton.__IInkToolbarCustomPenButtonStatics.get_ConfigurationContentProperty()
    }

    /**
     * 
     * @returns {InkToolbarCustomPenButton} 
     */
    static CreateInstance() {
        if (!InkToolbarCustomPenButton.HasProp("__IInkToolbarCustomPenButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarCustomPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarCustomPenButtonFactory.IID)
            InkToolbarCustomPenButton.__IInkToolbarCustomPenButtonFactory := IInkToolbarCustomPenButtonFactory(factoryPtr)
        }

        return InkToolbarCustomPenButton.__IInkToolbarCustomPenButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [InkToolbarCustomPen](inktoolbarcustompen.md) associated with the [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustompenbutton.custompen
     * @type {InkToolbarCustomPen} 
     */
    CustomPen {
        get => this.get_CustomPen()
        set => this.put_CustomPen(value)
    }

    /**
     * Gets or sets the content of an optional ink stroke configuration flyout associated with the [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md).
     * @remarks
     * Each feature on the [InkToolbar](inktoolbar.md) can support supplementary functionality in a flyout (an "extension glyph" on the feature button indicates to the user that the functionality is available).
     * 
     * To access the functionality, the feature button must be selected already, and the user must select the button again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustompenbutton.configurationcontent
     * @type {UIElement} 
     */
    ConfigurationContent {
        get => this.get_ConfigurationContent()
        set => this.put_ConfigurationContent(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {InkToolbarCustomPen} 
     */
    get_CustomPen() {
        if (!this.HasProp("__IInkToolbarCustomPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarCustomPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarCustomPenButton := IInkToolbarCustomPenButton(outPtr)
        }

        return this.__IInkToolbarCustomPenButton.get_CustomPen()
    }

    /**
     * 
     * @param {InkToolbarCustomPen} value 
     * @returns {HRESULT} 
     */
    put_CustomPen(value) {
        if (!this.HasProp("__IInkToolbarCustomPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarCustomPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarCustomPenButton := IInkToolbarCustomPenButton(outPtr)
        }

        return this.__IInkToolbarCustomPenButton.put_CustomPen(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_ConfigurationContent() {
        if (!this.HasProp("__IInkToolbarCustomPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarCustomPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarCustomPenButton := IInkToolbarCustomPenButton(outPtr)
        }

        return this.__IInkToolbarCustomPenButton.get_ConfigurationContent()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_ConfigurationContent(value) {
        if (!this.HasProp("__IInkToolbarCustomPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarCustomPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarCustomPenButton := IInkToolbarCustomPenButton(outPtr)
        }

        return this.__IInkToolbarCustomPenButton.put_ConfigurationContent(value)
    }

;@endregion Instance Methods
}
