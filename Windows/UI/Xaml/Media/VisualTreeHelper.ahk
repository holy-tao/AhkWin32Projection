#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVisualTreeHelper.ahk
#Include .\IVisualTreeHelperStatics2.ahk
#Include .\IVisualTreeHelperStatics.ahk
#Include .\IVisualTreeHelperStatics3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides utility methods that can be used to traverse object relationships (along child-object or parent-object axes) in the visual tree of your app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class VisualTreeHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualTreeHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualTreeHelper.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a collection of all open popup controls from the target [Window](../windows.ui.xaml/window.md).
     * @remarks
     * Popups don't exist in the conventional XAML visual tree that begins from the root visual, although they are associated with the app main window. Unless your app maintains a list of all the [Popup](../windows.ui.xaml.controls.primitives/popup.md) elements you've created as well as a status (the [IsOpen](../windows.ui.xaml.controls.primitives/popup_isopen.md) value), it can be difficult to keep track of them. Sometimes you will want to clear all popups prior to initiating another UI action, like navigating the page or displaying a flyout. GetOpenPopups provides the utility so that you can get a reference to all these popups as [Popup](../windows.ui.xaml.controls.primitives/popup.md) instances, and then you would typically set [IsOpen](../windows.ui.xaml.controls.primitives/popup_isopen.md) to **false** on each of them.
     * 
     * Elements such as [AppBar](../windows.ui.xaml.controls/appbar.md) are not considered a popup, they are owned by the [Page](../windows.ui.xaml.controls/page.md). A [ToolTip](../windows.ui.xaml.controls/tooltip.md) is also not considered a popup, it's considered a child of the element that uses the [ToolTipService](../windows.ui.xaml.controls/tooltipservice.md) attached properties to host it. Both [AppBar](../windows.ui.xaml.controls/appbar.md) and [ToolTip](../windows.ui.xaml.controls/tooltip.md) elements are thus in the conventional XAML visual tree, even if they're not always displayed at the time. You could find these with [GetChild](visualtreehelper_getchild_2017450836.md) or other [VisualTreeHelper](visualtreehelper.md)API, or by walking the tree with **Child*/*Items*/*Children** and related properties if you know the exact structure by type.
     * @param {Window} window_ The current [Window](../windows.ui.xaml/window.md) instance to retrieve the popups from.
     * @returns {IVectorView<Popup>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.getopenpopups
     */
    static GetOpenPopups(window_) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics2.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics2 := IVisualTreeHelperStatics2(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics2.GetOpenPopups(window_)
    }

    /**
     * Retrieves a set of objects that are located within a specified [Rect](../windows.foundation/rect.md) frame of an app UI. The set of objects represents the components of a visual tree that share a rectangular area, and might include elements that overdraw.
     * @remarks
     * An element is considered hit-testable if it both occupies space in the layout and "*produces ink*". 
     * For elements that have a [Brush](./brush.md), any non-**null** Brush is considered something that produces ink, even if the Brush doesn't produce visible pixels. For example, a [SolidColorBrush](./solidcolorbrush.md) with its color set to *Transparent* still produces ink. Only a **null** brush does not produce ink. The Opacity property is not considered. The element still produces ink even if it's Opacity is 0.
     * 
     * When the *includeAllElements* parameter is set to **true**, elements that don't produce ink are considered for hit-testing. In this case, as long as the element meets the spatial requirements (the rect intersects the element bounds), then it and its ancestors are included in the results.
     * 
     * > [!NOTE]
     * > Some special elements, like [SwapChainPanel](./../windows.ui.xaml.controls/swapchainpanel.md) and [MediaElement](./../windows.ui.xaml.controls/mediaelement.md), don’t have a brush but can still produce ink.
     * @param {POINT} intersectingPoint 
     * @param {UIElement} subtree An object to search for. If the *subtree* object exists in the overall set of elements that exist within the specified *intersectingRect*, then the return value contains only the *subtree* object and elements that are drawing on top of its space. If the *subtree* object doesn't exist within the *intersectingRect* frame, the return value will be empty.
     * @returns {IIterable<UIElement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.findelementsinhostcoordinates
     */
    static FindElementsInHostCoordinatesPoint(intersectingPoint, subtree) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics := IVisualTreeHelperStatics(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics.FindElementsInHostCoordinatesPoint(intersectingPoint, subtree)
    }

    /**
     * Retrieves a set of objects that are located within a specified [Rect](../windows.foundation/rect.md) frame of an app UI. The set of objects represents the components of a visual tree that share a rectangular area, and might include elements that overdraw.
     * @remarks
     * An element is considered hit-testable if it both occupies space in the layout and "*produces ink*". 
     * For elements that have a [Brush](./brush.md), any non-**null** Brush is considered something that produces ink, even if the Brush doesn't produce visible pixels. For example, a [SolidColorBrush](./solidcolorbrush.md) with its color set to *Transparent* still produces ink. Only a **null** brush does not produce ink. The Opacity property is not considered. The element still produces ink even if it's Opacity is 0.
     * 
     * When the *includeAllElements* parameter is set to **true**, elements that don't produce ink are considered for hit-testing. In this case, as long as the element meets the spatial requirements (the rect intersects the element bounds), then it and its ancestors are included in the results.
     * 
     * > [!NOTE]
     * > Some special elements, like [SwapChainPanel](./../windows.ui.xaml.controls/swapchainpanel.md) and [MediaElement](./../windows.ui.xaml.controls/mediaelement.md), don’t have a brush but can still produce ink.
     * @param {RECT} intersectingRect The [Rect](../windows.foundation/rect.md) to use as the determination area. This frame is using the coordinate space of the app window, not of any specific element (and not of *subtree* if specified).
     * @param {UIElement} subtree An object to search for. If the *subtree* object exists in the overall set of elements that exist within the specified *intersectingRect*, then the return value contains only the *subtree* object and elements that are drawing on top of its space. If the *subtree* object doesn't exist within the *intersectingRect* frame, the return value will be empty.
     * @returns {IIterable<UIElement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.findelementsinhostcoordinates
     */
    static FindElementsInHostCoordinatesRect(intersectingRect, subtree) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics := IVisualTreeHelperStatics(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics.FindElementsInHostCoordinatesRect(intersectingRect, subtree)
    }

    /**
     * Retrieves a set of objects that are located within a specified [Rect](../windows.foundation/rect.md) frame of an app UI. The set of objects represents the components of a visual tree that share a rectangular area, and might include elements that overdraw.
     * @remarks
     * The return value is not a single element, it is a collection. The collection can have more than one element because there can be multiple UI elements stacked over each other in a z-order, and also multiple elements fully or partially in the *intersectingRect* frame. The conventional hit-testing techniques exposed by the input event handlers, such as the *sender* value for a [PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md) event, only account for the topmost element that has the highest z-order. [FindElementsInHostCoordinates](visualtreehelper_findelementsinhostcoordinates_1478853318.md) methods return the whole stack of elements that share that point or area in the app UI, listed by visual tree order (which is usually the same as inverse of XAML declaration order). Using [FindElementsInHostCoordinates](visualtreehelper_findelementsinhostcoordinates_1478853318.md) can thus be useful for examining cases where you've intentionally or unintentionally stacked elements. You may want to correct the order for rendering and hit-testing, or examine that order for other reasons.
     * 
     * [FindElementsInHostCoordinates](visualtreehelper_findelementsinhostcoordinates_1478853318.md) over an area is useful for two scenarios: basic hit testing and hit testing that is filtering for a specific element.
     * @param {POINT} intersectingPoint 
     * @param {UIElement} subtree An object to search for. If the *subtree* object exists in the overall set of elements that exist within the specified *intersectingRect*, then the return value contains only the *subtree* object and elements that are drawing on top of its space. If the *subtree* object doesn't exist within the *intersectingRect* frame, the return value will be empty.
     * @param {Boolean} includeAllElements 
     * @returns {IIterable<UIElement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.findelementsinhostcoordinates
     */
    static FindAllElementsInHostCoordinatesPoint(intersectingPoint, subtree, includeAllElements) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics := IVisualTreeHelperStatics(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics.FindAllElementsInHostCoordinatesPoint(intersectingPoint, subtree, includeAllElements)
    }

    /**
     * Retrieves a set of objects that are located within a specified [Rect](../windows.foundation/rect.md) frame of an app UI. The set of objects represents the components of a visual tree that share a rectangular area, and might include elements that overdraw.
     * @remarks
     * The return value is not a single element, it is a collection. The collection can have more than one element because there can be multiple UI elements stacked over each other in a z-order, and also multiple elements fully or partially in the *intersectingRect* frame. The conventional hit-testing techniques exposed by the input event handlers, such as the *sender* value for a [PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md) event, only account for the topmost element that has the highest z-order. [FindElementsInHostCoordinates](visualtreehelper_findelementsinhostcoordinates_1478853318.md) methods return the whole stack of elements that share that point or area in the app UI, listed by visual tree order (which is usually the same as inverse of XAML declaration order). Using [FindElementsInHostCoordinates](visualtreehelper_findelementsinhostcoordinates_1478853318.md) can thus be useful for examining cases where you've intentionally or unintentionally stacked elements. You may want to correct the order for rendering and hit-testing, or examine that order for other reasons.
     * 
     * [FindElementsInHostCoordinates](visualtreehelper_findelementsinhostcoordinates_1478853318.md) over an area is useful for two scenarios: basic hit testing and hit testing that is filtering for a specific element.
     * @param {RECT} intersectingRect The [Rect](../windows.foundation/rect.md) to use as the determination area. This frame is using the coordinate space of the app window, not of any specific element (and not of *subtree* if specified).
     * @param {UIElement} subtree An object to search for. If the *subtree* object exists in the overall set of elements that exist within the specified *intersectingRect*, then the return value contains only the *subtree* object and elements that are drawing on top of its space. If the *subtree* object doesn't exist within the *intersectingRect* frame, the return value will be empty.
     * @param {Boolean} includeAllElements 
     * @returns {IIterable<UIElement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.findelementsinhostcoordinates
     */
    static FindAllElementsInHostCoordinatesRect(intersectingRect, subtree, includeAllElements) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics := IVisualTreeHelperStatics(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics.FindAllElementsInHostCoordinatesRect(intersectingRect, subtree, includeAllElements)
    }

    /**
     * Using the provided index, obtains a specific child object of the provided object by examining the visual tree.
     * @param {DependencyObject} reference_ The object that holds the child collection.
     * @param {Integer} childIndex The index of the requested child object in the *reference* child collection.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.getchild
     */
    static GetChild(reference_, childIndex) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics := IVisualTreeHelperStatics(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics.GetChild(reference_, childIndex)
    }

    /**
     * Returns the number of children that exist in an object's child collection in the visual tree.
     * @param {DependencyObject} reference_ The source visual.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.getchildrencount
     */
    static GetChildrenCount(reference_) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics := IVisualTreeHelperStatics(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics.GetChildrenCount(reference_)
    }

    /**
     * Returns an object's parent object in the visual tree.
     * @param {DependencyObject} reference_ The object for which to get the parent object.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.getparent
     */
    static GetParent(reference_) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics := IVisualTreeHelperStatics(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics.GetParent(reference_)
    }

    /**
     * Explicitly removes all references from a target [UIElement](../windows.ui.xaml/uielement.md), with the goal of cleaning up reference cycles.
     * @remarks
     * This method is not intended for typical app or user code scenarios. Instead, it is intended for scenarios where a visual tree is hosted by some other application, such as a designer or code analysis tool. In most cases the scenario is that the visual tree is being cleared because it is about to be rebuilt based on saved information plus changes.
     * @param {UIElement} element The target object to disconnect children and remove references from.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.disconnectchildrenrecursive
     */
    static DisconnectChildrenRecursive(element) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics := IVisualTreeHelperStatics(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics.DisconnectChildrenRecursive(element)
    }

    /**
     * Retrieves a collection of all open popup controls from the target [XamlRoot](../windows.ui.xaml/xamlroot.md).
     * @param {XamlRoot} xamlRoot_ The current [XamlRoot](../windows.ui.xaml/xamlroot.md) instance to retrieve the popups from.
     * @returns {IVectorView<Popup>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.visualtreehelper.getopenpopupsforxamlroot
     */
    static GetOpenPopupsForXamlRoot(xamlRoot_) {
        if (!VisualTreeHelper.HasProp("__IVisualTreeHelperStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.VisualTreeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualTreeHelperStatics3.IID)
            VisualTreeHelper.__IVisualTreeHelperStatics3 := IVisualTreeHelperStatics3(factoryPtr)
        }

        return VisualTreeHelper.__IVisualTreeHelperStatics3.GetOpenPopupsForXamlRoot(xamlRoot_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
