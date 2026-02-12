#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IInkToolbar.ahk
#Include .\IInkToolbar2.ahk
#Include .\IInkToolbar3.ahk
#Include .\IInkToolbarStatics2.ahk
#Include .\IInkToolbarStatics3.ahk
#Include .\IInkToolbarStatics.ahk
#Include .\IInkToolbarFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\InkToolbar.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\InkToolbarIsStencilButtonCheckedChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Universal Windows app control containing a customizable and extensible collection of buttons that activate ink-related features in an associated [InkCanvas](inkcanvas.md).
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Inking controls](/windows/uwp/design/controls-and-patterns/inking-controls).
 * 
 * Associate an InkToolbar with an [InkCanvas](inkcanvas.md) control through the [TargetInkCanvas](inktoolbar_targetinkcanvas.md) property.
 * 
 * By default, the toolbar includes buttons for drawing, erasing, highlighting, and displaying a ruler. Depending on the feature, other settings and commands, such as ink color, stroke thickness, erase all, are provided in a flyout. An "extension glyph" is displayed on the button to indicate the existence of the flyout.
 * 
 * The InkToolbar consists of two distinct groups of button types:
 * 
 * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * 
 * Built-in buttons can be displayed by default, or you can specify which should be displayed by your app. See [InitialControls](inktoolbar_initialcontrols.md).
 * 
 * You cannot change the display order of the built-in buttons. The default display order is: [InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md), [InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md), [InkToolbarEraserButton](inktoolbareraserbutton.md), and [InkToolbarRulerButton](inktoolbarrulerbutton.md). Custom tool buttons are added between the highlighter button and the eraser button and custom toggle buttons are added after the ruler button. (Custom buttons are added in the order they are specified.)
 * 
 * **Custom drying and the InkToolbar**
 * 
 * By default, ink input is processed on a low-latency background thread and rendered "wet" as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered "dry" to the [InkCanvas](inkcanvas.md) layer (above the application content and replacing the wet ink). The ink platform enables you to override this behavior and completely customize the inking experience by custom drying the ink input.
 * 
 * If your app overrides the default ink rendering behavior of the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) with a custom drying implementation, the rendered ink strokes are no longer available to the InkToolbar and the built-in erase commands of the InkToolbar do not work as expected. To provide erase functionality, you must handle all pointer events, perform hit-testing on each stroke, and override the built-in "Erase all ink" command.
 * 
 * For more info on custom drying, see [Pen interactions and Windows Ink in UWP apps](/windows/uwp/input-and-devices/pen-and-stylus-interactions).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbar extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbar.IID

    /**
     * Identifies the [IsStencilButtonChecked](inktoolbar_isstencilbuttonchecked.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.isstencilbuttoncheckedproperty
     * @type {DependencyProperty} 
     */
    static IsStencilButtonCheckedProperty {
        get => InkToolbar.get_IsStencilButtonCheckedProperty()
    }

    /**
     * Identifies the [ButtonFlyoutPlacement](inktoolbar_buttonflyoutplacement.md) dependency property.
     * Identifies the [ButtonFlyoutPlacement](inktoolbar_buttonflyoutplacement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.buttonflyoutplacementproperty
     * @type {DependencyProperty} 
     */
    static ButtonFlyoutPlacementProperty {
        get => InkToolbar.get_ButtonFlyoutPlacementProperty()
    }

    /**
     * Identifies the [InkToolbar.Orientation](inktoolbar_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => InkToolbar.get_OrientationProperty()
    }

    /**
     * Identifies the [TargetInkPresenter](inktoolbar_targetinkpresenter.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.targetinkpresenterproperty
     * @type {DependencyProperty} 
     */
    static TargetInkPresenterProperty {
        get => InkToolbar.get_TargetInkPresenterProperty()
    }

    /**
     * Identifies the [InitialControls](inktoolbar_initialcontrols.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.initialcontrolsproperty
     * @type {DependencyProperty} 
     */
    static InitialControlsProperty {
        get => InkToolbar.get_InitialControlsProperty()
    }

    /**
     * Identifies the [Children](inktoolbar_children.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.childrenproperty
     * @type {DependencyProperty} 
     */
    static ChildrenProperty {
        get => InkToolbar.get_ChildrenProperty()
    }

    /**
     * Identifies the [ActiveTool](inktoolbar_activetool.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.activetoolproperty
     * @type {DependencyProperty} 
     */
    static ActiveToolProperty {
        get => InkToolbar.get_ActiveToolProperty()
    }

    /**
     * Identifies the [InkDrawingAttributes](inktoolbar_inkdrawingattributes.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.inkdrawingattributesproperty
     * @type {DependencyProperty} 
     */
    static InkDrawingAttributesProperty {
        get => InkToolbar.get_InkDrawingAttributesProperty()
    }

    /**
     * Identifies the [IsRulerButtonChecked](inktoolbar_isrulerbuttonchecked.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.isrulerbuttoncheckedproperty
     * @type {DependencyProperty} 
     */
    static IsRulerButtonCheckedProperty {
        get => InkToolbar.get_IsRulerButtonCheckedProperty()
    }

    /**
     * Identifies the [TargetInkCanvas](inktoolbar_targetinkcanvas.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.targetinkcanvasproperty
     * @type {DependencyProperty} 
     */
    static TargetInkCanvasProperty {
        get => InkToolbar.get_TargetInkCanvasProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStencilButtonCheckedProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics2.IID)
            InkToolbar.__IInkToolbarStatics2 := IInkToolbarStatics2(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics2.get_IsStencilButtonCheckedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ButtonFlyoutPlacementProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics2.IID)
            InkToolbar.__IInkToolbarStatics2 := IInkToolbarStatics2(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics2.get_ButtonFlyoutPlacementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics2.IID)
            InkToolbar.__IInkToolbarStatics2 := IInkToolbarStatics2(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics2.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetInkPresenterProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics3.IID)
            InkToolbar.__IInkToolbarStatics3 := IInkToolbarStatics3(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics3.get_TargetInkPresenterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_InitialControlsProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics.IID)
            InkToolbar.__IInkToolbarStatics := IInkToolbarStatics(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics.get_InitialControlsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChildrenProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics.IID)
            InkToolbar.__IInkToolbarStatics := IInkToolbarStatics(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics.get_ChildrenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ActiveToolProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics.IID)
            InkToolbar.__IInkToolbarStatics := IInkToolbarStatics(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics.get_ActiveToolProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_InkDrawingAttributesProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics.IID)
            InkToolbar.__IInkToolbarStatics := IInkToolbarStatics(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics.get_InkDrawingAttributesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsRulerButtonCheckedProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics.IID)
            InkToolbar.__IInkToolbarStatics := IInkToolbarStatics(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics.get_IsRulerButtonCheckedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetInkCanvasProperty() {
        if (!InkToolbar.HasProp("__IInkToolbarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarStatics.IID)
            InkToolbar.__IInkToolbarStatics := IInkToolbarStatics(factoryPtr)
        }

        return InkToolbar.__IInkToolbarStatics.get_TargetInkCanvasProperty()
    }

    /**
     * 
     * @returns {InkToolbar} 
     */
    static CreateInstance() {
        if (!InkToolbar.HasProp("__IInkToolbarFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarFactory.IID)
            InkToolbar.__IInkToolbarFactory := IInkToolbarFactory(factoryPtr)
        }

        return InkToolbar.__IInkToolbarFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the collection of built-in buttons added to the [InkToolbar](inktoolbar.md) at initialization.
     * 
     * This property overrides the default collection of built-in buttons.
     * 
     * 
     * By default, the [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
     * 
     * + A [RadioButton](radiobutton.md) group containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. This group is where [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md) objects are added.
     * 
     * > Feature selection is mutually exclusive.
     * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
     * 
     * > Features are not mutually exclusive and can be used concurrently with other active tools.
     * @remarks
     * Default built-in buttons, or those specified through InitialControls, are not added to the [Children](inktoolbar_children.md) property.
     * 
     * Built-in or custom buttons added programmatically or declared in XAML, are added to the [Children](inktoolbar_children.md) property.
     * 
     * Built-in buttons are displayed in a pre-determined order within their respective control groups. Custom buttons are added to the appropriate control group in the order specified, after all built-in buttons.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.initialcontrols
     * @type {Integer} 
     */
    InitialControls {
        get => this.get_InitialControls()
        set => this.put_InitialControls(value)
    }

    /**
     * Gets the collection of custom buttons displayed on the [InkToolbar](inktoolbar.md).
     * @remarks
     * Children returns only the number of buttons on the [InkToolbar](inktoolbar.md) that have been added manually (see [ActiveTool](inktoolbar_activetool.md) and [InitialControls](inktoolbar_initialcontrols.md)). The default [InkToolbar](inktoolbar.md) does not add any buttons to the value of this property.
     * 
     * Children does not include buttons declared in markup.
     * 
     * 
     * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
     * 
     * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
     * 
     * > Feature selection is mutually exclusive.
     * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
     * 
     * > Features are not mutually exclusive and can be used concurrently with other active tools.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.children
     * @type {DependencyObjectCollection} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * Gets or sets the currently selected feature in the "tools" group of the [InkToolbar](inktoolbar.md) (see remarks).
     * This property provides access to the following objects:
     * 
     * + [InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md)
     * + [InkToolbarPencilButton](inktoolbarpencilbutton.md)
     * + [InkToolbarEraserButton](inktoolbareraserbutton.md)
     * + [InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)
     * + [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md)
     * + [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)
     * 
     * 
     * Features in this group are mutually exclusive: selecting a feature deselects the currently active feature.
     * 
     * > [!NOTE]
     * > [InkToolbarRulerButton](inktoolbarrulerbutton.md) and [InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md) objects work in conjunction with the active feature and are not exposed to the ActiveTool property.
     * @remarks
     * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
     * 
     * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
     * 
     * > Feature selection is mutually exclusive.
     * 
     * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
     * 
     * 
     * > Features are not mutually exclusive and can be used concurrently with other active tools.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.activetool
     * @type {InkToolbarToolButton} 
     */
    ActiveTool {
        get => this.get_ActiveTool()
        set => this.put_ActiveTool(value)
    }

    /**
     * Gets the [InkStroke](../windows.ui.input.inking/inkstroke.md) properties specified through the [InkToolbar](inktoolbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.inkdrawingattributes
     * @type {InkDrawingAttributes} 
     */
    InkDrawingAttributes {
        get => this.get_InkDrawingAttributes()
    }

    /**
     * Gets or sets the state of the [InkToolbarRulerButton](inktoolbarrulerbutton.md) (and associated tool) to on or off.
     * 
     * When turned on, the ruler works in conjunction with the active tool.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.isrulerbuttonchecked
     * @type {Boolean} 
     */
    IsRulerButtonChecked {
        get => this.get_IsRulerButtonChecked()
        set => this.put_IsRulerButtonChecked(value)
    }

    /**
     * Gets or sets the [InkCanvas](inkcanvas.md) control associated with the [InkToolbar](inktoolbar.md).
     * 
     * All [InkToolbar](inktoolbar.md) settings are propagated to the associated [InkCanvas](inkcanvas.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.targetinkcanvas
     * @type {InkCanvas} 
     */
    TargetInkCanvas {
        get => this.get_TargetInkCanvas()
        set => this.put_TargetInkCanvas(value)
    }

    /**
     * Gets or sets the state of the [InkToolbarStencilButton](inktoolbarstencilbutton.md) (and associated tool) to on or off.
     * 
     * When turned on, the stencil works in conjunction with the active tool.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.isstencilbuttonchecked
     * @type {Boolean} 
     */
    IsStencilButtonChecked {
        get => this.get_IsStencilButtonChecked()
        set => this.put_IsStencilButtonChecked(value)
    }

    /**
     * Gets or sets the location of ink stroke configuration flyout relative to the [InkToolbar](inktoolbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.buttonflyoutplacement
     * @type {Integer} 
     */
    ButtonFlyoutPlacement {
        get => this.get_ButtonFlyoutPlacement()
        set => this.put_ButtonFlyoutPlacement(value)
    }

    /**
     * Gets or sets the orientation of the [InkToolbar](inktoolbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object associated with the [InkToolbar](inktoolbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.targetinkpresenter
     * @type {InkPresenter} 
     */
    TargetInkPresenter {
        get => this.get_TargetInkPresenter()
        set => this.put_TargetInkPresenter(value)
    }

    /**
     * Occurs when the currently selected feature in the [RadioButton](radiobutton.md) group of the [InkToolbar](inktoolbar.md) is changed.
     * This event provides access to the following objects:
     * 
     * + [InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md)
     * + [InkToolbarPencilButton](inktoolbarpencilbutton.md)
     * + [InkToolbarEraserButton](inktoolbareraserbutton.md)
     * + [InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)
     * + [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md)
     * + [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)
     * 
     * 
     * Features in this group are mutually exclusive: selecting a feature deselects the currently active feature.
     * 
     * > [!NOTE]
     * > [InkToolbarRulerButton](inktoolbarrulerbutton.md) and [InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md) objects work in conjunction with the active feature and are not exposed to the ActiveToolChanged event.
     * @type {TypedEventHandler<InkToolbar, IInspectable>}
    */
    OnActiveToolChanged {
        get {
            if(!this.HasProp("__OnActiveToolChanged")){
                this.__OnActiveToolChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eea8b7be-9cba-5129-9b75-4930dc0c2705}"),
                    InkToolbar,
                    IInspectable
                )
                this.__OnActiveToolChangedToken := this.add_ActiveToolChanged(this.__OnActiveToolChanged.iface)
            }
            return this.__OnActiveToolChanged
        }
    }

    /**
     * Occurs when any [InkDrawingAttributes](inktoolbar_inkdrawingattributes.md) are changed.
     * @type {TypedEventHandler<InkToolbar, IInspectable>}
    */
    OnInkDrawingAttributesChanged {
        get {
            if(!this.HasProp("__OnInkDrawingAttributesChanged")){
                this.__OnInkDrawingAttributesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eea8b7be-9cba-5129-9b75-4930dc0c2705}"),
                    InkToolbar,
                    IInspectable
                )
                this.__OnInkDrawingAttributesChangedToken := this.add_InkDrawingAttributesChanged(this.__OnInkDrawingAttributesChanged.iface)
            }
            return this.__OnInkDrawingAttributesChanged
        }
    }

    /**
     * Occurs when "Erase All  Ink" is selected from the flyout for the [InkToolbarEraserButton](inktoolbareraserbutton.md) on the [InkToolbar](inktoolbar.md).
     * @remarks
     * Each feature on the [InkToolbar](inktoolbar.md) can support supplementary functionality in a flyout (an "extension glyph" on the feature button indicates to the user that the functionality is available). "Erase All  Ink" is the built-in flyout for the Eraser button.
     * 
     * To access the functionality, the feature button must be selected already, and the user must select the button again.
     * 
     * 
     * 
     * > **Custom drying and the InkToolbar**
     * > By default, ink input is processed on a low-latency background thread and rendered "wet" as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered "dry" to the [InkCanvas](inkcanvas.md) layer (above the application content and replacing the wet ink). The ink platform enables you to override this behavior and completely customize the inking experience by custom drying the ink input.
     * 
     * If your app overrides the default ink rendering behavior of the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) with a custom drying implementation, the rendered ink strokes are no longer available to the [InkToolbar](inktoolbar.md) and the built-in erase commands of the [InkToolbar](inktoolbar.md) do not work as expected. To provide erase functionality, you must handle all pointer events, perform hit-testing on each stroke, and override the built-in "Erase all ink" command.
     * 
     * For more info on custom drying, see [Pen interactions and Windows Ink in UWP apps](/windows/uwp/input-and-devices/pen-and-stylus-interactions).
     * @type {TypedEventHandler<InkToolbar, IInspectable>}
    */
    OnEraseAllClicked {
        get {
            if(!this.HasProp("__OnEraseAllClicked")){
                this.__OnEraseAllClicked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eea8b7be-9cba-5129-9b75-4930dc0c2705}"),
                    InkToolbar,
                    IInspectable
                )
                this.__OnEraseAllClickedToken := this.add_EraseAllClicked(this.__OnEraseAllClicked.iface)
            }
            return this.__OnEraseAllClicked
        }
    }

    /**
     * Occurs when the toggled state of the [InkToolbarRulerButton](inktoolbarrulerbutton.md) changes.
     * @type {TypedEventHandler<InkToolbar, IInspectable>}
    */
    OnIsRulerButtonCheckedChanged {
        get {
            if(!this.HasProp("__OnIsRulerButtonCheckedChanged")){
                this.__OnIsRulerButtonCheckedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eea8b7be-9cba-5129-9b75-4930dc0c2705}"),
                    InkToolbar,
                    IInspectable
                )
                this.__OnIsRulerButtonCheckedChangedToken := this.add_IsRulerButtonCheckedChanged(this.__OnIsRulerButtonCheckedChanged.iface)
            }
            return this.__OnIsRulerButtonCheckedChanged
        }
    }

    /**
     * Occurs when the toggled state of the [InkToolbaStencilButton](inktoolbarstencilbutton.md) changes.
     * @type {TypedEventHandler<InkToolbar, InkToolbarIsStencilButtonCheckedChangedEventArgs>}
    */
    OnIsStencilButtonCheckedChanged {
        get {
            if(!this.HasProp("__OnIsStencilButtonCheckedChanged")){
                this.__OnIsStencilButtonCheckedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{80a45bd6-7b40-5410-9c65-a8e05fee5e0f}"),
                    InkToolbar,
                    InkToolbarIsStencilButtonCheckedChangedEventArgs
                )
                this.__OnIsStencilButtonCheckedChangedToken := this.add_IsStencilButtonCheckedChanged(this.__OnIsStencilButtonCheckedChanged.iface)
            }
            return this.__OnIsStencilButtonCheckedChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnActiveToolChangedToken")) {
            this.remove_ActiveToolChanged(this.__OnActiveToolChangedToken)
            this.__OnActiveToolChanged.iface.Dispose()
        }

        if(this.HasProp("__OnInkDrawingAttributesChangedToken")) {
            this.remove_InkDrawingAttributesChanged(this.__OnInkDrawingAttributesChangedToken)
            this.__OnInkDrawingAttributesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnEraseAllClickedToken")) {
            this.remove_EraseAllClicked(this.__OnEraseAllClickedToken)
            this.__OnEraseAllClicked.iface.Dispose()
        }

        if(this.HasProp("__OnIsRulerButtonCheckedChangedToken")) {
            this.remove_IsRulerButtonCheckedChanged(this.__OnIsRulerButtonCheckedChangedToken)
            this.__OnIsRulerButtonCheckedChanged.iface.Dispose()
        }

        if(this.HasProp("__OnIsStencilButtonCheckedChangedToken")) {
            this.remove_IsStencilButtonCheckedChanged(this.__OnIsStencilButtonCheckedChangedToken)
            this.__OnIsStencilButtonCheckedChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitialControls() {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.get_InitialControls()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InitialControls(value) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.put_InitialControls(value)
    }

    /**
     * 
     * @returns {DependencyObjectCollection} 
     */
    get_Children() {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.get_Children()
    }

    /**
     * 
     * @returns {InkToolbarToolButton} 
     */
    get_ActiveTool() {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.get_ActiveTool()
    }

    /**
     * 
     * @param {InkToolbarToolButton} value 
     * @returns {HRESULT} 
     */
    put_ActiveTool(value) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.put_ActiveTool(value)
    }

    /**
     * 
     * @returns {InkDrawingAttributes} 
     */
    get_InkDrawingAttributes() {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.get_InkDrawingAttributes()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRulerButtonChecked() {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.get_IsRulerButtonChecked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRulerButtonChecked(value) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.put_IsRulerButtonChecked(value)
    }

    /**
     * 
     * @returns {InkCanvas} 
     */
    get_TargetInkCanvas() {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.get_TargetInkCanvas()
    }

    /**
     * 
     * @param {InkCanvas} value 
     * @returns {HRESULT} 
     */
    put_TargetInkCanvas(value) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.put_TargetInkCanvas(value)
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActiveToolChanged(handler) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.add_ActiveToolChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActiveToolChanged(token) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.remove_ActiveToolChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InkDrawingAttributesChanged(handler) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.add_InkDrawingAttributesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InkDrawingAttributesChanged(token) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.remove_InkDrawingAttributesChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EraseAllClicked(handler) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.add_EraseAllClicked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EraseAllClicked(token) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.remove_EraseAllClicked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsRulerButtonCheckedChanged(handler) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.add_IsRulerButtonCheckedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsRulerButtonCheckedChanged(token) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.remove_IsRulerButtonCheckedChanged(token)
    }

    /**
     * Retrieves a reference to one of the following objects from the radio button group of the [InkToolbar](inktoolbar.md).
     * + [InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md)
     * + [InkToolbarPencilButton](inktoolbarpencilbutton.md)
     * + [InkToolbarEraserButton](inktoolbareraserbutton.md)
     * + [InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)
     * + [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md)
     * + [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)
     * @param {Integer} tool Indicates the type of [InkToolbarToolButton](inktoolbartoolbutton.md) to retrieve.
     * @returns {InkToolbarToolButton} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.gettoolbutton
     */
    GetToolButton(tool) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.GetToolButton(tool)
    }

    /**
     * Retrieves a reference to an [InkToolbarToggleButton](inktoolbartogglebutton.md) object from the toggle button group of the [InkToolbar](inktoolbar.md).
     * @param {Integer} tool Indicates the type of [InkToolbarToggleButton](inktoolbartogglebutton.md) to retrieve.
     * @returns {InkToolbarToggleButton} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.gettogglebutton
     */
    GetToggleButton(tool) {
        if (!this.HasProp("__IInkToolbar")) {
            if ((queryResult := this.QueryInterface(IInkToolbar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar := IInkToolbar(outPtr)
        }

        return this.__IInkToolbar.GetToggleButton(tool)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStencilButtonChecked() {
        if (!this.HasProp("__IInkToolbar2")) {
            if ((queryResult := this.QueryInterface(IInkToolbar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar2 := IInkToolbar2(outPtr)
        }

        return this.__IInkToolbar2.get_IsStencilButtonChecked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStencilButtonChecked(value) {
        if (!this.HasProp("__IInkToolbar2")) {
            if ((queryResult := this.QueryInterface(IInkToolbar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar2 := IInkToolbar2(outPtr)
        }

        return this.__IInkToolbar2.put_IsStencilButtonChecked(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ButtonFlyoutPlacement() {
        if (!this.HasProp("__IInkToolbar2")) {
            if ((queryResult := this.QueryInterface(IInkToolbar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar2 := IInkToolbar2(outPtr)
        }

        return this.__IInkToolbar2.get_ButtonFlyoutPlacement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ButtonFlyoutPlacement(value) {
        if (!this.HasProp("__IInkToolbar2")) {
            if ((queryResult := this.QueryInterface(IInkToolbar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar2 := IInkToolbar2(outPtr)
        }

        return this.__IInkToolbar2.put_ButtonFlyoutPlacement(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IInkToolbar2")) {
            if ((queryResult := this.QueryInterface(IInkToolbar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar2 := IInkToolbar2(outPtr)
        }

        return this.__IInkToolbar2.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IInkToolbar2")) {
            if ((queryResult := this.QueryInterface(IInkToolbar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar2 := IInkToolbar2(outPtr)
        }

        return this.__IInkToolbar2.put_Orientation(value)
    }

    /**
     * 
     * @param {TypedEventHandler<InkToolbar, InkToolbarIsStencilButtonCheckedChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsStencilButtonCheckedChanged(handler) {
        if (!this.HasProp("__IInkToolbar2")) {
            if ((queryResult := this.QueryInterface(IInkToolbar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar2 := IInkToolbar2(outPtr)
        }

        return this.__IInkToolbar2.add_IsStencilButtonCheckedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsStencilButtonCheckedChanged(token) {
        if (!this.HasProp("__IInkToolbar2")) {
            if ((queryResult := this.QueryInterface(IInkToolbar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar2 := IInkToolbar2(outPtr)
        }

        return this.__IInkToolbar2.remove_IsStencilButtonCheckedChanged(token)
    }

    /**
     * Retrieves a reference to an [InkToolbarMenuButton](inktoolbarmenubutton.md) object from the menu button group of the [InkToolbar](inktoolbar.md).
     * @param {Integer} menu Indicates the type of [InkToolbarMenuButton](inktoolbarmenubutton.md) to retrieve.
     * @returns {InkToolbarMenuButton} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbar.getmenubutton
     */
    GetMenuButton(menu) {
        if (!this.HasProp("__IInkToolbar2")) {
            if ((queryResult := this.QueryInterface(IInkToolbar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar2 := IInkToolbar2(outPtr)
        }

        return this.__IInkToolbar2.GetMenuButton(menu)
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_TargetInkPresenter() {
        if (!this.HasProp("__IInkToolbar3")) {
            if ((queryResult := this.QueryInterface(IInkToolbar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar3 := IInkToolbar3(outPtr)
        }

        return this.__IInkToolbar3.get_TargetInkPresenter()
    }

    /**
     * 
     * @param {InkPresenter} value 
     * @returns {HRESULT} 
     */
    put_TargetInkPresenter(value) {
        if (!this.HasProp("__IInkToolbar3")) {
            if ((queryResult := this.QueryInterface(IInkToolbar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbar3 := IInkToolbar3(outPtr)
        }

        return this.__IInkToolbar3.put_TargetInkPresenter(value)
    }

;@endregion Instance Methods
}
