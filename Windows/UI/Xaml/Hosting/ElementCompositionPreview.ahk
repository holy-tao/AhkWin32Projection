#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IElementCompositionPreview.ahk
#Include .\IElementCompositionPreviewStatics3.ahk
#Include .\IElementCompositionPreviewStatics.ahk
#Include .\IElementCompositionPreviewStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables access to composition visual objects that back XAML elements in the XAML composition tree.
 * @remarks
 * ElementCompositionPreview allows access to the [Windows.UI.Composition.Visual](../windows.ui.composition/visual.md) object backing a XAML element with the [GetElementVisual](elementcompositionpreview_getelementvisual_1511147715.md) method. Once the backing object has been retrieved it can be manipulated using the [Windows.UI.Composition](../windows.ui.composition/windows_ui_composition.md) namespace. This allows properties of the object to be changed, like the orientation, or additional objects to be added to the XAML composition tree.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class ElementCompositionPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IElementCompositionPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IElementCompositionPreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Sets a XAML UIElement as the content root of an AppWindow.
     * @param {AppWindow} appWindow_ The AppWindow to set the content for.
     * @param {UIElement} xamlContent The content to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.setappwindowcontent
     */
    static SetAppWindowContent(appWindow_, xamlContent) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics3.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics3 := IElementCompositionPreviewStatics3(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics3.SetAppWindowContent(appWindow_, xamlContent)
    }

    /**
     * Retrieves the content root of an AppWindow.
     * @param {AppWindow} appWindow_ The AppWindow to get the content from.
     * @returns {UIElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.getappwindowcontent
     */
    static GetAppWindowContent(appWindow_) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics3.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics3 := IElementCompositionPreviewStatics3(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics3.GetAppWindowContent(appWindow_)
    }

    /**
     * Retrieves the [Windows.UI.Composition.Visual](../windows.ui.composition/visual.md) object that backs a XAML element in the XAML composition tree.
     * @param {UIElement} element The element for which to retrieve the [Visual](../windows.ui.composition/visual.md).
     * @returns {Visual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.getelementvisual
     */
    static GetElementVisual(element) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics := IElementCompositionPreviewStatics(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics.GetElementVisual(element)
    }

    /**
     * Retrieves a [Windows.UI.Composition.Visual](../windows.ui.composition/visual.md) object previously set by a call to [SetElementChildVisual](elementcompositionpreview_setelementchildvisual_151424769.md).
     * @param {UIElement} element The element for which to retrieve the [Visual](../windows.ui.composition/visual.md).
     * @returns {Visual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.getelementchildvisual
     */
    static GetElementChildVisual(element) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics := IElementCompositionPreviewStatics(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics.GetElementChildVisual(element)
    }

    /**
     * Sets a custom [Windows.UI.Composition.Visual](../windows.ui.composition/visual.md) as the last child of the element’s visual tree.
     * @remarks
     * The [Visual](../windows.ui.composition/visual.md) is added as the last child, therefore on top of the rest of the element in z-order.
     * @param {UIElement} element The element to add the child [Visual](../windows.ui.composition/visual.md) to.
     * @param {Visual} visual_ The [Visual](../windows.ui.composition/visual.md) to add to the element's visual tree.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.setelementchildvisual
     */
    static SetElementChildVisual(element, visual_) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics := IElementCompositionPreviewStatics(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics.SetElementChildVisual(element, visual_)
    }

    /**
     * Retrieves the composition properties of a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) element.
     * @param {ScrollViewer} scrollViewer_ The [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md) element to get the composition properties for.
     * @returns {CompositionPropertySet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.getscrollviewermanipulationpropertyset
     */
    static GetScrollViewerManipulationPropertySet(scrollViewer_) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics := IElementCompositionPreviewStatics(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics.GetScrollViewerManipulationPropertySet(scrollViewer_)
    }

    /**
     * Associates the specified show animation with a UIElement.
     * @remarks
     * When an element is added to the scene or its **Visibility** property becomes **Visibility.Visible**, the element and all of its descendents in the UI tree will play their show animations.
     * @param {UIElement} element The UIElement to associate the animation with.
     * @param {ICompositionAnimationBase} animation The animation to play when the UIElement is shown. A **Null** value prevents show animations from playing for this element until the method is called again with an animation value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.setimplicitshowanimation
     */
    static SetImplicitShowAnimation(element, animation) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics2.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics2 := IElementCompositionPreviewStatics2(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics2.SetImplicitShowAnimation(element, animation)
    }

    /**
     * Associates the specified hide animation with a UIElement.
     * @remarks
     * When an element is removed from the scene or its **Visibility** property becomes **Visibility.Collapsed**, the element and all of its descendents in the UI tree will play their hide animations.
     * @param {UIElement} element The UIElement to associate the animation with.
     * @param {ICompositionAnimationBase} animation The animation to play when the UIElement is hidden. A **Null** value prevents hide animations from playing for this element until the method is called again with an animation value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.setimplicithideanimation
     */
    static SetImplicitHideAnimation(element, animation) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics2.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics2 := IElementCompositionPreviewStatics2(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics2.SetImplicitHideAnimation(element, animation)
    }

    /**
     * Toggles the ability to set, animate, and use a render-time post-layout translate transform to position XAML elements on screen using Composition APIs.
     * @param {UIElement} element The element on which to enable or disable translate transforms.
     * @param {Boolean} value **true** to enable translate transforms; **false** to disable translate transforms.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.setistranslationenabled
     */
    static SetIsTranslationEnabled(element, value) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics2.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics2 := IElementCompositionPreviewStatics2(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics2.SetIsTranslationEnabled(element, value)
    }

    /**
     * Retrieves the pointer position relative to a UIElement.
     * @param {UIElement} targetElement The element that the pointer position is relative to.
     * @returns {CompositionPropertySet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.elementcompositionpreview.getpointerpositionpropertyset
     */
    static GetPointerPositionPropertySet(targetElement) {
        if (!ElementCompositionPreview.HasProp("__IElementCompositionPreviewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.ElementCompositionPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementCompositionPreviewStatics2.IID)
            ElementCompositionPreview.__IElementCompositionPreviewStatics2 := IElementCompositionPreviewStatics2(factoryPtr)
        }

        return ElementCompositionPreview.__IElementCompositionPreviewStatics2.GetPointerPositionPropertySet(targetElement)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
