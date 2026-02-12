#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Panel.ahk
#Include .\ICanvas.ahk
#Include .\ICanvasStatics.ahk
#Include .\ICanvasFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines an area within which you can explicitly position child objects, using coordinates that are relative to the Canvas area.
 * @remarks
 * Canvas is a layout panel that supports absolute positioning of child elements relative to the top left corner of the canvas.
 * 
 * <img alt="Canvas layout panel" src="images/controls/Canvas.png" />
 * 
 * A Canvas is one of the [Panel](panel.md) elements that enable layout. Canvas uses absolute positioning as its layout technique for its contained child elements. Each child element is rendered within the Canvas area. You control the positioning of elements inside the Canvas by specifying x and y coordinates. These coordinates are in pixels. The x and y coordinates are often specified by using the [Canvas.Left](/uwp/api/windows.ui.xaml.controls.canvas.left) and [Canvas.Top](/uwp/api/windows.ui.xaml.controls.canvas.top) attached properties. [Canvas.Left](/uwp/api/windows.ui.xaml.controls.canvas.left) specifies the object's distance from the left side of the containing Canvas (the x-coordinate), and [Canvas.Top](/uwp/api/windows.ui.xaml.controls.canvas.top) specifies the object's distance from the top of the containing Canvas (the y-coordinate).
 * 
 * > [!NOTE]
 * > Because absolute positioning does not take into account the size of the app window, scaling, or other user-selected sizing, using a container element that adapts to different orientations and screen settings, such as [Grid](grid.md) or [StackPanel](stackpanel.md), is often a better choice than using Canvas. For more information, see [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
 * 
 * You can nest Canvas objects. When you nest objects, the coordinates used by each object are relative to its immediate containing Canvas.
 * 
 * Each child object of a Canvas must be a [UIElement](../windows.ui.xaml/uielement.md). In XAML, you declare child objects as content of a Canvas object element. In code, you can manipulate the collection of Canvas child objects by getting the collection that is accessed by the [Children](panel_children.md) property.
 * 
 * In many cases, a Canvas is used solely as a container for other objects and does not have any visible properties. A Canvas and its children (if any) are not visible if any of these conditions are true:
 * 
 * + The [Visibility](../windows.ui.xaml/uielement_visibility.md) property is set to **Collapsed**.
 * + The [Opacity](../windows.ui.xaml/uielement_opacity.md) property of the Canvas is 0.
 * 
 * The children of a Canvas (if any) are still visible even if the Canvas has any of these conditions:
 * 
 * + The [Background](panel_background.md) property of the Canvas is **null**.
 * + The [Height](../windows.ui.xaml/frameworkelement_height.md) or [Width](../windows.ui.xaml/frameworkelement_width.md) property of the Canvas is 0.
 * 
 * A Canvas with no children and with a default [Height](../windows.ui.xaml/frameworkelement_height.md) and [Width](../windows.ui.xaml/frameworkelement_width.md) of **Auto** doesn't have dimensions. This is also the case if the Canvas has children but all the children have [Visibility](../windows.ui.xaml/uielement_visibility.md) of **Collapsed**, or zero [Height](../windows.ui.xaml/frameworkelement_height.md) or [Width](../windows.ui.xaml/frameworkelement_width.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Canvas extends Panel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICanvas

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICanvas.IID

    /**
     * Identifies the [Canvas.Left](canvas_left.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [Canvas.Left](canvas_left.md) XAML attached property in XAML and won't need this identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas.leftproperty
     * @type {DependencyProperty} 
     */
    static LeftProperty {
        get => Canvas.get_LeftProperty()
    }

    /**
     * Identifies the [Canvas.Top](canvas_top.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [Canvas.Top](canvas_top.md) XAML attached property in XAML and won't need this identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas.topproperty
     * @type {DependencyProperty} 
     */
    static TopProperty {
        get => Canvas.get_TopProperty()
    }

    /**
     * Identifies the [Canvas.ZIndex](canvas_zindex.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [Canvas.ZIndex](canvas_zindex.md) XAML attached property in XAML and won't need this identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas.zindexproperty
     * @type {DependencyProperty} 
     */
    static ZIndexProperty {
        get => Canvas.get_ZIndexProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LeftProperty() {
        if (!Canvas.HasProp("__ICanvasStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasStatics.IID)
            Canvas.__ICanvasStatics := ICanvasStatics(factoryPtr)
        }

        return Canvas.__ICanvasStatics.get_LeftProperty()
    }

    /**
     * Gets the value of the [Canvas.Left](canvas_left.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Canvas.Left](canvas_left.md) XAML attached property in XAML and won't need this method. For more info, see the [Canvas.Left](canvas_left.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas.getleft
     */
    static GetLeft(element) {
        if (!Canvas.HasProp("__ICanvasStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasStatics.IID)
            Canvas.__ICanvasStatics := ICanvasStatics(factoryPtr)
        }

        return Canvas.__ICanvasStatics.GetLeft(element)
    }

    /**
     * Sets the value of the [Canvas.Left](canvas_left.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Canvas.Left](canvas_left.md) XAML attached property in XAML and won't need this method. For more info, see the [Canvas.Left](canvas_left.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {Float} length The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas.setleft
     */
    static SetLeft(element, length) {
        if (!Canvas.HasProp("__ICanvasStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasStatics.IID)
            Canvas.__ICanvasStatics := ICanvasStatics(factoryPtr)
        }

        return Canvas.__ICanvasStatics.SetLeft(element, length)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TopProperty() {
        if (!Canvas.HasProp("__ICanvasStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasStatics.IID)
            Canvas.__ICanvasStatics := ICanvasStatics(factoryPtr)
        }

        return Canvas.__ICanvasStatics.get_TopProperty()
    }

    /**
     * Gets the value of the [Canvas.Top](canvas_top.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Canvas.Top](canvas_top.md) XAML attached property in XAML and won't need this method. For more info, see the [Canvas.Top](canvas_top.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas.gettop
     */
    static GetTop(element) {
        if (!Canvas.HasProp("__ICanvasStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasStatics.IID)
            Canvas.__ICanvasStatics := ICanvasStatics(factoryPtr)
        }

        return Canvas.__ICanvasStatics.GetTop(element)
    }

    /**
     * Sets the value of the [Canvas.Top](canvas_top.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Canvas.Top](canvas_top.md) XAML attached property in XAML and won't need this method. For more info, see the [Canvas.Top](canvas_top.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {Float} length The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas.settop
     */
    static SetTop(element, length) {
        if (!Canvas.HasProp("__ICanvasStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasStatics.IID)
            Canvas.__ICanvasStatics := ICanvasStatics(factoryPtr)
        }

        return Canvas.__ICanvasStatics.SetTop(element, length)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZIndexProperty() {
        if (!Canvas.HasProp("__ICanvasStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasStatics.IID)
            Canvas.__ICanvasStatics := ICanvasStatics(factoryPtr)
        }

        return Canvas.__ICanvasStatics.get_ZIndexProperty()
    }

    /**
     * Gets the value of the [Canvas.ZIndex](canvas_zindex.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Canvas.ZIndex](canvas_zindex.md) XAML attached property in XAML and won't need this method. For more info, see the [Canvas.ZIndex](canvas_zindex.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas.getzindex
     */
    static GetZIndex(element) {
        if (!Canvas.HasProp("__ICanvasStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasStatics.IID)
            Canvas.__ICanvasStatics := ICanvasStatics(factoryPtr)
        }

        return Canvas.__ICanvasStatics.GetZIndex(element)
    }

    /**
     * Sets the value of the [Canvas.ZIndex](canvas_zindex.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [Canvas.ZIndex](canvas_zindex.md) XAML attached property in XAML and won't need this method. For more info, see the [Canvas.ZIndex](canvas_zindex.md) attached property.
     * @param {UIElement} element The object to which the property value is written. 
     * <!--The maximum allowed value for <xref rid="w_ui_xaml_ctrl.canvas_zindex" targtype="property_winrt">ZIndex</xref> is Int16.MaxValue – 1 = 32766.
     *       -->
     * @param {Integer} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.canvas.setzindex
     */
    static SetZIndex(element, value) {
        if (!Canvas.HasProp("__ICanvasStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasStatics.IID)
            Canvas.__ICanvasStatics := ICanvasStatics(factoryPtr)
        }

        return Canvas.__ICanvasStatics.SetZIndex(element, value)
    }

    /**
     * 
     * @returns {Canvas} 
     */
    static CreateInstance() {
        if (!Canvas.HasProp("__ICanvasFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Canvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICanvasFactory.IID)
            Canvas.__ICanvasFactory := ICanvasFactory(factoryPtr)
        }

        return Canvas.__ICanvasFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
