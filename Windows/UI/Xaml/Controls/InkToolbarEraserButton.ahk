#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InkToolbarToolButton.ahk
#Include .\IInkToolbarEraserButton.ahk
#Include .\IInkToolbarEraserButton2.ahk
#Include .\IInkToolbarEraserButtonStatics2.ahk
#Include .\IInkToolbarEraserButtonFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) button that activates the built-in eraser tool.
 * @remarks
 * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
 * 
 * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing (InkToolbarEraserButton), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * 
 * The eraser stroke has a default size of 2x2 pixels.
 * 
 * An ink stroke touched by the eraser stroke is deleted in its entirety, not just the portion under the erase stroke.
 * 
 * **Custom drying and the InkToolbar**
 * 
 * By default, ink input is processed on a low-latency background thread and rendered "wet" as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered "dry" to the [InkCanvas](inkcanvas.md) layer (above the application content and replacing the wet ink). The ink platform enables you to override this behavior and completely customize the inking experience by custom drying the ink input.
 * 
 * If your app overrides the default ink rendering behavior of the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) with a custom drying implementation, the rendered ink strokes are no longer available to the [InkToolbar](inktoolbar.md) and the built-in erase commands of the [InkToolbar](inktoolbar.md) do not work as expected. To provide erase functionality, you must handle all pointer events, perform hit-testing on each stroke, and override the built-in "Erase all ink" command.
 * 
 * For more info on custom drying, see [Pen interactions and Windows Ink in UWP apps](/windows/uwp/input-and-devices/pen-and-stylus-interactions).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbareraserbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarEraserButton extends InkToolbarToolButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarEraserButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarEraserButton.IID

    /**
     * Identifies the [IsClearAllVisible](inktoolbareraserbutton_isclearallvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbareraserbutton.isclearallvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsClearAllVisibleProperty {
        get => InkToolbarEraserButton.get_IsClearAllVisibleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsClearAllVisibleProperty() {
        if (!InkToolbarEraserButton.HasProp("__IInkToolbarEraserButtonStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarEraserButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarEraserButtonStatics2.IID)
            InkToolbarEraserButton.__IInkToolbarEraserButtonStatics2 := IInkToolbarEraserButtonStatics2(factoryPtr)
        }

        return InkToolbarEraserButton.__IInkToolbarEraserButtonStatics2.get_IsClearAllVisibleProperty()
    }

    /**
     * 
     * @returns {InkToolbarEraserButton} 
     */
    static CreateInstance() {
        if (!InkToolbarEraserButton.HasProp("__IInkToolbarEraserButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarEraserButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarEraserButtonFactory.IID)
            InkToolbarEraserButton.__IInkToolbarEraserButtonFactory := IInkToolbarEraserButtonFactory(factoryPtr)
        }

        return InkToolbarEraserButton.__IInkToolbarEraserButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether the "Erase all ink" button is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbareraserbutton.isclearallvisible
     * @type {Boolean} 
     */
    IsClearAllVisible {
        get => this.get_IsClearAllVisible()
        set => this.put_IsClearAllVisible(value)
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
    get_IsClearAllVisible() {
        if (!this.HasProp("__IInkToolbarEraserButton2")) {
            if ((queryResult := this.QueryInterface(IInkToolbarEraserButton2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarEraserButton2 := IInkToolbarEraserButton2(outPtr)
        }

        return this.__IInkToolbarEraserButton2.get_IsClearAllVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsClearAllVisible(value) {
        if (!this.HasProp("__IInkToolbarEraserButton2")) {
            if ((queryResult := this.QueryInterface(IInkToolbarEraserButton2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarEraserButton2 := IInkToolbarEraserButton2(outPtr)
        }

        return this.__IInkToolbarEraserButton2.put_IsClearAllVisible(value)
    }

;@endregion Instance Methods
}
