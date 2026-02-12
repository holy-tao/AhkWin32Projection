#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InkToolbarMenuButton.ahk
#Include .\IInkToolbarStencilButton.ahk
#Include .\IInkToolbarStencilButtonStatics.ahk
#Include .\IInkToolbarStencilButtonFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) button that sets the state of stencil tool to on or off.
 * @remarks
 * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
 * 
 * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
 * 
 * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil (InkToolbarStencilButton) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarStencilButton extends InkToolbarMenuButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarStencilButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarStencilButton.IID

    /**
     * Identifies the [Ruler](inktoolbarstencilbutton_ruler.md) dependency property.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.rulerproperty
     * @type {DependencyProperty} 
     */
    static RulerProperty {
        get => InkToolbarStencilButton.get_RulerProperty()
    }

    /**
     * Identifies the [Protractor](inktoolbarstencilbutton_protractor.md) dependency property.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.protractorproperty
     * @type {DependencyProperty} 
     */
    static ProtractorProperty {
        get => InkToolbarStencilButton.get_ProtractorProperty()
    }

    /**
     * Identifies the [SelectedStencil](inktoolbarstencilbutton_selectedstencil.md) dependency property.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.selectedstencilproperty
     * @type {DependencyProperty} 
     */
    static SelectedStencilProperty {
        get => InkToolbarStencilButton.get_SelectedStencilProperty()
    }

    /**
     * Identifies the [IsRulerItemVisible](inktoolbarstencilbutton_isruleritemvisible.md) dependency property.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.isruleritemvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsRulerItemVisibleProperty {
        get => InkToolbarStencilButton.get_IsRulerItemVisibleProperty()
    }

    /**
     * Identifies the [IsProtractorItemVisible](inktoolbarstencilbutton_isprotractoritemvisible.md) dependency property.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.isprotractoritemvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsProtractorItemVisibleProperty {
        get => InkToolbarStencilButton.get_IsProtractorItemVisibleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RulerProperty() {
        if (!InkToolbarStencilButton.HasProp("__IInkToolbarStencilButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarStencilButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStencilButtonStatics.IID)
            InkToolbarStencilButton.__IInkToolbarStencilButtonStatics := IInkToolbarStencilButtonStatics(factoryPtr)
        }

        return InkToolbarStencilButton.__IInkToolbarStencilButtonStatics.get_RulerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ProtractorProperty() {
        if (!InkToolbarStencilButton.HasProp("__IInkToolbarStencilButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarStencilButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStencilButtonStatics.IID)
            InkToolbarStencilButton.__IInkToolbarStencilButtonStatics := IInkToolbarStencilButtonStatics(factoryPtr)
        }

        return InkToolbarStencilButton.__IInkToolbarStencilButtonStatics.get_ProtractorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedStencilProperty() {
        if (!InkToolbarStencilButton.HasProp("__IInkToolbarStencilButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarStencilButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStencilButtonStatics.IID)
            InkToolbarStencilButton.__IInkToolbarStencilButtonStatics := IInkToolbarStencilButtonStatics(factoryPtr)
        }

        return InkToolbarStencilButton.__IInkToolbarStencilButtonStatics.get_SelectedStencilProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsRulerItemVisibleProperty() {
        if (!InkToolbarStencilButton.HasProp("__IInkToolbarStencilButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarStencilButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStencilButtonStatics.IID)
            InkToolbarStencilButton.__IInkToolbarStencilButtonStatics := IInkToolbarStencilButtonStatics(factoryPtr)
        }

        return InkToolbarStencilButton.__IInkToolbarStencilButtonStatics.get_IsRulerItemVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsProtractorItemVisibleProperty() {
        if (!InkToolbarStencilButton.HasProp("__IInkToolbarStencilButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarStencilButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStencilButtonStatics.IID)
            InkToolbarStencilButton.__IInkToolbarStencilButtonStatics := IInkToolbarStencilButtonStatics(factoryPtr)
        }

        return InkToolbarStencilButton.__IInkToolbarStencilButtonStatics.get_IsProtractorItemVisibleProperty()
    }

    /**
     * 
     * @returns {InkToolbarStencilButton} 
     */
    static CreateInstance() {
        if (!InkToolbarStencilButton.HasProp("__IInkToolbarStencilButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarStencilButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStencilButtonFactory.IID)
            InkToolbarStencilButton.__IInkToolbarStencilButtonFactory := IInkToolbarStencilButtonFactory(factoryPtr)
        }

        return InkToolbarStencilButton.__IInkToolbarStencilButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a reference to the [ruler](../windows.ui.input.inking/inkpresenterruler.md) tool of the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.ruler
     * @type {InkPresenterRuler} 
     */
    Ruler {
        get => this.get_Ruler()
    }

    /**
     * Gets a reference to the [protractor](../windows.ui.input.inking/inkpresenterprotractor.md) tool of the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.protractor
     * @type {InkPresenterProtractor} 
     */
    Protractor {
        get => this.get_Protractor()
    }

    /**
     * Gets or sets the selected stencil button.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.selectedstencil
     * @type {Integer} 
     */
    SelectedStencil {
        get => this.get_SelectedStencil()
        set => this.put_SelectedStencil(value)
    }

    /**
     * Gets or sets whether the built-in ruler stencil button is visible.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.isruleritemvisible
     * @type {Boolean} 
     */
    IsRulerItemVisible {
        get => this.get_IsRulerItemVisible()
        set => this.put_IsRulerItemVisible(value)
    }

    /**
     * Gets or sets whether the built-in protractor stencil button is visible.
     * @remarks
     * Apps that target Windows Creators Update (SDK 15063) or later should use this object instead of [InkToolbarRulerButton](inktoolbarrulerbutton.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarstencilbutton.isprotractoritemvisible
     * @type {Boolean} 
     */
    IsProtractorItemVisible {
        get => this.get_IsProtractorItemVisible()
        set => this.put_IsProtractorItemVisible(value)
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
        if (!this.HasProp("__IInkToolbarStencilButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarStencilButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarStencilButton := IInkToolbarStencilButton(outPtr)
        }

        return this.__IInkToolbarStencilButton.get_Ruler()
    }

    /**
     * 
     * @returns {InkPresenterProtractor} 
     */
    get_Protractor() {
        if (!this.HasProp("__IInkToolbarStencilButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarStencilButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarStencilButton := IInkToolbarStencilButton(outPtr)
        }

        return this.__IInkToolbarStencilButton.get_Protractor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedStencil() {
        if (!this.HasProp("__IInkToolbarStencilButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarStencilButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarStencilButton := IInkToolbarStencilButton(outPtr)
        }

        return this.__IInkToolbarStencilButton.get_SelectedStencil()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedStencil(value) {
        if (!this.HasProp("__IInkToolbarStencilButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarStencilButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarStencilButton := IInkToolbarStencilButton(outPtr)
        }

        return this.__IInkToolbarStencilButton.put_SelectedStencil(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRulerItemVisible() {
        if (!this.HasProp("__IInkToolbarStencilButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarStencilButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarStencilButton := IInkToolbarStencilButton(outPtr)
        }

        return this.__IInkToolbarStencilButton.get_IsRulerItemVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRulerItemVisible(value) {
        if (!this.HasProp("__IInkToolbarStencilButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarStencilButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarStencilButton := IInkToolbarStencilButton(outPtr)
        }

        return this.__IInkToolbarStencilButton.put_IsRulerItemVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtractorItemVisible() {
        if (!this.HasProp("__IInkToolbarStencilButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarStencilButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarStencilButton := IInkToolbarStencilButton(outPtr)
        }

        return this.__IInkToolbarStencilButton.get_IsProtractorItemVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsProtractorItemVisible(value) {
        if (!this.HasProp("__IInkToolbarStencilButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarStencilButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarStencilButton := IInkToolbarStencilButton(outPtr)
        }

        return this.__IInkToolbarStencilButton.put_IsProtractorItemVisible(value)
    }

;@endregion Instance Methods
}
