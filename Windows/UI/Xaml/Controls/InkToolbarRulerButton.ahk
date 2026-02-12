#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InkToolbarToggleButton.ahk
#Include .\IInkToolbarRulerButton.ahk
#Include .\IInkToolbarRulerButtonStatics.ahk
#Include .\IInkToolbarRulerButtonFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) button that sets the state of the built-in ruler tool to on or off.
 * @remarks
 * Apps that target Windows Creators Update (SDK 15063) or later should use the [InkToolbarStencilButton](inktoolbarstencilbutton.md) object instead of this object. If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
 * 
 * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
 * 
 * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the InkToolbarRulerButton button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarrulerbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarRulerButton extends InkToolbarToggleButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarRulerButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarRulerButton.IID

    /**
     * Identifies the [Ruler](inktoolbarrulerbutton_ruler.md) dependency property.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use the [InkToolbarStencilButton](inktoolbarstencilbutton.md) object instead of this object. If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarrulerbutton.rulerproperty
     * @type {DependencyProperty} 
     */
    static RulerProperty {
        get => InkToolbarRulerButton.get_RulerProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RulerProperty() {
        if (!InkToolbarRulerButton.HasProp("__IInkToolbarRulerButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarRulerButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarRulerButtonStatics.IID)
            InkToolbarRulerButton.__IInkToolbarRulerButtonStatics := IInkToolbarRulerButtonStatics(factoryPtr)
        }

        return InkToolbarRulerButton.__IInkToolbarRulerButtonStatics.get_RulerProperty()
    }

    /**
     * 
     * @returns {InkToolbarRulerButton} 
     */
    static CreateInstance() {
        if (!InkToolbarRulerButton.HasProp("__IInkToolbarRulerButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarRulerButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarRulerButtonFactory.IID)
            InkToolbarRulerButton.__IInkToolbarRulerButtonFactory := IInkToolbarRulerButtonFactory(factoryPtr)
        }

        return InkToolbarRulerButton.__IInkToolbarRulerButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the stencil associated with the [InkToolbarRulerButton](inktoolbarrulerbutton.md).
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use the [InkToolbarStencilButton](inktoolbarstencilbutton.md) object instead of this object. If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarrulerbutton.ruler
     * @type {InkPresenterRuler} 
     */
    Ruler {
        get => this.get_Ruler()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {InkPresenterRuler} 
     */
    get_Ruler() {
        if (!this.HasProp("__IInkToolbarRulerButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarRulerButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarRulerButton := IInkToolbarRulerButton(outPtr)
        }

        return this.__IInkToolbarRulerButton.get_Ruler()
    }

;@endregion Instance Methods
}
