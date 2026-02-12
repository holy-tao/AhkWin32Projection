#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InkToolbarToolButton.ahk
#Include .\IInkToolbarCustomToolButton.ahk
#Include .\IInkToolbarCustomToolButtonFactory.ahk
#Include .\IInkToolbarCustomToolButtonStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) button that invokes a non-pen tool, defined by the host app.
 * @remarks
 * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
 * 
 * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and InkToolbarCustomToolButton) are added here.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * 
 * Built-in buttons can be displayed by default, or you can specify which should be displayed by your app.
 * 
 * > You cannot change the display order of the built-in buttons. The default display order is: [InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md), [InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md), [InkToolbarEraserButton](inktoolbareraserbutton.md), and [InkToolbarRulerButton](inktoolbarrulerbutton.md), with custom tool buttons appended to the radio button group and custom toggle buttons appended to the toggle button group.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustomtoolbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarCustomToolButton extends InkToolbarToolButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarCustomToolButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarCustomToolButton.IID

    /**
     * Identifies the [ConfigurationContent](inktoolbarcustomtoolbutton_configurationcontent.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustomtoolbutton.configurationcontentproperty
     * @type {DependencyProperty} 
     */
    static ConfigurationContentProperty {
        get => InkToolbarCustomToolButton.get_ConfigurationContentProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {InkToolbarCustomToolButton} 
     */
    static CreateInstance() {
        if (!InkToolbarCustomToolButton.HasProp("__IInkToolbarCustomToolButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarCustomToolButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarCustomToolButtonFactory.IID)
            InkToolbarCustomToolButton.__IInkToolbarCustomToolButtonFactory := IInkToolbarCustomToolButtonFactory(factoryPtr)
        }

        return InkToolbarCustomToolButton.__IInkToolbarCustomToolButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ConfigurationContentProperty() {
        if (!InkToolbarCustomToolButton.HasProp("__IInkToolbarCustomToolButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarCustomToolButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarCustomToolButtonStatics.IID)
            InkToolbarCustomToolButton.__IInkToolbarCustomToolButtonStatics := IInkToolbarCustomToolButtonStatics(factoryPtr)
        }

        return InkToolbarCustomToolButton.__IInkToolbarCustomToolButtonStatics.get_ConfigurationContentProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content of an optional ink stroke configuration flyout associated with the [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md).
     * @remarks
     * Each feature on the [InkToolbar](inktoolbar.md) can support supplementary functionality in a flyout (an "extension glyph" on the feature button indicates to the user that the functionality is available).
     * 
     * To access the functionality, the feature button must be selected already, and the user must select the button again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustomtoolbutton.configurationcontent
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
     * @returns {UIElement} 
     */
    get_ConfigurationContent() {
        if (!this.HasProp("__IInkToolbarCustomToolButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarCustomToolButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarCustomToolButton := IInkToolbarCustomToolButton(outPtr)
        }

        return this.__IInkToolbarCustomToolButton.get_ConfigurationContent()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_ConfigurationContent(value) {
        if (!this.HasProp("__IInkToolbarCustomToolButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarCustomToolButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarCustomToolButton := IInkToolbarCustomToolButton(outPtr)
        }

        return this.__IInkToolbarCustomToolButton.put_ConfigurationContent(value)
    }

;@endregion Instance Methods
}
