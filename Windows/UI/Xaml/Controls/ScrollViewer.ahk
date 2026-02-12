#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IScrollViewer.ahk
#Include .\IScrollViewer2.ahk
#Include .\IScrollViewer3.ahk
#Include .\IScrollViewer4.ahk
#Include .\IScrollAnchorProvider.ahk
#Include .\IScrollViewerStatics4.ahk
#Include .\IScrollViewerStatics.ahk
#Include .\IScrollViewerStatics2.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ScrollViewerViewChangedEventArgs.ahk
#Include .\ScrollViewerViewChangingEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ScrollViewer.ahk
#Include .\AnchorRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a scrollable area that can contain other visible elements.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Scroll viewer controls](/windows/uwp/design/controls-and-patterns/scroll-controls).
 * 
 * ScrollViewer is a container control that lets the user pan and zoom its content.
 * 
 * <img alt="Scroll viewer control" src="images/controls/ScrollViewerBasic.png" />
 * 
 * A ScrollViewer enables content to be displayed in a smaller area than its actual size. When the content of the ScrollViewer is not entirely visible, the ScrollViewer displays scrollbars that the user can use to move the content areas that is visible. The area that includes all of the content of the ScrollViewer is the extent. The visible area of the content is the viewport.
 * 
 * It's typical for a ScrollViewer control to exist as a composite part of other controls. A ScrollViewer part along with the [ScrollContentPresenter](scrollcontentpresenter.md) class for support will display a viewport along with scrollbars only when the host control's layout space is being constrained smaller than the expanded content size. This is often the case for lists, so [ListView](listview.md) and [GridView](gridview.md) templates always include a ScrollViewer. [TextBox](textbox.md) and [RichEditBox](richeditbox.md) also include a ScrollViewer in their templates.
 * 
 * When a ScrollViewer part in a control exists, the host control often has built-in event handling for certain input events and manipulations that enable the content to scroll. For example, a [GridView](gridview.md) interprets a swipe gesture and this causes the content to scroll horizontally. The input events and raw manipulations that the host control receives are considered handled by the control, and lower-level events such as [PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md) won't be raised and won't bubble to any parent containers either. You can change some of the built-in control handling by overriding a control class and the **On**_Event_ virtual methods for events, or by retemplating the control. But in either case it's not trivial to reproduce the original default behavior, which is typically there so that the control reacts in expected ways to events and to a user's input actions and gestures. So you should consider whether you really need that input event to fire. You might want to investigate whether there are other input events or gestures that are not being control-handled, and use those in your app or control interaction design.
 * 
 * To make it possible for controls that include a ScrollViewer to influence some of the behavior and properties that are from within the ScrollViewer part, ScrollViewer defines a number of XAML attached properties that can be set in styles and used in template bindings.
 * 
 * If you need to handle pointer events for a [UIElement](../windows.ui.xaml/uielement.md) in a scrollable view (such as a ScrollViewer), you must explicitly disable support for manipulation events on the element in the view by calling [UIElement.CancelDirectmanipulation()](../windows.ui.xaml/uielement_canceldirectmanipulations_1164631120.md). To re-enable manipulation events in the view, call [UIElement.TryStartDirectManipulation()](../windows.ui.xaml/uielement_trystartdirectmanipulation_1983346775.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ScrollViewer extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollViewer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollViewer.IID

    /**
     * Identifies the [ReduceViewportForCoreInputViewOcclusions](scrollviewer_reduceviewportforcoreinputviewocclusions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.reduceviewportforcoreinputviewocclusionsproperty
     * @type {DependencyProperty} 
     */
    static ReduceViewportForCoreInputViewOcclusionsProperty {
        get => ScrollViewer.get_ReduceViewportForCoreInputViewOcclusionsProperty()
    }

    /**
     * Identifies the [HorizontalAnchorRatio](scrollviewer_horizontalanchorratio.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalanchorratioproperty
     * @type {DependencyProperty} 
     */
    static HorizontalAnchorRatioProperty {
        get => ScrollViewer.get_HorizontalAnchorRatioProperty()
    }

    /**
     * Identifies the [VerticalAnchorRatio](scrollviewer_verticalanchorratio.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalanchorratioproperty
     * @type {DependencyProperty} 
     */
    static VerticalAnchorRatioProperty {
        get => ScrollViewer.get_VerticalAnchorRatioProperty()
    }

    /**
     * Identifies the [CanContentRenderOutsideBounds](scrollviewer_cancontentrenderoutsidebounds.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.cancontentrenderoutsideboundsproperty
     * @type {DependencyProperty} 
     */
    static CanContentRenderOutsideBoundsProperty {
        get => ScrollViewer.get_CanContentRenderOutsideBoundsProperty()
    }

    /**
     * Identifies the [HorizontalSnapPointsAlignment](scrollviewer_horizontalsnappointsalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalsnappointsalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalSnapPointsAlignmentProperty {
        get => ScrollViewer.get_HorizontalSnapPointsAlignmentProperty()
    }

    /**
     * Identifies the [VerticalSnapPointsAlignment](scrollviewer_verticalsnappointsalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalsnappointsalignmentproperty
     * @type {DependencyProperty} 
     */
    static VerticalSnapPointsAlignmentProperty {
        get => ScrollViewer.get_VerticalSnapPointsAlignmentProperty()
    }

    /**
     * Identifies the [HorizontalSnapPointsType](scrollviewer_horizontalsnappointstype.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalsnappointstypeproperty
     * @type {DependencyProperty} 
     */
    static HorizontalSnapPointsTypeProperty {
        get => ScrollViewer.get_HorizontalSnapPointsTypeProperty()
    }

    /**
     * Identifies the [VerticalSnapPointsType](scrollviewer_verticalsnappointstype.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalsnappointstypeproperty
     * @type {DependencyProperty} 
     */
    static VerticalSnapPointsTypeProperty {
        get => ScrollViewer.get_VerticalSnapPointsTypeProperty()
    }

    /**
     * Identifies the [ZoomSnapPointsType](scrollviewer_zoomsnappointstype.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.zoomsnappointstypeproperty
     * @type {DependencyProperty} 
     */
    static ZoomSnapPointsTypeProperty {
        get => ScrollViewer.get_ZoomSnapPointsTypeProperty()
    }

    /**
     * Identifies the [HorizontalOffset](scrollviewer_horizontaloffset.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static HorizontalOffsetProperty {
        get => ScrollViewer.get_HorizontalOffsetProperty()
    }

    /**
     * Identifies the [ViewportWidth](scrollviewer_viewportwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.viewportwidthproperty
     * @type {DependencyProperty} 
     */
    static ViewportWidthProperty {
        get => ScrollViewer.get_ViewportWidthProperty()
    }

    /**
     * Identifies the [ScrollableWidth](scrollviewer_scrollablewidth.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.scrollablewidthproperty
     * @type {DependencyProperty} 
     */
    static ScrollableWidthProperty {
        get => ScrollViewer.get_ScrollableWidthProperty()
    }

    /**
     * Identifies the [ComputedHorizontalScrollBarVisibility](scrollviewer_computedhorizontalscrollbarvisibility.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.computedhorizontalscrollbarvisibilityproperty
     * @type {DependencyProperty} 
     */
    static ComputedHorizontalScrollBarVisibilityProperty {
        get => ScrollViewer.get_ComputedHorizontalScrollBarVisibilityProperty()
    }

    /**
     * Identifier for the [ExtentWidth](scrollviewer_extentwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.extentwidthproperty
     * @type {DependencyProperty} 
     */
    static ExtentWidthProperty {
        get => ScrollViewer.get_ExtentWidthProperty()
    }

    /**
     * Identifies the [VerticalOffset](scrollviewer_verticaloffset.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static VerticalOffsetProperty {
        get => ScrollViewer.get_VerticalOffsetProperty()
    }

    /**
     * Identifies the [ViewportHeight](scrollviewer_viewportheight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.viewportheightproperty
     * @type {DependencyProperty} 
     */
    static ViewportHeightProperty {
        get => ScrollViewer.get_ViewportHeightProperty()
    }

    /**
     * Identifies the [ScrollableHeight](scrollviewer_scrollableheight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.scrollableheightproperty
     * @type {DependencyProperty} 
     */
    static ScrollableHeightProperty {
        get => ScrollViewer.get_ScrollableHeightProperty()
    }

    /**
     * Identifies the [ComputedVerticalScrollBarVisibility](scrollviewer_computedverticalscrollbarvisibility.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.computedverticalscrollbarvisibilityproperty
     * @type {DependencyProperty} 
     */
    static ComputedVerticalScrollBarVisibilityProperty {
        get => ScrollViewer.get_ComputedVerticalScrollBarVisibilityProperty()
    }

    /**
     * Identifier for the [ExtentHeight](scrollviewer_extentheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.extentheightproperty
     * @type {DependencyProperty} 
     */
    static ExtentHeightProperty {
        get => ScrollViewer.get_ExtentHeightProperty()
    }

    /**
     * Identifies the [MinZoomFactor](scrollviewer_minzoomfactor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.minzoomfactorproperty
     * @type {DependencyProperty} 
     */
    static MinZoomFactorProperty {
        get => ScrollViewer.get_MinZoomFactorProperty()
    }

    /**
     * Identifies the [MaxZoomFactor](scrollviewer_maxzoomfactor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.maxzoomfactorproperty
     * @type {DependencyProperty} 
     */
    static MaxZoomFactorProperty {
        get => ScrollViewer.get_MaxZoomFactorProperty()
    }

    /**
     * Identifies the [ZoomFactor](scrollviewer_zoomfactor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.zoomfactorproperty
     * @type {DependencyProperty} 
     */
    static ZoomFactorProperty {
        get => ScrollViewer.get_ZoomFactorProperty()
    }

    /**
     * Identifies the [ZoomSnapPoints](scrollviewer_zoomsnappoints.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.zoomsnappointsproperty
     * @type {DependencyProperty} 
     */
    static ZoomSnapPointsProperty {
        get => ScrollViewer.get_ZoomSnapPointsProperty()
    }

    /**
     * Identifies the [HorizontalScrollBarVisibility](scrollviewer_horizontalscrollbarvisibility.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalscrollbarvisibilityproperty
     * @type {DependencyProperty} 
     */
    static HorizontalScrollBarVisibilityProperty {
        get => ScrollViewer.get_HorizontalScrollBarVisibilityProperty()
    }

    /**
     * Identifies the [VerticalScrollBarVisibility](scrollviewer_verticalscrollbarvisibility.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalscrollbarvisibilityproperty
     * @type {DependencyProperty} 
     */
    static VerticalScrollBarVisibilityProperty {
        get => ScrollViewer.get_VerticalScrollBarVisibilityProperty()
    }

    /**
     * Identifies the [IsHorizontalRailEnabled](scrollviewer_ishorizontalrailenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.ishorizontalrailenabledproperty
     * @type {DependencyProperty} 
     */
    static IsHorizontalRailEnabledProperty {
        get => ScrollViewer.get_IsHorizontalRailEnabledProperty()
    }

    /**
     * Identifies the [IsVerticalRailEnabled](scrollviewer_isverticalrailenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.isverticalrailenabledproperty
     * @type {DependencyProperty} 
     */
    static IsVerticalRailEnabledProperty {
        get => ScrollViewer.get_IsVerticalRailEnabledProperty()
    }

    /**
     * Identifies the [IsHorizontalScrollChainingEnabled](scrollviewer_ishorizontalscrollchainingenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.ishorizontalscrollchainingenabledproperty
     * @type {DependencyProperty} 
     */
    static IsHorizontalScrollChainingEnabledProperty {
        get => ScrollViewer.get_IsHorizontalScrollChainingEnabledProperty()
    }

    /**
     * Identifies the [IsVerticalScrollChainingEnabled](scrollviewer_isverticalscrollchainingenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.isverticalscrollchainingenabledproperty
     * @type {DependencyProperty} 
     */
    static IsVerticalScrollChainingEnabledProperty {
        get => ScrollViewer.get_IsVerticalScrollChainingEnabledProperty()
    }

    /**
     * Identifies the [IsZoomChainingEnabled](scrollviewer_iszoomchainingenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.iszoomchainingenabledproperty
     * @type {DependencyProperty} 
     */
    static IsZoomChainingEnabledProperty {
        get => ScrollViewer.get_IsZoomChainingEnabledProperty()
    }

    /**
     * Identifies the [IsScrollInertiaEnabled](scrollviewer_isscrollinertiaenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.isscrollinertiaenabledproperty
     * @type {DependencyProperty} 
     */
    static IsScrollInertiaEnabledProperty {
        get => ScrollViewer.get_IsScrollInertiaEnabledProperty()
    }

    /**
     * Identifies the [IsZoomInertiaEnabled](scrollviewer_iszoominertiaenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.iszoominertiaenabledproperty
     * @type {DependencyProperty} 
     */
    static IsZoomInertiaEnabledProperty {
        get => ScrollViewer.get_IsZoomInertiaEnabledProperty()
    }

    /**
     * Identifies the [HorizontalScrollMode](scrollviewer_horizontalscrollmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalscrollmodeproperty
     * @type {DependencyProperty} 
     */
    static HorizontalScrollModeProperty {
        get => ScrollViewer.get_HorizontalScrollModeProperty()
    }

    /**
     * Identifies the [VerticalScrollMode](scrollviewer_verticalscrollmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalscrollmodeproperty
     * @type {DependencyProperty} 
     */
    static VerticalScrollModeProperty {
        get => ScrollViewer.get_VerticalScrollModeProperty()
    }

    /**
     * Identifies the [ZoomMode](scrollviewer_zoommode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.zoommodeproperty
     * @type {DependencyProperty} 
     */
    static ZoomModeProperty {
        get => ScrollViewer.get_ZoomModeProperty()
    }

    /**
     * Identifies the [IsDeferredScrollingEnabled](scrollviewer_isdeferredscrollingenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.isdeferredscrollingenabledproperty
     * @type {DependencyProperty} 
     */
    static IsDeferredScrollingEnabledProperty {
        get => ScrollViewer.get_IsDeferredScrollingEnabledProperty()
    }

    /**
     * Identifies the [BringIntoViewOnFocusChange](scrollviewer_bringintoviewonfocuschange.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.bringintoviewonfocuschangeproperty
     * @type {DependencyProperty} 
     */
    static BringIntoViewOnFocusChangeProperty {
        get => ScrollViewer.get_BringIntoViewOnFocusChangeProperty()
    }

    /**
     * Identifies the [TopLeftHeader](scrollviewer_topleftheader.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.topleftheaderproperty
     * @type {DependencyProperty} 
     */
    static TopLeftHeaderProperty {
        get => ScrollViewer.get_TopLeftHeaderProperty()
    }

    /**
     * Identifies the [LeftHeader](scrollviewer_leftheader.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.leftheaderproperty
     * @type {DependencyProperty} 
     */
    static LeftHeaderProperty {
        get => ScrollViewer.get_LeftHeaderProperty()
    }

    /**
     * Identifies the [TopHeader](scrollviewer_topheader.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.topheaderproperty
     * @type {DependencyProperty} 
     */
    static TopHeaderProperty {
        get => ScrollViewer.get_TopHeaderProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ReduceViewportForCoreInputViewOcclusionsProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics4.IID)
            ScrollViewer.__IScrollViewerStatics4 := IScrollViewerStatics4(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics4.get_ReduceViewportForCoreInputViewOcclusionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalAnchorRatioProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics4.IID)
            ScrollViewer.__IScrollViewerStatics4 := IScrollViewerStatics4(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics4.get_HorizontalAnchorRatioProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalAnchorRatioProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics4.IID)
            ScrollViewer.__IScrollViewerStatics4 := IScrollViewerStatics4(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics4.get_VerticalAnchorRatioProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanContentRenderOutsideBoundsProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics4.IID)
            ScrollViewer.__IScrollViewerStatics4 := IScrollViewerStatics4(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics4.get_CanContentRenderOutsideBoundsProperty()
    }

    /**
     * Gets the value of the [CanContentRenderOutsideBounds](scrollviewer_cancontentrenderoutsidebounds.md) dependency property / `ScrollViewer.CanContentRenderOutsideBounds` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [CanContentRenderOutsideBounds](scrollviewer_cancontentrenderoutsidebounds.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getcancontentrenderoutsidebounds
     */
    static GetCanContentRenderOutsideBounds(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics4.IID)
            ScrollViewer.__IScrollViewerStatics4 := IScrollViewerStatics4(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics4.GetCanContentRenderOutsideBounds(element)
    }

    /**
     * Sets the value of the [CanContentRenderOutsideBounds](scrollviewer_cancontentrenderoutsidebounds.md) dependency property / `ScrollViewer.CanContentRenderOutsideBounds` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [CanContentRenderOutsideBounds](scrollviewer_cancontentrenderoutsidebounds.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} canContentRenderOutsideBounds The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setcancontentrenderoutsidebounds
     */
    static SetCanContentRenderOutsideBounds(element, canContentRenderOutsideBounds) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics4.IID)
            ScrollViewer.__IScrollViewerStatics4 := IScrollViewerStatics4(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics4.SetCanContentRenderOutsideBounds(element, canContentRenderOutsideBounds)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalSnapPointsAlignmentProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_HorizontalSnapPointsAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalSnapPointsAlignmentProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_VerticalSnapPointsAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalSnapPointsTypeProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_HorizontalSnapPointsTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalSnapPointsTypeProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_VerticalSnapPointsTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZoomSnapPointsTypeProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ZoomSnapPointsTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalOffsetProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_HorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ViewportWidthProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ViewportWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScrollableWidthProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ScrollableWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ComputedHorizontalScrollBarVisibilityProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ComputedHorizontalScrollBarVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExtentWidthProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ExtentWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalOffsetProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_VerticalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ViewportHeightProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ViewportHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScrollableHeightProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ScrollableHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ComputedVerticalScrollBarVisibilityProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ComputedVerticalScrollBarVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExtentHeightProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ExtentHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinZoomFactorProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_MinZoomFactorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxZoomFactorProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_MaxZoomFactorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZoomFactorProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ZoomFactorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZoomSnapPointsProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ZoomSnapPointsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalScrollBarVisibilityProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_HorizontalScrollBarVisibilityProperty()
    }

    /**
     * Gets the value of the [HorizontalScrollBarVisibility](scrollviewer_horizontalscrollbarvisibility.md) dependency property / `ScrollViewer.HorizontalScrollBarVisibility` XAML attached property from a specified element.
     * @remarks
     * For more info, see Remarks for the [HorizontalScrollBarVisibility](scrollviewer_horizontalscrollbarvisibility.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.gethorizontalscrollbarvisibility
     */
    static GetHorizontalScrollBarVisibility(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetHorizontalScrollBarVisibility(element)
    }

    /**
     * Sets the value of the [HorizontalScrollBarVisibility](scrollviewer_horizontalscrollbarvisibility.md) dependency property / `ScrollViewer.HorizontalScrollBarVisibility` XAML attached property on a specified element.
     * @remarks
     * For more info, see Remarks for the [HorizontalScrollBarVisibility](scrollviewer_horizontalscrollbarvisibility.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Integer} horizontalScrollBarVisibility The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.sethorizontalscrollbarvisibility
     */
    static SetHorizontalScrollBarVisibility(element, horizontalScrollBarVisibility) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetHorizontalScrollBarVisibility(element, horizontalScrollBarVisibility)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalScrollBarVisibilityProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_VerticalScrollBarVisibilityProperty()
    }

    /**
     * Gets the value of the [VerticalScrollBarVisibility](scrollviewer_verticalscrollbarvisibility.md) dependency property / `ScrollViewer.VerticalScrollBarVisibility` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [VerticalScrollBarVisibility](scrollviewer_verticalscrollbarvisibility.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getverticalscrollbarvisibility
     */
    static GetVerticalScrollBarVisibility(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetVerticalScrollBarVisibility(element)
    }

    /**
     * Sets the value of the [VerticalScrollBarVisibility](scrollviewer_verticalscrollbarvisibility.md) dependency property / `ScrollViewer.VerticalScrollBarVisibility` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [VerticalScrollBarVisibility](scrollviewer_verticalscrollbarvisibility.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Integer} verticalScrollBarVisibility The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setverticalscrollbarvisibility
     */
    static SetVerticalScrollBarVisibility(element, verticalScrollBarVisibility) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetVerticalScrollBarVisibility(element, verticalScrollBarVisibility)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHorizontalRailEnabledProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_IsHorizontalRailEnabledProperty()
    }

    /**
     * Gets the value of the [IsHorizontalRailEnabled](scrollviewer_ishorizontalrailenabled.md) dependency property / `ScrollViewer.IsHorizontalRailEnabled` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [IsHorizontalRailEnabled](scrollviewer_ishorizontalrailenabled.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getishorizontalrailenabled
     */
    static GetIsHorizontalRailEnabled(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetIsHorizontalRailEnabled(element)
    }

    /**
     * Sets the value of the [IsHorizontalRailEnabled](scrollviewer_ishorizontalrailenabled.md) dependency property / `ScrollViewer.IsHorizontalRailEnabled` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [IsHorizontalRailEnabled](scrollviewer_ishorizontalrailenabled.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} isHorizontalRailEnabled The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setishorizontalrailenabled
     */
    static SetIsHorizontalRailEnabled(element, isHorizontalRailEnabled) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetIsHorizontalRailEnabled(element, isHorizontalRailEnabled)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsVerticalRailEnabledProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_IsVerticalRailEnabledProperty()
    }

    /**
     * Gets the value of the [IsVerticalRailEnabled](scrollviewer_isverticalrailenabled.md) dependency property / `ScrollViewer.IsVerticalRailEnabled` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [IsVerticalRailEnabled](scrollviewer_isverticalrailenabled.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getisverticalrailenabled
     */
    static GetIsVerticalRailEnabled(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetIsVerticalRailEnabled(element)
    }

    /**
     * Sets the value of the [IsVerticalRailEnabled](scrollviewer_isverticalrailenabled.md) dependency property / `ScrollViewer.IsVerticalRailEnabled` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [IsVerticalRailEnabled](scrollviewer_isverticalrailenabled.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} isVerticalRailEnabled The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setisverticalrailenabled
     */
    static SetIsVerticalRailEnabled(element, isVerticalRailEnabled) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetIsVerticalRailEnabled(element, isVerticalRailEnabled)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHorizontalScrollChainingEnabledProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_IsHorizontalScrollChainingEnabledProperty()
    }

    /**
     * Gets the value of the [IsHorizontalScrollChainingEnabled](scrollviewer_ishorizontalscrollchainingenabled.md) dependency property / `ScrollViewer.IsHorizontalScrollChainingEnabled` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [IsHorizontalScrollChainingEnabled](scrollviewer_ishorizontalscrollchainingenabled.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getishorizontalscrollchainingenabled
     */
    static GetIsHorizontalScrollChainingEnabled(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetIsHorizontalScrollChainingEnabled(element)
    }

    /**
     * Sets the value of the [IsHorizontalScrollChainingEnabled](scrollviewer_ishorizontalscrollchainingenabled.md) dependency property / `ScrollViewer.IsHorizontalScrollChainingEnabled` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [IsHorizontalScrollChainingEnabled](scrollviewer_ishorizontalscrollchainingenabled.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} isHorizontalScrollChainingEnabled The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setishorizontalscrollchainingenabled
     */
    static SetIsHorizontalScrollChainingEnabled(element, isHorizontalScrollChainingEnabled) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetIsHorizontalScrollChainingEnabled(element, isHorizontalScrollChainingEnabled)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsVerticalScrollChainingEnabledProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_IsVerticalScrollChainingEnabledProperty()
    }

    /**
     * Gets the value of the [IsVerticalScrollChainingEnabled](scrollviewer_isverticalscrollchainingenabled.md) dependency property / `ScrollViewer.IsVerticalScrollChainingEnabled` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [IsVerticalScrollChainingEnabled](scrollviewer_isverticalscrollchainingenabled.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getisverticalscrollchainingenabled
     */
    static GetIsVerticalScrollChainingEnabled(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetIsVerticalScrollChainingEnabled(element)
    }

    /**
     * Sets the value of the [IsVerticalScrollChainingEnabled](scrollviewer_isverticalscrollchainingenabled.md) dependency property / `ScrollViewer.IsVerticalScrollChainingEnabled` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [IsVerticalScrollChainingEnabled](scrollviewer_isverticalscrollchainingenabled.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} isVerticalScrollChainingEnabled The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setisverticalscrollchainingenabled
     */
    static SetIsVerticalScrollChainingEnabled(element, isVerticalScrollChainingEnabled) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetIsVerticalScrollChainingEnabled(element, isVerticalScrollChainingEnabled)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsZoomChainingEnabledProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_IsZoomChainingEnabledProperty()
    }

    /**
     * Gets the value of the [IsZoomChainingEnabled](scrollviewer_iszoomchainingenabled.md) dependency property / `ScrollViewer.IsZoomChainingEnabled` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [IsZoomChainingEnabled](scrollviewer_iszoomchainingenabled.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getiszoomchainingenabled
     */
    static GetIsZoomChainingEnabled(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetIsZoomChainingEnabled(element)
    }

    /**
     * Sets the value of the [IsZoomChainingEnabled](scrollviewer_iszoomchainingenabled.md) dependency property / `ScrollViewer.IsZoomChainingEnabled` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [IsZoomChainingEnabled](scrollviewer_iszoomchainingenabled.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} isZoomChainingEnabled The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setiszoomchainingenabled
     */
    static SetIsZoomChainingEnabled(element, isZoomChainingEnabled) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetIsZoomChainingEnabled(element, isZoomChainingEnabled)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsScrollInertiaEnabledProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_IsScrollInertiaEnabledProperty()
    }

    /**
     * Gets the value of the [IsScrollInertiaEnabled](scrollviewer_isscrollinertiaenabled.md) dependency property / `ScrollViewer.IsScrollInertiaEnabled` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [IsScrollInertiaEnabled](scrollviewer_isscrollinertiaenabled.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getisscrollinertiaenabled
     */
    static GetIsScrollInertiaEnabled(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetIsScrollInertiaEnabled(element)
    }

    /**
     * Sets the value of the [IsScrollInertiaEnabled](scrollviewer_isscrollinertiaenabled.md) dependency property / `ScrollViewer.IsScrollInertiaEnabled` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [IsScrollInertiaEnabled](scrollviewer_isscrollinertiaenabled.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} isScrollInertiaEnabled The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setisscrollinertiaenabled
     */
    static SetIsScrollInertiaEnabled(element, isScrollInertiaEnabled) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetIsScrollInertiaEnabled(element, isScrollInertiaEnabled)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsZoomInertiaEnabledProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_IsZoomInertiaEnabledProperty()
    }

    /**
     * Gets the value of the [IsZoomInertiaEnabled](scrollviewer_iszoominertiaenabled.md) dependency property / `ScrollViewer.IsZoomInertiaEnabled` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [IsZoomInertiaEnabled](scrollviewer_iszoominertiaenabled.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getiszoominertiaenabled
     */
    static GetIsZoomInertiaEnabled(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetIsZoomInertiaEnabled(element)
    }

    /**
     * Sets the value of the [IsZoomInertiaEnabled](scrollviewer_iszoominertiaenabled.md) dependency property / `ScrollViewer.IsZoomInertiaEnabled` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [IsZoomInertiaEnabled](scrollviewer_iszoominertiaenabled.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} isZoomInertiaEnabled The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setiszoominertiaenabled
     */
    static SetIsZoomInertiaEnabled(element, isZoomInertiaEnabled) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetIsZoomInertiaEnabled(element, isZoomInertiaEnabled)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalScrollModeProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_HorizontalScrollModeProperty()
    }

    /**
     * Gets the value of the [HorizontalScrollMode](scrollviewer_horizontalscrollmode.md) dependency property / `ScrollViewer.HorizontalScrollMode` XAML attached property from a specified element.
     * @remarks
     * For more info, see Remarks for the [HorizontalScrollMode](scrollviewer_horizontalscrollmode.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.gethorizontalscrollmode
     */
    static GetHorizontalScrollMode(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetHorizontalScrollMode(element)
    }

    /**
     * Sets the value of the [HorizontalScrollMode](scrollviewer_horizontalscrollmode.md) dependency property / `ScrollViewer.HorizontalScrollMode` XAML attached property on a specified element.
     * @remarks
     * For more info, see Remarks for the [HorizontalScrollMode](scrollviewer_horizontalscrollmode.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Integer} horizontalScrollMode The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.sethorizontalscrollmode
     */
    static SetHorizontalScrollMode(element, horizontalScrollMode) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetHorizontalScrollMode(element, horizontalScrollMode)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalScrollModeProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_VerticalScrollModeProperty()
    }

    /**
     * Gets the value of the [VerticalScrollMode](scrollviewer_verticalscrollmode.md) dependency property / `ScrollViewer.VerticalScrollMode` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [VerticalScrollMode](scrollviewer_verticalscrollmode.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getverticalscrollmode
     */
    static GetVerticalScrollMode(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetVerticalScrollMode(element)
    }

    /**
     * Sets the value of the [VerticalScrollMode](scrollviewer_verticalscrollmode.md) dependency property / `ScrollViewer.VerticalScrollMode` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [VerticalScrollMode](scrollviewer_verticalscrollmode.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Integer} verticalScrollMode The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setverticalscrollmode
     */
    static SetVerticalScrollMode(element, verticalScrollMode) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetVerticalScrollMode(element, verticalScrollMode)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZoomModeProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_ZoomModeProperty()
    }

    /**
     * Gets the value of the [ZoomMode](scrollviewer_zoommode.md) dependency property / `ScrollViewer.ZoomMode` XAML attached property from a specified element.
     * @remarks
     * For more info, see the [ZoomMode](scrollviewer_zoommode.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getzoommode
     */
    static GetZoomMode(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetZoomMode(element)
    }

    /**
     * Sets the value of the [ZoomMode](scrollviewer_zoommode.md) dependency property / `ScrollViewer.ZoomMode` XAML attached property on a specified element.
     * @remarks
     * For more info, see the [ZoomMode](scrollviewer_zoommode.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Integer} zoomMode_ The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setzoommode
     */
    static SetZoomMode(element, zoomMode_) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetZoomMode(element, zoomMode_)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDeferredScrollingEnabledProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_IsDeferredScrollingEnabledProperty()
    }

    /**
     * Gets the value of the [IsDeferredScrollingEnabled](scrollviewer_isdeferredscrollingenabled.md) dependency property / `ScrollViewer.IsDeferredScrollingInertiaEnabled` XAML attached property from a specified element.
     * @remarks
     * For more info, see Remarks for the [IsDeferredScrollingEnabled](scrollviewer_isdeferredscrollingenabled.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getisdeferredscrollingenabled
     */
    static GetIsDeferredScrollingEnabled(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetIsDeferredScrollingEnabled(element)
    }

    /**
     * Sets the value of the [IsDeferredScrollingEnabled](scrollviewer_isdeferredscrollingenabled.md) dependency property / `ScrollViewer.IsDeferredScrollingEnabled` XAML attached property on a specified element.
     * @remarks
     * For more info, see Remarks for the [IsDeferredScrollingEnabled](scrollviewer_isdeferredscrollingenabled.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} isDeferredScrollingEnabled The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setisdeferredscrollingenabled
     */
    static SetIsDeferredScrollingEnabled(element, isDeferredScrollingEnabled) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetIsDeferredScrollingEnabled(element, isDeferredScrollingEnabled)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BringIntoViewOnFocusChangeProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.get_BringIntoViewOnFocusChangeProperty()
    }

    /**
     * Gets the value of the [BringIntoViewOnFocusChange](scrollviewer_bringintoviewonfocuschange.md) dependency property / `ScrollViewer.BringIntoViewOnFocusChange` XAML attached property from a specified element.
     * @remarks
     * For more info, see Remarks for the [BringIntoViewOnFocusChange](scrollviewer_bringintoviewonfocuschange.md) property.
     * @param {DependencyObject} element The element from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.getbringintoviewonfocuschange
     */
    static GetBringIntoViewOnFocusChange(element) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.GetBringIntoViewOnFocusChange(element)
    }

    /**
     * Sets the value of the [BringIntoViewOnFocusChange](scrollviewer_bringintoviewonfocuschange.md) dependency property / `ScrollViewer.BringIntoViewOnFocusChange` XAML attached property on a specified element.
     * @remarks
     * For more info, see Remarks for the [BringIntoViewOnFocusChange](scrollviewer_bringintoviewonfocuschange.md) property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Boolean} bringIntoViewOnFocusChange The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.setbringintoviewonfocuschange
     */
    static SetBringIntoViewOnFocusChange(element, bringIntoViewOnFocusChange) {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics.IID)
            ScrollViewer.__IScrollViewerStatics := IScrollViewerStatics(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics.SetBringIntoViewOnFocusChange(element, bringIntoViewOnFocusChange)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TopLeftHeaderProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics2.IID)
            ScrollViewer.__IScrollViewerStatics2 := IScrollViewerStatics2(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics2.get_TopLeftHeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LeftHeaderProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics2.IID)
            ScrollViewer.__IScrollViewerStatics2 := IScrollViewerStatics2(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics2.get_LeftHeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TopHeaderProperty() {
        if (!ScrollViewer.HasProp("__IScrollViewerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollViewerStatics2.IID)
            ScrollViewer.__IScrollViewerStatics2 := IScrollViewerStatics2(factoryPtr)
        }

        return ScrollViewer.__IScrollViewerStatics2.get_TopHeaderProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether a horizontal [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) should be displayed.
     * @remarks
     * For XAML usage, HorizontalScrollBarVisibility can either be an attribute on an explicit [ScrollViewer](scrollviewer.md) element, or a `ScrollViewer.HorizontalScrollBarVisibility` attached property usage on an element that is a child of a control that supports scrollview implicitly in its template. Controls with a [ScrollViewer](scrollviewer.md) as part of their composition typically use template binding such that setting the attached property at the level of the control will change the scroll behavior of the [ScrollViewer](scrollviewer.md) part within the control. Otherwise, it may be necessary to replace the template in order to change the scroll behavior of a [ScrollViewer](scrollviewer.md) part.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalscrollbarvisibility
     * @type {Integer} 
     */
    HorizontalScrollBarVisibility {
        get => this.get_HorizontalScrollBarVisibility()
        set => this.put_HorizontalScrollBarVisibility(value)
    }

    /**
     * Gets or sets a value that indicates whether a vertical [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) should be displayed.
     * @remarks
     * Scrolling behavior can also be set through a `ScrollViewer.VerticalScrollBarVisibility` XAML attached property usage, or by calling [SetVerticalScrollBarVisibility](scrollviewer_setverticalscrollbarvisibility_1675279630.md). This is for cases where the [ScrollViewer](scrollviewer.md) is implicit, such as when the [ScrollViewer](scrollviewer.md) exists in the default template for a [GridView](gridview.md), and you want to be able to influence the scrolling behavior without accessing template parts. Controls with a [ScrollViewer](scrollviewer.md) as part of their composition typically use template binding such that setting the attached property at the level of the control will change the scroll behavior of the [ScrollViewer](scrollviewer.md) part within the control. Otherwise, it may be necessary to replace the template in order to change the scroll behavior of a [ScrollViewer](scrollviewer.md) part.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalscrollbarvisibility
     * @type {Integer} 
     */
    VerticalScrollBarVisibility {
        get => this.get_VerticalScrollBarVisibility()
        set => this.put_VerticalScrollBarVisibility(value)
    }

    /**
     * Gets or sets a value that indicates whether the scroll rail is enabled for the horizontal axis.
     * @remarks
     * When content is scrolled without manipulating the scrollbar directly, for example, by touch, we call it panning. Because content can be both wider and taller than the display area, two-dimensional panning (horizontal and vertical) is often necessary. _Rails_ improve the user experience in these cases by locking the panning to the axis of motion, either vertical or horizontal, as if the content were on a rail.
     * 
     * The following diagram demonstrates the concept of rails.
     * 
     * ![diagram of a screen with rails that constrain panning](images/ux-panning-rails.png)
     * 
     * For more info, see [Guidelines for panning](/windows/uwp/design/input/guidelines-for-panning).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.ishorizontalrailenabled
     * @type {Boolean} 
     */
    IsHorizontalRailEnabled {
        get => this.get_IsHorizontalRailEnabled()
        set => this.put_IsHorizontalRailEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the scroll rail is enabled for the vertical axis.
     * @remarks
     * When content is scrolled without manipulating the scrollbar directly, for example, by touch, we call it panning. Because content can be both wider and taller than the display area, two-dimensional panning (horizontal and vertical) is often necessary. _Rails_ improve the user experience in these cases by locking the panning to the axis of motion, either vertical or horizontal, as if the content were on a rail.
     * 
     * The following diagram demonstrates the concept of rails.
     * 
     * ![diagram of a screen with rails that constrain panning](images/ux-panning-rails.png)
     * 
     * For more info, see [Guidelines for panning](/windows/uwp/design/input/guidelines-for-panning).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.isverticalrailenabled
     * @type {Boolean} 
     */
    IsVerticalRailEnabled {
        get => this.get_IsVerticalRailEnabled()
        set => this.put_IsVerticalRailEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether scroll chaining is enabled from this child to its parent, for the horizontal axis.
     * @remarks
     * After a user hits a scroll limit on an element that has been nested within another scrollable element, you can specify whether that parent element should continue the scrolling operation begun in its child element. This is called scroll chaining.
     * 
     * For more info, see [Guidelines for panning](/windows/uwp/design/input/guidelines-for-panning).
     * 
     * For XAML usage, IsHorizontalScrollChainingEnabled can either be an attribute on an explicit [ScrollViewer](scrollviewer.md) element, or a **ScrollViewer.IsHorizontalScrollChainingEnabled** attached property usage on an element that is a child of a control that supports scrollview implicitly in its template.
     * 
     * The ScrollViewer's chaining properties ([IsHorizontalScrollChainingEnabled](/uwp/api/windows.ui.xaml.controls.scrollviewer.ishorizontalscrollchainingenabled),[IsVerticalScrollChainingEnabled](/uwp/api/windows.ui.xaml.controls.scrollviewer.isverticalscrollchainingenabled), [IsZoomChainingEnabled](/uwp/api/windows.ui.xaml.controls.scrollviewer.iszoomchainingenabled) ) do not apply when the control is in inertial mode. Because mouse wheel rotations are handled as **inertial manipulations**, chaining does not work.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.ishorizontalscrollchainingenabled
     * @type {Boolean} 
     */
    IsHorizontalScrollChainingEnabled {
        get => this.get_IsHorizontalScrollChainingEnabled()
        set => this.put_IsHorizontalScrollChainingEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether scroll chaining is enabled from this child to its parent, for the vertical axis.
     * @remarks
     * After a user hits a scroll limit on an element that has been nested within another scrollable element, you can specify whether that parent element should continue the scrolling operation begun in its child element. This is called scroll chaining.
     * 
     * For more info, see [Guidelines for panning](/windows/uwp/design/input/guidelines-for-panning).
     * 
     * For XAML usage, IsVerticalScrollChainingEnabled can either be an attribute on an explicit [ScrollViewer](scrollviewer.md) element, or a **ScrollViewer.IsVerticalScrollChainingEnabled** attached property usage on an element that is a child of a control that supports scrollview implicitly in its template. 
     * 
     * The ScrollViewer's chaining properties ([IsHorizontalScrollChainingEnabled](/uwp/api/windows.ui.xaml.controls.scrollviewer.ishorizontalscrollchainingenabled),[IsVerticalScrollChainingEnabled](/uwp/api/windows.ui.xaml.controls.scrollviewer.isverticalscrollchainingenabled), [IsZoomChainingEnabled](/uwp/api/windows.ui.xaml.controls.scrollviewer.iszoomchainingenabled) ) do not apply when the control is in inertial mode. Because mouse wheel rotations are handled as **inertial manipulations**, chaining does not work.
     * <!--May not work because there is no apparent templatebinding linkage in most of the generic templates.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.isverticalscrollchainingenabled
     * @type {Boolean} 
     */
    IsVerticalScrollChainingEnabled {
        get => this.get_IsVerticalScrollChainingEnabled()
        set => this.put_IsVerticalScrollChainingEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether zoom chaining is enabled from this child to its parent.
     * @remarks
     * After a user hits a zoom limit on an element that has been nested within another zoomable element, you can specify whether that parent element should continue the zooming operation begun in its child element. This is called zoom chaining.
     * 
     * For XAML usage, IsZoomChainingEnabled can either be an attribute on an explicit [ScrollViewer](scrollviewer.md) element, or a **ScrollViewer.IsZoomChainingEnabled** attached property usage on an element that is a child of a control that supports scrollview implicitly in its template.
     * 
     * The ScrollViewer's chaining properties ([IsHorizontalScrollChainingEnabled](/uwp/api/windows.ui.xaml.controls.scrollviewer.ishorizontalscrollchainingenabled),[IsVerticalScrollChainingEnabled](/uwp/api/windows.ui.xaml.controls.scrollviewer.isverticalscrollchainingenabled), [IsZoomChainingEnabled](/uwp/api/windows.ui.xaml.controls.scrollviewer.iszoomchainingenabled) ) do not apply when the control is in inertial mode. Because mouse wheel rotations are handled as **inertial manipulations**, chaining does not work.
     * <!--May not work because there is no apparent templatebinding linkage in most of the generic templates.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.iszoomchainingenabled
     * @type {Boolean} 
     */
    IsZoomChainingEnabled {
        get => this.get_IsZoomChainingEnabled()
        set => this.put_IsZoomChainingEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether scroll actions should include inertia in their behavior and value.
     * @remarks
     * For XAML usage, IsScrollInertiaEnabled can either be an attribute on an explicit [ScrollViewer](scrollviewer.md) element, or a **ScrollViewer.IsScrollInertiaEnabled** attached property usage on an element that is a child of a control that supports scrollview implicitly in its template.
     * <!--May not work because there is no apparent templatebinding linkage in most of the generic templates.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.isscrollinertiaenabled
     * @type {Boolean} 
     */
    IsScrollInertiaEnabled {
        get => this.get_IsScrollInertiaEnabled()
        set => this.put_IsScrollInertiaEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether zoom actions should include inertia in their behavior and value.
     * @remarks
     * For XAML usage, IsZoomInertiaEnabled can either be an attribute on an explicit [ScrollViewer](scrollviewer.md) element, or a **ScrollViewer.IsZoomInertiaEnabled** attached property usage on an element that is a child of a control that supports scrollview implicitly in its template.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.iszoominertiaenabled
     * @type {Boolean} 
     */
    IsZoomInertiaEnabled {
        get => this.get_IsZoomInertiaEnabled()
        set => this.put_IsZoomInertiaEnabled(value)
    }

    /**
     * Gets or sets a value that determines how manipulation input influences scrolling behavior on the horizontal axis.
     * @remarks
     * Scrolling behavior can also be set through a `ScrollViewer.HorizontalScrollMode` XAML attached property usage, or by calling [SetHorizontalScrollMode](scrollviewer_sethorizontalscrollmode_2014527863.md). This is for cases where the [ScrollViewer](scrollviewer.md) is implicit, such as when the [ScrollViewer](scrollviewer.md) exists in the default template for a [GridView](gridview.md), and you want to be able to influence the scrolling behavior without accessing template parts. Controls with a [ScrollViewer](scrollviewer.md) as part of their composition typically use template binding such that setting the attached property at the level of the control will change the scroll behavior of the [ScrollViewer](scrollviewer.md) part within the control. Otherwise, it may be necessary to replace the template in order to change the scroll behavior of a [ScrollViewer](scrollviewer.md) part.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalscrollmode
     * @type {Integer} 
     */
    HorizontalScrollMode {
        get => this.get_HorizontalScrollMode()
        set => this.put_HorizontalScrollMode(value)
    }

    /**
     * Gets or sets a value that determines how manipulation input influences scrolling behavior on the vertical axis.
     * @remarks
     * Scrolling behavior can also be set through a `ScrollViewer.VerticalScrollMode` XAML attached property usage, or by calling [SetVerticalScrollMode](scrollviewer_setverticalscrollmode_1928942593.md). This is for cases where the [ScrollViewer](scrollviewer.md) is implicit, such as when the [ScrollViewer](scrollviewer.md) exists in the default template for a [GridView](gridview.md), and you want to be able to influence the scrolling behavior without accessing template parts. Controls with a [ScrollViewer](scrollviewer.md) as part of their composition typically use template binding such that setting the attached property at the level of the control will change the scroll behavior of the [ScrollViewer](scrollviewer.md) part within the control. Otherwise, it may be necessary to replace the template in order to change the scroll behavior of a [ScrollViewer](scrollviewer.md) part.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalscrollmode
     * @type {Integer} 
     */
    VerticalScrollMode {
        get => this.get_VerticalScrollMode()
        set => this.put_VerticalScrollMode(value)
    }

    /**
     * Gets or sets a value that indicates whether zoom behavior in the [ScrollViewer](scrollviewer.md) content is enabled.
     * @remarks
     * No default value is listed for this property. Controls that incorporate a [ScrollViewer](scrollviewer.md) in compositing often set a value for ZoomMode in the default template and starting visual states, and it is this templated value that you will typically start with. Controls with a [ScrollViewer](scrollviewer.md) as part of their composition typically use template binding such that setting the attached property at the level of the control will change the scroll behavior of the [ScrollViewer](scrollviewer.md) part within the control. Otherwise, it may be necessary to replace the template in order to change the scroll behavior of a [ScrollViewer](scrollviewer.md) part.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.zoommode
     * @type {Integer} 
     */
    ZoomMode {
        get => this.get_ZoomMode()
        set => this.put_ZoomMode(value)
    }

    /**
     * Gets or sets a value that indicates how the existing snap points are horizontally aligned versus the initial viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalsnappointsalignment
     * @type {Integer} 
     */
    HorizontalSnapPointsAlignment {
        get => this.get_HorizontalSnapPointsAlignment()
        set => this.put_HorizontalSnapPointsAlignment(value)
    }

    /**
     * Gets or sets a value that indicates how the existing snap points are vertically aligned versus the initial viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalsnappointsalignment
     * @type {Integer} 
     */
    VerticalSnapPointsAlignment {
        get => this.get_VerticalSnapPointsAlignment()
        set => this.put_VerticalSnapPointsAlignment(value)
    }

    /**
     * Gets or sets a value that declares how manipulation behavior reacts to the snap points along the horizontal axis.
     * @remarks
     * For panning actions, there are often natural stopping places. Snap points provide a way to indicate where these places are. Then, when a user swipes, the manipulation result favors that natural point using behavior as expressed by a [SnapPointsType](snappointstype.md) value.
     * 
     * **Proximity points (****Optional**** and ****OptionalSingle****):
     * ** When a user is going to naturally stop the manipulation in the proximity of a snap point, proximity points help the user land at the natural stopping place. Because the user has to land in proximity to the snap point to cause it to stop there, the user will sometimes have to perform another swipe to reach a snap point.
     * 
     * **Mandatory snap points (****Mandatory**** and ****MandatorySingle**)**:
     * ** In contrast to proximity, mandatory snap points ensure that the content is adjusted to always land on a snap point. Even if the user releases the manipulation halfway between two snap-points, it will always move to one of the snap points.
     * 
     * To see the effects of snap points on [ScrollViewer](scrollviewer.md) behavior yourself, get the [XAML scrolling, panning and zooming sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/XAML%20scrolling%2C%20panning%2C%20and%20zooming%20sample). Run the sample on a touch device (not the simulator). Try out the [SnapPointsType](snappointstype.md) values when you view the "Panning with snap-points" example page of the sample.
     * 
     * To learn more about the swipe gesture and panning, see the "Panning behaviors" section of [Guidelines for panning](/windows/uwp/input-and-devices/guidelines-for-panning).
     * 
     * The default value of **None** is the default of the enumeration. If it's set, this property is often set as an attribute in a XAML template part, or as a style [Setter](../windows.ui.xaml/setter.md). Each control potentially sets this differently. Getting the value at run time will provide the value that came from applied styles and templates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalsnappointstype
     * @type {Integer} 
     */
    HorizontalSnapPointsType {
        get => this.get_HorizontalSnapPointsType()
        set => this.put_HorizontalSnapPointsType(value)
    }

    /**
     * Gets or sets a value that declares how manipulation behavior reacts to the snap points along the vertical axis.
     * @remarks
     * For panning actions, there are often natural stopping places. Snap points provide a way to indicate where these places are. Then, when a user swipes, the manipulation result favors that natural point using behavior as expressed by a [SnapPointsType](snappointstype.md) value.
     * 
     * **Proximity points (****Optional**** and ****OptionalSingle****):
     * ** When a user is going to naturally stop the manipulation in the proximity of a snap point, proximity points help the user land at the natural stopping place. Because the user has to land in proximity to the snap point to cause it to stop there, the user will sometimes have to perform another swipe to reach a snap point.
     * 
     * **Mandatory snap points (****Mandatory**** and ****MandatorySingle**)**:
     * ** In contrast to proximity, mandatory snap points ensure that the content is adjusted to always land on a snap point. Even if the user releases the manipulation halfway between two snap-points, it will always move to one of the snap points.
     * 
     * To see the effects of snap points on [ScrollViewer](scrollviewer.md) behavior yourself, get the [XAML scrolling, panning and zooming sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/XAML%20scrolling%2C%20panning%2C%20and%20zooming%20sample). Run the sample on a touch device (not the simulator). Try out the [SnapPointsType](snappointstype.md) values when you view the "Panning with snap-points" example page of the sample.
     * 
     * To learn more about the swipe gesture and panning, see the "Panning behaviors" section of [Guidelines for panning](/windows/uwp/input-and-devices/guidelines-for-panning).
     * 
     * The default value of **None** is the default of the enumeration. If it's set, this property is often set as an attribute in a XAML template part, or as a style [Setter](../windows.ui.xaml/setter.md). Each control potentially sets this differently. Getting the value at run time will provide the value that came from applied styles and templates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalsnappointstype
     * @type {Integer} 
     */
    VerticalSnapPointsType {
        get => this.get_VerticalSnapPointsType()
        set => this.put_VerticalSnapPointsType(value)
    }

    /**
     * Gets or sets a value that indicates how zoom snap points are processed for interaction input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.zoomsnappointstype
     * @type {Integer} 
     */
    ZoomSnapPointsType {
        get => this.get_ZoomSnapPointsType()
        set => this.put_ZoomSnapPointsType(value)
    }

    /**
     * Gets the distance the content has been scrolled horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
    }

    /**
     * Gets the horizontal size of the viewable content.
     * @remarks
     * The viewport includes all the visible content in the [ScrollViewer](scrollviewer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.viewportwidth
     * @type {Float} 
     */
    ViewportWidth {
        get => this.get_ViewportWidth()
    }

    /**
     * Gets a value that represents the horizontal size of the area that can be scrolled; the difference between the width of the extent and the width of the viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.scrollablewidth
     * @type {Float} 
     */
    ScrollableWidth {
        get => this.get_ScrollableWidth()
    }

    /**
     * Gets a value that indicates whether the horizontal [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.computedhorizontalscrollbarvisibility
     * @type {Integer} 
     */
    ComputedHorizontalScrollBarVisibility {
        get => this.get_ComputedHorizontalScrollBarVisibility()
    }

    /**
     * Gets the horizontal size of all the scrollable content in the [ScrollViewer](scrollviewer.md).
     * @remarks
     * The extent includes all the content in the [ScrollViewer](scrollviewer.md), whether visible or not. The viewport is the visible area of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.extentwidth
     * @type {Float} 
     */
    ExtentWidth {
        get => this.get_ExtentWidth()
    }

    /**
     * Gets the distance the content has been scrolled vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
    }

    /**
     * Gets the vertical size of the viewable content.
     * @remarks
     * The viewport includes all the visible content in the [ScrollViewer](scrollviewer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.viewportheight
     * @type {Float} 
     */
    ViewportHeight {
        get => this.get_ViewportHeight()
    }

    /**
     * Gets a value that represents the vertical size of the area that can be scrolled; the difference between the height of the extent and the height of the viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.scrollableheight
     * @type {Float} 
     */
    ScrollableHeight {
        get => this.get_ScrollableHeight()
    }

    /**
     * Gets a value that indicates whether the vertical [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.computedverticalscrollbarvisibility
     * @type {Integer} 
     */
    ComputedVerticalScrollBarVisibility {
        get => this.get_ComputedVerticalScrollBarVisibility()
    }

    /**
     * Gets the vertical size of all the scrollable content in the [ScrollViewer](scrollviewer.md).
     * @remarks
     * The extent includes all the content in the [ScrollViewer](scrollviewer.md), whether visible or not. The viewport is the visible area of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.extentheight
     * @type {Float} 
     */
    ExtentHeight {
        get => this.get_ExtentHeight()
    }

    /**
     * Gets or sets a value that indicates the minimum permitted run-time value of [ZoomFactor](scrollviewer_zoomfactor.md).
     * @remarks
     * The value for this property must be greater than or equal to 0.1; otherwise, an exception is thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.minzoomfactor
     * @type {Float} 
     */
    MinZoomFactor {
        get => this.get_MinZoomFactor()
        set => this.put_MinZoomFactor(value)
    }

    /**
     * Gets or sets a value that indicates the maximum permitted run-time value of [ZoomFactor](scrollviewer_zoomfactor.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.maxzoomfactor
     * @type {Float} 
     */
    MaxZoomFactor {
        get => this.get_MaxZoomFactor()
        set => this.put_MaxZoomFactor(value)
    }

    /**
     * Gets a value that indicates the current zoom factor engaged for content scaling.
     * @remarks
     * To change the value of this property at run-time or for initialization, use [ChangeView](scrollviewer_changeview_1425504772.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.zoomfactor
     * @type {Float} 
     */
    ZoomFactor {
        get => this.get_ZoomFactor()
    }

    /**
     * Gets the observable collection of zoom snap point factors that are held by the [ScrollViewer](scrollviewer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.zoomsnappoints
     * @type {IVector<Float>} 
     */
    ZoomSnapPoints {
        get => this.get_ZoomSnapPoints()
    }

    /**
     * Gets or sets a value that determines the deferred scrolling behavior for a [ScrollViewer](scrollviewer.md).
     * @remarks
     * Deferred scrolling behavior means that the view does not scroll until a user action is completed. For example, if a region scrolls when the user manipulates a thumb control, and IsDeferredScrollingEnabled is true, the scroll does not occur until the touch point on the thumb is released. In contrast, if IsDeferredScrollingEnabled is false, the region scrolls any time that the touch point selection point along the slider track is moved.
     * 
     * For XAML usage, IsDeferredScrollingEnabled can either be an attribute on an explicit [ScrollViewer](scrollviewer.md) element, or a **ScrollViewer.IsDeferredScrollingEnabled** attached property usage on an element that is a child of a control that supports scrollview implicitly in its template.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.isdeferredscrollingenabled
     * @type {Boolean} 
     */
    IsDeferredScrollingEnabled {
        get => this.get_IsDeferredScrollingEnabled()
        set => this.put_IsDeferredScrollingEnabled(value)
    }

    /**
     * Gets or sets a value that determines whether the [ScrollViewer](scrollviewer.md) uses a bring-into-view scroll behavior when an item in the view gets focus.
     * @remarks
     * For XAML usage, BringIntoViewOnFocusChange can either be an attribute on an explicit [ScrollViewer](scrollviewer.md) element, or a **ScrollViewer.BringIntoViewOnFocusChange** attached property usage on an element that is a child of a control that supports scrollview implicitly in its template.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.bringintoviewonfocuschange
     * @type {Boolean} 
     */
    BringIntoViewOnFocusChange {
        get => this.get_BringIntoViewOnFocusChange()
        set => this.put_BringIntoViewOnFocusChange(value)
    }

    /**
     * Gets or sets the content of the top, left header.
     * @remarks
     * The [LeftHeader](scrollviewer_leftheader.md), [TopHeader](scrollviewer_topheader.md), and TopLeftHeader properties can be set only when [ScrollViewer](scrollviewer.md) content's [HorizontalAlignment](../windows.ui.xaml/frameworkelement_horizontalalignment.md) is **Left** and [VerticalAlignment](../windows.ui.xaml/frameworkelement_verticalalignment.md) is **Top**.
     * 
     * The top left header doesn't scroll in any direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.topleftheader
     * @type {UIElement} 
     */
    TopLeftHeader {
        get => this.get_TopLeftHeader()
        set => this.put_TopLeftHeader(value)
    }

    /**
     * Gets or sets the content of the left header.
     * @remarks
     * The LeftHeader, [TopHeader](scrollviewer_topheader.md), and [TopLeftHeader](scrollviewer_topleftheader.md) properties can be set only when [ScrollViewer](scrollviewer.md) content's [HorizontalAlignment](../windows.ui.xaml/frameworkelement_horizontalalignment.md) is **Left** and [VerticalAlignment](../windows.ui.xaml/frameworkelement_verticalalignment.md) is **Top**.
     * 
     * The left header scrolls vertically, but not horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.leftheader
     * @type {UIElement} 
     */
    LeftHeader {
        get => this.get_LeftHeader()
        set => this.put_LeftHeader(value)
    }

    /**
     * Gets or sets the content of the top header.
     * @remarks
     * The [LeftHeader](scrollviewer_leftheader.md), TopHeader, and [TopLeftHeader](scrollviewer_topleftheader.md) properties can be set only when [ScrollViewer](scrollviewer.md) content's [HorizontalAlignment](../windows.ui.xaml/frameworkelement_horizontalalignment.md) is **Left** and [VerticalAlignment](../windows.ui.xaml/frameworkelement_verticalalignment.md) is **Top**.
     * 
     * The top header scrolls horizontally, but not vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.topheader
     * @type {UIElement} 
     */
    TopHeader {
        get => this.get_TopHeader()
        set => this.put_TopHeader(value)
    }

    /**
     * Gets or sets a value that indicates whether the ScrollViewer should try to adjust its content to keep it visible when a docked CoreInputView occludes part of it.
     * @remarks
     * When this feature is enabled and a docked [CoreInputView](/windows.ui.viewmanagement.core/coreinputview.md) covers part of the ScrollViewer control, the ScrollViewer reduces the space available to its content according to the size and location of the CoreInputView. Then the ScrollViewer, as in any other case where the content is constrained, allows the user to pan/scroll the content. Also, any time a text edit control gets focus, it automatically brings itself into view, so the user isn't required to manually pan.
     * 
     * This property defaults to **false**, and it's typically not necessary for you to set it in your app. XAML maintains a ScrollViewer internally with this feature enabled, and your window content is displayed in this ScrollViewer. That is, **Window.Current.Content** is automatically parented to a ScrollViewer that has this feature enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.reduceviewportforcoreinputviewocclusions
     * @type {Boolean} 
     */
    ReduceViewportForCoreInputViewOcclusions {
        get => this.get_ReduceViewportForCoreInputViewOcclusions()
        set => this.put_ReduceViewportForCoreInputViewOcclusions(value)
    }

    /**
     * Determines the horizontal position of the ScrollViewer's *anchor point* with respect to the viewport. By default, the ScrollViewer selects an element as its [CurrentAnchor](iscrollanchorprovider_currentanchor.md) by identifying the element in its viewport nearest to the anchor point.
     * @remarks
     * A value of 0.0 represents the left-most point within the viewport. A value of 1.0 represents the right-most point within the viewport. A value of 0.5f represents the center-most point within the viewport.
     * 
     * When the value is 0.0 or 1.0 the ScrollViewer applies special behavior when the scroll position is at the start or end of the scrollable area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.horizontalanchorratio
     * @type {Float} 
     */
    HorizontalAnchorRatio {
        get => this.get_HorizontalAnchorRatio()
        set => this.put_HorizontalAnchorRatio(value)
    }

    /**
     * Determines the vertical position of the ScrollViewer's *anchor point* with respect to the viewport. By default, the ScrollViewer selects an element as its [CurrentAnchor](/uwp/api/windows.ui.xaml.controls.iscrollanchorprovider.currentanchor) by identifying the element in its viewport nearest to the anchor point.
     * @remarks
     * A value of 0.0 represents the top-most point within the viewport. A value of 1.0 represents the bottom-most point within the viewport. A value of 0.5f represents the center-most point within the viewport.
     * 
     * When the value is 0.0 or 1.0, the ScrollViewer applies special behavior when the scroll position is at the start or end of the scrollable area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.verticalanchorratio
     * @type {Float} 
     */
    VerticalAnchorRatio {
        get => this.get_VerticalAnchorRatio()
        set => this.put_VerticalAnchorRatio(value)
    }

    /**
     * Gets or sets a value that indicates whether scrolled content can render outside the bounds of the ScrollViewer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.cancontentrenderoutsidebounds
     * @type {Boolean} 
     */
    CanContentRenderOutsideBounds {
        get => this.get_CanContentRenderOutsideBounds()
        set => this.put_CanContentRenderOutsideBounds(value)
    }

    /**
     * The currently chosen anchor element to use for scroll anchoring.
     * @remarks
     * If there are no anchor candidates registered with the [ScrollViewer](scrollviewer.md) or none have been chosen, then CurrentAnchor is **null**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.currentanchor
     * @type {UIElement} 
     */
    CurrentAnchor {
        get => this.get_CurrentAnchor()
    }

    /**
     * Occurs when manipulations such as scrolling and zooming have caused the view to change.
     * @remarks
     * [ViewChanging](scrollviewer_viewchanging.md) fires before ViewChanged.
     * 
     * In your event handler, use a parameter of type [ScrollViewerViewChangedEventArgs](scrollviewerviewchangedeventargs.md) for the second parameter of your handler method. [ScrollViewerViewChangedEventArgs](scrollviewerviewchangedeventargs.md) includes the [IsIntermediate](scrollviewerviewchangedeventargs_isintermediate.md) property, which reports whether the manipulation that fired the event is completed or still ongoing.
     * 
     * Not every underlying manipulation will necessarily fire this event. The class logic delays and consolidates intermediate events into a single occurrence in some cases.
     * @type {EventHandler<ScrollViewerViewChangedEventArgs>}
    */
    OnViewChanged {
        get {
            if(!this.HasProp("__OnViewChanged")){
                this.__OnViewChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{62ca7aeb-f4cd-5f43-a499-3a7fe085c047}"),
                    IInspectable,
                    ScrollViewerViewChangedEventArgs
                )
                this.__OnViewChangedToken := this.add_ViewChanged(this.__OnViewChanged.iface)
            }
            return this.__OnViewChanged
        }
    }

    /**
     * Occurs when manipulations such as scrolling and zooming cause the view to change.
     * @remarks
     * [ScrollViewerViewChangingEventArgs](scrollviewerviewchangingeventargs.md) includes the [IsInertial](scrollviewerviewchangingeventargs_isinertial.md) property, which reports whether the manipulation that is firing the event contains an inertial component.
     * 
     * Not every underlying manipulation will necessarily fire this event. The [ScrollViewer](scrollviewer.md) logic delays and consolidates intermediate events into a single occurrence in some cases.
     * @type {EventHandler<ScrollViewerViewChangingEventArgs>}
    */
    OnViewChanging {
        get {
            if(!this.HasProp("__OnViewChanging")){
                this.__OnViewChanging := WinRTEventHandler(
                    EventHandler,
                    Guid("{bc463f46-e07b-56c3-8d04-f0e1513266c5}"),
                    IInspectable,
                    ScrollViewerViewChangingEventArgs
                )
                this.__OnViewChangingToken := this.add_ViewChanging(this.__OnViewChanging.iface)
            }
            return this.__OnViewChanging
        }
    }

    /**
     * Occurs when any direct manipulation of the [ScrollViewer](scrollviewer.md) begins.
     * @type {EventHandler<IInspectable>}
    */
    OnDirectManipulationStarted {
        get {
            if(!this.HasProp("__OnDirectManipulationStarted")){
                this.__OnDirectManipulationStarted := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnDirectManipulationStartedToken := this.add_DirectManipulationStarted(this.__OnDirectManipulationStarted.iface)
            }
            return this.__OnDirectManipulationStarted
        }
    }

    /**
     * Occurs when any direct manipulation of the [ScrollViewer](scrollviewer.md) finishes.
     * @type {EventHandler<IInspectable>}
    */
    OnDirectManipulationCompleted {
        get {
            if(!this.HasProp("__OnDirectManipulationCompleted")){
                this.__OnDirectManipulationCompleted := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnDirectManipulationCompletedToken := this.add_DirectManipulationCompleted(this.__OnDirectManipulationCompleted.iface)
            }
            return this.__OnDirectManipulationCompleted
        }
    }

    /**
     * Occurs when an anchor is requested at the beginning of the Arrange pass. Handle this event to override the ScrollViewer's default logic to select an anchor element as part of *scroll anchoring*.
     * @remarks
     * Explicitly set the [Anchor](anchorrequestedeventargs_anchor.md) property of the [AnchorRequestedEventArgs](anchorrequestedeventargs.md) to a UIElement within the [ScrollViewer](scrollviewer.md)'s subtree to override the default policy of choosing an anchor element.  The [AnchorCandidates](anchorrequestedeventargs_anchorcandidates.md) property provides the list of candidates currently registered with the [ScrollViewer](scrollviewer.md).
     * @type {TypedEventHandler<ScrollViewer, AnchorRequestedEventArgs>}
    */
    OnAnchorRequested {
        get {
            if(!this.HasProp("__OnAnchorRequested")){
                this.__OnAnchorRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cee8ee94-babc-5b1c-8cfc-1c9985e8b542}"),
                    ScrollViewer,
                    AnchorRequestedEventArgs
                )
                this.__OnAnchorRequestedToken := this.add_AnchorRequested(this.__OnAnchorRequested.iface)
            }
            return this.__OnAnchorRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ScrollViewer](scrollviewer.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnViewChangedToken")) {
            this.remove_ViewChanged(this.__OnViewChangedToken)
            this.__OnViewChanged.iface.Dispose()
        }

        if(this.HasProp("__OnViewChangingToken")) {
            this.remove_ViewChanging(this.__OnViewChangingToken)
            this.__OnViewChanging.iface.Dispose()
        }

        if(this.HasProp("__OnDirectManipulationStartedToken")) {
            this.remove_DirectManipulationStarted(this.__OnDirectManipulationStartedToken)
            this.__OnDirectManipulationStarted.iface.Dispose()
        }

        if(this.HasProp("__OnDirectManipulationCompletedToken")) {
            this.remove_DirectManipulationCompleted(this.__OnDirectManipulationCompletedToken)
            this.__OnDirectManipulationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnAnchorRequestedToken")) {
            this.remove_AnchorRequested(this.__OnAnchorRequestedToken)
            this.__OnAnchorRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalScrollBarVisibility() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_HorizontalScrollBarVisibility()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalScrollBarVisibility(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_HorizontalScrollBarVisibility(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalScrollBarVisibility() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_VerticalScrollBarVisibility()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalScrollBarVisibility(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_VerticalScrollBarVisibility(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHorizontalRailEnabled() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_IsHorizontalRailEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHorizontalRailEnabled(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_IsHorizontalRailEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVerticalRailEnabled() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_IsVerticalRailEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVerticalRailEnabled(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_IsVerticalRailEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHorizontalScrollChainingEnabled() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_IsHorizontalScrollChainingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHorizontalScrollChainingEnabled(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_IsHorizontalScrollChainingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVerticalScrollChainingEnabled() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_IsVerticalScrollChainingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVerticalScrollChainingEnabled(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_IsVerticalScrollChainingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomChainingEnabled() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_IsZoomChainingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsZoomChainingEnabled(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_IsZoomChainingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScrollInertiaEnabled() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_IsScrollInertiaEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsScrollInertiaEnabled(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_IsScrollInertiaEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomInertiaEnabled() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_IsZoomInertiaEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsZoomInertiaEnabled(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_IsZoomInertiaEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalScrollMode() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_HorizontalScrollMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalScrollMode(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_HorizontalScrollMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalScrollMode() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_VerticalScrollMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalScrollMode(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_VerticalScrollMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZoomMode() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ZoomMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ZoomMode(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_ZoomMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalSnapPointsAlignment() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_HorizontalSnapPointsAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalSnapPointsAlignment(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_HorizontalSnapPointsAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalSnapPointsAlignment() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_VerticalSnapPointsAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalSnapPointsAlignment(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_VerticalSnapPointsAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalSnapPointsType() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_HorizontalSnapPointsType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalSnapPointsType(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_HorizontalSnapPointsType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalSnapPointsType() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_VerticalSnapPointsType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalSnapPointsType(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_VerticalSnapPointsType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZoomSnapPointsType() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ZoomSnapPointsType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ZoomSnapPointsType(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_ZoomSnapPointsType(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_HorizontalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportWidth() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ViewportWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScrollableWidth() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ScrollableWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComputedHorizontalScrollBarVisibility() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ComputedHorizontalScrollBarVisibility()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentWidth() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ExtentWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_VerticalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportHeight() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ViewportHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScrollableHeight() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ScrollableHeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComputedVerticalScrollBarVisibility() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ComputedVerticalScrollBarVisibility()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExtentHeight() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ExtentHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinZoomFactor() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_MinZoomFactor()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinZoomFactor(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_MinZoomFactor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxZoomFactor() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_MaxZoomFactor()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxZoomFactor(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_MaxZoomFactor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZoomFactor() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ZoomFactor()
    }

    /**
     * 
     * @returns {IVector<Float>} 
     */
    get_ZoomSnapPoints() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_ZoomSnapPoints()
    }

    /**
     * 
     * @param {EventHandler<ScrollViewerViewChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ViewChanged(handler) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.add_ViewChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ViewChanged(token) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.remove_ViewChanged(token)
    }

    /**
     * > [!NOTE]
     * > ScrollToHorizontalOffset may be altered or unavailable for releases after Windows 8.1. Instead, use [ChangeView](scrollviewer_changeview_1425504772.md).
     * 
     * Scrolls the content that is within the [ScrollViewer](scrollviewer.md) to the specified horizontal offset position.
     * @param {Float} offset The position that the content scrolls to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.scrolltohorizontaloffset
     */
    ScrollToHorizontalOffset(offset) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.ScrollToHorizontalOffset(offset)
    }

    /**
     * > [!NOTE]
     * > ScrollToVerticalOffset may be altered or unavailable for releases after Windows 8.1. Instead, use [ChangeView](scrollviewer_changeview_1425504772.md).
     * 
     * Scrolls the content that is within the [ScrollViewer](scrollviewer.md) to the specified vertical offset position.
     * @param {Float} offset The position that the content scrolls to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.scrolltoverticaloffset
     */
    ScrollToVerticalOffset(offset) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.ScrollToVerticalOffset(offset)
    }

    /**
     * > [!NOTE]
     * > ZoomToFactor may be altered or unavailable for releases after Windows 8.1. Instead, use [ChangeView](scrollviewer_changeview_1425504772.md).
     * 
     * Sets the effective value of [ZoomFactor](scrollviewer_zoomfactor.md).
     * @param {Float} factor The zoom factor to set. The factors are based on a norm of 1.0, which represents no zoom applied. The values you can set are also influenced by current values for [MinZoomFactor](scrollviewer_minzoomfactor.md) and [MaxZoomFactor](scrollviewer_maxzoomfactor.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.zoomtofactor
     */
    ZoomToFactor(factor) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.ZoomToFactor(factor)
    }

    /**
     * Called when the value of properties that describe the size and location of the scroll area change.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.invalidatescrollinfo
     */
    InvalidateScrollInfo() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.InvalidateScrollInfo()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDeferredScrollingEnabled() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_IsDeferredScrollingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDeferredScrollingEnabled(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_IsDeferredScrollingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BringIntoViewOnFocusChange() {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.get_BringIntoViewOnFocusChange()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BringIntoViewOnFocusChange(value) {
        if (!this.HasProp("__IScrollViewer")) {
            if ((queryResult := this.QueryInterface(IScrollViewer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer := IScrollViewer(outPtr)
        }

        return this.__IScrollViewer.put_BringIntoViewOnFocusChange(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_TopLeftHeader() {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.get_TopLeftHeader()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_TopLeftHeader(value) {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.put_TopLeftHeader(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_LeftHeader() {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.get_LeftHeader()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_LeftHeader(value) {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.put_LeftHeader(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_TopHeader() {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.get_TopHeader()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_TopHeader(value) {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.put_TopHeader(value)
    }

    /**
     * 
     * @param {EventHandler<ScrollViewerViewChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ViewChanging(handler) {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.add_ViewChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ViewChanging(token) {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.remove_ViewChanging(token)
    }

    /**
     * Causes the [ScrollViewer](scrollviewer.md) to load a new view into the viewport using the specified offsets and zoom factor, and optionally disables scrolling animation.
     * @remarks
     * You can set parameter values to **null** to use this method to scroll only horizontally, only vertically, or to only change the zoom factor.
     * @param {IReference<Float>} horizontalOffset A value between 0 and [ScrollableWidth](scrollviewer_scrollablewidth.md) that specifies the distance the content should be scrolled horizontally.
     * @param {IReference<Float>} verticalOffset A value between 0 and [ScrollableHeight](scrollviewer_scrollableheight.md) that specifies the distance the content should be scrolled vertically.
     * @param {IReference<Float>} zoomFactor A value between [MinZoomFactor](scrollviewer_minzoomfactor.md) and [MaxZoomFactor](scrollviewer_maxzoomfactor.md) that specifies the required target [ZoomFactor](scrollviewer_maxzoomfactor.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.changeview
     */
    ChangeView(horizontalOffset, verticalOffset, zoomFactor) {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.ChangeView(horizontalOffset, verticalOffset, zoomFactor)
    }

    /**
     * Causes the [ScrollViewer](scrollviewer.md) to load a new view into the viewport using the specified offsets and zoom factor.
     * @remarks
     * You can set parameter values to **null** to use this method to scroll only horizontally, only vertically, or to only change the zoom factor.
     * @param {IReference<Float>} horizontalOffset A value between 0 and [ScrollableWidth](scrollviewer_scrollablewidth.md) that specifies the distance the content should be scrolled horizontally.
     * @param {IReference<Float>} verticalOffset A value between 0 and [ScrollableHeight](scrollviewer_scrollableheight.md) that specifies the distance the content should be scrolled vertically.
     * @param {IReference<Float>} zoomFactor A value between [MinZoomFactor](scrollviewer_minzoomfactor.md) and [MaxZoomFactor](scrollviewer_maxzoomfactor.md) that specifies the required target [ZoomFactor](scrollviewer_maxzoomfactor.md).
     * @param {Boolean} disableAnimation 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.changeview
     */
    ChangeViewWithOptionalAnimation(horizontalOffset, verticalOffset, zoomFactor, disableAnimation) {
        if (!this.HasProp("__IScrollViewer2")) {
            if ((queryResult := this.QueryInterface(IScrollViewer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer2 := IScrollViewer2(outPtr)
        }

        return this.__IScrollViewer2.ChangeViewWithOptionalAnimation(horizontalOffset, verticalOffset, zoomFactor, disableAnimation)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DirectManipulationStarted(handler) {
        if (!this.HasProp("__IScrollViewer3")) {
            if ((queryResult := this.QueryInterface(IScrollViewer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer3 := IScrollViewer3(outPtr)
        }

        return this.__IScrollViewer3.add_DirectManipulationStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DirectManipulationStarted(token) {
        if (!this.HasProp("__IScrollViewer3")) {
            if ((queryResult := this.QueryInterface(IScrollViewer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer3 := IScrollViewer3(outPtr)
        }

        return this.__IScrollViewer3.remove_DirectManipulationStarted(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DirectManipulationCompleted(handler) {
        if (!this.HasProp("__IScrollViewer3")) {
            if ((queryResult := this.QueryInterface(IScrollViewer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer3 := IScrollViewer3(outPtr)
        }

        return this.__IScrollViewer3.add_DirectManipulationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DirectManipulationCompleted(token) {
        if (!this.HasProp("__IScrollViewer3")) {
            if ((queryResult := this.QueryInterface(IScrollViewer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer3 := IScrollViewer3(outPtr)
        }

        return this.__IScrollViewer3.remove_DirectManipulationCompleted(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ReduceViewportForCoreInputViewOcclusions() {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.get_ReduceViewportForCoreInputViewOcclusions()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ReduceViewportForCoreInputViewOcclusions(value) {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.put_ReduceViewportForCoreInputViewOcclusions(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalAnchorRatio() {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.get_HorizontalAnchorRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalAnchorRatio(value) {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.put_HorizontalAnchorRatio(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalAnchorRatio() {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.get_VerticalAnchorRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalAnchorRatio(value) {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.put_VerticalAnchorRatio(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanContentRenderOutsideBounds() {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.get_CanContentRenderOutsideBounds()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanContentRenderOutsideBounds(value) {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.put_CanContentRenderOutsideBounds(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ScrollViewer, AnchorRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AnchorRequested(handler) {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.add_AnchorRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AnchorRequested(token) {
        if (!this.HasProp("__IScrollViewer4")) {
            if ((queryResult := this.QueryInterface(IScrollViewer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewer4 := IScrollViewer4(outPtr)
        }

        return this.__IScrollViewer4.remove_AnchorRequested(token)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_CurrentAnchor() {
        if (!this.HasProp("__IScrollAnchorProvider")) {
            if ((queryResult := this.QueryInterface(IScrollAnchorProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollAnchorProvider := IScrollAnchorProvider(outPtr)
        }

        return this.__IScrollAnchorProvider.get_CurrentAnchor()
    }

    /**
     * Registers a [UIElement](../windows.ui.xaml/uielement.md) as a potential scroll anchor.
     * @remarks
     * When an element has [CanBeScrollAnchor](../windows.ui.xaml/uielement_canbescrollanchor.md) set to **true** the framework locates the first [IScrollAnchorProvider](iscrollanchorprovider.md) in that element's chain of ancestors and automatically calls its RegisterAnchorCandidate method. This occurs both when the property is set on an existing element or an element is added to the live tree with the property already set.
     * 
     * Similarly, when the property is set to **false** (or an element is removed from the visual tree with the property set to true), the framework calls the [UnregisterAnchorCandidate](iscrollanchorprovider_unregisteranchorcandidate_667335027.md) on the first [IScrollAnchorProvider](iscrollanchorprovider.md).
     * @param {UIElement} element A [UIElement](../windows.ui.xaml/uielement.md) within the subtree of the [ScrollViewer](scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.registeranchorcandidate
     */
    RegisterAnchorCandidate(element) {
        if (!this.HasProp("__IScrollAnchorProvider")) {
            if ((queryResult := this.QueryInterface(IScrollAnchorProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollAnchorProvider := IScrollAnchorProvider(outPtr)
        }

        return this.__IScrollAnchorProvider.RegisterAnchorCandidate(element)
    }

    /**
     * Unregisters a [UIElement](../windows.ui.xaml/uielement.md) as a potential scroll anchor.
     * @remarks
     * When an element's [CanBeScrollAnchor](../windows.ui.xaml/uielement_canbescrollanchor.md) property changes to **false** (or the element is removed from the visual tree), the framework locates the first [IScrollAnchorProvider](iscrollanchorprovider.md) in that element's chain of ancestors and automatically calls its UnregisterAnchorCandidate method.
     * @param {UIElement} element A [UIElement](../windows.ui.xaml/uielement.md) within the subtree of the [ScrollViewer](scrollviewer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewer.unregisteranchorcandidate
     */
    UnregisterAnchorCandidate(element) {
        if (!this.HasProp("__IScrollAnchorProvider")) {
            if ((queryResult := this.QueryInterface(IScrollAnchorProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollAnchorProvider := IScrollAnchorProvider(outPtr)
        }

        return this.__IScrollAnchorProvider.UnregisterAnchorCandidate(element)
    }

;@endregion Instance Methods
}
