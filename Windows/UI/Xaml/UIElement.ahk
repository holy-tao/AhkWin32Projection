#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\IUIElement.ahk
#Include .\IUIElement2.ahk
#Include .\IUIElement3.ahk
#Include .\IUIElement4.ahk
#Include .\IUIElement5.ahk
#Include .\IUIElement7.ahk
#Include .\IUIElement8.ahk
#Include .\IUIElement9.ahk
#Include .\IUIElement10.ahk
#Include .\IUIElementOverrides.ahk
#Include .\IUIElementOverrides7.ahk
#Include .\IUIElementOverrides8.ahk
#Include .\IUIElementOverrides9.ahk
#Include ..\Composition\IAnimationObject.ahk
#Include .\IUIElementStatics7.ahk
#Include .\IUIElementStatics10.ahk
#Include .\IUIElementStatics2.ahk
#Include .\IUIElementFactory.ahk
#Include .\IUIElementStatics4.ahk
#Include .\IUIElementStatics5.ahk
#Include .\IUIElementStatics.ahk
#Include .\IUIElementStatics9.ahk
#Include .\IUIElementStatics8.ahk
#Include .\IUIElementStatics6.ahk
#Include .\IUIElementStatics3.ahk
#Include Input\KeyEventHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include Input\KeyRoutedEventArgs.ahk
#Include .\RoutedEventHandler.ahk
#Include .\RoutedEventArgs.ahk
#Include .\DragEventHandler.ahk
#Include .\DragEventArgs.ahk
#Include Input\PointerEventHandler.ahk
#Include Input\PointerRoutedEventArgs.ahk
#Include Input\TappedEventHandler.ahk
#Include Input\TappedRoutedEventArgs.ahk
#Include Input\DoubleTappedEventHandler.ahk
#Include Input\DoubleTappedRoutedEventArgs.ahk
#Include Input\HoldingEventHandler.ahk
#Include Input\HoldingRoutedEventArgs.ahk
#Include Input\RightTappedEventHandler.ahk
#Include Input\RightTappedRoutedEventArgs.ahk
#Include Input\ManipulationStartingEventHandler.ahk
#Include Input\ManipulationStartingRoutedEventArgs.ahk
#Include Input\ManipulationInertiaStartingEventHandler.ahk
#Include Input\ManipulationInertiaStartingRoutedEventArgs.ahk
#Include Input\ManipulationStartedEventHandler.ahk
#Include Input\ManipulationStartedRoutedEventArgs.ahk
#Include Input\ManipulationDeltaEventHandler.ahk
#Include Input\ManipulationDeltaRoutedEventArgs.ahk
#Include Input\ManipulationCompletedEventHandler.ahk
#Include Input\ManipulationCompletedRoutedEventArgs.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\UIElement.ahk
#Include .\DragStartingEventArgs.ahk
#Include .\DropCompletedEventArgs.ahk
#Include Input\ContextRequestedEventArgs.ahk
#Include Input\AccessKeyDisplayRequestedEventArgs.ahk
#Include Input\AccessKeyDisplayDismissedEventArgs.ahk
#Include Input\AccessKeyInvokedEventArgs.ahk
#Include Input\GettingFocusEventArgs.ahk
#Include Input\LosingFocusEventArgs.ahk
#Include Input\NoFocusCandidateFoundEventArgs.ahk
#Include Input\CharacterReceivedRoutedEventArgs.ahk
#Include Input\ProcessKeyboardAcceleratorEventArgs.ahk
#Include .\BringIntoViewRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * UIElement is a base class for most of the Windows Runtime UI objects that have visual appearance and can process basic input as part of your app's user interface.
 * @remarks
 * UIElement is a base element: it's a class that many other Windows Runtime classes inherit from in order to support the XAML UI element model. Properties, methods and events that UIElement defines are inherited by hundreds of other Windows Runtime classes.
 * 
 * Although UIElement defines the events for focus reporting ([GotFocus](uielement_gotfocus.md), [LostFocus](uielement_lostfocus.md)), UIElement does not define an API for programmatically setting the focus. This capability is defined by the [Control](../windows.ui.xaml.controls/control.md) class.
 * 
 * UIElement does not expose a public constructor. Typically, you don't derive classes from either UIElement or [FrameworkElement](frameworkelement.md) directly. More typically used base classes for derived custom classes are these classes:
 * 
 * + Specific controls that are not sealed (for example, [TextBox](../windows.ui.xaml.controls/textbox.md))
 * + Control base classes ([Control](../windows.ui.xaml.controls/control.md), [ContentControl](../windows.ui.xaml.controls/contentcontrol.md), [UserControl](../windows.ui.xaml.controls/usercontrol.md))
 * + Navigation elements ([Page](../windows.ui.xaml.controls/page.md), [Frame](../windows.ui.xaml.controls/frame.md))
 * + Panel classes (the base class [Panel](../windows.ui.xaml.controls/panel.md), or specific non-sealed implementations such as [Grid](../windows.ui.xaml.controls/grid.md))
 * 
 * The UIElement class is used as the type parameter of many properties and methods in the Windows Runtime  API. For example, the [Child](../windows.ui.xaml.controls/border_child.md) property of [Border](../windows.ui.xaml.controls/border.md) takes a single UIElement, which represents the element that the [Border](../windows.ui.xaml.controls/border.md) is drawn around. You can provide any UIElement-derived element for such a property, including custom controls that you define.
 * 
 * The [UIElementCollection](../windows.ui.xaml.controls/uielementcollection.md) class provides a strongly typed collection of UIElement items. [UIElementCollection](../windows.ui.xaml.controls/uielementcollection.md) is used as a type for properties of objects that contain several child elements, for example for the [Children](../windows.ui.xaml.controls/panel_children.md) property of any [Panel](../windows.ui.xaml.controls/panel.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class UIElement extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUIElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUIElement.IID

    /**
     * Gets the identifier for the PreviewKeyDown routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.previewkeydownevent
     * @type {RoutedEvent} 
     */
    static PreviewKeyDownEvent {
        get => UIElement.get_PreviewKeyDownEvent()
    }

    /**
     * Gets the identifier for the [CharacterReceived](uielement_characterreceived.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.characterreceivedevent
     * @type {RoutedEvent} 
     */
    static CharacterReceivedEvent {
        get => UIElement.get_CharacterReceivedEvent()
    }

    /**
     * Gets the identifier for the PreviewKeyUp routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.previewkeyupevent
     * @type {RoutedEvent} 
     */
    static PreviewKeyUpEvent {
        get => UIElement.get_PreviewKeyUpEvent()
    }

    /**
     * Identifies the [Shadow](uielement_shadow.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.shadowproperty
     * @type {DependencyProperty} 
     */
    static ShadowProperty {
        get => UIElement.get_ShadowProperty()
    }

    /**
     * Identifies the [CompositeMode](uielement_compositemode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.compositemodeproperty
     * @type {DependencyProperty} 
     */
    static CompositeModeProperty {
        get => UIElement.get_CompositeModeProperty()
    }

    /**
     * Identifies for the [ContextFlyout](uielement_contextflyout.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.contextflyoutproperty
     * @type {DependencyProperty} 
     */
    static ContextFlyoutProperty {
        get => UIElement.get_ContextFlyoutProperty()
    }

    /**
     * Identifies the [ExitDisplayModeOnAccessKeyInvoked](uielement_exitdisplaymodeonaccesskeyinvoked.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.exitdisplaymodeonaccesskeyinvokedproperty
     * @type {DependencyProperty} 
     */
    static ExitDisplayModeOnAccessKeyInvokedProperty {
        get => UIElement.get_ExitDisplayModeOnAccessKeyInvokedProperty()
    }

    /**
     * Identifies for the [IsAccessKeyScope](uielement_isaccesskeyscope.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.isaccesskeyscopeproperty
     * @type {DependencyProperty} 
     */
    static IsAccessKeyScopeProperty {
        get => UIElement.get_IsAccessKeyScopeProperty()
    }

    /**
     * Identifies for the [AccessKeyScopeOwner](uielement_accesskeyscopeowner.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.accesskeyscopeownerproperty
     * @type {DependencyProperty} 
     */
    static AccessKeyScopeOwnerProperty {
        get => UIElement.get_AccessKeyScopeOwnerProperty()
    }

    /**
     * Identifies for the [AccessKey](uielement_accesskey.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.accesskeyproperty
     * @type {DependencyProperty} 
     */
    static AccessKeyProperty {
        get => UIElement.get_AccessKeyProperty()
    }

    /**
     * Identifies the [Lights](uielement_lights.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.lightsproperty
     * @type {DependencyProperty} 
     */
    static LightsProperty {
        get => UIElement.get_LightsProperty()
    }

    /**
     * Identifies the [KeyTipPlacementMode](uielement_keytipplacementmode.md) dependency property.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keytipplacementmodeproperty
     * @type {DependencyProperty} 
     */
    static KeyTipPlacementModeProperty {
        get => UIElement.get_KeyTipPlacementModeProperty()
    }

    /**
     * Identifies the [KeyTipHorizontalOffset](uielement_keytiphorizontaloffset.md) dependency property.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keytiphorizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static KeyTipHorizontalOffsetProperty {
        get => UIElement.get_KeyTipHorizontalOffsetProperty()
    }

    /**
     * Identifies the [KeyTipVerticalOffset](uielement_keytipverticaloffset.md) dependency property.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keytipverticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static KeyTipVerticalOffsetProperty {
        get => UIElement.get_KeyTipVerticalOffsetProperty()
    }

    /**
     * Identifies the [XYFocusKeyboardNavigation](uielement_xyfocuskeyboardnavigation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocuskeyboardnavigationproperty
     * @type {DependencyProperty} 
     */
    static XYFocusKeyboardNavigationProperty {
        get => UIElement.get_XYFocusKeyboardNavigationProperty()
    }

    /**
     * Identifies the [XYFocusUpNavigationStrategy](uielement_xyfocusupnavigationstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocusupnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusUpNavigationStrategyProperty {
        get => UIElement.get_XYFocusUpNavigationStrategyProperty()
    }

    /**
     * Identifies the [XYFocusDownNavigationStrategy](uielement_xyfocusdownnavigationstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocusdownnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusDownNavigationStrategyProperty {
        get => UIElement.get_XYFocusDownNavigationStrategyProperty()
    }

    /**
     * Identifies the [XYFocusLeftNavigationStrategy](uielement_xyfocusleftnavigationstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocusleftnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusLeftNavigationStrategyProperty {
        get => UIElement.get_XYFocusLeftNavigationStrategyProperty()
    }

    /**
     * Identifies the [XYFocusRightNavigationStrategy](uielement_xyfocusrightnavigationstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocusrightnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusRightNavigationStrategyProperty {
        get => UIElement.get_XYFocusRightNavigationStrategyProperty()
    }

    /**
     * Identifies the [HighContrastAdjustment](uielement_highcontrastadjustment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.highcontrastadjustmentproperty
     * @type {DependencyProperty} 
     */
    static HighContrastAdjustmentProperty {
        get => UIElement.get_HighContrastAdjustmentProperty()
    }

    /**
     * Identifies the [TabFocusNavigation](uielement_tabfocusnavigation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.tabfocusnavigationproperty
     * @type {DependencyProperty} 
     */
    static TabFocusNavigationProperty {
        get => UIElement.get_TabFocusNavigationProperty()
    }

    /**
     * Gets the identifier for the [KeyDown](uielement_keydown.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keydownevent
     * @type {RoutedEvent} 
     */
    static KeyDownEvent {
        get => UIElement.get_KeyDownEvent()
    }

    /**
     * Gets the identifier for the [KeyUp](uielement_keyup.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keyupevent
     * @type {RoutedEvent} 
     */
    static KeyUpEvent {
        get => UIElement.get_KeyUpEvent()
    }

    /**
     * Gets the identifier for the [PointerEntered](uielement_pointerentered.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointerenteredevent
     * @type {RoutedEvent} 
     */
    static PointerEnteredEvent {
        get => UIElement.get_PointerEnteredEvent()
    }

    /**
     * Gets the identifier for the [PointerPressed](uielement_pointerpressed.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointerpressedevent
     * @type {RoutedEvent} 
     */
    static PointerPressedEvent {
        get => UIElement.get_PointerPressedEvent()
    }

    /**
     * Gets the identifier for the [PointerMoved](uielement_pointermoved.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointermovedevent
     * @type {RoutedEvent} 
     */
    static PointerMovedEvent {
        get => UIElement.get_PointerMovedEvent()
    }

    /**
     * Gets the identifier for the [PointerReleased](uielement_pointerreleased.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointerreleasedevent
     * @type {RoutedEvent} 
     */
    static PointerReleasedEvent {
        get => UIElement.get_PointerReleasedEvent()
    }

    /**
     * Gets the identifier for the [PointerExited](uielement_pointerexited.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointerexitedevent
     * @type {RoutedEvent} 
     */
    static PointerExitedEvent {
        get => UIElement.get_PointerExitedEvent()
    }

    /**
     * Gets the identifier for the [PointerCaptureLost](uielement_pointercapturelost.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointercapturelostevent
     * @type {RoutedEvent} 
     */
    static PointerCaptureLostEvent {
        get => UIElement.get_PointerCaptureLostEvent()
    }

    /**
     * Gets the identifier for the [PointerCanceled](uielement_pointercanceled.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointercanceledevent
     * @type {RoutedEvent} 
     */
    static PointerCanceledEvent {
        get => UIElement.get_PointerCanceledEvent()
    }

    /**
     * Gets the identifier for the [PointerWheelChanged](uielement_pointerwheelchanged.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointerwheelchangedevent
     * @type {RoutedEvent} 
     */
    static PointerWheelChangedEvent {
        get => UIElement.get_PointerWheelChangedEvent()
    }

    /**
     * Gets the identifier for the [Tapped](uielement_tapped.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.tappedevent
     * @type {RoutedEvent} 
     */
    static TappedEvent {
        get => UIElement.get_TappedEvent()
    }

    /**
     * Gets the identifier for the [DoubleTapped](uielement_doubletapped.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.doubletappedevent
     * @type {RoutedEvent} 
     */
    static DoubleTappedEvent {
        get => UIElement.get_DoubleTappedEvent()
    }

    /**
     * Gets the identifier for the [Holding](uielement_holding.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.holdingevent
     * @type {RoutedEvent} 
     */
    static HoldingEvent {
        get => UIElement.get_HoldingEvent()
    }

    /**
     * Gets the identifier for the [RightTapped](uielement_righttapped.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.righttappedevent
     * @type {RoutedEvent} 
     */
    static RightTappedEvent {
        get => UIElement.get_RightTappedEvent()
    }

    /**
     * Gets the identifier for the [ManipulationStarting](uielement_manipulationstarting.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.manipulationstartingevent
     * @type {RoutedEvent} 
     */
    static ManipulationStartingEvent {
        get => UIElement.get_ManipulationStartingEvent()
    }

    /**
     * Gets the identifier for the [ManipulationInertiaStarting](uielement_manipulationinertiastarting.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.manipulationinertiastartingevent
     * @type {RoutedEvent} 
     */
    static ManipulationInertiaStartingEvent {
        get => UIElement.get_ManipulationInertiaStartingEvent()
    }

    /**
     * Gets the identifier for the [ManipulationStarted](uielement_manipulationstarted.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.manipulationstartedevent
     * @type {RoutedEvent} 
     */
    static ManipulationStartedEvent {
        get => UIElement.get_ManipulationStartedEvent()
    }

    /**
     * Gets the identifier for the [ManipulationDelta](uielement_manipulationdelta.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.manipulationdeltaevent
     * @type {RoutedEvent} 
     */
    static ManipulationDeltaEvent {
        get => UIElement.get_ManipulationDeltaEvent()
    }

    /**
     * Gets the identifier for the [ManipulationCompleted](uielement_manipulationcompleted.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.manipulationcompletedevent
     * @type {RoutedEvent} 
     */
    static ManipulationCompletedEvent {
        get => UIElement.get_ManipulationCompletedEvent()
    }

    /**
     * Gets the identifier for the [DragEnter](uielement_dragenter.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.dragenterevent
     * @type {RoutedEvent} 
     */
    static DragEnterEvent {
        get => UIElement.get_DragEnterEvent()
    }

    /**
     * Gets the identifier for the [DragLeave](uielement_dragleave.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.dragleaveevent
     * @type {RoutedEvent} 
     */
    static DragLeaveEvent {
        get => UIElement.get_DragLeaveEvent()
    }

    /**
     * Gets the identifier for the [DragOver](uielement_dragover.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.dragoverevent
     * @type {RoutedEvent} 
     */
    static DragOverEvent {
        get => UIElement.get_DragOverEvent()
    }

    /**
     * Gets the identifier for the [Drop](uielement_drop.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.dropevent
     * @type {RoutedEvent} 
     */
    static DropEvent {
        get => UIElement.get_DropEvent()
    }

    /**
     * Identifies the [AllowDrop](uielement_allowdrop.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.allowdropproperty
     * @type {DependencyProperty} 
     */
    static AllowDropProperty {
        get => UIElement.get_AllowDropProperty()
    }

    /**
     * Identifies the [IsHitTestVisible](uielement_ishittestvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.opacityproperty
     * @type {DependencyProperty} 
     */
    static OpacityProperty {
        get => UIElement.get_OpacityProperty()
    }

    /**
     * Identifies the [Clip](uielement_clip.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.clipproperty
     * @type {DependencyProperty} 
     */
    static ClipProperty {
        get => UIElement.get_ClipProperty()
    }

    /**
     * Identifies the [RenderTransform](uielement_rendertransform.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.rendertransformproperty
     * @type {DependencyProperty} 
     */
    static RenderTransformProperty {
        get => UIElement.get_RenderTransformProperty()
    }

    /**
     * Identifies the [Projection](uielement_projection.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.projectionproperty
     * @type {DependencyProperty} 
     */
    static ProjectionProperty {
        get => UIElement.get_ProjectionProperty()
    }

    /**
     * Identifies the [RenderTransformOrigin](uielement_rendertransformorigin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.rendertransformoriginproperty
     * @type {DependencyProperty} 
     */
    static RenderTransformOriginProperty {
        get => UIElement.get_RenderTransformOriginProperty()
    }

    /**
     * Identifies the [IsHitTestVisible](uielement_ishittestvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.ishittestvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsHitTestVisibleProperty {
        get => UIElement.get_IsHitTestVisibleProperty()
    }

    /**
     * Identifies the [Visibility](uielement_visibility.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.visibilityproperty
     * @type {DependencyProperty} 
     */
    static VisibilityProperty {
        get => UIElement.get_VisibilityProperty()
    }

    /**
     * Identifies the [UseLayoutRounding](uielement_uselayoutrounding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.uselayoutroundingproperty
     * @type {DependencyProperty} 
     */
    static UseLayoutRoundingProperty {
        get => UIElement.get_UseLayoutRoundingProperty()
    }

    /**
     * Identifies the [Transitions](uielement_transitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.transitionsproperty
     * @type {DependencyProperty} 
     */
    static TransitionsProperty {
        get => UIElement.get_TransitionsProperty()
    }

    /**
     * Identifies the [CacheMode](uielement_cachemode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.cachemodeproperty
     * @type {DependencyProperty} 
     */
    static CacheModeProperty {
        get => UIElement.get_CacheModeProperty()
    }

    /**
     * Identifies the [IsTapEnabled](uielement_istapenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.istapenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTapEnabledProperty {
        get => UIElement.get_IsTapEnabledProperty()
    }

    /**
     * Identifies the [IsDoubleTapEnabled](uielement_isdoubletapenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.isdoubletapenabledproperty
     * @type {DependencyProperty} 
     */
    static IsDoubleTapEnabledProperty {
        get => UIElement.get_IsDoubleTapEnabledProperty()
    }

    /**
     * Identifies the [IsRightTapEnabled](uielement_isrighttapenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.isrighttapenabledproperty
     * @type {DependencyProperty} 
     */
    static IsRightTapEnabledProperty {
        get => UIElement.get_IsRightTapEnabledProperty()
    }

    /**
     * Identifies the [IsHoldingEnabled](uielement_isholdingenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.isholdingenabledproperty
     * @type {DependencyProperty} 
     */
    static IsHoldingEnabledProperty {
        get => UIElement.get_IsHoldingEnabledProperty()
    }

    /**
     * Identifies the [ManipulationMode](uielement_manipulationmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.manipulationmodeproperty
     * @type {DependencyProperty} 
     */
    static ManipulationModeProperty {
        get => UIElement.get_ManipulationModeProperty()
    }

    /**
     * Identifies the [PointerCaptures](uielement_pointercaptures.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointercapturesproperty
     * @type {DependencyProperty} 
     */
    static PointerCapturesProperty {
        get => UIElement.get_PointerCapturesProperty()
    }

    /**
     * Identifies the [CanBeScrollAnchor](uielement_canbescrollanchor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.canbescrollanchorproperty
     * @type {DependencyProperty} 
     */
    static CanBeScrollAnchorProperty {
        get => UIElement.get_CanBeScrollAnchorProperty()
    }

    /**
     * Gets the identifier for the BringIntoViewRequested routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.bringintoviewrequestedevent
     * @type {RoutedEvent} 
     */
    static BringIntoViewRequestedEvent {
        get => UIElement.get_BringIntoViewRequestedEvent()
    }

    /**
     * Gets the identifier for the ContextRequested routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.contextrequestedevent
     * @type {RoutedEvent} 
     */
    static ContextRequestedEvent {
        get => UIElement.get_ContextRequestedEvent()
    }

    /**
     * Identifies the [KeyTipTarget](uielement_keytiptarget.md) dependency property.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keytiptargetproperty
     * @type {DependencyProperty} 
     */
    static KeyTipTargetProperty {
        get => UIElement.get_KeyTipTargetProperty()
    }

    /**
     * Identifies the [KeyboardAcceleratorPlacementTarget](uielement_keyboardacceleratorplacementtarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keyboardacceleratorplacementtargetproperty
     * @type {DependencyProperty} 
     */
    static KeyboardAcceleratorPlacementTargetProperty {
        get => UIElement.get_KeyboardAcceleratorPlacementTargetProperty()
    }

    /**
     * Identifies the [KeyboardAcceleratorPlacementMode](uielement_keyboardacceleratorplacementmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keyboardacceleratorplacementmodeproperty
     * @type {DependencyProperty} 
     */
    static KeyboardAcceleratorPlacementModeProperty {
        get => UIElement.get_KeyboardAcceleratorPlacementModeProperty()
    }

    /**
     * Gets the identifier for the [GettingFocus](uielement_gettingfocus.md) routed event.
     * @remarks
     * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of [FocusManager](../windows.ui.xaml.input/focusmanager.md) events whenever possible.
     * 
     * Only a single UI element at a time can have focus.
     * 
     * A control can get focus when another control loses focus, the application view changes, the user switches applications, or the user interacts with the system such that the application is no longer in the foreground.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.gettingfocusevent
     * @type {RoutedEvent} 
     */
    static GettingFocusEvent {
        get => UIElement.get_GettingFocusEvent()
    }

    /**
     * Gets the identifier for the [LosingFocus](uielement_losingfocus.md) routed event.
     * @remarks
     * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of [FocusManager](../windows.ui.xaml.input/focusmanager.md) events whenever possible.
     * 
     * Only a single UI element at a time can have focus.
     * 
     * A control can lose focus when another control gets focus, the application view changes, the user switches applications, or the user interacts with the system such that the application is no longer in the foreground.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.losingfocusevent
     * @type {RoutedEvent} 
     */
    static LosingFocusEvent {
        get => UIElement.get_LosingFocusEvent()
    }

    /**
     * Gets the identifier for the [NoFocusCandidateFound](uielement_nofocuscandidatefound.md) routed event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.nofocuscandidatefoundevent
     * @type {RoutedEvent} 
     */
    static NoFocusCandidateFoundEvent {
        get => UIElement.get_NoFocusCandidateFoundEvent()
    }

    /**
     * Identifies the [Transform3D](uielement_transform3d.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.transform3dproperty
     * @type {DependencyProperty} 
     */
    static Transform3DProperty {
        get => UIElement.get_Transform3DProperty()
    }

    /**
     * Identifies the [CanDrag](uielement_candrag.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.candragproperty
     * @type {DependencyProperty} 
     */
    static CanDragProperty {
        get => UIElement.get_CanDragProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PreviewKeyDownEvent() {
        if (!UIElement.HasProp("__IUIElementStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics7.IID)
            UIElement.__IUIElementStatics7 := IUIElementStatics7(factoryPtr)
        }

        return UIElement.__IUIElementStatics7.get_PreviewKeyDownEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_CharacterReceivedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics7.IID)
            UIElement.__IUIElementStatics7 := IUIElementStatics7(factoryPtr)
        }

        return UIElement.__IUIElementStatics7.get_CharacterReceivedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PreviewKeyUpEvent() {
        if (!UIElement.HasProp("__IUIElementStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics7.IID)
            UIElement.__IUIElementStatics7 := IUIElementStatics7(factoryPtr)
        }

        return UIElement.__IUIElementStatics7.get_PreviewKeyUpEvent()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShadowProperty() {
        if (!UIElement.HasProp("__IUIElementStatics10")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics10.IID)
            UIElement.__IUIElementStatics10 := IUIElementStatics10(factoryPtr)
        }

        return UIElement.__IUIElementStatics10.get_ShadowProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CompositeModeProperty() {
        if (!UIElement.HasProp("__IUIElementStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics2.IID)
            UIElement.__IUIElementStatics2 := IUIElementStatics2(factoryPtr)
        }

        return UIElement.__IUIElementStatics2.get_CompositeModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContextFlyoutProperty() {
        if (!UIElement.HasProp("__IUIElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics4.IID)
            UIElement.__IUIElementStatics4 := IUIElementStatics4(factoryPtr)
        }

        return UIElement.__IUIElementStatics4.get_ContextFlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExitDisplayModeOnAccessKeyInvokedProperty() {
        if (!UIElement.HasProp("__IUIElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics4.IID)
            UIElement.__IUIElementStatics4 := IUIElementStatics4(factoryPtr)
        }

        return UIElement.__IUIElementStatics4.get_ExitDisplayModeOnAccessKeyInvokedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsAccessKeyScopeProperty() {
        if (!UIElement.HasProp("__IUIElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics4.IID)
            UIElement.__IUIElementStatics4 := IUIElementStatics4(factoryPtr)
        }

        return UIElement.__IUIElementStatics4.get_IsAccessKeyScopeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AccessKeyScopeOwnerProperty() {
        if (!UIElement.HasProp("__IUIElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics4.IID)
            UIElement.__IUIElementStatics4 := IUIElementStatics4(factoryPtr)
        }

        return UIElement.__IUIElementStatics4.get_AccessKeyScopeOwnerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AccessKeyProperty() {
        if (!UIElement.HasProp("__IUIElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics4.IID)
            UIElement.__IUIElementStatics4 := IUIElementStatics4(factoryPtr)
        }

        return UIElement.__IUIElementStatics4.get_AccessKeyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightsProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_LightsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTipPlacementModeProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_KeyTipPlacementModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTipHorizontalOffsetProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_KeyTipHorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTipVerticalOffsetProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_KeyTipVerticalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusKeyboardNavigationProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_XYFocusKeyboardNavigationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusUpNavigationStrategyProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_XYFocusUpNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusDownNavigationStrategyProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_XYFocusDownNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusLeftNavigationStrategyProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_XYFocusLeftNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusRightNavigationStrategyProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_XYFocusRightNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HighContrastAdjustmentProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_HighContrastAdjustmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TabFocusNavigationProperty() {
        if (!UIElement.HasProp("__IUIElementStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics5.IID)
            UIElement.__IUIElementStatics5 := IUIElementStatics5(factoryPtr)
        }

        return UIElement.__IUIElementStatics5.get_TabFocusNavigationProperty()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_KeyDownEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_KeyDownEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_KeyUpEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_KeyUpEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PointerEnteredEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_PointerEnteredEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PointerPressedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_PointerPressedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PointerMovedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_PointerMovedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PointerReleasedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_PointerReleasedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PointerExitedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_PointerExitedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PointerCaptureLostEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_PointerCaptureLostEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PointerCanceledEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_PointerCanceledEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_PointerWheelChangedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_PointerWheelChangedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_TappedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_TappedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_DoubleTappedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_DoubleTappedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_HoldingEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_HoldingEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_RightTappedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_RightTappedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_ManipulationStartingEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_ManipulationStartingEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_ManipulationInertiaStartingEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_ManipulationInertiaStartingEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_ManipulationStartedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_ManipulationStartedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_ManipulationDeltaEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_ManipulationDeltaEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_ManipulationCompletedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_ManipulationCompletedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_DragEnterEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_DragEnterEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_DragLeaveEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_DragLeaveEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_DragOverEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_DragOverEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_DropEvent() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_DropEvent()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AllowDropProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_AllowDropProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpacityProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_OpacityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClipProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_ClipProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RenderTransformProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_RenderTransformProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ProjectionProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_ProjectionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RenderTransformOriginProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_RenderTransformOriginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHitTestVisibleProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_IsHitTestVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VisibilityProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_VisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UseLayoutRoundingProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_UseLayoutRoundingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TransitionsProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_TransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CacheModeProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_CacheModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTapEnabledProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_IsTapEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDoubleTapEnabledProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_IsDoubleTapEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsRightTapEnabledProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_IsRightTapEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHoldingEnabledProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_IsHoldingEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ManipulationModeProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_ManipulationModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerCapturesProperty() {
        if (!UIElement.HasProp("__IUIElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics.IID)
            UIElement.__IUIElementStatics := IUIElementStatics(factoryPtr)
        }

        return UIElement.__IUIElementStatics.get_PointerCapturesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanBeScrollAnchorProperty() {
        if (!UIElement.HasProp("__IUIElementStatics9")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics9.IID)
            UIElement.__IUIElementStatics9 := IUIElementStatics9(factoryPtr)
        }

        return UIElement.__IUIElementStatics9.get_CanBeScrollAnchorProperty()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_BringIntoViewRequestedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics8.IID)
            UIElement.__IUIElementStatics8 := IUIElementStatics8(factoryPtr)
        }

        return UIElement.__IUIElementStatics8.get_BringIntoViewRequestedEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_ContextRequestedEvent() {
        if (!UIElement.HasProp("__IUIElementStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics8.IID)
            UIElement.__IUIElementStatics8 := IUIElementStatics8(factoryPtr)
        }

        return UIElement.__IUIElementStatics8.get_ContextRequestedEvent()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTipTargetProperty() {
        if (!UIElement.HasProp("__IUIElementStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics8.IID)
            UIElement.__IUIElementStatics8 := IUIElementStatics8(factoryPtr)
        }

        return UIElement.__IUIElementStatics8.get_KeyTipTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyboardAcceleratorPlacementTargetProperty() {
        if (!UIElement.HasProp("__IUIElementStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics8.IID)
            UIElement.__IUIElementStatics8 := IUIElementStatics8(factoryPtr)
        }

        return UIElement.__IUIElementStatics8.get_KeyboardAcceleratorPlacementTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyboardAcceleratorPlacementModeProperty() {
        if (!UIElement.HasProp("__IUIElementStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics8.IID)
            UIElement.__IUIElementStatics8 := IUIElementStatics8(factoryPtr)
        }

        return UIElement.__IUIElementStatics8.get_KeyboardAcceleratorPlacementModeProperty()
    }

    /**
     * Registers an element as representing a scrollable viewport.
     * @remarks
     * This method informs the framework that the element's applied clip (either due to layout or an explicitly assigned [Clip](uielement_clip.md)) is acting as a viewport and should receive special consideration.
     * 
     * This method is intended for use by custom controls that do not use the platform's native controls to display a scrollable area. For example, a custom scrolling control could be built using [InteractionTracker](../windows.ui.composition.interactions/interactiontracker.md).
     * @param {UIElement} element The element to register as a scrollable viewport.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.registerasscrollport
     */
    static RegisterAsScrollPort(element) {
        if (!UIElement.HasProp("__IUIElementStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics8.IID)
            UIElement.__IUIElementStatics8 := IUIElementStatics8(factoryPtr)
        }

        return UIElement.__IUIElementStatics8.RegisterAsScrollPort(element)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_GettingFocusEvent() {
        if (!UIElement.HasProp("__IUIElementStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics6.IID)
            UIElement.__IUIElementStatics6 := IUIElementStatics6(factoryPtr)
        }

        return UIElement.__IUIElementStatics6.get_GettingFocusEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_LosingFocusEvent() {
        if (!UIElement.HasProp("__IUIElementStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics6.IID)
            UIElement.__IUIElementStatics6 := IUIElementStatics6(factoryPtr)
        }

        return UIElement.__IUIElementStatics6.get_LosingFocusEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    static get_NoFocusCandidateFoundEvent() {
        if (!UIElement.HasProp("__IUIElementStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics6.IID)
            UIElement.__IUIElementStatics6 := IUIElementStatics6(factoryPtr)
        }

        return UIElement.__IUIElementStatics6.get_NoFocusCandidateFoundEvent()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Transform3DProperty() {
        if (!UIElement.HasProp("__IUIElementStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics3.IID)
            UIElement.__IUIElementStatics3 := IUIElementStatics3(factoryPtr)
        }

        return UIElement.__IUIElementStatics3.get_Transform3DProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanDragProperty() {
        if (!UIElement.HasProp("__IUIElementStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics3.IID)
            UIElement.__IUIElementStatics3 := IUIElementStatics3(factoryPtr)
        }

        return UIElement.__IUIElementStatics3.get_CanDragProperty()
    }

    /**
     * Resumes direct manipulation processing (system-defined panning/zooming) on any [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) parent that contains the current [UIElement](uielement.md).
     * @remarks
     * By default, touch input interactions in [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) elements are handled by the [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal) engine off the UI thread. An app cannot directly process the associated pointer events after [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal) processing starts. You can call [CancelDirectManipulations](uielement_canceldirectmanipulations_1164631120.md) at the start of a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) interaction and handle the pointer events on the UI thread, which gives you the opportunity to do custom input handling in a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md).
     * 
     * If you cancel [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal) processing at the start of a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) interaction, you can call TryStartDirectManipulation to resume having [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal) process the input stream. This lets you do custom input processing first, and then resume [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal) handling to make your app more responsive to touch interactions like scrolling and zooming.
     * 
     * Only active touch contacts can be passed to [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal). Using non-active or non-touch contacts causes an exception to be thrown.
     * 
     * Specifying a touch contact to pass to [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal) results in the framework walking up the parent chain and setting the contact on the [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal) viewport of each [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) encountered in order, until the walk reaches any element (including the original target element) that does not have a [ManipulationMode](uielement_manipulationmode.md) that contains [ManipulationModes.System](../windows.ui.xaml.input/manipulationmodes.md). A given touch contact can only be associated with a single chain of visuals at a time. Calling TryStartDirectManipulation more than once on the same contact results in any previous chain being released.
     * @param {Pointer} value The active touch point that initiated the manipulation.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.trystartdirectmanipulation
     */
    static TryStartDirectManipulation(value) {
        if (!UIElement.HasProp("__IUIElementStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.UIElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUIElementStatics3.IID)
            UIElement.__IUIElementStatics3 := IUIElementStatics3(factoryPtr)
        }

        return UIElement.__IUIElementStatics3.TryStartDirectManipulation(value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the size that this [UIElement](uielement.md) computed during the measure pass of the layout process.
     * @remarks
     * DesiredSize is typically checked as one of the measurement factors when you implement layout behavior overrides such as [ArrangeOverride](frameworkelement_arrangeoverride_1795048387.md) or [MeasureOverride](frameworkelement_measureoverride_1586581644.md). Depending on the parent container's layout logic, DesiredSize might be fully respected, constraints on DesiredSize might be applied, and such constraints might also change other characteristics of either the parent element or child element. For example, a control that supports scrollable regions (but chooses not to derive from the controls that already enable scrollable regions) could compare available size to DesiredSize. The control could then set an internal state that enabled scrollbars in the UI for that control. Or, DesiredSize could be ignored and the element always gets a layout that is sized by other considerations such as checking attached property values.
     * 
     * DesiredSize won't contain a useful value unless at least one "Measure" pass of layout has run on the element.
     * 
     * DesiredSize is really only intended for use when you define your own layout override methods. If you're just interested in the size of an element in your app's UI at run time, then you should use the [ActualWidth](frameworkelement_actualwidth.md) and [ActualHeight](frameworkelement_actualheight.md) properties instead. You might be checking size this way if an element is influenced by dynamic layout techniques such as star sizing of [Grid](../windows.ui.xaml.controls/grid.md) cells. Rely on [ActualWidth](frameworkelement_actualwidth.md) and [ActualHeight](frameworkelement_actualheight.md) values only in situations that are sure to be after layout has run: for example, in [Loaded](frameworkelement_loaded.md) events, or triggered by user actions that are only possible after the UI has been rendered initially.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.desiredsize
     * @type {SIZE} 
     */
    DesiredSize {
        get => this.get_DesiredSize()
    }

    /**
     * Gets or sets a value that determines whether this [UIElement](uielement.md) can be a drop target for purposes of drag-and-drop operations.
     * @remarks
     * The value of AllowDrop determines whether various events related to being a drop target or responding to being dragged over can be handled. Such events only can be handled if AllowDrop is **true** on the [UIElement](uielement.md) that is a potential drop target. These events are:
     * + [DragEnter](uielement_dragenter.md)
     * + [DragLeave](uielement_dragleave.md)
     * + [DragOver](uielement_dragover.md)
     * + [Drop](uielement_drop.md)
     *  Each of the listed events is a routed event. If you want to handle a bubbling drag-drop event, the potential drop target must have AllowDrop set to **true**, and the object where the event is handled must have AllowDrop set to **true**. For more info on routed event concepts, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * The Windows Runtime implementation of drag-drop concepts permits only certain controls and input actions to initiate a drag-drop action. There is no generalized **DoDragDrop** method that would permit any UI element to initiate a drag-drop action. The main source of a drag-drop action in an app is when you drag the items of a list such as [GridView](../windows.ui.xaml.controls/gridview.md). However once the action is initiated, any [UIElement](uielement.md) in the app can potentially be a drop target so long as AllowDrop is **true** on that element. Any elements that the drag-drop action passes over can handle [DragEnter](uielement_dragenter.md), [DragLeave](uielement_dragleave.md) or [DragOver](uielement_dragover.md). The initiating list view does not require AllowDrop. Instead, the value of [CanDragItems](../windows.ui.xaml.controls/listviewbase_candragitems.md) is used to determine whether the items in the list can be used to start a drag-drop action.
     * 
     * A UI element can't be a drop target for any drag-drop action that begins from outside the current UWP app. This includes actions that come from another UWP app, which is possible for a snapped view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.allowdrop
     * @type {Boolean} 
     */
    AllowDrop {
        get => this.get_AllowDrop()
        set => this.put_AllowDrop(value)
    }

    /**
     * Gets or sets the degree of the object's opacity.
     * @remarks
     * When Opacity is set on objects that are nested, the effective opacity for rendering is the product of all applicable opacity factors. For example, if an object that has `Opacity=0.5` is contained in a [Canvas](../windows.ui.xaml.controls/canvas.md) that is also `Opacity=0.5`, the effective Opacity value for rendering is `0.25`. Opacity values greater than 1.0 are treated as 1.0 when the value is used, although obtaining the property value will still give you the original greater-than-one value. Opacity values set as less than 0 are treated as 0 when the value is used. In the factoring logic, setting an Opacity to 2 to cancel out the effects of being contained by an object with 0.5 Opacity does not work; the 2 value is treated as 1.0 even before the nested-object factoring is calculated.
     * 
     * Opacity is a property that's sometimes animated in visual state storyboards, with zero duration. For example, the focus rectangle for "FocusStates" visual states is set with `Opacity="0"` in the original control template, because you don't want this rectangle to appear in a default non-focused states. But the visual states define a zero-duration "Focused" state that sets Opacity to 1 when the control using these templates and states has detected that it's keyboard-focused. For more info on this usage of Opacity, see [Storyboarded animations for visual states](/previous-versions/windows/apps/jj819808(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.opacity
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * Gets or sets the [RectangleGeometry](../windows.ui.xaml.media/rectanglegeometry.md) used to define the outline of the contents of a [UIElement](uielement.md).
     * @remarks
     * The clipping geometry for UIElement.Clip in the Windows Runtime  API must be a [RectangleGeometry](../windows.ui.xaml.media/rectanglegeometry.md). You can't specify a non-rectangular geometry.
     * 
     * The clipped area is the "outside" of the geometry. In other words, the content that is shown (not clipped) is the area of the rectangle that is drawn with [Fill](../windows.ui.xaml.shapes/shape_fill.md) if the geometry were used as data for a [Path](../windows.ui.xaml.shapes/path.md) rather than for clipping. The clipped area is any area that falls outside the rectangle. The clipped area isn't hit-testable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.clip
     * @type {RectangleGeometry} 
     */
    Clip {
        get => this.get_Clip()
        set => this.put_Clip(value)
    }

    /**
     * Gets or sets transform information that affects the rendering position of a [UIElement](uielement.md).
     * @remarks
     * You can animate a transform, if you target sub-properties of the specific transform being used that take **Double** values. Or you can use [ObjectAnimationUsingKeyFrames](../windows.ui.xaml.media.animation/objectanimationusingkeyframes.md) to cycle through distinct transforms. Classes such as [QuarticEase](../windows.ui.xaml.media.animation/quarticease.md) show some example XAML.
     * 
     * If you do animate RenderTransform, make sure there is an existing starting [Transform](../windows.ui.xaml.media/transform.md) value, even if it is all at default values. You can't animate a RenderTransform value that is initially null.
     * 
     * The value of RenderTransform is overridden by [PointerDownThemeAnimation](../windows.ui.xaml.media.animation/pointerdownthemeanimation.md) and [PointerUpThemeAnimation](../windows.ui.xaml.media.animation/pointerupthemeanimation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.rendertransform
     * @type {Transform} 
     */
    RenderTransform {
        get => this.get_RenderTransform()
        set => this.put_RenderTransform(value)
    }

    /**
     * Gets or sets the perspective projection (3-D effect) to apply when rendering this element.
     * @remarks
     * Projection and [RenderTransform](uielement_rendertransform.md) with a [SkewTransform](../windows.ui.xaml.media/skewtransform.md) can achieve similar results, a Projection is probably more versatile, especially if you want a sense of perspective change applied to the element.
     * 
     * Projection is the base class type that this property uses, but Projection does not implement a practical behavior. Use either [Matrix3DProjection](../windows.ui.xaml.media/matrix3dprojection.md) or [PlaneProjection](../windows.ui.xaml.media/planeprojection.md).
     * 
     * The value of Projection is overridden by [PointerDownThemeAnimation](../windows.ui.xaml.media.animation/pointerdownthemeanimation.md) and [PointerUpThemeAnimation](../windows.ui.xaml.media.animation/pointerupthemeanimation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.projection
     * @type {Projection} 
     */
    Projection {
        get => this.get_Projection()
        set => this.put_Projection(value)
    }

    /**
     * Gets or sets the origin point of any possible render transform declared by [RenderTransform](uielement_rendertransform.md), relative to the bounds of the [UIElement](uielement.md).
     * @remarks
     * RenderTransformOrigin enables you to create or change the effect of a transform on a particular element without having to alter the specifics of the [RenderTransform](uielement_rendertransform.md) transform. The [Point](../windows.foundation/point.md) value you specify for RenderTransformOrigin is not based on actual pixel measures. Instead, it is a *logical point*, where a value of 0,0 refers to the top left corner of the overall [UIElement](uielement.md) render area, and 1,1 refers to the bottom right. The value is then evaluated into an X,Y coordinate by factoring it into the current coordinate space of the [UIElement](uielement.md).
     * 
     * For some transforms, the origin doesn't matter. For example the RenderTransformOrigin won't change the behavior of a [TranslateTransform](../windows.ui.xaml.media/translatetransform.md) applied to the [RenderTransform](uielement_rendertransform.md) property.
     * 
     * Some transform types have their own properties for specifying the origin of the transform. For example, [RotateTransform](../windows.ui.xaml.media/rotatetransform.md) has [CenterX](../windows.ui.xaml.media/rotatetransform_centerx.md) and [CenterY](../windows.ui.xaml.media/rotatetransform_centery.md). When you're working with a [UIElement](uielement.md), visual design tools sometimes hide these other properties so that you only use RenderTransformOrigin for all transform origin changes and leave transform-specific origins as the defaults. Tools might also apply all transform effects to a single [CompositeTransform](../windows.ui.xaml.media/compositetransform.md) value for [RenderTransform](uielement_rendertransform.md), rather than defining XAML elements for the specific transforms and making a [TransformGroup](../windows.ui.xaml.media/transformgroup.md). If you're writing your own XAML or defining transforms in code, you might consider following these same practices so that you always use RenderTransformOrigin rather than the transform-specific origin values if you're applying transforms for [RenderTransform](uielement_rendertransform.md), otherwise the values will offset each other.
     * 
     * A common technique is to set RenderTransformOrigin to 0.5,0.5, which places the origin at the element center. You could then apply a [RotateTransform](../windows.ui.xaml.media/rotatetransform.md) to rotate the element around the center.
     * 
     * Changing [FlowDirection](frameworkelement_flowdirection.md) to **RightToLeft** changes the meaning of the X coordinate of a RenderTransformOrigin for a [UIElement](uielement.md); 0 will be the right edge.
     * 
     * Some of the same visual effects that you can produce with [RenderTransform](uielement_rendertransform.md) and RenderTransformOrigin can also be achieved with [Projection](uielement_projection.md) and a [PlaneProjection](../windows.ui.xaml.media/planeprojection.md). For example, you can rotate a [UIElement](uielement.md) around its center by changing [PlaneProjection.RotationZ](../windows.ui.xaml.media/planeprojection_rotationz.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.rendertransformorigin
     * @type {POINT} 
     */
    RenderTransformOrigin {
        get => this.get_RenderTransformOrigin()
        set => this.put_RenderTransformOrigin(value)
    }

    /**
     * Gets or sets whether the contained area of this [UIElement](uielement.md) can return true values for hit testing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.ishittestvisible
     * @type {Boolean} 
     */
    IsHitTestVisible {
        get => this.get_IsHitTestVisible()
        set => this.put_IsHitTestVisible(value)
    }

    /**
     * Gets or sets the visibility of a [UIElement](uielement.md). A [UIElement](uielement.md) that is not visible is not rendered and does not communicate its desired size to layout.
     * @remarks
     * A UI element that has Visibility equals **Collapsed** is still loaded along with the rest of the XAML on a page and exists in the runtime object tree.
     * 
     * An element that has Visibility equals **Collapsed** has no location in the UI and does not participate in input or hit testing. They are also not in a tab sequence and cannot be focused, not even programmatically. If you still want input, focus or hit testing, rather than set Visibility use a zero [Opacity](uielement_opacity.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.visibility
     * @type {Integer} 
     */
    Visibility {
        get => this.get_Visibility()
        set => this.put_Visibility(value)
    }

    /**
     * Gets the final render size of a [UIElement](uielement.md). Use is not recommended, see Remarks.
     * @remarks
     * RenderSize is not the property to use to obtain size information about a UI element for most scenarios, because in the current implementation it doesn't have a safe technique for knowing when the value is current. For general UI purposes, use [ActualHeight](frameworkelement_actualheight.md) and [ActualWidth](frameworkelement_actualwidth.md) instead, and do so only at points in object lifetime where object layout is complete. Examples of safe timing for checking [ActualHeight](frameworkelement_actualheight.md) or [ActualWidth](frameworkelement_actualwidth.md) are user input events or the [Loaded](frameworkelement_loaded.md) event. Or you can handle [SizeChanged](frameworkelement_sizechanged.md), which has updated size information in its event data. For layout method override purposes (for example [MeasureOverride](frameworkelement_measureoverride_1586581644.md)), use [DesiredSize](uielement_desiredsize.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.rendersize
     * @type {SIZE} 
     */
    RenderSize {
        get => this.get_RenderSize()
    }

    /**
     * Gets or sets a value that determines whether rendering for the object and its visual subtree should use rounding behavior that aligns rendering to whole pixels.
     * @remarks
     * Various Windows Runtime properties of type **Double** are used to specify layout desired values or characteristics. The most obvious are [Height](frameworkelement_height.md) and [Width](frameworkelement_width.md) but there are many others. The default value of **true** for UseLayoutRounding will cause measurement and layout operations to round potential subpixel values from these layout properties to the nearest integer value, and render objects aligned to pixel boundaries. This behavior is intended to reduce the visual artifacts that can appear when a subpixel value renders and affects pixels on either side of the subpixel boundary. The most prominent example of such an artifact is when you intend to produce a crisp, thin line of a particular color. If your measurement for the line gave a subpixel value, and the layout behavior did not round to whole pixels, then the line can potentially appear blurry as well as appearing as a dimmer color shade than you intended.
     * 
     * Layout rounding affects aliasing as well as positioning.
     * 
     * Possible scenarios for setting UseLayoutRounding to **false** are not documented here. If you feel that there might be benefit in enabling subpixel rendering for your app, experiment with setting UseLayoutRounding to **false**, examine the visual results, and make sure that possible rendering artifacts from subpixel rendering do not outweigh the perceived benefits. If you do set UseLayoutRounding to **false**, it's common to do so on the root of your XAML page or object tree.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.uselayoutrounding
     * @type {Boolean} 
     */
    UseLayoutRounding {
        get => this.get_UseLayoutRounding()
        set => this.put_UseLayoutRounding(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to a [UIElement](uielement.md).
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * This is a short list of some of the possible types for transitions:
     * + [AddDeleteThemeTransition](../windows.ui.xaml.media.animation/adddeletethemetransition.md)
     * + [ContentThemeTransition](../windows.ui.xaml.media.animation/contentthemetransition.md)
     * + [EdgeUIThemeTransition](../windows.ui.xaml.media.animation/edgeuithemetransition.md)
     * + [EntranceThemeTransition](../windows.ui.xaml.media.animation/entrancethemetransition.md)
     * + [PopupThemeTransition](../windows.ui.xaml.media.animation/popupthemetransition.md)
     * + [ReorderThemeTransition](../windows.ui.xaml.media.animation/reorderthemetransition.md)
     * + [RepositionThemeTransition](../windows.ui.xaml.media.animation/repositionthemetransition.md)
     * 
     * Specific classes that derive from [UIElement](uielement.md) sometimes have their own properties that hold other types of transitions for class-specific scenarios. For example, [Popup.ChildTransitions](../windows.ui.xaml.controls.primitives/popup_childtransitions.md) and [ItemsControl.ItemContainerTransitions](../windows.ui.xaml.controls/itemscontrol_itemcontainertransitions.md).
     * 
     * Transition animations play a particular role in the UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * <!-- For more info, see  Transition animations and theme animations.-->
     * 
     * It's not common to set the value of the Transitions property directly on a [UIElement](uielement.md) that is a direct element of app UI. It's more common to have a transitions collection be a part of a visual state, template or style. In this case you use mechanisms such as [Setter](setter.md) of a [Style](style.md) to specify the Transitions property, and set the value using XAML-defined content that is typically stored as a XAML resource.
     * 
     * [VisualTransition](visualtransition.md) is not one of the types you put in the UIElement.Transitions collection. [VisualTransition](visualtransition.md) is specifically for animations in visual state groups, and is used by the [VisualStateGroup.Transitions](visualstategroup_transitions.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.transitions
     * @type {TransitionCollection} 
     */
    Transitions {
        get => this.get_Transitions()
        set => this.put_Transitions(value)
    }

    /**
     * Gets or sets a value that indicates that rendered content should be cached as a composited bitmap when possible.
     * @remarks
     * Set this value to enable the caching behavior that offloads [RenderTransform](uielement_rendertransform.md) and [Opacity](uielement_opacity.md) bitmaps to the graphics processing unit (GPU). Otherwise, leave it as **null**.
     * 
     * For XAML, the string literal "BitmapCache" is the only enabled value you can use to set CacheMode as an attribute. 
     * 
     * > [!NOTE]
     * > [BitmapCache](../windows.ui.xaml.media/bitmapcache.md) is the only existing practical derived classes in the Windows Runtime  API that enables this behavior (the [CacheMode](../windows.ui.xaml.media/cachemode.md) type is an intermediate type that exists only for infrastructure and legacy reasons).
     * 
     * If setting CacheMode in code, set it to a new value of [BitmapCache](../windows.ui.xaml.media/bitmapcache.md), like this:
     * 
     * ```xaml
     * <Canvas x:Name="canvas1"/>
     * ```
     * 
     * ```csharp
     * canvas1.CacheMode = new BitmapCache();
     * ```
     * 
     * ```cppwinrt
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.cachemode
     * @type {CacheMode} 
     */
    CacheMode {
        get => this.get_CacheMode()
        set => this.put_CacheMode(value)
    }

    /**
     * Gets or sets a value that determines whether the [Tapped](uielement_tapped.md) event can originate from that element.
     * @remarks
     * The default is **true** (event enabled). If you set to **false**, the [UIElement](uielement.md) will no longer source the [Tapped](uielement_tapped.md) event. This might be desirable if a parent element such as a list control should instead process the action as a manipulation, or if you want to specify that only some child items emit a [Tapped](uielement_tapped.md) event that a parent handles after bubbling.
     * 
     * Another reason to suppress gesture events is if you are handling pointer-level events and don't want gesture recognition logic to impact how the pointer events are fired. For example, if the gesture recognition engine has to test for [Tapped](uielement_tapped.md), then it must delay firing a [PointerMoved](uielement_pointermoved.md) event for small movements, because the user might lift the touch point soon and the input event would normally be gesture-recognized as a tap.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.istapenabled
     * @type {Boolean} 
     */
    IsTapEnabled {
        get => this.get_IsTapEnabled()
        set => this.put_IsTapEnabled(value)
    }

    /**
     * Gets or sets a value that determines whether the [DoubleTapped](uielement_doubletapped.md) event can originate from that element.
     * @remarks
     * The default is **true** (event enabled). If you set to **false**, the [UIElement](uielement.md) will no longer source the [DoubleTapped](uielement_doubletapped.md) event. This might be desirable if a parent element such as a list control should instead process the action as a manipulation, or if you want to specify that only some child items emit a [DoubleTapped](uielement_doubletapped.md) event that a parent handles after bubbling.
     * 
     * Another reason to suppress gesture events is if you are handling pointer-level events and don't want gesture recognition logic to impact how the pointer events are fired. For example, if the gesture recognition engine has to test for [Tapped](uielement_tapped.md), then it must delay firing a [PointerMoved](uielement_pointermoved.md) event for small movements, because the user might lift the touch point soon and the input event would normally be gesture-recognized as a tap.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.isdoubletapenabled
     * @type {Boolean} 
     */
    IsDoubleTapEnabled {
        get => this.get_IsDoubleTapEnabled()
        set => this.put_IsDoubleTapEnabled(value)
    }

    /**
     * Gets or sets a value that determines whether the [RightTapped](uielement_righttapped.md) event can originate from that element.
     * @remarks
     * The default is **true** (event enabled). If you set to **false**, the [UIElement](uielement.md) will no longer source the [RightTapped](uielement_righttapped.md) event. This might be desirable if a parent element such as a list control should instead process the action as a manipulation, or if you want to specify that only some child items emit a [RightTapped](uielement_righttapped.md) event that a parent handles after bubbling.
     * 
     * Another reason to suppress gesture events is if you are handling pointer-level events and don't want gesture recognition logic to impact how the pointer events are fired. For example, if the gesture recognition engine has to test for [Tapped](uielement_tapped.md), then it must delay firing a [PointerMoved](uielement_pointermoved.md) event for small movements, because the user might lift the touch point soon and the input event would normally be gesture-recognized as a tap.
     * 
     * You do not need a mouse device to produce a [RightTapped](uielement_righttapped.md) event. A [RightTapped](uielement_righttapped.md) event is generated if a touch event becomes a [Holding](uielement_holding.md) event when the touch position remained in one place. Even though [Holding](uielement_holding.md) and [RightTapped](uielement_righttapped.md) might result from the same user touch action, the design guidance for what that event means to an app is different, as is the timing. For more info, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.isrighttapenabled
     * @type {Boolean} 
     */
    IsRightTapEnabled {
        get => this.get_IsRightTapEnabled()
        set => this.put_IsRightTapEnabled(value)
    }

    /**
     * Gets or sets a value that determines whether the [Holding](uielement_holding.md) event can originate from that element.
     * @remarks
     * The default is **true** (event enabled). If you set to **false**, the [UIElement](uielement.md) will no longer source the [Holding](uielement_holding.md) event. This might be desirable if a parent element such as a list control should instead process the action as a manipulation, or if you want to specify that only some child items emit a [Holding](uielement_holding.md) event that a parent handles after bubbling.
     * 
     * Another reason to suppress gesture events is if you are handling pointer-level events and don't want gesture recognition logic to impact how the pointer events are fired. For example, if the gesture recognition engine has to test for [Tapped](uielement_tapped.md), then it must delay firing a [PointerMoved](uielement_pointermoved.md) event for small movements, because the user might lift the touch point soon and the input event would normally be gesture-recognized as a tap. Also, [Holding](uielement_holding.md) states might interfere with other pointer events, or generate theme animations, because of the progression through the [Holding](uielement_holding.md) states that must be reported by gesture recognition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.isholdingenabled
     * @type {Boolean} 
     */
    IsHoldingEnabled {
        get => this.get_IsHoldingEnabled()
        set => this.put_IsHoldingEnabled(value)
    }

    /**
     * Gets or sets the [ManipulationModes](../windows.ui.xaml.input/manipulationmodes.md) value used for [UIElement](uielement.md) behavior and interaction with gestures. Setting this value enables handling the manipulation events from this element in app code.
     * @remarks
     * You must set the ManipulationMode to a value other than **System** or **None** if you want to handle manipulation events such as [ManipulationStarted](uielement_manipulationstarted.md) from UI elements in your app code. For more info on manipulations, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input).
     * 
     * The typical default value of ManipulationMode is **System** rather than **None**. When the value is **System**, manipulations that originate from the element can be handled by the Windows Runtime infrastructure, which is based on the [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal)  API. For example, [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) handles user manipulations in its control logic and processes them as scrolling actions for the control. The **System** value also enables personality animations that respond to manipulation events.
     * 
     * [Slider](../windows.ui.xaml.controls/slider.md) and [ToggleSwitch](../windows.ui.xaml.controls/toggleswitch.md) have default templates that set the ManipulationMode value to **None**, so **None** will be the default value you see at design time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.manipulationmode
     * @type {Integer} 
     */
    ManipulationMode {
        get => this.get_ManipulationMode()
        set => this.put_ManipulationMode(value)
    }

    /**
     * Gets the set of all captured pointers, represented as [Pointer](../windows.ui.xaml.input/pointer.md) values.
     * @remarks
     * For more info on how to capture a pointer and why you might want to do so, see [CapturePointer](uielement_capturepointer_916768934.md).
     * 
     * Because there are input scenarios such as manipulations that involve more than one pointer point, the Windows Runtime enables capturing more than one pointer at a time. The PointerCaptures property exposes a view of which pointer points are currently captured by the [UIElement](uielement.md).
     * 
     * This property's value is calculated based on the results of other actions. Calling [CapturePointer](uielement_capturepointer_916768934.md) adds to the internal collection that PointerCaptures provides a read-only view of. Calling [ReleasePointerCapture](uielement_releasepointercapture_962192786.md) removes from the collection. [ReleasePointerCaptures](uielement_releasepointercaptures_190109337.md) clears the collection. User action that invalidates pointer capture such as releasing from a pointer point also changes capture state and thus the collection. For more info, see [Mouse interactions](/windows/uwp/input-and-devices/mouse-interactions) and [Handle pointer input](/windows/uwp/design/input/handle-pointer-input).
     * 
     * The collection is not necessarily indexed by [PointerId](../windows.ui.xaml.input/pointer_pointerid.md). To find a specific [PointerId](../windows.ui.xaml.input/pointer_pointerid.md), you must check the items in the collection and reference a specific [Pointer](../windows.ui.xaml.input/pointer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.pointercaptures
     * @type {IVectorView<Pointer>} 
     */
    PointerCaptures {
        get => this.get_PointerCaptures()
    }

    /**
     * Gets or sets a property that declares alternate composition and blending modes for the element in its parent layout and window. This is relevant for elements that are involved in a mixed XAML / Microsoft DirectX UI.
     * @remarks
     * If left unset, the default value of **CompositeMode** is **ElementCompositeMode.Inherits**. This means that the composite mode inherits from successive parents in the visual tree. However, at the root of a XAML visual tree is a final object representing the **hWnd** that is not typically represented in user code, and its effective **CompositeMode** behavior is **SourceOver**. Therefore, unless some element in the chain is specifically set to **MinBlend**, the render behavior of XAML elements all inherit to use **SourceOver** as inherited from the parent window.
     * 
     * Setting **CompositeMode** to **MinBlend** is useful for a mixed XAML / Microsoft DirectX UI because it is information used by the Direct Composition layer when it combines the UI sources. The **MinBlend** behavior can be better for situations such as text overlays.
     * 
     * Setting a value of **MinBlend** is typically most relevant for a [SwapChainPanel](../windows.ui.xaml.controls/swapchainbackgroundpanel.md) element, so that the hosted content gets this behavior. But for some scenarios such as text overlays it can also be set on specific UI elements such as [Rectangle](../windows.ui.xaml.shapes/rectangle.md), [Canvas](../windows.ui.xaml.controls/canvas.md) and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.compositemode
     * @type {Integer} 
     */
    CompositeMode {
        get => this.get_CompositeMode()
        set => this.put_CompositeMode(value)
    }

    /**
     * Gets or sets the 3-D transform effect to apply when rendering this element.
     * @remarks
     * Use the Transform3D property to apply a 3-D transform matrix to a XAML element. This lets you create effects where two-dimensional UI appears to exist in 3-D space relative to the user. Transform3D behaves much like [RenderTransform](uielement_rendertransform.md), but allows transforms in three-dimensional space and not just two dimensions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.transform3d
     * @type {Transform3D} 
     */
    Transform3D {
        get => this.get_Transform3D()
        set => this.put_Transform3D(value)
    }

    /**
     * Gets or sets a value that indicates whether the element can be dragged as data in a drag-and-drop operation.
     * @remarks
     * <!--* If the value of CanDrag is set after DragStarting event is raised, that value does not come into effect until the next Drag operation i.e. until the next DragStarting event is raised.
     * 
     * * If CanDrag is set to true, during or before DropCompleted is raised, but after the DragStarting event, then the DropCompleted event should not be raised. 
     * 
     * * If CanDrag is set to true, but the app does not handle the DragStarting event, then the Drag operation is cancelled 
     * -->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.candrag
     * @type {Boolean} 
     */
    CanDrag {
        get => this.get_CanDrag()
        set => this.put_CanDrag(value)
    }

    /**
     * Gets or sets the flyout associated with this element.
     * @remarks
     * A context menu is attached to a single element and displays secondary commands. It's invoked by right clicking or an equivalent action, such as pressing and holding with your finger.
     * 
     * When you set the `ContextFlyout` property, the context menu is shown and hidden automatically, the [ContextRequested](uielement_contextrequested.md) event is marked as handled. You should only handle `ContextRequested` and `ContextCanceled` if you do not set `ContextFlyout`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.contextflyout
     * @type {FlyoutBase} 
     */
    ContextFlyout {
        get => this.get_ContextFlyout()
        set => this.put_ContextFlyout(value)
    }

    /**
     * Gets or sets a value that specifies whether the access key display is dismissed when an access key is invoked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.exitdisplaymodeonaccesskeyinvoked
     * @type {Boolean} 
     */
    ExitDisplayModeOnAccessKeyInvoked {
        get => this.get_ExitDisplayModeOnAccessKeyInvoked()
        set => this.put_ExitDisplayModeOnAccessKeyInvoked(value)
    }

    /**
     * Gets or sets a value that indicates whether an element defines its own access key scope.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.isaccesskeyscope
     * @type {Boolean} 
     */
    IsAccessKeyScope {
        get => this.get_IsAccessKeyScope()
        set => this.put_IsAccessKeyScope(value)
    }

    /**
     * Gets or sets a source element that provides the access key scope for this element, even if it's not in the visual tree of the source element.
     * @remarks
     * The source element must have its [IsAccessKeyScope](uielement_isaccesskeyscope.md) property set to **true**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.accesskeyscopeowner
     * @type {DependencyObject} 
     */
    AccessKeyScopeOwner {
        get => this.get_AccessKeyScopeOwner()
        set => this.put_AccessKeyScopeOwner(value)
    }

    /**
     * Gets or sets the access key (mnemonic) for this element.
     * @remarks
     * Setting this property enables the [AccessKeyDisplayRequested](uielement_accesskeydisplayrequested.md) event to be raised.
     * 
     * If the [AutomationProperties.AccessKey](/uwp/api/windows.ui.xaml.automation.automationproperties.accesskey) attached property is not set, this property is used by the Automation framework instead. The value is used as case-insensitive, using the user language. It is used as text, so if an Input Method Editor (IME) is active the composed text is used.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.accesskey
     * @type {HSTRING} 
     */
    AccessKey {
        get => this.get_AccessKey()
        set => this.put_AccessKey(value)
    }

    /**
     * Gets the collection of [XamlLight](../windows.ui.xaml.media/xamllight.md) objects attached to this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.lights
     * @type {IVector<XamlLight>} 
     */
    Lights {
        get => this.get_Lights()
    }

    /**
     * Gets or sets a value that indicates where the access key keytip is placed in relation to the boundary of the UIElement.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * 
     * Use the [KeyTipTarget](uielement_keytiptarget.md) property to specify a target element other than this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keytipplacementmode
     * @type {Integer} 
     */
    KeyTipPlacementMode {
        get => this.get_KeyTipPlacementMode()
        set => this.put_KeyTipPlacementMode(value)
    }

    /**
     * Gets or sets a value that indicates how far left or right the keytip is placed in relation to the UIElement.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keytiphorizontaloffset
     * @type {Float} 
     */
    KeyTipHorizontalOffset {
        get => this.get_KeyTipHorizontalOffset()
        set => this.put_KeyTipHorizontalOffset(value)
    }

    /**
     * Gets or sets a value that indicates how far up or down the keytip is placed in relation to the UI element.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keytipverticaloffset
     * @type {Float} 
     */
    KeyTipVerticalOffset {
        get => this.get_KeyTipVerticalOffset()
        set => this.put_KeyTipVerticalOffset(value)
    }

    /**
     * Gets or sets a value that enables or disables navigation using the keyboard directional arrows.
     * @remarks
     * When this property is set to **Auto**, the behavior is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback behavior is **Disabled**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocuskeyboardnavigation
     * @type {Integer} 
     */
    XYFocusKeyboardNavigation {
        get => this.get_XYFocusKeyboardNavigation()
        set => this.put_XYFocusKeyboardNavigation(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of an up navigation.
     * @remarks
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocusupnavigationstrategy
     * @type {Integer} 
     */
    XYFocusUpNavigationStrategy {
        get => this.get_XYFocusUpNavigationStrategy()
        set => this.put_XYFocusUpNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of a down navigation.
     * @remarks
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocusdownnavigationstrategy
     * @type {Integer} 
     */
    XYFocusDownNavigationStrategy {
        get => this.get_XYFocusDownNavigationStrategy()
        set => this.put_XYFocusDownNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of a left navigation.
     * @remarks
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocusleftnavigationstrategy
     * @type {Integer} 
     */
    XYFocusLeftNavigationStrategy {
        get => this.get_XYFocusLeftNavigationStrategy()
        set => this.put_XYFocusLeftNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of a right navigation.
     * @remarks
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xyfocusrightnavigationstrategy
     * @type {Integer} 
     */
    XYFocusRightNavigationStrategy {
        get => this.get_XYFocusRightNavigationStrategy()
        set => this.put_XYFocusRightNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that indicates whether the framework automatically adjusts the element's visual properties when high contrast themes are enabled.
     * @remarks
     * The value of the property is inherited.  When set to **Application** the adjustment will mirror what is set for the [Application](application.md)'s [HighContrastAdjustment](application_highcontrastadjustment.md) property.  Setting the [Application](application.md)'s [HighContrastAdjustment](application_highcontrastadjustment.md) property to **None** will effectively disable it for all UI in the application.  It can be selectively enabled for a UIElement by explicitly setting the value to **Auto**.   
     * When set to **Auto**, the framework automatically applies the following adjustments to XAML's text elements while a high contrast theme is enabled:
     * * The foreground color on text is ignored.  The text is colored using either the system’s high contrast text color or the disabled color when in a parent [Control](../windows.ui.xaml.controls/control.md) where [IsEnabled](../windows.ui.xaml.controls/control_isenabled.md) = "False".
     * * An opaque rectangle is rendered immediately behind the text to enforce a high contrast ratio.
     * * Non-zero values for [Opacity](uielement_opacity.md) are ignored.  The element and its children will appear as if they had an opacity of 1.0.
     * 
     * The following images show the difference between **Auto** (the default **Application** value) and **None**:
     * 
     * :::image type="content" source="images/HighContrastAdjustment_auto.png" alt-text="Example of buttons with HighContrastAdjustment set to auto.":::
     * :::image type="content" source="images/HighContrastAdjustment_none.png" alt-text="Example of buttons with HighContrastAdjustment set to none.":::
     * 
     * It is possible to set HighContrastAdjustment = None on a UIElement and then have HighContrastAdjustment = Auto on one of its descendants.  However, the framework does not guarantee that the descendent will be fully opaque if an opacity is applied on any of its ancestors.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.highcontrastadjustment
     * @type {Integer} 
     */
    HighContrastAdjustment {
        get => this.get_HighContrastAdjustment()
        set => this.put_HighContrastAdjustment(value)
    }

    /**
     * Gets or sets a value that modifies how tabbing and [TabIndex](../windows.ui.xaml.controls/control_tabindex.md) work for this control.
     * @remarks
     * Use this property instead of the [Control.TabNavigation](../windows.ui.xaml.controls/control_tabnavigation.md) property for objects that do not use a [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md) to define their appearance.
     * 
     * > [!NOTE]
     * > For Windows 10 Creators Update (build 10.0.15063) and newer, use this property of the [UIElement](../windows.ui.xaml/uielement.md) base class instead of the [TabNavigation](../windows.ui.xaml.controls/control_tabnavigation.md) property of a [Control](../windows.ui.xaml.controls/control.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.tabfocusnavigation
     * @type {Integer} 
     */
    TabFocusNavigation {
        get => this.get_TabFocusNavigation()
        set => this.put_TabFocusNavigation(value)
    }

    /**
     * Gets the collection of key combinations that invoke an action using the keyboard.
     * 
     * Accelerators are typically assigned to buttons or menu items.
     * 
     * ![Example of a menu showing keyboard accelerators for various menu items](images/keyboard-accelerators.png)<br/>
     * *Example of a menu showing keyboard accelerators for various menu items*
     * @remarks
     * As keyboard accelerators are not typically described directly in the UI of your UWP application, you can improve discoverability through [tooltips](../windows.ui.xaml.controls/tooltip.md), which display automatically when the user moves focus to, presses and holds, or hovers the mouse pointer over a control. The tooltip can identify whether a control has an associated keyboard accelerator and, if so, what the accelerator key combination is.
     * 
     * Windows 10, version 1703, introduced keyboard accelerator shortcuts. However, these shortcuts were not displayed with the UI of their corresponding controls.
     * 
     * Starting with Windows 10, version 1803, when KeyboardAccelerators are declared, controls present the corresponding key combinations by default in a tooltip (unless they are associated with [MenuFlyoutItem](/uwp/api/Windows.UI.Xaml.Controls.MenuFlyoutItem) and [ToggleMenuFlyoutItem](/uwp/api/windows.ui.xaml.controls.togglemenuflyoutitem) objects). Note that explicitly specifying a tooltip overrides this behavior.
     * 
     * For [MenuFlyoutItem](/uwp/api/windows.ui.xaml.controls.appbarbutton) and [ToggleMenuFlyoutItem](/uwp/api/windows.ui.xaml.controls.togglemenuflyoutitem) objects, the keyboard accelerator is displayed with the flyout text.
     * 
     * If a control has more than one accelerator defined, the first registered accelerator is presented.
     * 
     * Depending on the control, you can override the default key combination string associated with a keyboard accelerator using text override properties. See [MenuFlyoutItem.KeyboardAcceleratorTextOverride](../windows.ui.xaml.controls/menuflyoutitem_keyboardacceleratortextoverride.md), [AppBarButton.KeyboardAcceleratorTextOverride](../windows.ui.xaml.controls/appbarbutton_keyboardacceleratortextoverride.md), and [AppBarToggleButton.KeyboardAcceleratorTextOverride](../windows.ui.xaml.controls/appbartogglebutton_keyboardacceleratortextoverride.md).
     * 
     * An accelerator key can be a single key, such as F1 - F12 and Esc, or a combination of keys (Ctrl + Shift + B, or Ctrl C) that invoke a command. They differ from access keys (mnemonics), which are typically modified with the Alt key and simply activate a command or control.
     * 
     * An accelerator can be executed even if the element associated with the accelerator is not visible. For example, an item in the [CommandBar.SecondaryCommands](../windows.ui.xaml.controls/commandbar_secondarycommands.md) collection of the [CommandBar](../windows.ui.xaml.controls/commandbar.md) can be invoked using an accelerator without expanding the overflow menu and displaying the element.
     * 
     * By default, an accelerator has global scope. However, you can constrain scope using [KeyboardAccelerator.ScopeOwner](../windows.ui.xaml.input/keyboardaccelerator_scopeowner.md) or disable an accelerator completely using [KeyboardAccelerator.IsEnabled](../windows.ui.xaml.input/keyboardaccelerator_isenabled.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keyboardaccelerators
     * @type {IVector<KeyboardAccelerator>} 
     */
    KeyboardAccelerators {
        get => this.get_KeyboardAccelerators()
    }

    /**
     * Gets or sets a value that indicates the element targeted by the access key keytip.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * 
     * The [KeyTipPlacementMode](uielement_keytipplacementmode.md) property is used to specify the location of the access key keytip relative to the boundary of the targeted element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keytiptarget
     * @type {DependencyObject} 
     */
    KeyTipTarget {
        get => this.get_KeyTipTarget()
        set => this.put_KeyTipTarget(value)
    }

    /**
     * Gets or sets a value that indicates the control [tooltip](../windows.ui.xaml.controls/tooltip.md) that displays the accelerator key combination.
     * @remarks
     * <!-- 
     * Use the [KeyboardAcceleratorToolTipTarget](uielement_keyboardacceleratortooltiptarget.md) property to specify the control tooltip that displays the accelerator key combination. For example, a Pivot control can display the tooltip for a PivotItem with the Pivot header.  
     * -->
     * 
     * Use the [KeyboardAcceleratorPlacementMode](uielement_keyboardacceleratorplacementmode.md) property to specify whether the control tooltip displays the key combination for its associated keyboard accelerator.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keyboardacceleratorplacementtarget
     * @type {DependencyObject} 
     */
    KeyboardAcceleratorPlacementTarget {
        get => this.get_KeyboardAcceleratorPlacementTarget()
        set => this.put_KeyboardAcceleratorPlacementTarget(value)
    }

    /**
     * Gets or sets a value that indicates whether the control [tooltip](../windows.ui.xaml.controls/tooltip.md) displays the key combination for its associated keyboard accelerator.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.keyboardacceleratorplacementmode
     * @type {Integer} 
     */
    KeyboardAcceleratorPlacementMode {
        get => this.get_KeyboardAcceleratorPlacementMode()
        set => this.put_KeyboardAcceleratorPlacementMode(value)
    }

    /**
     * Gets or sets a value that indicates whether the [UIElement](uielement.md) can be a candidate for scroll anchoring.
     * @remarks
     * For more info, see the remarks for the [IScrollAnchorProvider](../windows.ui.xaml.controls/iscrollanchorprovider.md) interface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.canbescrollanchor
     * @type {Boolean} 
     */
    CanBeScrollAnchor {
        get => this.get_CanBeScrollAnchor()
        set => this.put_CanBeScrollAnchor(value)
    }

    /**
     * Gets or sets the ScalarTransition that animates changes to the Opacity property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.opacitytransition
     * @type {ScalarTransition} 
     */
    OpacityTransition {
        get => this.get_OpacityTransition()
        set => this.put_OpacityTransition(value)
    }

    /**
     * Gets or sets the x, y, and z rendering position of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.translation
     * @type {Vector3} 
     */
    Translation {
        get => this.get_Translation()
        set => this.put_Translation(value)
    }

    /**
     * Gets or sets the Vector3Transition that animates changes to the Translation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.translationtransition
     * @type {Vector3Transition} 
     */
    TranslationTransition {
        get => this.get_TranslationTransition()
        set => this.put_TranslationTransition(value)
    }

    /**
     * Gets or sets the angle of clockwise rotation, in degrees. Rotates relative to the RotationAxis and the CenterPoint. Affects the rendering position of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.rotation
     * @type {Float} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * Gets or sets the ScalarTransition that animates changes to the Rotation property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.rotationtransition
     * @type {ScalarTransition} 
     */
    RotationTransition {
        get => this.get_RotationTransition()
        set => this.put_RotationTransition(value)
    }

    /**
     * Gets or sets the scale of the element. Scales relative to the element's CenterPoint. Affects the rendering position of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.scale
     * @type {Vector3} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * Gets or sets the Vector3Transition that animates changes to the Scale property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.scaletransition
     * @type {Vector3Transition} 
     */
    ScaleTransition {
        get => this.get_ScaleTransition()
        set => this.put_ScaleTransition(value)
    }

    /**
     * Gets or sets the transformation matrix to apply to the element.
     * @remarks
     * This property is not compatible with [`ElementCompositionPreview.GetElementVisual`](/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.getelementvisual?view=winrt-19041#Windows_UI_Xaml_Hosting_ElementCompositionPreview_GetElementVisual_Windows_UI_Xaml_UIElement_). Attempting to use `TransformMatrix` after calling `GetElementVisual` will fail with the following error: 
     * > Access denied.  Calling TransformMatrix API is not allowed on this object at this time, as this object currently has the ElementCompositionPreview.GetElementVisual property in use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.transformmatrix
     * @type {Matrix4x4} 
     */
    TransformMatrix {
        get => this.get_TransformMatrix()
        set => this.put_TransformMatrix(value)
    }

    /**
     * Gets or sets the center point of the element, which is the point about which rotation or scaling occurs. Affects the rendering position of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.centerpoint
     * @type {Vector3} 
     */
    CenterPoint {
        get => this.get_CenterPoint()
        set => this.put_CenterPoint(value)
    }

    /**
     * Gets or sets the axis to rotate the element around.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.rotationaxis
     * @type {Vector3} 
     */
    RotationAxis {
        get => this.get_RotationAxis()
        set => this.put_RotationAxis(value)
    }

    /**
     * Gets the position of this UIElement, relative to its parent, computed during the arrange pass of the layout process.
     * @remarks
     * ActualOffset can be used as an input property to an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md).
     * 
     * The _z_ value of the offset is always 0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.actualoffset
     * @type {Vector3} 
     */
    ActualOffset {
        get => this.get_ActualOffset()
    }

    /**
     * Gets the size that this UIElement computed during the arrange pass of the layout process.
     * @remarks
     * The ActualSize property is equivalent to the [ActualWidth](frameworkelement_actualwidth.md) and [ActualHeight](frameworkelement_actualheight.md) properties, but represented as a Vector2. ActualSize can be used as an input property to an [ExpressionAnimation](../windows.ui.composition/expressionanimation.md).
     * 
     * When the ActualSize changes, the [FrameworkElement.SizeChanged](frameworkelement_sizechanged.md) event is raised. The value of [SizeChangedEventArgs.NewSize](sizechangedeventargs_newsize.md) will be the new value of the ActualSize.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.actualsize
     * @type {Vector2} 
     */
    ActualSize {
        get => this.get_ActualSize()
    }

    /**
     * Gets or sets the `XamlRoot` in which this element is being viewed.
     * @remarks
     * When a `UIElement` is first created, `XamlRoot` returns `null`. After it's parented to a live XAML object, it will return the same `XamlRoot` object as its parent. A common scenario for `XamlRoot` to be `null` is if you access the property from the constructor of your app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.xamlroot
     * @type {XamlRoot} 
     */
    XamlRoot {
        get => this.get_XamlRoot()
        set => this.put_XamlRoot(value)
    }

    /**
     * Gets the context identifier for the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.uicontext
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * Gets or sets the shadow effect cast by the element.
     * @remarks
     * > [!TIP]
     * > For more info, design guidance, and code examples, see [Z-depth and shadow](/windows/uwp/design/layout/depth-shadow).
     * 
     * Many common controls automatically cast shadows using a [ThemeShadow](../windows.ui.xaml.media/themeshadow.md). 
     * 
     * The UIElement.Shadow property can be used to cast shadows from additional visual elements or custom controls.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.shadow
     * @type {Shadow} 
     */
    Shadow {
        get => this.get_Shadow()
        set => this.put_Shadow(value)
    }

    /**
     * Occurs when a keyboard key is released while the [UIElement](uielement.md) has focus.
     * @remarks
     * Controls in your UI generate keyboard events only when they have input focus. By default, the first focusable element in the visual tree is given focus by the system. An individual control gains focus when the user clicks or taps directly on that control in the layout, or uses the Tab key to step into a tab sequence within the content area. You can also focus controls programmatically by calling [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md).
     * 
     * KeyUp is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * KeyUp uses [KeyRoutedEventArgs](../windows.ui.xaml.input/keyroutedeventargs.md) event data. The most relevant properties of [KeyRoutedEventArgs](../windows.ui.xaml.input/keyroutedeventargs.md) for most handler scenarios are [Key](../windows.ui.xaml.input/keyroutedeventargs_key.md) and possibly [KeyStatus](../windows.ui.xaml.input/keyroutedeventargs_keystatus.md). For more info on handling keyboard events, including example code for defining a [KeyEventHandler](../windows.ui.xaml.input/keyeventhandler.md) method, see [Keyboard interactions](/windows/uwp/input-and-devices/keyboard-interactions).
     * 
     * One scenario for handling keyboard events is to support access keys or accelerator keys for an app, or a region or control within an app. For more info about this scenario, see [Keyboard accessibility](/windows/uwp/accessibility/keyboard-accessibility).
     * 
     * Specific Windows Runtime controls may have class-based handling for the KeyUp input event. If so, the control probably has an override for the method [OnKeyUp](../windows.ui.xaml.controls/control_onkeyup_802918872.md). Typically these class handlers are intended to process a subset of key presses that enable a keyboard-based user interaction with that control, and often this interaction supports a keyboard accessibility feature. If a keyboard key event is handled by class-based handling, then the key event is considered to be already handled, and the KeyUp event is not raised for handling by any user code handlers on that control. Usually this is just for a few dedicated keys. For example, [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) has class handling so that the Space key and Enter key are handled as keyboard equivalents for invoking the [Button](../windows.ui.xaml.controls/button.md). That provides a built-in keyboard equivalent for tapping the button or clicking on it with a mouse, and enables the accessibility scenario of using the UI and the button using a keyboard only. But any other keys other than Space or Enter will still fire a [KeyDown](uielement_keydown.md) and KeyUp event for a [Button](../windows.ui.xaml.controls/button.md). For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * KeyUp supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/keyroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {KeyEventHandler}
    */
    OnKeyUp {
        get {
            if(!this.HasProp("__OnKeyUp")){
                this.__OnKeyUp := WinRTEventHandler(
                    KeyEventHandler,
                    KeyEventHandler.IID,
                    IInspectable,
                    KeyRoutedEventArgs
                )
                this.__OnKeyUpToken := this.add_KeyUp(this.__OnKeyUp.iface)
            }
            return this.__OnKeyUp
        }
    }

    /**
     * Occurs when a keyboard key is pressed while the [UIElement](uielement.md) has focus.
     * @remarks
     * Controls in your UI generate keyboard events only when they have input focus. By default, the first focusable element in the visual tree is given focus by the system. An individual control gains focus when the user clicks or taps directly on that control in the layout, or uses the Tab key to step into a tab sequence within the content area. You can also focus controls programmatically by calling [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md).
     * 
     * KeyDown is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * KeyDown uses [KeyRoutedEventArgs](../windows.ui.xaml.input/keyroutedeventargs.md) event data. The most relevant properties of [KeyRoutedEventArgs](../windows.ui.xaml.input/keyroutedeventargs.md) for most handler scenarios are [Key](../windows.ui.xaml.input/keyroutedeventargs_key.md) and possibly [KeyStatus](../windows.ui.xaml.input/keyroutedeventargs_keystatus.md). For more info on handling keyboard events, including example code for defining a [KeyEventHandler](../windows.ui.xaml.input/keyeventhandler.md) method, see [Keyboard interactions](/windows/uwp/input-and-devices/keyboard-interactions).
     * 
     * One scenario for handling keyboard events is to support access keys or accelerator keys for an app, or a region or control within an app. For more info about this scenario, see [Keyboard accessibility](/windows/uwp/accessibility/keyboard-accessibility).
     * 
     * Specific Windows Runtime controls may have class-based handling for the KeyDown input event. If so, the control probably has an override for the method [OnKeyDown](../windows.ui.xaml.controls/control_onkeydown_1048103922.md). Typically these class handlers are intended to process a subset of key presses that enable a keyboard-based user interaction with that control, and often this interaction supports a keyboard accessibility feature. If a key press is handled by class-based handling, then the key press is considered to be already handled, and the KeyDown event is not raised for handling by any user code handlers on that control for that key specifically. Usually this is just for a few dedicated keys. For example, [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) has class handling so that the Space key and Enter key are handled as keyboard equivalents for invoking the [Button](../windows.ui.xaml.controls/button.md). That provides a built-in keyboard equivalent for tapping the button or clicking on it with a mouse, and enables the accessibility scenario of using the UI and the button using a keyboard only. But any other keys other than Space or Enter will still fire a KeyDown and [KeyUp](uielement_keyup.md) event for a [Button](../windows.ui.xaml.controls/button.md). For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * KeyDown supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/keyroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {KeyEventHandler}
    */
    OnKeyDown {
        get {
            if(!this.HasProp("__OnKeyDown")){
                this.__OnKeyDown := WinRTEventHandler(
                    KeyEventHandler,
                    KeyEventHandler.IID,
                    IInspectable,
                    KeyRoutedEventArgs
                )
                this.__OnKeyDownToken := this.add_KeyDown(this.__OnKeyDown.iface)
            }
            return this.__OnKeyDown
        }
    }

    /**
     * Occurs when a [UIElement](uielement.md) receives focus. This event is raised asynchronously, so focus can move again before bubbling is complete.
     * @remarks
     * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of [FocusManager](../windows.ui.xaml.input/focusmanager.md) events whenever possible.
     * 
     * Only a single UI element at a time can have focus.
     * 
     * A control can get focus when another control loses focus, the application view changes, the user switches applications, or the user interacts with the system such that the application is no longer in the foreground.
     * 
     * [LostFocus](uielement_lostfocus.md) is raised before GotFocus.
     * 
     * If you are using control compositing or UI compositing and handling GotFocus on a container such as a [Panel](../windows.ui.xaml.controls/panel.md) or [GridView](../windows.ui.xaml.controls/gridview.md), then you might want to check the [OriginalSource](routedeventargs_originalsource.md) on the event data to determine which element in the composition actually received the focus.
     * 
     * GotFocus doesn't have any specialized event data. Where you handle GotFocus, you might want to determine whether it was the user or app code that caused an element to gain focus. To determine this in your handler, cast the *sender* of the event to be a [Control](../windows.ui.xaml.controls/control.md) object, and check the [FocusState](../windows.ui.xaml.controls/control_focusstate.md).
     * 
     * Keyboard focus is particularly relevant for keyboard event handling, because only the currently keyboard-focused [UIElement](uielement.md) can be the source of the [KeyUp](uielement_keyup.md) and [KeyDown](uielement_keydown.md) key events. Applications might call [Focus](../windows.ui.xaml.controls/control_focus_195503898.md) as an initialization action so that the key events in the app as a whole can be used to detect access or accelerator keys. For more info, see [Keyboard interactions](/windows/uwp/input-and-devices/keyboard-interactions).
     * 
     * GotFocus is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Specific Windows Runtime controls may have class-based handling for the GotFocus event. If so, the control probably has an override for the method [OnGotFocus](../windows.ui.xaml.controls/control_ongotfocus_1398920478.md). Typically the event is marked handled by the class handler, and the GotFocus event is not raised for handling by any user code handlers on that control. Controls might handle the event in order to load a visual state property that displays a focus rectangle.
     * 
     * A control's focus rectangle is an important visual component that aids accessibility by identifying the current focused element and indicating where the user is within the tab sequence of the application UI. In some cases, the [FocusState](focusstate.md) of the focus action is relevant for whether a visible focus indicator should display.
     * 
     * For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview). For more info on tab sequences and accessibility, see [Keyboard accessibility](/windows/uwp/accessibility/keyboard-accessibility).
     * @type {RoutedEventHandler}
    */
    OnGotFocus {
        get {
            if(!this.HasProp("__OnGotFocus")){
                this.__OnGotFocus := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnGotFocusToken := this.add_GotFocus(this.__OnGotFocus.iface)
            }
            return this.__OnGotFocus
        }
    }

    /**
     * Occurs when a [UIElement](uielement.md) loses focus. This event is raised asynchronously, so focus can move again before bubbling is complete.
     * @remarks
     * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of [FocusManager](../windows.ui.xaml.input/focusmanager.md) events whenever possible.
     * 
     * Only a single UI element at a time can have focus.
     * 
     * A control can lose focus when another control gets focus, the application view changes, the user switches applications, or the user interacts with the system such that the application is no longer in the foreground.
     * 
     * LostFocus is raised before [GotFocus](uielement_gotfocus.md).
     * 
     * Keyboard focus is particularly relevant for keyboard event handling, because only the currently keyboard-focused [UIElement](uielement.md) can be the source of the [KeyUp](uielement_keyup.md) and [KeyDown](uielement_keydown.md) key events. Applications might call [Focus](../windows.ui.xaml.controls/control_focus_195503898.md) as an initialization action so that the key events in the app as a whole can be used to detect access or accelerator keys. For more info, see [Keyboard interactions](/windows/uwp/input-and-devices/keyboard-interactions).
     * 
     * LostFocus is a routed event. For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Specific Windows Runtime controls may have class-based handling for the LostFocus event. If so, the control probably has an override for the method [OnLostFocus](../windows.ui.xaml.controls/control_onlostfocus_679101471.md). Typically the event is marked handled by the class handler, and the LostFocus event is not raised for handling by any user code handlers on that control. Controls might handle the event in order to unload a visual state that displayed a focus rectangle in response to [OnGotFocus](../windows.ui.xaml.controls/control_ongotfocus_1398920478.md).
     * 
     * A control's focus rectangle is an important visual component that aids accessibility by identifying the current focused element and indicating where the user is within the tab sequence of the application UI. In some cases, the [FocusState](focusstate.md) of the focus action is relevant for whether a visible focus indicator should display.
     * 
     * For more info on tab sequences and accessibility, see [Keyboard accessibility](/windows/uwp/accessibility/keyboard-accessibility).
     * @type {RoutedEventHandler}
    */
    OnLostFocus {
        get {
            if(!this.HasProp("__OnLostFocus")){
                this.__OnLostFocus := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnLostFocusToken := this.add_LostFocus(this.__OnLostFocus.iface)
            }
            return this.__OnLostFocus
        }
    }

    /**
     * Occurs when the input system reports an underlying drag event with this element as the target.
     * @remarks
     * For a DragEnter event to occur, the value of [AllowDrop](uielement_allowdrop.md) on the current [UIElement](uielement.md) and on the event source must be **true**. Otherwise, consider using [PointerEntered](uielement_pointerentered.md).
     * 
     * You can initiate a drag-drop action on any [UIElement](uielement.md) by calling the [StartDragAsync](uielement_startdragasync_369751260.md) method. Once the action is initiated, any [UIElement](uielement.md) in the app can potentially be a drop target so long as [AllowDrop](uielement_allowdrop.md) is **true** on that element. Any elements that the drag-drop action passes over can handle DragEnter, [DragLeave](uielement_dragleave.md) or [DragOver](uielement_dragover.md).
     * 
     * DragEnter is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions, drag-drop actions, and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility, for example [IsEnabled](../windows.ui.xaml.controls/control_isenabled.md). For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * DragEnter supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](drageventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the DragEnter event. If so, the control probably has an override for the method [OnDragEnter](../windows.ui.xaml.controls/control_ondragenter_196818472.md). Typically the event is marked handled by the class handler, and the DragEnter event is not raised for handling by any user code handlers on that control. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Independent of the event occurrence, some controls may use theme animations such as [DragItemThemeAnimation](../windows.ui.xaml.media.animation/dragitemthemeanimation.md) to visually indicate a drag behavior to the user.
     * 
     * > **Windows 8/Windows 8.1**
     * > Prior to Windows 10, the Windows Runtime implementation of drag-drop concepts permits only certain controls and input actions to initiate a drag-drop action. There is no [StartDragAsync](uielement_startdragasync_369751260.md) or generalized **DoDragDrop** method that would permit any UI element to initiate a drag-drop action. The main source of a drag-drop action in an app is when you drag the items of a list such as [GridView](../windows.ui.xaml.controls/gridview.md).
     * @type {DragEventHandler}
    */
    OnDragEnter {
        get {
            if(!this.HasProp("__OnDragEnter")){
                this.__OnDragEnter := WinRTEventHandler(
                    DragEventHandler,
                    DragEventHandler.IID,
                    IInspectable,
                    DragEventArgs
                )
                this.__OnDragEnterToken := this.add_DragEnter(this.__OnDragEnter.iface)
            }
            return this.__OnDragEnter
        }
    }

    /**
     * Occurs when the input system reports an underlying drag event with this element as the origin.
     * @remarks
     * For DragLeave to occur, the value of [AllowDrop](uielement_allowdrop.md) on the current [UIElement](uielement.md) and on the event source must be **true**. Otherwise, consider using [PointerExited](uielement_pointerexited.md).
     * 
     * You can initiate a drag-drop action on any [UIElement](uielement.md) by calling the [StartDragAsync](uielement_startdragasync_369751260.md) method. Once the action is initiated, any [UIElement](uielement.md) in the app can potentially be a drop target so long as [AllowDrop](uielement_allowdrop.md) is **true** on that element. Any elements that the drag-drop action passes over can handle [DragEnter](uielement_dragenter.md), DragLeave or [DragOver](uielement_dragover.md).
     * 
     * DragLeave is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions, drag-drop actions, and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility, for example [IsEnabled](../windows.ui.xaml.controls/control_isenabled.md). For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * DragLeave supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](drageventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the DragLeave event. If so, the control probably has an override for the method [OnDragLeave](../windows.ui.xaml.controls/control_ondragleave_545548419.md). Typically the event is marked handled by the class handler, and the DragLeave event is not raised for handling by any user code handlers on that control. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Independent of the event occurrence, some controls may use theme animations such as [DragItemThemeAnimation](../windows.ui.xaml.media.animation/dragitemthemeanimation.md) to visually indicate a drag behavior to the user.
     * 
     * > **Windows 8/Windows 8.1**
     * > Prior to Windows 10, the Windows Runtime implementation of drag-drop concepts permits only certain controls and input actions to initiate a drag-drop action. There is no [StartDragAsync](uielement_startdragasync_369751260.md) or generalized **DoDragDrop** method that would permit any UI element to initiate a drag-drop action. The main source of a drag-drop action in an app is when you drag the items of a list such as [GridView](../windows.ui.xaml.controls/gridview.md).
     * @type {DragEventHandler}
    */
    OnDragLeave {
        get {
            if(!this.HasProp("__OnDragLeave")){
                this.__OnDragLeave := WinRTEventHandler(
                    DragEventHandler,
                    DragEventHandler.IID,
                    IInspectable,
                    DragEventArgs
                )
                this.__OnDragLeaveToken := this.add_DragLeave(this.__OnDragLeave.iface)
            }
            return this.__OnDragLeave
        }
    }

    /**
     * Occurs when the input system reports an underlying drag event with this element as the potential drop target.
     * @remarks
     * For DragOver to occur, the value of [AllowDrop](uielement_allowdrop.md) on the current [UIElement](uielement.md) and on the event source must be **true**. Otherwise, consider using [PointerMoved](uielement_pointermoved.md).
     * 
     * You can initiate a drag-drop action on any [UIElement](uielement.md) by calling the [StartDragAsync](uielement_startdragasync_369751260.md) method. Once the action is initiated, any [UIElement](uielement.md) in the app can potentially be a drop target so long as [AllowDrop](uielement_allowdrop.md) is **true** on that element. Any elements that the drag-drop action passes over can handle [DragEnter](uielement_dragenter.md), [DragLeave](uielement_dragleave.md) or DragOver.
     * 
     * DragOver is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions, drag-drop actions, and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility, for example [IsEnabled](../windows.ui.xaml.controls/control_isenabled.md). For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * DragOver supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](drageventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the DragOver event. If so, the control probably has an override for the method [OnDragOver](../windows.ui.xaml.controls/control_ondragover_783114431.md). Typically the event is marked handled by the class handler, and the DragOver event is not raised for handling by any user code handlers on that control. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Independent of the event occurrence, some controls may use theme animations such as [DragItemThemeAnimation](../windows.ui.xaml.media.animation/dragitemthemeanimation.md) to visually indicate a drag behavior to the user.
     * 
     * > **Windows 8/Windows 8.1**
     * > Prior to Windows 10, the Windows Runtime implementation of drag-drop concepts permits only certain controls and input actions to initiate a drag-drop action. There is no [StartDragAsync](uielement_startdragasync_369751260.md) or generalized **DoDragDrop** method that would permit any UI element to initiate a drag-drop action. The main source of a drag-drop action in an app is when you drag the items of a list such as [GridView](../windows.ui.xaml.controls/gridview.md).
     * @type {DragEventHandler}
    */
    OnDragOver {
        get {
            if(!this.HasProp("__OnDragOver")){
                this.__OnDragOver := WinRTEventHandler(
                    DragEventHandler,
                    DragEventHandler.IID,
                    IInspectable,
                    DragEventArgs
                )
                this.__OnDragOverToken := this.add_DragOver(this.__OnDragOver.iface)
            }
            return this.__OnDragOver
        }
    }

    /**
     * Occurs when the input system reports an underlying drop event with this element as the drop target.
     * @remarks
     * For Drop to occur and to invoke a handler, the value of [AllowDrop](uielement_allowdrop.md) on the [UIElement](uielement.md) that is the drop target and also on the drag-drop action source must be **true**.
     * 
     * A typical handler will check the [Data](drageventargs_data.md) value from the [DragEventArgs](drageventargs.md) event data.
     * 
     * You can initiate a drag-drop action on any [UIElement](uielement.md) by calling the [StartDragAsync](uielement_startdragasync_369751260.md) method. Once the action is initiated, any [UIElement](uielement.md) in the app can potentially be a drop target so long as [AllowDrop](uielement_allowdrop.md) is **true** on that element, and any elements that the drag-drop action passes over can handle [DragEnter](uielement_dragenter.md), [DragLeave](uielement_dragleave.md) or [DragOver](uielement_dragover.md).
     * 
     * Drop is a routed event. An element must have [AllowDrop](uielement_allowdrop.md) be **true** to be a Drop event source. If the event is permitted to bubble up to parent elements because it goes unhandled, then it is possible to handle the event on a parent element if [AllowDrop](uielement_allowdrop.md) is **true** on the parent element. Intermediate elements in the route that aren't either the handler object or the drop target don't need [AllowDrop](uielement_allowdrop.md) to be **true**. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions, drag-drop actions, and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility, for example [IsEnabled](../windows.ui.xaml.controls/control_isenabled.md). For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Drop supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](drageventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the Drop event. If so, the control's logic probably has an override for the method [OnDrop](../windows.ui.xaml.controls/control_ondrop_1015747496.md). Typically the event is marked handled by the class handler, and the Drop event is not raised for handling by any user code handlers on that control. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Independent of the event occurrence, some controls may use theme animations such as [DragItemThemeAnimation](../windows.ui.xaml.media.animation/dragitemthemeanimation.md) to visually indicate a drag behavior to the user.
     * 
     * > **Windows 8/Windows 8.1**
     * > Prior to Windows 10, the Windows Runtime implementation of drag-drop concepts permits only certain controls and input actions to initiate a drag-drop action. There is no [StartDragAsync](uielement_startdragasync_369751260.md) or generalized **DoDragDrop** method that would permit any UI element to initiate a drag-drop action. The main source of a drag-drop action in an app is when you drag the items of a list such as [GridView](../windows.ui.xaml.controls/gridview.md).
     * @type {DragEventHandler}
    */
    OnDrop {
        get {
            if(!this.HasProp("__OnDrop")){
                this.__OnDrop := WinRTEventHandler(
                    DragEventHandler,
                    DragEventHandler.IID,
                    IInspectable,
                    DragEventArgs
                )
                this.__OnDropToken := this.add_Drop(this.__OnDrop.iface)
            }
            return this.__OnDrop
        }
    }

    /**
     * Occurs when the pointer device initiates a **Press** action within this element.
     * @remarks
     * Touch, mouse, and pen/stylus interactions are received, processed, and managed as pointer input in UWP app. Any of these interactions can produce a PointerPressed event. For more info, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input). Pointer events are intended for scenarios where you're interested in multiple pointers and their relationships, or when you are examining specifics of each pointer such as exact coordinate position. Otherwise, you might consider handling gesture events such as [Tapped](uielement_tapped.md).
     * 
     * Use a handler based on [PointerEventHandler](../windows.ui.xaml.input/pointereventhandler.md) to handle this event.
     * 
     * Mouse input is associated with a single pointer assigned when mouse input is first detected. Clicking a mouse button (left, wheel, or right) creates a secondary association between the pointer and that button through the PointerPressed event. The [PointerReleased](uielement_pointerreleased.md) event is fired only when that same mouse button is released (no other button can be associated with the pointer until this event is complete). Because of this exclusive association, other mouse button clicks are routed through the [PointerMoved](uielement_pointermoved.md) event. You can test the mouse button state when handling this event, as shown in the following example.
     * 
     * [!code-csharp[PointerMoved](../windows.ui.input.inking/code/PointerInput/csharp/MainPage.xaml.cs#SnippetPointerMoved)]
     * 
     * [!code-csharp[PointerMoved](../windows.ui.input.inking/code/PointerInput_UWP/csharp/MainPage.xaml.cs#SnippetPointerMoved)]
     * 
     * Pointer events from a mouse input device generally have the same [PointerId](../windows.ui.input/pointerpoint_pointerid.md) in the event details for the lifetime of the app.
     * 
     * PointerPressed is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * PointerPressed supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/pointerroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the PointerPressed input event. If so, the control probably has an override for the method [OnPointerPressed](../windows.ui.xaml.controls/control_onpointerpressed_1718956371.md). Typically the event is marked handled by the class handler, and the PointerPressed event is not raised for handling by any user code handlers on that control. For example, [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) has class handling that handles PointerPressed and instead fires [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md). For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Controls may also have a [PointerDownThemeAnimation](../windows.ui.xaml.media.animation/pointerdownthemeanimation.md) personality animation that run independently of the event.
     * @type {PointerEventHandler}
    */
    OnPointerPressed {
        get {
            if(!this.HasProp("__OnPointerPressed")){
                this.__OnPointerPressed := WinRTEventHandler(
                    PointerEventHandler,
                    PointerEventHandler.IID,
                    IInspectable,
                    PointerRoutedEventArgs
                )
                this.__OnPointerPressedToken := this.add_PointerPressed(this.__OnPointerPressed.iface)
            }
            return this.__OnPointerPressed
        }
    }

    /**
     * Occurs when a pointer moves while the pointer remains within the hit test area of this element.
     * @remarks
     * Touch, mouse, and pen/stylus interactions are received, processed, and managed as pointer input in UWP app. Any of these interactions can produce a PointerMoved event. For more info, see [Handle pointer input](/windows/uwp/input-and-devices/handle-pointer-input) and the "PointerMoved for mouse and stylus input" section of this topic.
     * 
     * In some UI scenarios, particularly if the user is using a mouse, this event will fire a lot. Be aware of the performance profile for code you put into this handler, and consider ways to use your own flags or tolerances that can throttle how many times the logic actually needs to run.
     * 
     * This event is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * This event also supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked **Handled**. See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {PointerEventHandler}
    */
    OnPointerMoved {
        get {
            if(!this.HasProp("__OnPointerMoved")){
                this.__OnPointerMoved := WinRTEventHandler(
                    PointerEventHandler,
                    PointerEventHandler.IID,
                    IInspectable,
                    PointerRoutedEventArgs
                )
                this.__OnPointerMovedToken := this.add_PointerMoved(this.__OnPointerMoved.iface)
            }
            return this.__OnPointerMoved
        }
    }

    /**
     * Occurs when the pointer device that previously initiated a **Press** action is released, while within this element. Note that the end of a **Press** action is not guaranteed to fire a PointerReleased event; other events may fire instead. For more info, see Remarks.
     * @remarks
     * Touch, mouse, and pen/stylus interactions are received, processed, and managed as pointer input in UWP app. Any of these interactions can produce a PointerReleased event. For more info, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input).
     * 
     * Other events instead of PointerReleased may fire at the end of the action— for example, [PointerCanceled](uielement_pointercanceled.md) or [PointerCaptureLost](uielement_pointercapturelost.md). Don't rely on [PointerPressed](uielement_pointerpressed.md) and PointerReleased events always occurring in pairs. To function properly, your app must listen for and handle all events that represent likely conclusions to the **Press** action. Some of the reasons why you might not get a PointerReleased occurrence are:
     * 
     * + Differences in how specific hardware handles touch actions and **Press** actions
     * + A programmatic pointer capture from a different pointer
     * + User actions that change the relationship of the display area, such as changing resolution or monitor settings
     * + Input interactions such as a stylus touching the same surface as a previous touch action
     * 
     * The user action that fires a PointerReleased event initially can result in the [Tapped](uielement_tapped.md) event, or can also result in [RightTapped](uielement_righttapped.md) under conditions that vary per device. For more info, see [Tapped](uielement_tapped.md) and [RightTapped](uielement_righttapped.md).
     * 
     * Mouse input is associated with a single pointer assigned when mouse input is first detected. Clicking a mouse button (left, wheel, or right) creates a secondary association between the pointer and that button through the [PointerPressed](uielement_pointerpressed.md) event. The PointerReleased event is fired only when that same mouse button is released (no other button can be associated with the pointer until this event is complete). Because of this exclusive association, other mouse button clicks are routed through the [PointerMoved](uielement_pointermoved.md) event. You can test the mouse button state when handling this event, as shown in the following example.
     * 
     * [!code-csharp[PointerMoved](../windows.ui.input.inking/code/PointerInput/csharp/MainPage.xaml.cs#SnippetPointerMoved)]
     * 
     * [!code-csharp[PointerMoved](../windows.ui.input.inking/code/PointerInput_UWP/csharp/MainPage.xaml.cs#SnippetPointerMoved)]
     * 
     * PointerReleased is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * PointerReleased supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/pointerroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the PointerReleased input event. If so, the control probably has an override for the method [OnPointerReleased](../windows.ui.xaml.controls/control_onpointerreleased_2120631493.md). Typically the event is marked handled by the class handler, and the PointerReleased event is not raised for handling by any user code handlers on that control. For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Controls may also have a [PointerUpThemeAnimation](../windows.ui.xaml.media.animation/pointerupthemeanimation.md) personality animation that run independently of the event.
     * @type {PointerEventHandler}
    */
    OnPointerReleased {
        get {
            if(!this.HasProp("__OnPointerReleased")){
                this.__OnPointerReleased := WinRTEventHandler(
                    PointerEventHandler,
                    PointerEventHandler.IID,
                    IInspectable,
                    PointerRoutedEventArgs
                )
                this.__OnPointerReleasedToken := this.add_PointerReleased(this.__OnPointerReleased.iface)
            }
            return this.__OnPointerReleased
        }
    }

    /**
     * Occurs when a pointer enters the hit test area of this element.
     * @remarks
     * The PointerEntered event fires in response to a pointer moving into the element's bounding area. Touch, mouse, and pen/stylus interactions are received, processed, and managed as pointer input in UWP app. Any of these devices and their interactions can produce a PointerEntered event. For more info, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input) and also the other remarks in this topic.
     * 
     * PointerEntered is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Use a handler based on [PointerEventHandler](../windows.ui.xaml.input/pointereventhandler.md) to handle this event.
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * PointerEntered supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/pointerroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the PointerEntered input event. If so, the control probably has an override for the method [OnPointerEntered](../windows.ui.xaml.controls/control_onpointerentered_760744783.md). Typically the event is not marked handled by the class handler, so the PointerEntered event can still be handled by your user code for the control in your UI. For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {PointerEventHandler}
    */
    OnPointerEntered {
        get {
            if(!this.HasProp("__OnPointerEntered")){
                this.__OnPointerEntered := WinRTEventHandler(
                    PointerEventHandler,
                    PointerEventHandler.IID,
                    IInspectable,
                    PointerRoutedEventArgs
                )
                this.__OnPointerEnteredToken := this.add_PointerEntered(this.__OnPointerEntered.iface)
            }
            return this.__OnPointerEntered
        }
    }

    /**
     * Occurs when a pointer leaves the hit test area of this element.
     * @remarks
     * The PointerExited event fires in response to a pointer that was initially in the element's bounding area leaving that bounding area. Touch, mouse, and pen/stylus interactions are received, processed, and managed as pointer input in UWP app. Any of these devices and their interactions can produce a PointerExited event. For more info, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input) and the other remarks in this topic.
     * 
     * Use a handler based on [PointerEventHandler](../windows.ui.xaml.input/pointereventhandler.md) to handle this event.
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * PointerExited supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/pointerroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the PointerExited input event. If so, the control probably has an override for the method [OnPointerExited](../windows.ui.xaml.controls/control_onpointerexited_795974211.md). Typically the event is not marked handled by the class handler, so the PointerExited event can still be handled by your user code for the control in your UI. For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * If another element has captured the pointer, PointerExited won't fire even if the captured pointer leaves an element's bounds. For more info on pointer capture, see [CapturePointer](uielement_capturepointer_916768934.md) or [Mouse interactions](/windows/uwp/input-and-devices/mouse-interactions).
     * @type {PointerEventHandler}
    */
    OnPointerExited {
        get {
            if(!this.HasProp("__OnPointerExited")){
                this.__OnPointerExited := WinRTEventHandler(
                    PointerEventHandler,
                    PointerEventHandler.IID,
                    IInspectable,
                    PointerRoutedEventArgs
                )
                this.__OnPointerExitedToken := this.add_PointerExited(this.__OnPointerExited.iface)
            }
            return this.__OnPointerExited
        }
    }

    /**
     * Occurs when pointer capture previously held by this element moves to another element or elsewhere.
     * @remarks
     * > > [!IMPORTANT]
     * > PointerCaptureLost might fire instead of [PointerReleased](uielement_pointerreleased.md). Don't rely on [PointerPressed](uielement_pointerpressed.md) and [PointerReleased](uielement_pointerreleased.md) events always occurring in pairs. To function properly, your app must listen for and handle all events that represent likely conclusions to the **Press** action, and that includes PointerCaptureLost. A pointer can lose capture either because of user interactions or because you programmatically captured another pointer or released the current pointer capture deliberately.
     * 
     * There is no event that fires when a pointer is successfully captured. To capture a pointer, you call the [CapturePointer](uielement_capturepointer_916768934.md) method, and this is usually done within the context of an event handler for other pointer events. For more info on how to capture a pointer and why you might want to do so, see [CapturePointer](uielement_capturepointer_916768934.md) or [Mouse interactions](/windows/uwp/input-and-devices/mouse-interactions).
     * 
     * PointerCaptureLost is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * PointerCaptureLost supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked **Handled**. See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {PointerEventHandler}
    */
    OnPointerCaptureLost {
        get {
            if(!this.HasProp("__OnPointerCaptureLost")){
                this.__OnPointerCaptureLost := WinRTEventHandler(
                    PointerEventHandler,
                    PointerEventHandler.IID,
                    IInspectable,
                    PointerRoutedEventArgs
                )
                this.__OnPointerCaptureLostToken := this.add_PointerCaptureLost(this.__OnPointerCaptureLost.iface)
            }
            return this.__OnPointerCaptureLost
        }
    }

    /**
     * Occurs when a pointer that made contact abnormally loses contact.
     * @remarks
     * Some of the reasons why you might get a PointerCanceled occurrence are:
     * 
     * + User actions that change the relationship of the display area, such as changing resolution or monitor settings
     * + Input interactions such as a stylus touching the same surface as a previous touch action
     * + The user logs off or similar interruptions that aren't app-specific
     * + The number of simultaneous contacts exceeded the number supported by the device
     * 
     * > > [!IMPORTANT]
     * > PointerCanceled might fire instead of [PointerReleased](uielement_pointerreleased.md). Don't rely on [PointerPressed](uielement_pointerpressed.md) and [PointerReleased](uielement_pointerreleased.md) events always occurring in pairs. To function properly, your app must listen for and handle all events that represent the possible conclusions to a **Press** action, and that includes PointerCanceled.
     * 
     * If PointerCanceled fires, any pointer captures by that pointer are released. For more info on pointer capture, see [CapturePointer](uielement_capturepointer_916768934.md).
     * 
     * When handling a PointerCanceled event, anticipate that some of the event data normally available for a pointer event won't be meaningful in the [PointerRoutedEventArgs](../windows.ui.xaml.input/pointerroutedeventargs.md) object you get through your handler. For example, the [Position](../windows.ui.input/pointerpoint_position.md) of the pointer is invalid because the pointer no longer exists.
     * 
     * PointerCanceled is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * PointerCanceled supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/pointerroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {PointerEventHandler}
    */
    OnPointerCanceled {
        get {
            if(!this.HasProp("__OnPointerCanceled")){
                this.__OnPointerCanceled := WinRTEventHandler(
                    PointerEventHandler,
                    PointerEventHandler.IID,
                    IInspectable,
                    PointerRoutedEventArgs
                )
                this.__OnPointerCanceledToken := this.add_PointerCanceled(this.__OnPointerCanceled.iface)
            }
            return this.__OnPointerCanceled
        }
    }

    /**
     * Occurs when the delta value of a pointer wheel changes.
     * @remarks
     * When you handle PointerWheelChanged, you are usually interested in the [MouseWheelDelta](../windows.ui.input/pointerpointproperties_mousewheeldelta.md) property value:
     * 
     * 1. Call [GetCurrentPoint](../windows.ui.xaml.input/pointerroutedeventargs_getcurrentpoint_1761708789.md) from the [PointerRoutedEventArgs](../windows.ui.xaml.input/pointerroutedeventargs.md) available to your handler. This returns a [PointerPoint](../windows.ui.input/pointerpoint.md).
     * 1. Get the [Properties](../windows.ui.input/pointerpoint_properties.md) of the [PointerPoint](../windows.ui.input/pointerpoint.md). It contains a [PointerPointProperties](../windows.ui.input/pointerpointproperties.md) object.
     * 1. Get the [MouseWheelDelta](../windows.ui.input/pointerpointproperties_mousewheeldelta.md) property value from the [PointerPointProperties](../windows.ui.input/pointerpointproperties.md) object. A positive value indicates that the wheel was rotated forward (away from the user) or tilted to the right; a negative value indicates that the wheel was rotated backward (toward the user) or tilted to the left.
     * 
     * If the element where pointer events occur has a non-default [ManipulationMode](uielement_manipulationmode.md) value, then the action might also result in various manipulation events like [ManipulationStarted](uielement_manipulationstarted.md). In addition, mouse wheel input can be handled as a built-in manipulation behavior by controls, even with no [ManipulationMode](uielement_manipulationmode.md) value set. For example, certain controls like [GridView](../windows.ui.xaml.controls/gridview.md) and [ListView](../windows.ui.xaml.controls/listview.md) can process mouse wheel input to initiate a scroll/pan action.
     * 
     * PointerWheelChanged is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * PointerWheelChanged supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/pointerroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the PointerWheelChanged input event. If so, the control probably has an override for the method [OnPointerWheelChanged](../windows.ui.xaml.controls/control_onpointerwheelchanged_1180757497.md). Typically the event is marked handled by the class handler, and the PointerWheelChanged event is not raised for handling by any user code handlers on that control. A control might do this in order to support traversal of its child elements by using a pointer wheel action. For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {PointerEventHandler}
    */
    OnPointerWheelChanged {
        get {
            if(!this.HasProp("__OnPointerWheelChanged")){
                this.__OnPointerWheelChanged := WinRTEventHandler(
                    PointerEventHandler,
                    PointerEventHandler.IID,
                    IInspectable,
                    PointerRoutedEventArgs
                )
                this.__OnPointerWheelChangedToken := this.add_PointerWheelChanged(this.__OnPointerWheelChanged.iface)
            }
            return this.__OnPointerWheelChanged
        }
    }

    /**
     * Occurs when an otherwise unhandled **Tap** interaction occurs over the hit test area of this element.
     * @remarks
     * Touch, mouse devices and pen devices can all produce a **Tap** action. For more info, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input).
     * 
     * See [Touch interaction design](/windows/uwp/design/input/touch-interactions) for more info on how to use a **Tap** interaction in your app design. The general idea is that a **Tap** interaction on an element invokes the element's primary action in your app.
     * 
     * A Tapped event represents a gesture, whereas a [PointerPressed](uielement_pointerpressed.md) event is a lower-level input event. Tapped and [PointerPressed](uielement_pointerpressed.md) events can be raised as the result of a single user interaction. If the event source has a nondefault [ManipulationMode](uielement_manipulationmode.md), [ManipulationStarting](uielement_manipulationstarting.md) can be raised too. Even if a control is already handling [PointerPressed](uielement_pointerpressed.md) in the control logic, or is handling manipulations, that doesn't prevent Tapped from being raised.
     * 
     * A Tapped event is potentially the result of more than one pointer point. For the higher-level gesture events such as Tapped you no longer have immediate access to [PointerPoint](../windows.ui.input/pointerpoint.md) details such as individual [PointerId](../windows.ui.input/pointerpoint_pointerid.md) values or individual coordinates. You do have access to device type ([PointerDeviceType](../windows.ui.xaml.input/tappedroutedeventargs_pointerdevicetype.md)) and for coordinates you can call [GetPosition](../windows.ui.xaml.input/tappedroutedeventargs_getposition_1813281865.md), which gives an average of the coordinates for a **Tap** from more than one pointer point.
     * 
     * Tapped is a routed event. Also, an element must have [IsTapEnabled](uielement_istapenabled.md) be **true** to be a Tapped event source (**true** is the default). It is possible to handle Tapped on parent elements even if [IsTapEnabled](uielement_istapenabled.md) is **false** on the parent element, if the event bubbles to a parent from an event source child element where [IsTapEnabled](uielement_istapenabled.md) is **false**. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Tapped supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked **Handled**. See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may also have class-based handling for the Tapped event. If so, the control probably has an override for the method [OnTapped](../windows.ui.xaml.controls/control_ontapped_449778764.md). For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Tapped and [Holding](uielement_holding.md) are mutually exclusive. The input system must wait until the pointer point is released in order to determine whether the action should be Tapped, [Holding](uielement_holding.md) or some other gesture, so you don't get Tapped at the very instant that a user touches the screen. If you really need instant feedback you may want to use [PointerPressed](uielement_pointerpressed.md) instead.
     * 
     * If a user interaction also raises [DoubleTapped](uielement_doubletapped.md), Tapped will be raised first to represent the first tap, but the second tap won't raise an additional Tapped. If you want different logic for Tapped versus [DoubleTapped](uielement_doubletapped.md), your Tapped handler may need to use app-specific variables and a timer in order to avoid running on interactions that are eventually interpreted as a **DoubleTap** action.
     * @type {TappedEventHandler}
    */
    OnTapped {
        get {
            if(!this.HasProp("__OnTapped")){
                this.__OnTapped := WinRTEventHandler(
                    TappedEventHandler,
                    TappedEventHandler.IID,
                    IInspectable,
                    TappedRoutedEventArgs
                )
                this.__OnTappedToken := this.add_Tapped(this.__OnTapped.iface)
            }
            return this.__OnTapped
        }
    }

    /**
     * Occurs when an otherwise unhandled **DoubleTap** interaction occurs over the hit test area of this element.
     * @remarks
     * A **DoubleTap** interaction is simply two **Tap** interactions that occur in quick succession. The exact timing of what the system interprets as a double tap is adjustable by users through system settings.
     * 
     * See [Touch interaction design](https://msdn.microsoft.com/library/9ba7f613-e5d1-40d4-920b-143094209e3a) for more info on how to use a **DoubleTap** interaction in your app design.
     * 
     * If a user interaction also fires DoubleTapped, [Tapped](uielement_tapped.md) will fire first to represent the first tap, but the second tap won't fire an additional Tapped. If you want different logic for [Tapped](uielement_tapped.md) versus DoubleTapped, your [Tapped](uielement_tapped.md) handler may need to use app-specific variables and a timer in order to avoid running on interactions that are eventually interpreted as a **DoubleTap** action.
     * 
     * A DoubleTapped event represents a gesture, whereas a [PointerPressed](uielement_pointerpressed.md) event is a lower-level input event. DoubleTapped and [PointerPressed](uielement_pointerpressed.md) events can fire as the result of a single user interaction. Even if a control is already handling pointer events in the control logic, or is handling manipulations, that doesn't prevent DoubleTapped from firing.
     * 
     * A DoubleTapped event is potentially the result of more than one pointer point. For the higher-level gesture events like DoubleTapped you no longer have immediate access to [PointerPoint](../windows.ui.input/pointerpoint.md) details such as individual [PointerId](../windows.ui.input/pointerpoint_pointerid.md) values or individual coordinates. You do have access to device type ([PointerDeviceType](../windows.ui.xaml.input/doubletappedroutedeventargs_pointerdevicetype.md)) and for coordinates you can call [GetPosition](../windows.ui.xaml.input/doubletappedroutedeventargs_getposition_1813281865.md), which gives an average of the coordinates for a **DoubleTap** from more than one pointer point.
     * 
     * DoubleTapped is a routed event. Also, an element must have [IsDoubleTapEnabled](uielement_isdoubletapenabled.md) be **true** to be a DoubleTapped event source (**true** is the default). It is possible to handle DoubleTapped on parent elements even if [IsDoubleTapEnabled](uielement_isdoubletapenabled.md) is **false** on the parent element, if the event bubbles to a parent from an event source child element where [IsDoubleTapEnabled](uielement_isdoubletapenabled.md) is **false**. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * DoubleTapped supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked **Handled**. See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the DoubleTapped input event. If so, the control probably has an override for the method [OnDoubleTapped](../windows.ui.xaml.controls/control_ondoubletapped_1132552853.md). Typically the event is marked handled by the class handler, and the DoubleTapped event is not raised for handling by any user code handlers on that control. For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {DoubleTappedEventHandler}
    */
    OnDoubleTapped {
        get {
            if(!this.HasProp("__OnDoubleTapped")){
                this.__OnDoubleTapped := WinRTEventHandler(
                    DoubleTappedEventHandler,
                    DoubleTappedEventHandler.IID,
                    IInspectable,
                    DoubleTappedRoutedEventArgs
                )
                this.__OnDoubleTappedToken := this.add_DoubleTapped(this.__OnDoubleTapped.iface)
            }
            return this.__OnDoubleTapped
        }
    }

    /**
     * Occurs when an otherwise unhandled **Hold** interaction occurs over the hit test area of this element.
     * @remarks
     * Touch can produce a **Holding** action, but mouse devices generally can't. For more info, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input).
     * 
     * The [Tapped](uielement_tapped.md), [DoubleTapped](uielement_doubletapped.md), and [RightTapped](uielement_righttapped.md) events occur only after the touch point is removed. But the initial Holding event occurs while the touch point is still in contact. The event occurs if the touch point remains in approximately the same [PointerPoint](../windows.ui.input/pointerpoint.md) position for a period of time. The exact timing of what the system interprets as a holding action is adjustable by users through system settings.
     * 
     * Holding is intended for informational UI, but for interactions like displaying a context menu you should use [RightTapped](uielement_righttapped.md) instead. You might handle Holding first to display a hint that a menu will appear, but to display the menu itself, use a [RightTapped](uielement_righttapped.md) handler. See [Touch interaction design](https://msdn.microsoft.com/library/9ba7f613-e5d1-40d4-920b-143094209e3a) or [UX guidelines for custom user interactions](/windows/uwp/design/layout/index) for more info on how to use a **Hold** interaction in your app design.
     * 
     * Holding events generally occur in pairs. When the action is first interpreted as a **Hold** action based on no movement for a period of time, Holding fires, with [HoldingState](../windows.ui.input/holdingeventargs_holdingstate.md) value of **Started** in the [HoldingRoutedEventArgs](../windows.ui.xaml.input/holdingroutedeventargs.md) event data. When the **Hold** action ends, another Holding event fires, this time with [HoldingState](../windows.ui.input/holdingeventargs_holdingstate.md) of either **Completed** or **Canceled**.
     * 
     * + The **Hold** action ends with [HoldingState](../windows.ui.input/holdingeventargs_holdingstate.md) as **Completed** if the user doesn't move the pointer during the **Hold** state and then releases the pointer points that initiated the action. For this case, [RightTapped](uielement_righttapped.md) fires just after the second Holding event.
     * 
     * + The **Hold** action ends with [HoldingState](../windows.ui.input/holdingeventargs_holdingstate.md) as **Canceled** if the user does move the pointer(s) that initiated the action, or also for uncommon situations such as changing the hit-test status on the element during the action or capturing another pointer. If the **Hold** action ends with [HoldingState](../windows.ui.input/holdingeventargs_holdingstate.md) as **Canceled**, [RightTapped](uielement_righttapped.md) won't fire.
     * 
     * A Holding event represents a gesture, whereas a [PointerPressed](uielement_pointerpressed.md) event is a lower-level input event. Holding and [PointerPressed](uielement_pointerpressed.md) events can fire as the result of a single user interaction. Even if a control is already handling pointer events in the control logic, or is handling manipulations, that doesn't prevent Holding from firing.
     * 
     * A Holding event is potentially the result of more than one pointer point. For the higher-level gesture events like Holding you no longer have immediate access to [PointerPoint](../windows.ui.input/pointerpoint.md) details such as individual [PointerId](../windows.ui.input/pointerpoint_pointerid.md) values or individual coordinates. You do have access to device type ([PointerDeviceType](../windows.ui.xaml.input/holdingroutedeventargs_pointerdevicetype.md)) and for coordinates you can call [GetPosition](../windows.ui.xaml.input/holdingroutedeventargs_getposition_1813281865.md), which gives an average of the coordinates for a **Hold** from more than one pointer point.
     * 
     * Holding is a routed event. Also, an element must have [IsHoldingEnabled](uielement_isholdingenabled.md) be **true** to be a Holding event source (**true** is the default). It is possible to handle Holding on parent elements even if [IsHoldingEnabled](uielement_isholdingenabled.md) is **false** on the parent element, if the event bubbles to a parent from an event source child element where [IsHoldingEnabled](uielement_isholdingenabled.md) is **false**. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Holding supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/holdingroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the Holding event. If so, the control probably has an override for the method [OnHolding](../windows.ui.xaml.controls/control_onholding_1052914744.md). For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * [Tapped](uielement_tapped.md) and Holding are mutually exclusive. If the action passes the time threshold to be considered a **Hold** action, it's not considered to be a **Tap** action also.
     * 
     * Whenever Holding fires initially, so long as the element supports manipulation events through a non-default [ManipulationMode](uielement_manipulationmode.md) value, [ManipulationStarting](uielement_manipulationstarting.md) fires too. If the pointer point remains in one place long enough for Holding to be detected, but thereafter the user moves the pointer points associated with the **Hold** action without releasing them (leading to another Holding event with [HoldingState](../windows.ui.input/holdingeventargs_holdingstate.md) as **Canceled**), then other manipulation events like [ManipulationStarted](uielement_manipulationstarted.md) and [ManipulationDelta](uielement_manipulationdelta.md) can fire also.
     * @type {HoldingEventHandler}
    */
    OnHolding {
        get {
            if(!this.HasProp("__OnHolding")){
                this.__OnHolding := WinRTEventHandler(
                    HoldingEventHandler,
                    HoldingEventHandler.IID,
                    IInspectable,
                    HoldingRoutedEventArgs
                )
                this.__OnHoldingToken := this.add_Holding(this.__OnHolding.iface)
            }
            return this.__OnHolding
        }
    }

    /**
     * Occurs when a right-tap input stimulus happens while the pointer is over the element.
     * @remarks
     * RightTapped for a touch action results from processing an action that remains in one place for a certain amount of time. If it's a touch action, a [Holding](uielement_holding.md) event from the same element always precedes this, but RightTapped won't fire until the touch point is released. If the time the pointer is pressed is too short and [Tapped](uielement_tapped.md) fires instead of [Holding](uielement_holding.md), or if the **Hold** action ends with [HoldingState](../windows.ui.xaml.input/holdingroutedeventargs_holdingstate.md) as **Canceled**, RightTapped won't fire.
     * 
     * RightTapped is the event to handle for displaying context menus. See [Touch interaction design](https://msdn.microsoft.com/library/9ba7f613-e5d1-40d4-920b-143094209e3a) and [UX guidelines for custom user interactions](/windows/uwp/design/layout/index) for more info on how to use a right-tap interaction in your app design.
     * 
     * A RightTapped event represents a gesture, whereas a [PointerReleased](uielement_pointerreleased.md) event is a lower-level input event. RightTapped and [PointerReleased](uielement_pointerreleased.md) events can fire as the result of a single user interaction. Even if a control is already handling pointer events in the control logic, or is handling manipulations, that doesn't prevent RightTapped from firing.
     * 
     * A RightTapped event is potentially the result of more than one pointer point. For the higher-level gesture events like RightTapped you no longer have immediate access to [PointerPoint](../windows.ui.input/pointerpoint.md) details such as individual [PointerId](../windows.ui.input/pointerpoint_pointerid.md) values or individual coordinates. You do have access to device type ([PointerDeviceType](../windows.ui.xaml.input/righttappedroutedeventargs_pointerdevicetype.md)) and for coordinates you can call [GetPosition](../windows.ui.xaml.input/righttappedroutedeventargs_getposition_1813281865.md), which gives an average of the coordinates for a **RightTap** from more than one pointer point.
     * 
     * RightTapped is a routed event. Also, an element must have [IsRightTapEnabled](uielement_isrighttapenabled.md) be **true** to be a RightTapped event source (**true** is the default). It is possible to handle RightTapped on parent elements even if [IsRightTapEnabled](uielement_isrighttapenabled.md) is **false** on the parent element, if the event bubbles to a parent from an event source child element where [IsRightTapEnabled](uielement_isrighttapenabled.md) is **false**. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * RightTapped supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/righttappedroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * 
     * Specific Windows Runtime controls may have class-based handling for the RightTapped event. If so, the control probably has an override for the method [OnRightTapped](../windows.ui.xaml.controls/control_onrighttapped_206844945.md). A right-tap action might be associated with displaying a context menu or secondary window. For more info on how class-based handling for events works, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {RightTappedEventHandler}
    */
    OnRightTapped {
        get {
            if(!this.HasProp("__OnRightTapped")){
                this.__OnRightTapped := WinRTEventHandler(
                    RightTappedEventHandler,
                    RightTappedEventHandler.IID,
                    IInspectable,
                    RightTappedRoutedEventArgs
                )
                this.__OnRightTappedToken := this.add_RightTapped(this.__OnRightTapped.iface)
            }
            return this.__OnRightTapped
        }
    }

    /**
     * Occurs when the manipulation processor is first created.
     * @remarks
     * For custom controls and interaction experiences, see [GestureRecognizer](../windows.ui.input/gesturerecognizer.md).
     * 
     * An element must have a [ManipulationMode](uielement_manipulationmode.md) value other than **None** or **System** to be a manipulation event source. The default value of [ManipulationMode](uielement_manipulationmode.md) is **System**, which enables built-in control logic to process manipulations, but doesn't permit app code to handle manipulation events. If you want to handle manipulations, set [ManipulationMode](uielement_manipulationmode.md) to **All**, or to specific [ManipulationModes](../windows.ui.xaml.input/manipulationmodes.md) values. For more info, see [ManipulationMode](uielement_manipulationmode.md).
     * 
     * ManipulationStarting fires basically any time that a pointer interacts with an element where the element enables manipulation. This includes cases where the manipulation is interpreted as a gesture and the pointers never move, for example a [Tapped](uielement_tapped.md) or [Holding](uielement_holding.md) gesture. If the pointers do move, [ManipulationStarted](uielement_manipulationstarted.md) typically fires thereafter.
     * 
     * ManipulationStarting is a routed event. If the event is permitted to bubble up to parent elements because it goes unhandled, then it is possible to handle the event on parent elements even if [ManipulationMode](uielement_manipulationmode.md) is **None** or **System** on the parent element. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * ManipulationStarting supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/manipulationstartingroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {ManipulationStartingEventHandler}
    */
    OnManipulationStarting {
        get {
            if(!this.HasProp("__OnManipulationStarting")){
                this.__OnManipulationStarting := WinRTEventHandler(
                    ManipulationStartingEventHandler,
                    ManipulationStartingEventHandler.IID,
                    IInspectable,
                    ManipulationStartingRoutedEventArgs
                )
                this.__OnManipulationStartingToken := this.add_ManipulationStarting(this.__OnManipulationStarting.iface)
            }
            return this.__OnManipulationStarting
        }
    }

    /**
     * Occurs when the input device loses contact with the [UIElement](uielement.md) object during a manipulation and inertia begins.
     * @remarks
     * For custom controls and interaction experiences, see [GestureRecognizer.ManipulationInertiaStarting](../windows.ui.input/gesturerecognizer_manipulationinertiastarting.md).
     * 
     * An element must have a [ManipulationMode](uielement_manipulationmode.md) value other than **None** or **System** to be a manipulation event source. The default value of [ManipulationMode](uielement_manipulationmode.md) is **System**, which enables built-in control logic to process manipulations, but doesn't permit app code to handle manipulation events. If you want to handle manipulations, set [ManipulationMode](uielement_manipulationmode.md) to **All**, or to specific [ManipulationModes](../windows.ui.xaml.input/manipulationmodes.md) values. For more info, see [ManipulationMode](uielement_manipulationmode.md).
     * 
     * ManipulationInertiaStarting is a routed event. If the event is permitted to bubble up to parent elements because it goes unhandled, then it is possible to handle the event on parent elements even if [ManipulationMode](uielement_manipulationmode.md) is **None** or **System** on the parent element. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * ManipulationInertiaStarting supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/manipulationinertiastartingroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {ManipulationInertiaStartingEventHandler}
    */
    OnManipulationInertiaStarting {
        get {
            if(!this.HasProp("__OnManipulationInertiaStarting")){
                this.__OnManipulationInertiaStarting := WinRTEventHandler(
                    ManipulationInertiaStartingEventHandler,
                    ManipulationInertiaStartingEventHandler.IID,
                    IInspectable,
                    ManipulationInertiaStartingRoutedEventArgs
                )
                this.__OnManipulationInertiaStartingToken := this.add_ManipulationInertiaStarting(this.__OnManipulationInertiaStarting.iface)
            }
            return this.__OnManipulationInertiaStarting
        }
    }

    /**
     * Occurs when an input device begins a manipulation on the [UIElement](uielement.md).
     * @remarks
     * For custom controls and interaction experiences, see [GestureRecognizer.ManipulationStarted](../windows.ui.input/gesturerecognizer_manipulationstarted.md).
     * 
     * ManipulationStarted represents that the manipulation recognition logic has detected pointer movement. In this case it's the second manipulation event to fire in a typical sequence, firing after ManipulationStarting, but before ManipulationDelta or other events such as ManipulationInertiaStarting.
     * 
     * An element must have a [ManipulationMode](uielement_manipulationmode.md) value other than **None** or **System** to be a manipulation event source. The default value of [ManipulationMode](uielement_manipulationmode.md) is **System**, which enables built-in control logic to process manipulations, but doesn't permit app code to handle manipulation events. If you want to handle manipulations, set [ManipulationMode](uielement_manipulationmode.md) to **All**, or to specific [ManipulationModes](../windows.ui.xaml.input/manipulationmodes.md) values. For more info, see [ManipulationMode](uielement_manipulationmode.md).
     * 
     * ManipulationStarted is a routed event. If the event is permitted to bubble up to parent elements because it goes unhandled, then it is possible to handle the event on parent elements even if [ManipulationMode](uielement_manipulationmode.md) is **None** or **System** on the parent element. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * ManipulationStarted supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/manipulationstartedroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {ManipulationStartedEventHandler}
    */
    OnManipulationStarted {
        get {
            if(!this.HasProp("__OnManipulationStarted")){
                this.__OnManipulationStarted := WinRTEventHandler(
                    ManipulationStartedEventHandler,
                    ManipulationStartedEventHandler.IID,
                    IInspectable,
                    ManipulationStartedRoutedEventArgs
                )
                this.__OnManipulationStartedToken := this.add_ManipulationStarted(this.__OnManipulationStarted.iface)
            }
            return this.__OnManipulationStarted
        }
    }

    /**
     * Occurs when the input device changes position during a manipulation.
     * @remarks
     * For custom controls and interaction experiences, see [GestureRecognizer](../windows.ui.input/gesturerecognizer.md).
     * 
     * An element must have a [ManipulationMode](uielement_manipulationmode.md) value other than **None** or **System** to be a manipulation event source. The default value of [ManipulationMode](uielement_manipulationmode.md) is **System**, which enables built-in control logic to process manipulations, but doesn't permit app code to handle manipulation events. If you want to handle manipulations, set [ManipulationMode](uielement_manipulationmode.md) to **All**, or to specific [ManipulationModes](../windows.ui.xaml.input/manipulationmodes.md) values. For more info, see [ManipulationMode](uielement_manipulationmode.md).
     * 
     * ManipulationDelta is a routed event. If the event is permitted to bubble up to parent elements because it goes unhandled, then it is possible to handle the event on parent elements even if [ManipulationMode](uielement_manipulationmode.md) is **None** or **System** on the parent element. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * ManipulationDelta supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/manipulationdeltaroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {ManipulationDeltaEventHandler}
    */
    OnManipulationDelta {
        get {
            if(!this.HasProp("__OnManipulationDelta")){
                this.__OnManipulationDelta := WinRTEventHandler(
                    ManipulationDeltaEventHandler,
                    ManipulationDeltaEventHandler.IID,
                    IInspectable,
                    ManipulationDeltaRoutedEventArgs
                )
                this.__OnManipulationDeltaToken := this.add_ManipulationDelta(this.__OnManipulationDelta.iface)
            }
            return this.__OnManipulationDelta
        }
    }

    /**
     * Occurs when a manipulation on the [UIElement](uielement.md) is complete.
     * @remarks
     * For custom controls and interaction experiences, see [GestureRecognizer.ManipulationCompleted](../windows.ui.input/gesturerecognizer_manipulationcompleted.md).
     * 
     * An element must have a [ManipulationMode](uielement_manipulationmode.md) value other than **None** or **System** to be a manipulation event source. The default value of [ManipulationMode](uielement_manipulationmode.md) is **System**, which enables built-in control logic to process manipulations, but doesn't permit app code to handle manipulation events. If you want to handle manipulations, set [ManipulationMode](uielement_manipulationmode.md) to **All**, or to specific [ManipulationModes](../windows.ui.xaml.input/manipulationmodes.md) values. For more info, see [ManipulationMode](uielement_manipulationmode.md).
     * 
     * ManipulationCompleted is a routed event. If the event is permitted to bubble up to parent elements because it goes unhandled, then it is possible to handle the event on parent elements even if [ManipulationMode](uielement_manipulationmode.md) is **None** or **System** on the parent element. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * For touch actions and also for interaction-specific or manipulation events that are consequences of a touch action, an element must be hit-test visible in order to be the event source and fire the event that is associated with the action. [UIElement.Visibility](uielement_visibility.md) must be [Visible](visibility.md). Other properties of derived types also affect hit-test visibility. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * ManipulationCompleted supports the ability to attach event handlers to the route that will be invoked even if the event data for the event is marked [Handled](../windows.ui.xaml.input/manipulationcompletedroutedeventargs_handled.md). See [AddHandler](uielement_addhandler_2121467075.md).
     * @type {ManipulationCompletedEventHandler}
    */
    OnManipulationCompleted {
        get {
            if(!this.HasProp("__OnManipulationCompleted")){
                this.__OnManipulationCompleted := WinRTEventHandler(
                    ManipulationCompletedEventHandler,
                    ManipulationCompletedEventHandler.IID,
                    IInspectable,
                    ManipulationCompletedRoutedEventArgs
                )
                this.__OnManipulationCompletedToken := this.add_ManipulationCompleted(this.__OnManipulationCompleted.iface)
            }
            return this.__OnManipulationCompleted
        }
    }

    /**
     * Occurs when a drag operation is initiated.
     * @remarks
     * DragStarting is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {TypedEventHandler<UIElement, DragStartingEventArgs>}
    */
    OnDragStarting {
        get {
            if(!this.HasProp("__OnDragStarting")){
                this.__OnDragStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ecc4b13b-146c-5963-b8b3-024c5b9b95e4}"),
                    UIElement,
                    DragStartingEventArgs
                )
                this.__OnDragStartingToken := this.add_DragStarting(this.__OnDragStarting.iface)
            }
            return this.__OnDragStarting
        }
    }

    /**
     * Occurs when a drag-and-drop operation with this element as the source is ended.
     * @remarks
     * DropCompleted is raised on the drag source element after [DragStarting](uielement_dragstarting.md), when the dragged element has been dropped. You can handle this event and take appropriate action based on the [DropResult](dropcompletedeventargs_dropresult.md) in the event args. For example, if the DropResult is [Move](../windows.applicationmodel.datatransfer/datapackageoperation.md), you should delete the original drag source.
     * 
     * DragStarting and DropCompleted are raised only if [CanDrag](uielement_candrag.md) is **true**.
     * 
     * DropCompleted is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {TypedEventHandler<UIElement, DropCompletedEventArgs>}
    */
    OnDropCompleted {
        get {
            if(!this.HasProp("__OnDropCompleted")){
                this.__OnDropCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ffd72e78-ec1f-5bcc-9d13-ff5fbb040562}"),
                    UIElement,
                    DropCompletedEventArgs
                )
                this.__OnDropCompletedToken := this.add_DropCompleted(this.__OnDropCompleted.iface)
            }
            return this.__OnDropCompleted
        }
    }

    /**
     * Occurs when the user has completed a context input gesture, such as a right-click.
     * @remarks
     * We recommend the you set the [ContextFlyout](uielement_contextflyout.md) property to add a context menu to an element. When `ContextFlyout` is set, the context menu is shown and hidden automatically, and this event is marked as handled. You should only handle `ContextRequested` and `ContextCanceled` if you do not set `ContextFlyout`.
     * 
     * If you handle this event to show the context flyout, you should also handle the [ContextCanceled](uielement_contextcanceled.md) event to hide the flyout if the request is canceled.
     * 
     * `ContextRequested` is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {TypedEventHandler<UIElement, ContextRequestedEventArgs>}
    */
    OnContextRequested {
        get {
            if(!this.HasProp("__OnContextRequested")){
                this.__OnContextRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{41d66b93-d17b-59b2-b916-8e813fecb9bd}"),
                    UIElement,
                    ContextRequestedEventArgs
                )
                this.__OnContextRequestedToken := this.add_ContextRequested(this.__OnContextRequested.iface)
            }
            return this.__OnContextRequested
        }
    }

    /**
     * Occurs when a context input gesture continues into a manipulation gesture, to notify the element that the context flyout should not be opened.
     * @remarks
     * We recommend the you set the [ContextFlyout](uielement_contextflyout.md) property to add a context menu to an element. When `ContextFlyout` is set, the context menu is shown and hidden automatically. You should only handle `ContextRequested` and `ContextCanceled` if you do not set `ContextFlyout`.
     * 
     * If you handle the [ContextRequested](uielement_contextrequested.md) event to show the context flyout, you should also handle this event to hide the flyout if the request is canceled.
     * 
     * You typically handle this event for elements that can be manipulated by drag-and-drop. This event is raised when a [ContextRequested](uielement_contextrequested.md) event has been raised, but the element has not received a [PointerReleased](uielement_pointerreleased.md) event before a manipulation begins. This indicates that the user intended to invoke a manipulation rather than a context flyout, so the context flyout should not be opened.
     * 
     * `ContextCanceled` is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {TypedEventHandler<UIElement, RoutedEventArgs>}
    */
    OnContextCanceled {
        get {
            if(!this.HasProp("__OnContextCanceled")){
                this.__OnContextCanceled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{657f28aa-8c76-501f-b032-d8dc93595e76}"),
                    UIElement,
                    RoutedEventArgs
                )
                this.__OnContextCanceledToken := this.add_ContextCanceled(this.__OnContextCanceled.iface)
            }
            return this.__OnContextCanceled
        }
    }

    /**
     * Occurs when the user requests that access keys be displayed.
     * @remarks
     * This event notifies an element to show access key visuals.
     * 
     * This event is not raised if the element is under an element with its [Visibility](uielement_visibility.md) property set to **Collapsed**.
     * @type {TypedEventHandler<UIElement, AccessKeyDisplayRequestedEventArgs>}
    */
    OnAccessKeyDisplayRequested {
        get {
            if(!this.HasProp("__OnAccessKeyDisplayRequested")){
                this.__OnAccessKeyDisplayRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5871821a-2491-5cec-a457-21996ca4efaf}"),
                    UIElement,
                    AccessKeyDisplayRequestedEventArgs
                )
                this.__OnAccessKeyDisplayRequestedToken := this.add_AccessKeyDisplayRequested(this.__OnAccessKeyDisplayRequested.iface)
            }
            return this.__OnAccessKeyDisplayRequested
        }
    }

    /**
     * Occurs when access keys should no longer be displayed.
     * @remarks
     * This event notifies an element to hide access key visuals.
     * @type {TypedEventHandler<UIElement, AccessKeyDisplayDismissedEventArgs>}
    */
    OnAccessKeyDisplayDismissed {
        get {
            if(!this.HasProp("__OnAccessKeyDisplayDismissed")){
                this.__OnAccessKeyDisplayDismissed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2831903f-655e-5464-828c-56a8b4c65f1e}"),
                    UIElement,
                    AccessKeyDisplayDismissedEventArgs
                )
                this.__OnAccessKeyDisplayDismissedToken := this.add_AccessKeyDisplayDismissed(this.__OnAccessKeyDisplayDismissed.iface)
            }
            return this.__OnAccessKeyDisplayDismissed
        }
    }

    /**
     * Occurs when a user completes an access key sequence.
     * @remarks
     * This event indicates that the action associated with the access key sequence should be invoked. For example, if an element’s [AccessKey](uielement_accesskey.md) is "A" and the user presses Alt-A.
     * 
     * An access key can have one or several characters. This event occurs only when users type all the characters of an access key. For example, if an [AccessKey](uielement_accesskey.md) value is "BC", the event doesn't occur when the user presses "B". The event occurs when the user presses "B", then "C".
     * 
     * This event occurs when the key is pressed, not when it's released.
     * @type {TypedEventHandler<UIElement, AccessKeyInvokedEventArgs>}
    */
    OnAccessKeyInvoked {
        get {
            if(!this.HasProp("__OnAccessKeyInvoked")){
                this.__OnAccessKeyInvoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a5c9a137-f716-5d8d-92c4-02f171936fa1}"),
                    UIElement,
                    AccessKeyInvokedEventArgs
                )
                this.__OnAccessKeyInvokedToken := this.add_AccessKeyInvoked(this.__OnAccessKeyInvoked.iface)
            }
            return this.__OnAccessKeyInvoked
        }
    }

    /**
     * Occurs before a [UIElement](uielement.md) receives focus. This event is raised synchronously to ensure focus isn't moved while the event is bubbling.
     * @remarks
     * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of [FocusManager](../windows.ui.xaml.input/focusmanager.md) events whenever possible.
     * 
     * Only a single UI element at a time can have focus.
     * 
     * A control can get focus when another control loses focus, the application view changes, the user switches applications, or the user interacts with the system such that the application is no longer in the foreground.
     * 
     * When programmatically navigating between elements, [FocusNavigationDirection.Previous](../windows.ui.xaml.input/focusnavigationdirection.md) and [FocusNavigationDirection.Next](../windows.ui.xaml.input/focusnavigationdirection.md) cannot be used with [FindNextElementOptions](../windows.ui.xaml.input/findnextelementoptions.md). Only [FocusNavigationDirection.Up](../windows.ui.xaml.input/focusnavigationdirection.md), [FocusNavigationDirection.Down](../windows.ui.xaml.input/focusnavigationdirection.md), [FocusNavigationDirection.Left](../windows.ui.xaml.input/focusnavigationdirection.md), or [FocusNavigationDirection.Right](../windows.ui.xaml.input/focusnavigationdirection.md) are valid.
     * 
     * GettingFocus is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {TypedEventHandler<UIElement, GettingFocusEventArgs>}
    */
    OnGettingFocus {
        get {
            if(!this.HasProp("__OnGettingFocus")){
                this.__OnGettingFocus := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{34f34b77-ec52-5eb6-affc-220cb52ca093}"),
                    UIElement,
                    GettingFocusEventArgs
                )
                this.__OnGettingFocusToken := this.add_GettingFocus(this.__OnGettingFocus.iface)
            }
            return this.__OnGettingFocus
        }
    }

    /**
     * Occurs before a [UIElement](uielement.md) loses focus. This event is raised synchronously to ensure focus isn't moved while the event is bubbling.
     * @remarks
     * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of [FocusManager](../windows.ui.xaml.input/focusmanager.md) events whenever possible.
     * 
     * Only a single UI element at a time can have focus.
     * 
     * A control can lose focus when another control gets focus, the application view changes, the user switches applications, or the user interacts with the system such that the application is no longer in the foreground.
     * 
     * When programmatically navigating between elements, [FocusNavigationDirection.Previous](../windows.ui.xaml.input/focusnavigationdirection.md) and [FocusNavigationDirection.Next](../windows.ui.xaml.input/focusnavigationdirection.md) cannot be used with [FindNextElementOptions](../windows.ui.xaml.input/findnextelementoptions.md). Only [FocusNavigationDirection.Up](../windows.ui.xaml.input/focusnavigationdirection.md), [FocusNavigationDirection.Down](../windows.ui.xaml.input/focusnavigationdirection.md), [FocusNavigationDirection.Left](../windows.ui.xaml.input/focusnavigationdirection.md), or [FocusNavigationDirection.Right](../windows.ui.xaml.input/focusnavigationdirection.md) are valid.
     * 
     * LosingFocus is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {TypedEventHandler<UIElement, LosingFocusEventArgs>}
    */
    OnLosingFocus {
        get {
            if(!this.HasProp("__OnLosingFocus")){
                this.__OnLosingFocus := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a0f49f5f-c366-569a-895a-3a82d8801fe4}"),
                    UIElement,
                    LosingFocusEventArgs
                )
                this.__OnLosingFocusToken := this.add_LosingFocus(this.__OnLosingFocus.iface)
            }
            return this.__OnLosingFocus
        }
    }

    /**
     * Occurs when a user attempts to move focus (via tab or directional arrows), but focus doesn't move because no focus candidate is found in the direction of movement.
     * @remarks
     * NoFocusCandidateFound is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {TypedEventHandler<UIElement, NoFocusCandidateFoundEventArgs>}
    */
    OnNoFocusCandidateFound {
        get {
            if(!this.HasProp("__OnNoFocusCandidateFound")){
                this.__OnNoFocusCandidateFound := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d5de4415-b53c-5312-9e1b-ac2a19f04e71}"),
                    UIElement,
                    NoFocusCandidateFoundEventArgs
                )
                this.__OnNoFocusCandidateFoundToken := this.add_NoFocusCandidateFound(this.__OnNoFocusCandidateFound.iface)
            }
            return this.__OnNoFocusCandidateFound
        }
    }

    /**
     * Occurs when a single, composed character is received by the input queue.
     * @remarks
     * > [!NOTE]
     * > A composed character is a single visual object derived from a sequence of one or more other characters.
     * 
     * CharacterReceived is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](../windows.ui.xaml.input/characterreceivedroutedeventargs_handled.md) to true.
     * 
     * This event is useful for text input scenarios such as "typeahead find or search" (also known as incremental search, incremental find, or real-time suggestions) where, as the user types, the control progressively searches for and filters text based on the characters in the input queue.
     * 
     * The CharacterReceived event can occur at different times depending on the character entered, as the event is not fired until the composed character is registered in the input queue.
     * 
     * - User presses the W key (the character 'w' is received):
     *   - PreviewKeyDown for W
     *   - KeyDown for W
     *   - CharacterReceived
     *   - PreviewKeyUp for W
     *   - KeyUp for W
     * - User presses the Shift+W keys (the character 'W' is received):
     *   - PreviewKeyDown for Shift
     *   - KeyDown for Shift
     *   - PreviewKeyDown for W
     *   - KeyDown for W
     *   - CharacterReceived
     *   - PreviewKeyUp for W
     *   - KeyUp for W
     *   - PreviewKeyUp for Shift
     *   - KeyUp for Shift
     * - User presses Alt+164 using the NumPad (the character ‘ñ’ is received):
     *   - PreviewKeyDown for Alt
     *   - KeyDown for Alt
     *   - PreviewKeyDown for 1
     *   - KeyDown for 1
     *   - PreviewKeyUp for 1
     *   - KeyUp for 1
     *   - PreviewKeyDown for 6
     *   - KeyDown for 6
     *   - PreviewKeyUp for 6
     *   - KeyUp for 6
     *   - PreviewKeyDown for 4
     *   - KeyDown for 4
     *   - PreviewKeyUp for 4
     *   - KeyUp for 4
     *   - CharacterReceived
     *   - PreviewKeyUp for Alt
     *   - KeyUp for Alt
     * @type {TypedEventHandler<UIElement, CharacterReceivedRoutedEventArgs>}
    */
    OnCharacterReceived {
        get {
            if(!this.HasProp("__OnCharacterReceived")){
                this.__OnCharacterReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{24330117-55d4-5789-8aa2-6cab1d0662a0}"),
                    UIElement,
                    CharacterReceivedRoutedEventArgs
                )
                this.__OnCharacterReceivedToken := this.add_CharacterReceived(this.__OnCharacterReceived.iface)
            }
            return this.__OnCharacterReceived
        }
    }

    /**
     * Occurs when a [keyboard shortcut (or accelerator)](../windows.ui.xaml.input/keyboardaccelerator.md) is pressed.
     * @type {TypedEventHandler<UIElement, ProcessKeyboardAcceleratorEventArgs>}
    */
    OnProcessKeyboardAccelerators {
        get {
            if(!this.HasProp("__OnProcessKeyboardAccelerators")){
                this.__OnProcessKeyboardAccelerators := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c134d249-476a-5146-b5d4-6c98f4e81461}"),
                    UIElement,
                    ProcessKeyboardAcceleratorEventArgs
                )
                this.__OnProcessKeyboardAcceleratorsToken := this.add_ProcessKeyboardAccelerators(this.__OnProcessKeyboardAccelerators.iface)
            }
            return this.__OnProcessKeyboardAccelerators
        }
    }

    /**
     * Occurs when a keyboard key is pressed while the [UIElement](uielement.md) has focus.
     * @remarks
     * PreviewKeyDown is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * This event uses the tunneling routing strategy. The corresponding bubbling event is [KeyDown](uielement_keydown.md).
     * @type {KeyEventHandler}
    */
    OnPreviewKeyDown {
        get {
            if(!this.HasProp("__OnPreviewKeyDown")){
                this.__OnPreviewKeyDown := WinRTEventHandler(
                    KeyEventHandler,
                    KeyEventHandler.IID,
                    IInspectable,
                    KeyRoutedEventArgs
                )
                this.__OnPreviewKeyDownToken := this.add_PreviewKeyDown(this.__OnPreviewKeyDown.iface)
            }
            return this.__OnPreviewKeyDown
        }
    }

    /**
     * Occurs when a keyboard key is released while the [UIElement](uielement.md) has focus.
     * @remarks
     * [PreviewKeyDown](uielement_previewkeydown.md) is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * 
     * This event uses the tunneling routing strategy. The corresponding bubbling event is [KeyUp](uielement_keyup.md).
     * @type {KeyEventHandler}
    */
    OnPreviewKeyUp {
        get {
            if(!this.HasProp("__OnPreviewKeyUp")){
                this.__OnPreviewKeyUp := WinRTEventHandler(
                    KeyEventHandler,
                    KeyEventHandler.IID,
                    IInspectable,
                    KeyRoutedEventArgs
                )
                this.__OnPreviewKeyUpToken := this.add_PreviewKeyUp(this.__OnPreviewKeyUp.iface)
            }
            return this.__OnPreviewKeyUp
        }
    }

    /**
     * Occurs when [StartBringIntoView](uielement_startbringintoview_1818344798.md) is called on this element or one of its descendants.
     * @remarks
     * > [!NOTE]
     * > The framework may also raise the event in response to the element receiving focus via a keyboard or gamepad, or when an assistive technology executes the [IScrollItemProvider](../windows.ui.xaml.automation.provider/iscrollitemprovider.md)'s [ScrollIntoView](../windows.ui.xaml.automation.provider/iscrollitemprovider_scrollintoview_1265805467.md) method on the element's automation peer.
     * 
     * This event enables a control to participate in the process of bringing an element into view.  It indicates to a parent control, such as a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md), that the element which raised the event should be made visible within the scrollable region. Non-scrolling controls may use the event as a way to alter requests that originate from one of its children by modifying the event data ([BringIntoViewRequestedEventArgs](bringintoviewrequestedeventargs.md)). For example, you may listen to the event on a parent element to enlarge the [TargetRect](bringintoviewrequestedeventargs_targetrect.md) and ensure a minimum amount of padding is included when bringing any of its child elements into view.
     * 
     * In general, the event data ([BringIntoViewRequestedEventArgs](bringintoviewrequestedeventargs.md)) should not be marked handled.  Doing so may interfere with the intended goal when StartBringIntoView was called. Other event data may be modified as the event bubbles up to alter the request. Specifically, a parent scrolling control is expected to modify the event data to account for its contribution, whether it partially or fully satisfies the request. At a minimum, a scroller is expected to set itself as the [TargetElement](bringintoviewrequestedeventargs_targetelement.md) and update the [TargetRect](bringintoviewrequestedeventargs_targetrect.md) to its own coordinate space. For situations where the element is within a scroller that itself is within a scroller each must react to satisfy the requested alignment.
     * 
     * The [OriginalSource](routedeventargs_originalsource.md) should be used to determine the element on which the event was originally raised given that the [TargetElement](bringintoviewrequestedeventargs_targetelement.md) may be modified as the event bubbles.
     * 
     * BringIntoViewRequested is a routed event. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @type {TypedEventHandler<UIElement, BringIntoViewRequestedEventArgs>}
    */
    OnBringIntoViewRequested {
        get {
            if(!this.HasProp("__OnBringIntoViewRequested")){
                this.__OnBringIntoViewRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2126cf26-9201-5d6b-845e-97e1c44b9ffd}"),
                    UIElement,
                    BringIntoViewRequestedEventArgs
                )
                this.__OnBringIntoViewRequestedToken := this.add_BringIntoViewRequested(this.__OnBringIntoViewRequested.iface)
            }
            return this.__OnBringIntoViewRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnKeyUpToken")) {
            this.remove_KeyUp(this.__OnKeyUpToken)
            this.__OnKeyUp.iface.Dispose()
        }

        if(this.HasProp("__OnKeyDownToken")) {
            this.remove_KeyDown(this.__OnKeyDownToken)
            this.__OnKeyDown.iface.Dispose()
        }

        if(this.HasProp("__OnGotFocusToken")) {
            this.remove_GotFocus(this.__OnGotFocusToken)
            this.__OnGotFocus.iface.Dispose()
        }

        if(this.HasProp("__OnLostFocusToken")) {
            this.remove_LostFocus(this.__OnLostFocusToken)
            this.__OnLostFocus.iface.Dispose()
        }

        if(this.HasProp("__OnDragEnterToken")) {
            this.remove_DragEnter(this.__OnDragEnterToken)
            this.__OnDragEnter.iface.Dispose()
        }

        if(this.HasProp("__OnDragLeaveToken")) {
            this.remove_DragLeave(this.__OnDragLeaveToken)
            this.__OnDragLeave.iface.Dispose()
        }

        if(this.HasProp("__OnDragOverToken")) {
            this.remove_DragOver(this.__OnDragOverToken)
            this.__OnDragOver.iface.Dispose()
        }

        if(this.HasProp("__OnDropToken")) {
            this.remove_Drop(this.__OnDropToken)
            this.__OnDrop.iface.Dispose()
        }

        if(this.HasProp("__OnPointerPressedToken")) {
            this.remove_PointerPressed(this.__OnPointerPressedToken)
            this.__OnPointerPressed.iface.Dispose()
        }

        if(this.HasProp("__OnPointerMovedToken")) {
            this.remove_PointerMoved(this.__OnPointerMovedToken)
            this.__OnPointerMoved.iface.Dispose()
        }

        if(this.HasProp("__OnPointerReleasedToken")) {
            this.remove_PointerReleased(this.__OnPointerReleasedToken)
            this.__OnPointerReleased.iface.Dispose()
        }

        if(this.HasProp("__OnPointerEnteredToken")) {
            this.remove_PointerEntered(this.__OnPointerEnteredToken)
            this.__OnPointerEntered.iface.Dispose()
        }

        if(this.HasProp("__OnPointerExitedToken")) {
            this.remove_PointerExited(this.__OnPointerExitedToken)
            this.__OnPointerExited.iface.Dispose()
        }

        if(this.HasProp("__OnPointerCaptureLostToken")) {
            this.remove_PointerCaptureLost(this.__OnPointerCaptureLostToken)
            this.__OnPointerCaptureLost.iface.Dispose()
        }

        if(this.HasProp("__OnPointerCanceledToken")) {
            this.remove_PointerCanceled(this.__OnPointerCanceledToken)
            this.__OnPointerCanceled.iface.Dispose()
        }

        if(this.HasProp("__OnPointerWheelChangedToken")) {
            this.remove_PointerWheelChanged(this.__OnPointerWheelChangedToken)
            this.__OnPointerWheelChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTappedToken")) {
            this.remove_Tapped(this.__OnTappedToken)
            this.__OnTapped.iface.Dispose()
        }

        if(this.HasProp("__OnDoubleTappedToken")) {
            this.remove_DoubleTapped(this.__OnDoubleTappedToken)
            this.__OnDoubleTapped.iface.Dispose()
        }

        if(this.HasProp("__OnHoldingToken")) {
            this.remove_Holding(this.__OnHoldingToken)
            this.__OnHolding.iface.Dispose()
        }

        if(this.HasProp("__OnRightTappedToken")) {
            this.remove_RightTapped(this.__OnRightTappedToken)
            this.__OnRightTapped.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationStartingToken")) {
            this.remove_ManipulationStarting(this.__OnManipulationStartingToken)
            this.__OnManipulationStarting.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationInertiaStartingToken")) {
            this.remove_ManipulationInertiaStarting(this.__OnManipulationInertiaStartingToken)
            this.__OnManipulationInertiaStarting.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationStartedToken")) {
            this.remove_ManipulationStarted(this.__OnManipulationStartedToken)
            this.__OnManipulationStarted.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationDeltaToken")) {
            this.remove_ManipulationDelta(this.__OnManipulationDeltaToken)
            this.__OnManipulationDelta.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationCompletedToken")) {
            this.remove_ManipulationCompleted(this.__OnManipulationCompletedToken)
            this.__OnManipulationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnDragStartingToken")) {
            this.remove_DragStarting(this.__OnDragStartingToken)
            this.__OnDragStarting.iface.Dispose()
        }

        if(this.HasProp("__OnDropCompletedToken")) {
            this.remove_DropCompleted(this.__OnDropCompletedToken)
            this.__OnDropCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnContextRequestedToken")) {
            this.remove_ContextRequested(this.__OnContextRequestedToken)
            this.__OnContextRequested.iface.Dispose()
        }

        if(this.HasProp("__OnContextCanceledToken")) {
            this.remove_ContextCanceled(this.__OnContextCanceledToken)
            this.__OnContextCanceled.iface.Dispose()
        }

        if(this.HasProp("__OnAccessKeyDisplayRequestedToken")) {
            this.remove_AccessKeyDisplayRequested(this.__OnAccessKeyDisplayRequestedToken)
            this.__OnAccessKeyDisplayRequested.iface.Dispose()
        }

        if(this.HasProp("__OnAccessKeyDisplayDismissedToken")) {
            this.remove_AccessKeyDisplayDismissed(this.__OnAccessKeyDisplayDismissedToken)
            this.__OnAccessKeyDisplayDismissed.iface.Dispose()
        }

        if(this.HasProp("__OnAccessKeyInvokedToken")) {
            this.remove_AccessKeyInvoked(this.__OnAccessKeyInvokedToken)
            this.__OnAccessKeyInvoked.iface.Dispose()
        }

        if(this.HasProp("__OnGettingFocusToken")) {
            this.remove_GettingFocus(this.__OnGettingFocusToken)
            this.__OnGettingFocus.iface.Dispose()
        }

        if(this.HasProp("__OnLosingFocusToken")) {
            this.remove_LosingFocus(this.__OnLosingFocusToken)
            this.__OnLosingFocus.iface.Dispose()
        }

        if(this.HasProp("__OnNoFocusCandidateFoundToken")) {
            this.remove_NoFocusCandidateFound(this.__OnNoFocusCandidateFoundToken)
            this.__OnNoFocusCandidateFound.iface.Dispose()
        }

        if(this.HasProp("__OnCharacterReceivedToken")) {
            this.remove_CharacterReceived(this.__OnCharacterReceivedToken)
            this.__OnCharacterReceived.iface.Dispose()
        }

        if(this.HasProp("__OnProcessKeyboardAcceleratorsToken")) {
            this.remove_ProcessKeyboardAccelerators(this.__OnProcessKeyboardAcceleratorsToken)
            this.__OnProcessKeyboardAccelerators.iface.Dispose()
        }

        if(this.HasProp("__OnPreviewKeyDownToken")) {
            this.remove_PreviewKeyDown(this.__OnPreviewKeyDownToken)
            this.__OnPreviewKeyDown.iface.Dispose()
        }

        if(this.HasProp("__OnPreviewKeyUpToken")) {
            this.remove_PreviewKeyUp(this.__OnPreviewKeyUpToken)
            this.__OnPreviewKeyUp.iface.Dispose()
        }

        if(this.HasProp("__OnBringIntoViewRequestedToken")) {
            this.remove_BringIntoViewRequested(this.__OnBringIntoViewRequestedToken)
            this.__OnBringIntoViewRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_DesiredSize() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_DesiredSize()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowDrop() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_AllowDrop()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowDrop(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_AllowDrop(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_Opacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Opacity(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_Opacity(value)
    }

    /**
     * 
     * @returns {RectangleGeometry} 
     */
    get_Clip() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_Clip()
    }

    /**
     * 
     * @param {RectangleGeometry} value 
     * @returns {HRESULT} 
     */
    put_Clip(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_Clip(value)
    }

    /**
     * 
     * @returns {Transform} 
     */
    get_RenderTransform() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_RenderTransform()
    }

    /**
     * 
     * @param {Transform} value 
     * @returns {HRESULT} 
     */
    put_RenderTransform(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_RenderTransform(value)
    }

    /**
     * 
     * @returns {Projection} 
     */
    get_Projection() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_Projection()
    }

    /**
     * 
     * @param {Projection} value 
     * @returns {HRESULT} 
     */
    put_Projection(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_Projection(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_RenderTransformOrigin() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_RenderTransformOrigin()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_RenderTransformOrigin(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_RenderTransformOrigin(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHitTestVisible() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_IsHitTestVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHitTestVisible(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_IsHitTestVisible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Visibility() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_Visibility()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Visibility(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_Visibility(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_RenderSize() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_RenderSize()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseLayoutRounding() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_UseLayoutRounding()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseLayoutRounding(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_UseLayoutRounding(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_Transitions() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_Transitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_Transitions(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_Transitions(value)
    }

    /**
     * 
     * @returns {CacheMode} 
     */
    get_CacheMode() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_CacheMode()
    }

    /**
     * 
     * @param {CacheMode} value 
     * @returns {HRESULT} 
     */
    put_CacheMode(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_CacheMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTapEnabled() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_IsTapEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTapEnabled(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_IsTapEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleTapEnabled() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_IsDoubleTapEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDoubleTapEnabled(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_IsDoubleTapEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRightTapEnabled() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_IsRightTapEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRightTapEnabled(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_IsRightTapEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHoldingEnabled() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_IsHoldingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHoldingEnabled(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_IsHoldingEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ManipulationMode() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_ManipulationMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ManipulationMode(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.put_ManipulationMode(value)
    }

    /**
     * 
     * @returns {IVectorView<Pointer>} 
     */
    get_PointerCaptures() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.get_PointerCaptures()
    }

    /**
     * 
     * @param {KeyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyUp(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_KeyUp(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_KeyUp(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_KeyUp(token)
    }

    /**
     * 
     * @param {KeyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyDown(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_KeyDown(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_KeyDown(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_KeyDown(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_GotFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GotFocus(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_GotFocus(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LostFocus(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_LostFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LostFocus(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_LostFocus(token)
    }

    /**
     * 
     * @param {DragEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragEnter(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_DragEnter(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragEnter(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_DragEnter(token)
    }

    /**
     * 
     * @param {DragEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragLeave(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_DragLeave(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragLeave(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_DragLeave(token)
    }

    /**
     * 
     * @param {DragEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragOver(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_DragOver(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragOver(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_DragOver(token)
    }

    /**
     * 
     * @param {DragEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Drop(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_Drop(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Drop(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_Drop(token)
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressed(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_PointerPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerPressed(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_PointerPressed(token)
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoved(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_PointerMoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerMoved(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_PointerMoved(token)
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleased(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_PointerReleased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerReleased(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_PointerReleased(token)
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerEntered(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_PointerEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerEntered(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_PointerEntered(token)
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerExited(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_PointerExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerExited(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_PointerExited(token)
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerCaptureLost(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_PointerCaptureLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerCaptureLost(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_PointerCaptureLost(token)
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerCanceled(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_PointerCanceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerCanceled(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_PointerCanceled(token)
    }

    /**
     * 
     * @param {PointerEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerWheelChanged(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_PointerWheelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerWheelChanged(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_PointerWheelChanged(token)
    }

    /**
     * 
     * @param {TappedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Tapped(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_Tapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Tapped(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_Tapped(token)
    }

    /**
     * 
     * @param {DoubleTappedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DoubleTapped(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_DoubleTapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DoubleTapped(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_DoubleTapped(token)
    }

    /**
     * 
     * @param {HoldingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Holding(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_Holding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Holding(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_Holding(token)
    }

    /**
     * 
     * @param {RightTappedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RightTapped(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_RightTapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RightTapped(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_RightTapped(token)
    }

    /**
     * 
     * @param {ManipulationStartingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationStarting(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_ManipulationStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationStarting(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_ManipulationStarting(token)
    }

    /**
     * 
     * @param {ManipulationInertiaStartingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationInertiaStarting(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_ManipulationInertiaStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationInertiaStarting(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_ManipulationInertiaStarting(token)
    }

    /**
     * 
     * @param {ManipulationStartedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationStarted(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_ManipulationStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationStarted(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_ManipulationStarted(token)
    }

    /**
     * 
     * @param {ManipulationDeltaEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationDelta(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_ManipulationDelta(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationDelta(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_ManipulationDelta(token)
    }

    /**
     * 
     * @param {ManipulationCompletedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationCompleted(handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.add_ManipulationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationCompleted(token) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.remove_ManipulationCompleted(token)
    }

    /**
     * Updates the [DesiredSize](uielement_desiredsize.md) of a [UIElement](uielement.md). Typically, objects that implement custom layout for their layout children call this method from their own [MeasureOverride](frameworkelement_measureoverride_1586581644.md) implementations to form a recursive layout update.
     * @remarks
     * The Measure call potentially reaches a [MeasureOverride](frameworkelement_measureoverride_1586581644.md) implementation of that specific class. Otherwise, most [FrameworkElement](frameworkelement.md) classes have an implicit default layout behavior for Measure.
     * 
     * *availableSize* can be any number from zero to infinite. Elements participating in layout should return the minimum [Size](../windows.foundation/size.md) they require for a given *availableSize*.
     * 
     * Computation of initial layout positioning in a XAML UI consists of a Measure call and an [Arrange](uielement_arrange_958316931.md) call, in that order. During the Measure call, the layout system determines an element's size requirements using the *availableSize* measurement. During the [Arrange](uielement_arrange_958316931.md) call, the layout system finalizes the size and position of an element's bounding box.
     * 
     * When a layout is first produced, it always has a Measure call that happens before [Arrange](uielement_arrange_958316931.md). However, after the first layout pass, an [Arrange](uielement_arrange_958316931.md) call can happen without a Measure preceding it. This can happen when a property that affects only [Arrange](uielement_arrange_958316931.md) is changed (such as alignment), or when the parent receives an [Arrange](uielement_arrange_958316931.md) without a Measure.
     * 
     * A Measure call will automatically invalidate any [Arrange](uielement_arrange_958316931.md) information. Layout updates generally occur asynchronously (at a time determined by the layout system). An element might not immediately reflect changes to properties that affect element sizing (such as [Width](frameworkelement_actualwidth.md)).
     * @param {SIZE} availableSize The available space that a parent can allocate to a child object. A child object can request a larger space than what is available; the provided size might be accommodated if scrolling or other resize behavior is possible in that particular container.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.measure
     */
    Measure(availableSize) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.Measure(availableSize)
    }

    /**
     * Positions child objects and determines a size for a [UIElement](uielement.md). Parent objects that implement custom layout for their child elements should call this method from their layout override implementations to form a recursive layout update.
     * @remarks
     * The Arrange call potentially reaches an [ArrangeOverride](frameworkelement_arrangeoverride_1795048387.md) implementation of that specific class. Otherwise, most [FrameworkElement](frameworkelement.md) classes have an implicit default layout behavior for Arrange.
     * 
     * Computation of initial layout positioning in a XAML UI consists of a [Measure](uielement_measure_1722732750.md) call and an Arrange call, in that order. During the [Measure](uielement_measure_1722732750.md) call, the layout system determines an element's size requirements using the *availableSize* measurement. During the Arrange call, the layout system finalizes the size and position of an element's bounding box.
     * 
     * When a layout is first produced, it always has a [Measure](uielement_measure_1722732750.md) call that happens before Arrange. However, after the first layout pass, an Arrange call can happen without a [Measure](uielement_measure_1722732750.md) preceding it. This can happen when a property that affects only Arrange is changed (such as alignment), or when the parent receives an Arrange without a [Measure](uielement_measure_1722732750.md).
     * 
     * A [Measure](uielement_measure_1722732750.md) call will automatically invalidate any Arrange information. Layout updates generally occur asynchronously (at a time determined by the layout system). An element might not immediately reflect changes to properties that affect element sizing (such as [Width](frameworkelement_actualwidth.md)).
     * 
     * Layout updates can be forced by app code rather than relying on the built-in layout system behavior by using the [UpdateLayout](uielement_updatelayout_1243658106.md) method. However, that is not recommended. It is usually unnecessary and can cause poor performance if overused. In many situations where calling [UpdateLayout](uielement_updatelayout_1243658106.md) from app code might be appropriate because of changes to properties, the layout system will probably already be processing updates. The layout system also has optimizations for dealing with cascades of layout changes through parent-child relationships, and calling [UpdateLayout](uielement_updatelayout_1243658106.md) can work against such optimizations. Nevertheless, it's possible that layout situations exist in more complicated scenarios where calling [UpdateLayout](uielement_updatelayout_1243658106.md) is the best option for resolving a timing issue or other issue with layout. Just use it deliberately and sparingly.
     * @param {RECT} finalRect The final size that the parent computes for the child in layout, provided as a [Rect](../windows.foundation/rect.md) value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.arrange
     */
    Arrange(finalRect) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.Arrange(finalRect)
    }

    /**
     * Sets pointer capture to a [UIElement](uielement.md). Once captured, only the element that has capture will fire pointer-related events.
     * @remarks
     * You can only successfully capture the pointer if that pointer is in a pressed state ([Pointer.IsInContact](../windows.ui.xaml.input/pointer_isincontact.md) should be **true**). What physically constitutes being pressed will vary based on the pointer device type (mouse button pressed, touch point down, stylus in contact). If you attempt to capture a pointer that isn't pressed, or where the pointer was previously pressed but is now released, CapturePointer returns **false**. Existing captures aren't affected by a CapturePointer call that returned **false**.
     * 
     * You typically capture the pointer within a [PointerPressed](uielement_pointerpressed.md) event handler. The [Pointer](../windows.ui.xaml.input/pointer.md) instance you get from the [PointerRoutedEventArgs](../windows.ui.xaml.input/pointerroutedeventargs.md) event data of your [PointerPressed](uielement_pointerpressed.md) handler is the value you should pass for the *value* parameter when you call CapturePointer from within your handler's code.
     * 
     * You typically capture the pointer because you want the current pointer action to initiate a behavior in your app. In this case you typically don't want other elements to handle any other events that come from that pointer's actions, until your behavior is either completed or is canceled by releasing the pointer capture. If a pointer is captured, only the element that has capture gets the pointer's input events, and other elements don't fire events even if the pointer moves into their bounds. For example, consider a UI that has two adjacent elements. Normally, if you moved the pointer from one element to the other, you'd first get [PointerMoved](uielement_pointermoved.md) events from the first element, and then from the second element. But if the first element has captured the pointer, then the first element continues to receive [PointerMoved](uielement_pointermoved.md) events even if the captured pointer leaves its bounds. Also, the second element doesn't fire [PointerEntered](uielement_pointerentered.md) events for a captured pointer when the captured pointer enters it.
     * 
     * The pointer capture state and generating the events that are related to pointer capture isn't entirely up to app code. If the user releases the pointer, that generates a [PointerReleased](uielement_pointerreleased.md) event, and pointer captures associated with that pointer are lost. This also fires [PointerCaptureLost](uielement_pointercapturelost.md) on the original capturing element.
     * 
     * In most cases the pointer capture will be released automatically when the user completes an input action that releases the previous pointer capture (lifting a touch point, releasing the left mouse button, taking the stylus out of range). Another condition that might release capture is any action that also fires a [PointerCanceled](uielement_pointercanceled.md) event. Your app can typically rely on the capture-release behavior associated with user input actions, without having to specifically cancel a pointer capture with [ReleasePointerCapture](uielement_releasepointercapture_962192786.md) or [ReleasePointerCaptures](uielement_releasepointercaptures_190109337.md). For more info, see [Mouse interactions](/windows/uwp/input-and-devices/mouse-interactions).
     * 
     * The CapturePointer method will return **false** if the pointer was already captured.
     * 
     * 
     * A [UIElement](uielement.md) can capture more than one pointer point at a time. Use the *value* parameter to indicate the [Pointer](../windows.ui.xaml.input/pointer.md) instance you want to capture.
     * 
     * The input events that represent gestures (such as [Tapped](uielement_tapped.md) or [DoubleTapped](uielement_doubletapped.md)) are usually only fired after a pointer is released, so you shouldn't attempt to capture a pointer in event handlers for gesture events. The [Pointer](../windows.ui.xaml.input/pointer.md) reference in event data for gesture events won't be permitted to initiate a pointer capture.
     * 
     * 
     * 
     * > [!TIP]
     * > Don't try to use CapturePointer outside the scope of pointer-relevant input event handlers. Unless you have a [Pointer](../windows.ui.xaml.input/pointer.md) that you're sure is associated with a pointer that's permitted to have pointer capture at that time, your CapturePointer call won't have any effect. There's no practical way to generate a new [Pointer](../windows.ui.xaml.input/pointer.md) and call CapturePointer using that new pointer. You should only use the [Pointer](../windows.ui.xaml.input/pointer.md) references the system is providing to you through the event data of the pointer-related input events.
     * @param {Pointer} value The pointer object reference.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.capturepointer
     */
    CapturePointer(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.CapturePointer(value)
    }

    /**
     * Releases pointer captures for capture of one specific pointer by this [UIElement](uielement.md).
     * @remarks
     * Programmatically releasing the pointer capture with ReleasePointerCapture is not the only way that an element might lose pointer capture. For example, user-driven events such as releasing the pointer (touch point up, mouse button released) can cause the pointer capture to be canceled. 
     * <!--In this case you don't have to include any code in a  <xref targtype="event_winrt" rid="w_ui_xaml.uielement_pointerreleased"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">PointerReleased</xref> handler that explicitly calls <xref targtype="method_winrt" rid="w_ui_xaml.uielement_releasepointercapture">ReleasePointerCapture</xref>. Release of pointer capture will just happen implicitly because the pointer capture was canceled by a user-driven state change from the originating pointer device. -->
     * You can listen for the [PointerCaptureLost](uielement_pointercapturelost.md)event to determine when this happens.
     * 
     * Another way that pointer capture might be canceled is if a pointer moves out of one app and into another app while the two apps are side-by-side.
     * 
     * You should only call ReleasePointerCapture if your app code has previously called [CapturePointer](uielement_capturepointer_916768934.md), and has a reference to the particular [Pointer](../windows.ui.xaml.input/pointer.md) instance where you want to release the pointer capture. You'd typically get that [Pointer](../windows.ui.xaml.input/pointer.md) reference through an event such as [PointerReleased](uielement_pointerreleased.md) or perhaps [PointerMoved](uielement_pointermoved.md).
     * 
     * Your app code might call [CapturePointer](uielement_capturepointer_916768934.md) from a different [UIElement](uielement.md) than the one that has any current pointer capture. If so, that cancels any pointer capture previously made by other elements. 
     * <!--Again, you won't have to explicitly call <xref targtype="method_winrt" rid="w_ui_xaml.uielement_releasepointercapture"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">ReleasePointerCapture</xref>, release of pointer capture will just happen implicitly when another <xref targtype="class_winrt" rid="w_ui_xaml.uielement">UIElement</xref> calls <xref targtype="method_winrt" rid="w_ui_xaml.uielement_capturepointer">CapturePointer</xref>.-->
     * A [UIElement](uielement.md)can capture multiple pointers to handle multiple touch points such as for manipulations, but only one [UIElement](uielement.md)in an app can have any pointer captures at any one time. For more info, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input).
     * @param {Pointer} value The pointer reference. Use either saved references from previous captures, or pointer event data, to obtain this reference.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.releasepointercapture
     */
    ReleasePointerCapture(value) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.ReleasePointerCapture(value)
    }

    /**
     * Releases all pointer captures held by this element.
     * @remarks
     * Because there are input scenarios such as manipulations that involve more than one pointer point, the Windows Runtime enables capturing more than one pointer at a time. Calling [ReleasePointerCapture](uielement_releasepointercapture_962192786.md) removes a specific [Pointer](../windows.ui.xaml.input/pointer.md) from the collection as identified by its ID, whereas ReleasePointerCaptures clears the entire collection.
     * 
     * User action that invalidates pointer capture such as releasing from a pointer point also changes capture state. For more info, see [Mouse interactions](/windows/uwp/input-and-devices/mouse-interactions) and [Handle pointer input](/windows/uwp/design/input/handle-pointer-input).
     * 
     * The [PointerCaptures](uielement_pointercaptures.md) property exposes a view of which pointer points are currently captured by the [UIElement](uielement.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.releasepointercaptures
     */
    ReleasePointerCaptures() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.ReleasePointerCaptures()
    }

    /**
     * Adds a routed event handler for a specified routed event, adding the handler to the handler collection on the current element. Specify *handledEventsToo* as **true** to have the provided handler be invoked even if the event is handled elsewhere.
     * @remarks
     * Don't try to use AddHandler as a general substitute for the language-specific syntax you normally use for wiring event handlers; it won't work, because not all events have an identifier you can pass as *routedEvent*. AddHandler is specifically for routed events, and intended mainly for the particular scenario enabled by passing *handledEventsToo* as **true**. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @param {RoutedEvent} routedEvent_ An identifier for the routed event to be handled.
     * @param {IInspectable} handler A reference to the handler implementation.
     * @param {Boolean} handledEventsToo **true** to register the handler such that it is invoked even when the routed event is marked handled in its event data.
     * 
     * **false** to register the handler with the default condition that it will not be invoked if the routed event is already marked handled. The default is **false**.
     * 
     * Do not routinely ask to rehandle a routed event, because it interferes with the intended design of the Windows Runtime event system for control compositing.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.addhandler
     */
    AddHandler(routedEvent_, handler, handledEventsToo) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.AddHandler(routedEvent_, handler, handledEventsToo)
    }

    /**
     * Removes the specified routed event handler from this [UIElement](uielement.md). Typically the handler in question was added by [AddHandler](uielement_addhandler_2121467075.md).
     * @remarks
     * RemoveHandler can only be used for the event handlers of the events that are supported by [AddHandler](uielement_addhandler_2121467075.md), which is approximately the input-specific events of [UIElement](uielement.md). More precisely, the event must have a ***Event** property of type [RoutedEvent](routedevent.md), which is true only of certain events on [UIElement](uielement.md). You cannot use RemoveHandler to unhook event handlers for Windows Runtime events on runtime class instances in general. Instead, you should use the specific event handler unhooking syntax: 
     * + `-=` in C#
     * + **RemoveHandler** in Microsoft Visual Basic
     * + `-=` in Visual C++ component extensions (C++/CX)
     * 
     * <!--
     * 
     * If more than one handler is attached that matched the criteria, only the first handler in the event handler store is removed. This behavior is consistent with CLR behavior of the -= operator.  
     * 
     * -->
     * 
     * Calling this method has no effect if there were no handlers registered with criteria that match the input parameters for the method call.
     * 
     * This method ignores whether *handledEventsToo* parameter was **true** in the [AddHandler](uielement_addhandler_2121467075.md) call that originally attached the handler.
     * @param {RoutedEvent} routedEvent_ The identifier of the routed event for which the handler is attached.
     * @param {IInspectable} handler The specific handler implementation to remove from the event handler collection on this [UIElement](uielement.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.removehandler
     */
    RemoveHandler(routedEvent_, handler) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.RemoveHandler(routedEvent_, handler)
    }

    /**
     * Returns a transform object that can be used to transform coordinates from the [UIElement](uielement.md) to the specified object.
     * @remarks
     * Call TransformToVisual in order to get a coordinate offset between two elements in a UI. The first element being considered is the [UIElement](uielement.md) where you call TransformToVisual, the second element is the [UIElement](uielement.md) you pass as the *visual* parameter. For example, you can use the transform to determine how the bounds of an element are positioned in a coordinate system that is relative to a layout parent element, rather than the app's window.
     * 
     * TransformToVisual gives coordinate results after all considerations that affect rendering and positioning such as [RenderTransform](uielement_rendertransform.md) have been applied. This is useful if you're processing point values that were obtained during an animation of [RenderTransform](uielement_rendertransform.md) or other position changes.
     * 
     * The most common scenario for TransformToVisual is if you want to use a local coordinate system relative to the [UIElement](uielement.md) you call it on, and you aren't handling a real-time input event that has event data methods for converting a [Point](../windows.foundation/point.md) value into the object's frame of reference. After you call TransformToVisual, you can then call [TransformPoint](../windows.ui.xaml.media/generaltransform_transformpoint_1768161830.md) on the returned [GeneralTransform](../windows.ui.xaml.media/generaltransform.md).
     * 
     * > [!NOTE]
     * > The [GeneralTransform](../windows.ui.xaml.media/generaltransform.md) object returned by this method can be cast to a derived type, [Transform](../windows.ui.xaml.media/transform.md), but all the methods you need are defined by [GeneralTransform](../windows.ui.xaml.media/generaltransform.md). You can't cast to [TranslateTransform](../windows.ui.xaml.media/translatetransform.md) even though you might expect that the transform result would be a translation.
     * @param {UIElement} visual_ The object to compare to the current object for purposes of obtaining the transform.
     * If this parameter is null, then the root of the XAML tree is used.
     * @returns {GeneralTransform} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.transformtovisual
     */
    TransformToVisual(visual_) {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.TransformToVisual(visual_)
    }

    /**
     * Invalidates the measurement state (layout) for a [UIElement](uielement.md).
     * @remarks
     * [UpdateLayout](uielement_updatelayout_1243658106.md) is basically equivalent to calling InvalidateMeasure and [InvalidateArrange](uielement_invalidatearrange_2012947484.md) in sequence.
     * 
     * Layout updates can be forced by app code rather than relying on the built-in layout system behavior. However, that is not generally recommended. Calling [InvalidateArrange](uielement_invalidatearrange_2012947484.md), InvalidateMeasure or [UpdateLayout](uielement_updatelayout_1243658106.md) is usually unnecessary and can cause poor performance if overused. In many situations where app code might be changing layout properties, the layout system will probably already be processing updates asynchronously. The layout system also has optimizations for dealing with cascades of layout changes through parent-child relationships, and forcing layout with app code can work against such optimizations. Nevertheless, it's possible that layout situations exist in more complicated scenarios where forcing layout is the best option for resolving a timing issue or other issue with layout. Just use it deliberately and sparingly.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.invalidatemeasure
     */
    InvalidateMeasure() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.InvalidateMeasure()
    }

    /**
     * Invalidates the arrange state (layout) for a [UIElement](uielement.md). After the invalidation, the [UIElement](uielement.md) will have its layout updated, which will occur asynchronously.
     * @remarks
     * Controls that maintain their own orientation property might call InvalidateArrange when that orientation changes, as a way to reconstruct the layout for the new orientation. InvalidateArrange might also be called from within custom layout logic in cases such as when available size isn't adequate and the logic allows for an alternate layout strategy that uses available size differently.
     * 
     * [UpdateLayout](uielement_updatelayout_1243658106.md) is basically equivalent to calling [InvalidateMeasure](uielement_invalidatemeasure_969784920.md) and InvalidateArrange in sequence.
     * 
     * Layout updates can be forced by app code rather than relying on the built-in layout system behavior. However, that is not generally recommended. Calling InvalidateArrange, [InvalidateMeasure](uielement_invalidatemeasure_969784920.md) or [UpdateLayout](uielement_updatelayout_1243658106.md) is usually unnecessary and can cause poor performance if overused. In many situations where app code might be changing layout properties, the layout system will probably already be processing updates asynchronously. The layout system also has optimizations for dealing with cascades of layout changes through parent-child relationships, and forcing layout with app code can work against such optimizations. Nevertheless, it's possible that layout situations exist in more complicated scenarios where forcing layout is the best option for resolving a timing issue or other issue with layout. Just use it deliberately and sparingly.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.invalidatearrange
     */
    InvalidateArrange() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.InvalidateArrange()
    }

    /**
     * Ensures that all positions of child objects of a [UIElement](uielement.md) are properly updated for layout.
     * @remarks
     * UpdateLayout is basically equivalent to calling [InvalidateMeasure](uielement_invalidatemeasure_969784920.md) and [InvalidateArrange](uielement_invalidatearrange_2012947484.md) in sequence.
     * 
     * Layout updates can be forced by app code rather than relying on the built-in layout system behavior by using the UpdateLayout method. However, that is not generally recommended. It is usually unnecessary and can cause poor performance if overused. In many situations where calling UpdateLayout from app code might be appropriate because of changes to properties, the layout system will probably already be processing updates. The layout system also has optimizations for dealing with cascades of layout changes through parent-child relationships, and calling UpdateLayout can work against such optimizations. Nevertheless, it's possible that layout situations exist in more complicated scenarios where calling UpdateLayout is the best option for resolving a timing issue or other issue with layout. Just use it deliberately and sparingly. In the cases where you do need to call UpdateLayout you're probably going to call it just after calling `Children.Add` on some collection of child elements of a common layout parent, then calling UpdateLayout on that parent to make the layout system recognize the new added child.
     * 
     * One scenario for UpdateLayout is when you have linked containers like [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) and [RichTextBlockOverflow](../windows.ui.xaml.controls/richtextblockoverflow.md), you've made run-time changes to the content, and you want to make sure that operations not specifically tied to displaying the UI have a chance to run the layout and trigger the content rebalance between the linked containers. For example, you might want to do this to prepare a layout for printing. For an example of this scenario, see the #5 scenario in [Print sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/Printing).
     * 
     * 
     * 
     * > [!TIP]
     * > If you have a scenario where you use data binding to UI and you aren't seeing the layout reflect updates in your data source collections, calling UpdateLayout probably isn't going to help. It's more likely that you have issues with your binding declarations, the data context, or with the **INotifyPropertyChanged** or **INotifyCollectionChanged** support in your data source.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.updatelayout
     */
    UpdateLayout() {
        if (!this.HasProp("__IUIElement")) {
            if ((queryResult := this.QueryInterface(IUIElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement := IUIElement(outPtr)
        }

        return this.__IUIElement.UpdateLayout()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompositeMode() {
        if (!this.HasProp("__IUIElement2")) {
            if ((queryResult := this.QueryInterface(IUIElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement2 := IUIElement2(outPtr)
        }

        return this.__IUIElement2.get_CompositeMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CompositeMode(value) {
        if (!this.HasProp("__IUIElement2")) {
            if ((queryResult := this.QueryInterface(IUIElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement2 := IUIElement2(outPtr)
        }

        return this.__IUIElement2.put_CompositeMode(value)
    }

    /**
     * Cancels ongoing direct manipulation processing (system-defined panning/zooming) on any [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) parent that contains the current [UIElement](uielement.md).
     * @remarks
     * You might call this method if you want the target [UIElement](uielement.md) to be able to process ongoing manipulations through the lower-level pointer events ([PointerPressed](uielement_pointerpressed.md), [PointerMoved](uielement_pointermoved.md) and so on). By default, if the target [UIElement](uielement.md) is contained in a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md), that [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) parent would handle translation manipulations directly at the system level, treating them as pan or zoom. Manipulation handling by the [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) parent prevents the contained [UIElement](uielement.md) from receiving the pointer events (they would be marked as handled). Call CancelDirectManipulations to override this default behavior for an ongoing manipulation, and then you'll be able to handle manipulations at a non-system level for the individual [UIElement](uielement.md) target.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.canceldirectmanipulations
     */
    CancelDirectManipulations() {
        if (!this.HasProp("__IUIElement2")) {
            if ((queryResult := this.QueryInterface(IUIElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement2 := IUIElement2(outPtr)
        }

        return this.__IUIElement2.CancelDirectManipulations()
    }

    /**
     * 
     * @returns {Transform3D} 
     */
    get_Transform3D() {
        if (!this.HasProp("__IUIElement3")) {
            if ((queryResult := this.QueryInterface(IUIElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement3 := IUIElement3(outPtr)
        }

        return this.__IUIElement3.get_Transform3D()
    }

    /**
     * 
     * @param {Transform3D} value 
     * @returns {HRESULT} 
     */
    put_Transform3D(value) {
        if (!this.HasProp("__IUIElement3")) {
            if ((queryResult := this.QueryInterface(IUIElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement3 := IUIElement3(outPtr)
        }

        return this.__IUIElement3.put_Transform3D(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDrag() {
        if (!this.HasProp("__IUIElement3")) {
            if ((queryResult := this.QueryInterface(IUIElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement3 := IUIElement3(outPtr)
        }

        return this.__IUIElement3.get_CanDrag()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanDrag(value) {
        if (!this.HasProp("__IUIElement3")) {
            if ((queryResult := this.QueryInterface(IUIElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement3 := IUIElement3(outPtr)
        }

        return this.__IUIElement3.put_CanDrag(value)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, DragStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragStarting(handler) {
        if (!this.HasProp("__IUIElement3")) {
            if ((queryResult := this.QueryInterface(IUIElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement3 := IUIElement3(outPtr)
        }

        return this.__IUIElement3.add_DragStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragStarting(token) {
        if (!this.HasProp("__IUIElement3")) {
            if ((queryResult := this.QueryInterface(IUIElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement3 := IUIElement3(outPtr)
        }

        return this.__IUIElement3.remove_DragStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, DropCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DropCompleted(handler) {
        if (!this.HasProp("__IUIElement3")) {
            if ((queryResult := this.QueryInterface(IUIElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement3 := IUIElement3(outPtr)
        }

        return this.__IUIElement3.add_DropCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DropCompleted(token) {
        if (!this.HasProp("__IUIElement3")) {
            if ((queryResult := this.QueryInterface(IUIElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement3 := IUIElement3(outPtr)
        }

        return this.__IUIElement3.remove_DropCompleted(token)
    }

    /**
     * Initiates a drag-and-drop operation.
     * @remarks
     * If you implement custom gesture detection to initiate a drag operation, you can call the StartDragAsync method to programmatically initiate a drag operation on any [UIElement](uielement.md). Calling this method results in the [DragStarting](uielement_dragstarting.md) event being raised. Handle the [DragStarting](uielement_dragstarting.md) event to specify other properties of the operation, such as the data package and drag visual.
     * 
     * The *pointerPoint* parameter is the point at which the user interacts with the screen using an input device (touch, mouse, or pen). The drag visual that is shown during the drag operation is attached to the pointer indicated in the caller-provided [PointerPoint](../windows.ui.input/pointerpoint.md).
     * 
     * The [DataPackageOperation](../windows.applicationmodel.datatransfer/datapackageoperation.md) returned by this method indicates whether the drag operation is a move, copy, or link; and whether or not it's a success. This is the same value that's provided by the [DropResult](dropcompletedeventargs_dropresult.md) property in the [DropCompleted](uielement_dropcompleted.md) event args.
     * 
     * 
     * <!--Does it matter if CanDrag is false? (spec: Setting the CanDrag property on a UIElement allows the user to initiate a drag operation.  The DragAsync method similarly allows the application to initiate a drag operation...)-->
     * @param {PointerPoint} pointerPoint_ The coordinates of the pointer where the user interacts with the screen, and where the drag visual is attached.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.startdragasync
     */
    StartDragAsync(pointerPoint_) {
        if (!this.HasProp("__IUIElement3")) {
            if ((queryResult := this.QueryInterface(IUIElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement3 := IUIElement3(outPtr)
        }

        return this.__IUIElement3.StartDragAsync(pointerPoint_)
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_ContextFlyout() {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.get_ContextFlyout()
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_ContextFlyout(value) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.put_ContextFlyout(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExitDisplayModeOnAccessKeyInvoked() {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.get_ExitDisplayModeOnAccessKeyInvoked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExitDisplayModeOnAccessKeyInvoked(value) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.put_ExitDisplayModeOnAccessKeyInvoked(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAccessKeyScope() {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.get_IsAccessKeyScope()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAccessKeyScope(value) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.put_IsAccessKeyScope(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_AccessKeyScopeOwner() {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.get_AccessKeyScopeOwner()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_AccessKeyScopeOwner(value) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.put_AccessKeyScopeOwner(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccessKey() {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.get_AccessKey()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AccessKey(value) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.put_AccessKey(value)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, ContextRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextRequested(handler) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.add_ContextRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContextRequested(token) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.remove_ContextRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, RoutedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextCanceled(handler) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.add_ContextCanceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContextCanceled(token) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.remove_ContextCanceled(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, AccessKeyDisplayRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyDisplayRequested(handler) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.add_AccessKeyDisplayRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AccessKeyDisplayRequested(token) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.remove_AccessKeyDisplayRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, AccessKeyDisplayDismissedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyDisplayDismissed(handler) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.add_AccessKeyDisplayDismissed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AccessKeyDisplayDismissed(token) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.remove_AccessKeyDisplayDismissed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, AccessKeyInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyInvoked(handler) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.add_AccessKeyInvoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AccessKeyInvoked(token) {
        if (!this.HasProp("__IUIElement4")) {
            if ((queryResult := this.QueryInterface(IUIElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement4 := IUIElement4(outPtr)
        }

        return this.__IUIElement4.remove_AccessKeyInvoked(token)
    }

    /**
     * 
     * @returns {IVector<XamlLight>} 
     */
    get_Lights() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_Lights()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyTipPlacementMode() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_KeyTipPlacementMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_KeyTipPlacementMode(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_KeyTipPlacementMode(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KeyTipHorizontalOffset() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_KeyTipHorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_KeyTipHorizontalOffset(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_KeyTipHorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KeyTipVerticalOffset() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_KeyTipVerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_KeyTipVerticalOffset(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_KeyTipVerticalOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusKeyboardNavigation() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_XYFocusKeyboardNavigation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusKeyboardNavigation(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_XYFocusKeyboardNavigation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusUpNavigationStrategy() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_XYFocusUpNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusUpNavigationStrategy(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_XYFocusUpNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusDownNavigationStrategy() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_XYFocusDownNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusDownNavigationStrategy(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_XYFocusDownNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusLeftNavigationStrategy() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_XYFocusLeftNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusLeftNavigationStrategy(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_XYFocusLeftNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusRightNavigationStrategy() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_XYFocusRightNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusRightNavigationStrategy(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_XYFocusRightNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighContrastAdjustment() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_HighContrastAdjustment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HighContrastAdjustment(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_HighContrastAdjustment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TabFocusNavigation() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.get_TabFocusNavigation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TabFocusNavigation(value) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.put_TabFocusNavigation(value)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, GettingFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GettingFocus(handler) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.add_GettingFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GettingFocus(token) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.remove_GettingFocus(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, LosingFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LosingFocus(handler) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.add_LosingFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LosingFocus(token) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.remove_LosingFocus(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, NoFocusCandidateFoundEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NoFocusCandidateFound(handler) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.add_NoFocusCandidateFound(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NoFocusCandidateFound(token) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.remove_NoFocusCandidateFound(token)
    }

    /**
     * Initiates a request to the XAML framework to bring the element into view within any scrollable regions it is contained within.
     * @remarks
     * The request is fulfilled asynchronously as the framework initiates changes to the view of [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md)s that contain the element.  The [HorizontalOffset](../windows.ui.xaml.controls/scrollviewer_horizontaloffset.md) and [VerticalOffset](../windows.ui.xaml.controls/scrollviewer_verticaloffset.md) of those ScrollViewers may not be updated immediately upon returning from the call.  However, in the process of servicing the request a ScrollViewer's [ViewChanging](../windows.ui.xaml.controls/scrollviewer_viewchanging.md) and [ViewChanged](../windows.ui.xaml.controls/scrollviewer_viewchanged.md) events will fire.
     * If you use the signature that does not specify any options, then the entire element size (its [RenderSize](uielement_rendersize.md)) will be made visible and any changes to the viewports will be animated.
     * The StartBringIntoView method does not transmit any information about success or failure.  Reasons for failure can include the element settings, such as [Visibility](uielement_visibility.md) being some value other than **Visible**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.startbringintoview
     */
    StartBringIntoView() {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.StartBringIntoView()
    }

    /**
     * Initiates a request to the XAML framework to bring the element into view using the specified options.
     * @param {BringIntoViewOptions} options An instance of [BringIntoViewOptions](bringintoviewoptions.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.startbringintoview
     */
    StartBringIntoViewWithOptions(options) {
        if (!this.HasProp("__IUIElement5")) {
            if ((queryResult := this.QueryInterface(IUIElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement5 := IUIElement5(outPtr)
        }

        return this.__IUIElement5.StartBringIntoViewWithOptions(options)
    }

    /**
     * 
     * @returns {IVector<KeyboardAccelerator>} 
     */
    get_KeyboardAccelerators() {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.get_KeyboardAccelerators()
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, CharacterReceivedRoutedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CharacterReceived(handler) {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.add_CharacterReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CharacterReceived(token) {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.remove_CharacterReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, ProcessKeyboardAcceleratorEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProcessKeyboardAccelerators(handler) {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.add_ProcessKeyboardAccelerators(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProcessKeyboardAccelerators(token) {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.remove_ProcessKeyboardAccelerators(token)
    }

    /**
     * 
     * @param {KeyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PreviewKeyDown(handler) {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.add_PreviewKeyDown(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PreviewKeyDown(token) {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.remove_PreviewKeyDown(token)
    }

    /**
     * 
     * @param {KeyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PreviewKeyUp(handler) {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.add_PreviewKeyUp(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PreviewKeyUp(token) {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.remove_PreviewKeyUp(token)
    }

    /**
     * Attempts to invoke a [keyboard shortcut (or accelerator)](../windows.ui.xaml.input/keyboardaccelerator.md) by searching the entire visual tree of the UIElement for the shortcut.
     * @remarks
     * Call this method in your [OnProcessKeyboardAccelerators](uielement_onprocesskeyboardaccelerators_1771064317.md) override when an accelerator is invoked and you want to influence the default accelerator handling.
     * @param {ProcessKeyboardAcceleratorEventArgs} args The [ProcessKeyboardAcceleratorEventArgs](../windows.ui.xaml.input/processkeyboardacceleratoreventargs.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.tryinvokekeyboardaccelerator
     */
    TryInvokeKeyboardAccelerator(args) {
        if (!this.HasProp("__IUIElement7")) {
            if ((queryResult := this.QueryInterface(IUIElement7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement7 := IUIElement7(outPtr)
        }

        return this.__IUIElement7.TryInvokeKeyboardAccelerator(args)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_KeyTipTarget() {
        if (!this.HasProp("__IUIElement8")) {
            if ((queryResult := this.QueryInterface(IUIElement8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement8 := IUIElement8(outPtr)
        }

        return this.__IUIElement8.get_KeyTipTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_KeyTipTarget(value) {
        if (!this.HasProp("__IUIElement8")) {
            if ((queryResult := this.QueryInterface(IUIElement8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement8 := IUIElement8(outPtr)
        }

        return this.__IUIElement8.put_KeyTipTarget(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_KeyboardAcceleratorPlacementTarget() {
        if (!this.HasProp("__IUIElement8")) {
            if ((queryResult := this.QueryInterface(IUIElement8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement8 := IUIElement8(outPtr)
        }

        return this.__IUIElement8.get_KeyboardAcceleratorPlacementTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_KeyboardAcceleratorPlacementTarget(value) {
        if (!this.HasProp("__IUIElement8")) {
            if ((queryResult := this.QueryInterface(IUIElement8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement8 := IUIElement8(outPtr)
        }

        return this.__IUIElement8.put_KeyboardAcceleratorPlacementTarget(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyboardAcceleratorPlacementMode() {
        if (!this.HasProp("__IUIElement8")) {
            if ((queryResult := this.QueryInterface(IUIElement8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement8 := IUIElement8(outPtr)
        }

        return this.__IUIElement8.get_KeyboardAcceleratorPlacementMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_KeyboardAcceleratorPlacementMode(value) {
        if (!this.HasProp("__IUIElement8")) {
            if ((queryResult := this.QueryInterface(IUIElement8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement8 := IUIElement8(outPtr)
        }

        return this.__IUIElement8.put_KeyboardAcceleratorPlacementMode(value)
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, BringIntoViewRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BringIntoViewRequested(handler) {
        if (!this.HasProp("__IUIElement8")) {
            if ((queryResult := this.QueryInterface(IUIElement8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement8 := IUIElement8(outPtr)
        }

        return this.__IUIElement8.add_BringIntoViewRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BringIntoViewRequested(token) {
        if (!this.HasProp("__IUIElement8")) {
            if ((queryResult := this.QueryInterface(IUIElement8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement8 := IUIElement8(outPtr)
        }

        return this.__IUIElement8.remove_BringIntoViewRequested(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanBeScrollAnchor() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_CanBeScrollAnchor()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanBeScrollAnchor(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_CanBeScrollAnchor(value)
    }

    /**
     * 
     * @returns {ScalarTransition} 
     */
    get_OpacityTransition() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_OpacityTransition()
    }

    /**
     * 
     * @param {ScalarTransition} value 
     * @returns {HRESULT} 
     */
    put_OpacityTransition(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_OpacityTransition(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Translation() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_Translation()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Translation(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_Translation(value)
    }

    /**
     * 
     * @returns {Vector3Transition} 
     */
    get_TranslationTransition() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_TranslationTransition()
    }

    /**
     * 
     * @param {Vector3Transition} value 
     * @returns {HRESULT} 
     */
    put_TranslationTransition(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_TranslationTransition(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Rotation() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_Rotation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Rotation(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_Rotation(value)
    }

    /**
     * 
     * @returns {ScalarTransition} 
     */
    get_RotationTransition() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_RotationTransition()
    }

    /**
     * 
     * @param {ScalarTransition} value 
     * @returns {HRESULT} 
     */
    put_RotationTransition(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_RotationTransition(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Scale() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_Scale()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_Scale(value)
    }

    /**
     * 
     * @returns {Vector3Transition} 
     */
    get_ScaleTransition() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_ScaleTransition()
    }

    /**
     * 
     * @param {Vector3Transition} value 
     * @returns {HRESULT} 
     */
    put_ScaleTransition(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_ScaleTransition(value)
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_TransformMatrix() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_TransformMatrix()
    }

    /**
     * 
     * @param {Matrix4x4} value 
     * @returns {HRESULT} 
     */
    put_TransformMatrix(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_TransformMatrix(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_CenterPoint() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_CenterPoint()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_CenterPoint(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_CenterPoint(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RotationAxis() {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.get_RotationAxis()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_RotationAxis(value) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.put_RotationAxis(value)
    }

    /**
     * Begins the specified animation on the element.
     * @param {ICompositionAnimationBase} animation The animation to start.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.startanimation
     */
    StartAnimation(animation) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.StartAnimation(animation)
    }

    /**
     * Stops the specified animation on the element.
     * @param {ICompositionAnimationBase} animation The animation to stop.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.stopanimation
     */
    StopAnimation(animation) {
        if (!this.HasProp("__IUIElement9")) {
            if ((queryResult := this.QueryInterface(IUIElement9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement9 := IUIElement9(outPtr)
        }

        return this.__IUIElement9.StopAnimation(animation)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_ActualOffset() {
        if (!this.HasProp("__IUIElement10")) {
            if ((queryResult := this.QueryInterface(IUIElement10.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement10 := IUIElement10(outPtr)
        }

        return this.__IUIElement10.get_ActualOffset()
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_ActualSize() {
        if (!this.HasProp("__IUIElement10")) {
            if ((queryResult := this.QueryInterface(IUIElement10.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement10 := IUIElement10(outPtr)
        }

        return this.__IUIElement10.get_ActualSize()
    }

    /**
     * 
     * @returns {XamlRoot} 
     */
    get_XamlRoot() {
        if (!this.HasProp("__IUIElement10")) {
            if ((queryResult := this.QueryInterface(IUIElement10.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement10 := IUIElement10(outPtr)
        }

        return this.__IUIElement10.get_XamlRoot()
    }

    /**
     * 
     * @param {XamlRoot} value 
     * @returns {HRESULT} 
     */
    put_XamlRoot(value) {
        if (!this.HasProp("__IUIElement10")) {
            if ((queryResult := this.QueryInterface(IUIElement10.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement10 := IUIElement10(outPtr)
        }

        return this.__IUIElement10.put_XamlRoot(value)
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        if (!this.HasProp("__IUIElement10")) {
            if ((queryResult := this.QueryInterface(IUIElement10.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement10 := IUIElement10(outPtr)
        }

        return this.__IUIElement10.get_UIContext()
    }

    /**
     * 
     * @returns {Shadow} 
     */
    get_Shadow() {
        if (!this.HasProp("__IUIElement10")) {
            if ((queryResult := this.QueryInterface(IUIElement10.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement10 := IUIElement10(outPtr)
        }

        return this.__IUIElement10.get_Shadow()
    }

    /**
     * 
     * @param {Shadow} value 
     * @returns {HRESULT} 
     */
    put_Shadow(value) {
        if (!this.HasProp("__IUIElement10")) {
            if ((queryResult := this.QueryInterface(IUIElement10.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElement10 := IUIElement10(outPtr)
        }

        return this.__IUIElement10.put_Shadow(value)
    }

    /**
     * When implemented in a derived class, returns class-specific [AutomationPeer](../windows.ui.xaml.automation.peers/automationpeer.md) implementations for the Microsoft UI Automation infrastructure.
     * @remarks
     * For more info on the purpose of an automation peer and why you might need to define a class-specific [AutomationPeer](../windows.ui.xaml.automation.peers/automationpeer.md) class, see [Custom automation peers](/windows/uwp/accessibility/custom-automation-peers).
     * 
     * You should override this method in a custom class where you want to supply a custom automation peer for Microsoft UI Automation, rather than the default peer that is referenced by the default OnCreateAutomationPeer implementation. How you define a custom peer for your custom control depends on your control's accessibility requirements , its UI contract, and its behavior. For more info on why you might want to define a new peer, see [Custom automation peers](/windows/uwp/accessibility/custom-automation-peers). 
     * 
     * > [!NOTE]
     * >
     * > **This sample is not maintained and might not compile.**
     * >
     * > See [XAML accessibility sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/XAML%20accessibility%20sample) for an implementation of OnCreateAutomationPeer that defines the custom peer returned by OnCreateAutomationPeer (the peer implementation is part of Scenario 3 in this sample). 
     * 
     * We recommend that the OnCreateAutomationPeer implementation should do nothing more than initialize a new instance of your custom automation peer, passing the calling control as owner, and return that instance. Do not attempt additional logic in this method. In particular, any logic that could potentially lead to destruction of the [AutomationPeer](../windows.ui.xaml.automation.peers/automationpeer.md) within the same call may result in unexpected runtime behavior.
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.oncreateautomationpeer
     */
    OnCreateAutomationPeer() {
        if (!this.HasProp("__IUIElementOverrides")) {
            if ((queryResult := this.QueryInterface(IUIElementOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElementOverrides := IUIElementOverrides(outPtr)
        }

        return this.__IUIElementOverrides.OnCreateAutomationPeer()
    }

    /**
     * Override this method to implement how layout and logic should behave when items are removed from a class-specific content or children property.
     * @remarks
     * [UIElement](uielement.md) does not define any of the content model properties that OnDisconnectVisualChildren might act upon. Such properties are introduced deeper in an inheritance, for example at the [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) level.
     * 
     * [FrameworkElement](frameworkelement.md) uses an OnDisconnectVisualChildren override to clear values from [DataContext](frameworkelement_datacontext.md) and [Tag](frameworkelement_tag.md). In general, if you override this method you should always call the base implementation so that the framework-intentional behavior that acts on OnDisconnectVisualChildren can be preserved.
     * 
     * [VisualTreeHelper.DisconnectChildrenRecursive](../windows.ui.xaml.media/visualtreehelper_disconnectchildrenrecursive_1375370588.md) is a similar static helper API that can be called by app code.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.ondisconnectvisualchildren
     */
    OnDisconnectVisualChildren() {
        if (!this.HasProp("__IUIElementOverrides")) {
            if ((queryResult := this.QueryInterface(IUIElementOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElementOverrides := IUIElementOverrides(outPtr)
        }

        return this.__IUIElementOverrides.OnDisconnectVisualChildren()
    }

    /**
     * Enables a [UIElement](uielement.md) subclass to expose child elements that assist with resolving touch targeting.
     * @remarks
     * Points in the list are in descending z-order: topmost in the rendering stack appears first in the list.
     * 
     * [FindElementsInHostCoordinates](../windows.ui.xaml.media/visualtreehelper_findelementsinhostcoordinates_1478853318.md) is a similar static-class helper method that is also used for hit testing and general object tree examination. However, FindSubElementsForTouchTargeting adds the refinement of a [Rect](../windows.foundation/rect.md) input to use for touch tolerance.
     * 
     * If you are programming using C# or Microsoft Visual Basic, the return value type of this method is projected as an [IEnumerable](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) generic collection that contains [UIElement](uielement.md) items. If you are programming using Visual C++ component extensions (C++/CX), the return type of this method is [IIterable<UIElement>](../windows.foundation.collections/iiterable_1.md).
     * @param {POINT} point_ The point being touched.
     * @param {RECT} boundingRect The bounds used for touch tolerance.
     * @returns {IIterable<IIterable<POINT>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.findsubelementsfortouchtargeting
     */
    FindSubElementsForTouchTargeting(point_, boundingRect) {
        if (!this.HasProp("__IUIElementOverrides")) {
            if ((queryResult := this.QueryInterface(IUIElementOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElementOverrides := IUIElementOverrides(outPtr)
        }

        return this.__IUIElementOverrides.FindSubElementsForTouchTargeting(point_, boundingRect)
    }

    /**
     * Enables a [UIElement](uielement.md) subclass to expose child elements that take part in Tab focus.
     * @remarks
     * The default behavior for this method is to return the UIElement's collection of child elements.
     * 
     * When Tab is processed to move focus, the framework’s focus management calls the **GetChildrenInTabFocusOrder** override. The resulting list of DependencyObjects is used to process Tab focus instead of the element's default collection of children.
     * @returns {IIterable<DependencyObject>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.getchildrenintabfocusorder
     */
    GetChildrenInTabFocusOrder() {
        if (!this.HasProp("__IUIElementOverrides7")) {
            if ((queryResult := this.QueryInterface(IUIElementOverrides7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElementOverrides7 := IUIElementOverrides7(outPtr)
        }

        return this.__IUIElementOverrides7.GetChildrenInTabFocusOrder()
    }

    /**
     * Called just before a [keyboard shortcut (or accelerator)](../windows.ui.xaml.input/keyboardaccelerator.md) is processed in your app. Invoked whenever application code or internal processes call [ProcessKeyboardAccelerators](uielement_processkeyboardaccelerators.md). Override this method to influence the default accelerator handling.
     * @param {ProcessKeyboardAcceleratorEventArgs} args The [ProcessKeyboardAcceleratorEventArgs](../windows.ui.xaml.input/processkeyboardacceleratoreventargs.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.onprocesskeyboardaccelerators
     */
    OnProcessKeyboardAccelerators(args) {
        if (!this.HasProp("__IUIElementOverrides7")) {
            if ((queryResult := this.QueryInterface(IUIElementOverrides7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElementOverrides7 := IUIElementOverrides7(outPtr)
        }

        return this.__IUIElementOverrides7.OnProcessKeyboardAccelerators(args)
    }

    /**
     * Called when a [keyboard shortcut (or accelerator)](../windows.ui.xaml.input/keyboardaccelerator.md) is processed in your app. Override this method to handle how your app responds when a keyboard accelerator is invoked.
     * @param {KeyboardAcceleratorInvokedEventArgs} args The [KeyboardAcceleratorInvokedEventArgs](../windows.ui.xaml.input/keyboardacceleratorinvokedeventargs.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.onkeyboardacceleratorinvoked
     */
    OnKeyboardAcceleratorInvoked(args) {
        if (!this.HasProp("__IUIElementOverrides8")) {
            if ((queryResult := this.QueryInterface(IUIElementOverrides8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElementOverrides8 := IUIElementOverrides8(outPtr)
        }

        return this.__IUIElementOverrides8.OnKeyboardAcceleratorInvoked(args)
    }

    /**
     * Called before the [BringIntoViewRequested](uielement_bringintoviewrequested.md) event occurs.
     * @remarks
     * As it's implemented directly on [UIElement](uielement.md), OnBringIntoViewRequested has an empty implementation. But, an ancestor in an element's hierarchy may have provided an implementation such as a base scrolling control. You won't be able to see this implementation because it's internal native code. Control code or your code probably shouldn't be suppressing the event, because it's a common pattern to let the event bubble to the root visual so that any scrolling control in the element tree will have an opportunity to react to the request.
     * @param {BringIntoViewRequestedEventArgs} e The data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.onbringintoviewrequested
     */
    OnBringIntoViewRequested(e) {
        if (!this.HasProp("__IUIElementOverrides8")) {
            if ((queryResult := this.QueryInterface(IUIElementOverrides8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElementOverrides8 := IUIElementOverrides8(outPtr)
        }

        return this.__IUIElementOverrides8.OnBringIntoViewRequested(e)
    }

    /**
     * When overridden in a derived class, defines a property that can be animated.
     * @param {HSTRING} propertyName The property that can be animated.
     * @param {AnimationPropertyInfo} animationPropertyInfo_ Information about the property to be animated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.populatepropertyinfooverride
     */
    PopulatePropertyInfoOverride(propertyName, animationPropertyInfo_) {
        if (!this.HasProp("__IUIElementOverrides9")) {
            if ((queryResult := this.QueryInterface(IUIElementOverrides9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIElementOverrides9 := IUIElementOverrides9(outPtr)
        }

        return this.__IUIElementOverrides9.PopulatePropertyInfoOverride(propertyName, animationPropertyInfo_)
    }

    /**
     * Defines a property that can be animated.
     * @param {HSTRING} propertyName The property that can be animated.
     * @param {AnimationPropertyInfo} propertyInfo Information about the property to be animated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.uielement.populatepropertyinfo
     */
    PopulatePropertyInfo(propertyName, propertyInfo) {
        if (!this.HasProp("__IAnimationObject")) {
            if ((queryResult := this.QueryInterface(IAnimationObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationObject := IAnimationObject(outPtr)
        }

        return this.__IAnimationObject.PopulatePropertyInfo(propertyName, propertyInfo)
    }

;@endregion Instance Methods
}
