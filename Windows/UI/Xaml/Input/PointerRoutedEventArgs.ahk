#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IPointerRoutedEventArgs.ahk
#Include .\IPointerRoutedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the arguments returned by the last pointer event message.
 * @remarks
 * In most cases, we recommend that you get pointer info through the event argument of the pointer event handlers in your chosen language framework (Windows app using JavaScript, UWP app using C++, C#, or Visual Basic, or UWP app using DirectX with C++).
 * 
 * If the event argument doesn't intrinsically expose the pointer details required by your app, you can get access to extended pointer data through the [GetCurrentPoint](pointerroutedeventargs_getcurrentpoint_1761708789.md) and [GetIntermediatePoints](pointerroutedeventargs_getintermediatepoints_1716242609.md) methods of PointerRoutedEventArgs. Use these methods to specify the context of the pointer data.
 * 
 * The static [PointerPoint](../windows.ui.input/pointerpoint.md) methods, [GetCurrentPoint](../windows.ui.input/pointerpoint_getcurrentpoint_131721878.md) and [GetIntermediatePoints](../windows.ui.input/pointerpoint_getintermediatepoints_143894736.md), always use the context of the app.
 * The PointerRoutedEventArgs event data class is used for these events:
 * 
 * + [PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md)
 * + [PointerCanceled](../windows.ui.xaml/uielement_pointercanceled.md)
 * + [PointerCaptureLost](../windows.ui.xaml/uielement_pointercapturelost.md)
 * + [PointerEntered](../windows.ui.xaml/uielement_pointerentered.md)
 * + [PointerExited](../windows.ui.xaml/uielement_pointerexited.md)
 * + [PointerMoved](../windows.ui.xaml/uielement_pointermoved.md)
 * + [PointerReleased](../windows.ui.xaml/uielement_pointerreleased.md)
 * + [PointerWheelChanged](../windows.ui.xaml/uielement_pointerwheelchanged.md)
 * 
 * > [!IMPORTANT]
 * > Mouse input is associated with a single pointer assigned when mouse input is first detected. Clicking a mouse button (left, wheel, or right) creates a secondary association between the pointer and that button through the [PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md) event. The [PointerReleased](../windows.ui.xaml/uielement_pointerreleased.md) event is fired only when that same mouse button is released (no other button can be associated with the pointer until this event is complete). Because of this exclusive association, other mouse button clicks are routed through the [PointerMoved](../windows.ui.xaml/uielement_pointermoved.md) event. You can test the mouse button state when handling this event, as shown in the following example.
 * 
 * [!code-csharp[PointerMoved](../windows.ui.input.inking/code/PointerInput/csharp/MainPage.xaml.cs#SnippetPointerMoved)]
 * 
 * [!code-csharp[PointerMoved](../windows.ui.input.inking/code/PointerInput_UWP/csharp/MainPage.xaml.cs#SnippetPointerMoved)]
 * 
 * + The value of *sender* (which is on the delegate signature, not this event data class).
 * + Specific members of PointerRoutedEventArgs, such as [KeyModifiers](pointerroutedeventargs_keymodifiers.md) or [GetCurrentPoint](pointerroutedeventargs_getcurrentpoint_1761708789.md).
 * + Values of a [Pointer](pointer.md) device description class. Get the [Pointer](pointer.md) from the [Pointer](pointerroutedeventargs_pointer.md) property.
 * + Members that come from the system input conceptualization of a [PointerPoint](../windows.ui.input/pointerpoint.md). Use the [GetCurrentPoint](pointerroutedeventargs_getcurrentpoint_1761708789.md) API to get a [PointerPoint](../windows.ui.input/pointerpoint.md) value, then call [PointerPoint](../windows.ui.input/pointerpoint.md) API such as [Position](../windows.ui.input/pointerpoint_position.md) and [PointerPointProperties](../windows.ui.input/pointerpointproperties.md).
 * 
 * Specific events often have information available in the various pointer device and pointer point classes that is mainly only relevant for that event. For example, when you handle [PointerWheelChanged](../windows.ui.xaml/uielement_pointerwheelchanged.md), you might be interested in the [MouseWheelDelta](../windows.ui.input/pointerpointproperties_mousewheeldelta.md) from [PointerPointProperties](../windows.ui.input/pointerpointproperties.md).
 * 
 * The object retrieved by the GetCurrentPoint and GetIntermediatePoints methods provide access to extended pointer info through the [Properties](../windows.ui.input/pointerpoint_properties.md) property, which gets a [PointerPointProperties](../windows.ui.input/pointerpointproperties.md) object.
 * 
 * In the following example, we get extended pointer properties through the [PointerPoint](../windows.ui.input/pointerpoint.md) and [PointerPointProperties](../windows.ui.input/pointerpointproperties.md) objects. (See [Quickstart: Pointers](/previous-versions/windows/apps/hh465383(v=win.10)) for the complete example.)
 * 
 * [!code-csharp[SnippetQueryPointer](../windows.ui.input.inking/code/PointerInput/csharp/MainPage.xaml.cs#SnippetQueryPointer)]
 * 
 * Typically, the object returned by this method is used to feed pointer data to a [GestureRecognizer](../windows.ui.input/gesturerecognizer.md). Another scenario is getting the [MouseWheelDelta](../windows.ui.input/pointerpointproperties_mousewheeldelta.md) for a [PointerWheelChanged](../windows.ui.xaml/uielement_pointerwheelchanged.md) event; that value is in [PointerPointProperties](../windows.ui.input/pointerpointproperties.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointerroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class PointerRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointerRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointerRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a reference to a pointer token.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointerroutedeventargs.pointer
     * @type {Pointer} 
     */
    Pointer {
        get => this.get_Pointer()
    }

    /**
     * Gets a value that indicates which key modifiers were active at the time that the pointer event was initiated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointerroutedeventargs.keymodifiers
     * @type {Integer} 
     */
    KeyModifiers {
        get => this.get_KeyModifiers()
    }

    /**
     * Gets or sets a value that marks the routed event as handled, and prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointerroutedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets a value that indicates whether the pointer event occurred from direct interaction with an object by the user, or was generated by the platform based on changes to the UI of the application.
     * @remarks
     * Some examples where pointer events are generated by the platform include:
     * - The pointer is detected over a control after panning inertia is complete
     * - The pointer is detected over a control when the user scrolls or pages through content with the keyboard
     * - An item is added to or deleted from a list and the item under the pointer changes
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointerroutedeventargs.isgenerated
     * @type {Boolean} 
     */
    IsGenerated {
        get => this.get_IsGenerated()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Pointer() {
        if (!this.HasProp("__IPointerRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPointerRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerRoutedEventArgs := IPointerRoutedEventArgs(outPtr)
        }

        return this.__IPointerRoutedEventArgs.get_Pointer()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyModifiers() {
        if (!this.HasProp("__IPointerRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPointerRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerRoutedEventArgs := IPointerRoutedEventArgs(outPtr)
        }

        return this.__IPointerRoutedEventArgs.get_KeyModifiers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IPointerRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPointerRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerRoutedEventArgs := IPointerRoutedEventArgs(outPtr)
        }

        return this.__IPointerRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IPointerRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPointerRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerRoutedEventArgs := IPointerRoutedEventArgs(outPtr)
        }

        return this.__IPointerRoutedEventArgs.put_Handled(value)
    }

    /**
     * Retrieves a [PointerPoint](../windows.ui.input/pointerpoint.md) object that provides basic info on the pointer associated with the event.
     * @param {UIElement} relativeTo Any [UIElement](../windows.ui.xaml/uielement.md)-derived object that is connected to the same object tree. To specify the object relative to the overall coordinate system, use a *relativeTo*  value of **null**.
     * @returns {PointerPoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointerroutedeventargs.getcurrentpoint
     */
    GetCurrentPoint(relativeTo) {
        if (!this.HasProp("__IPointerRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPointerRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerRoutedEventArgs := IPointerRoutedEventArgs(outPtr)
        }

        return this.__IPointerRoutedEventArgs.GetCurrentPoint(relativeTo)
    }

    /**
     * Retrieves a collection of [PointerPoint](../windows.ui.input/pointerpoint.md) objects that represent the pointer history from the last pointer event up to and including the current pointer event. Each [PointerPoint](../windows.ui.input/pointerpoint.md) in the collection provides basic info on the pointer associated with the event.The last item in the collection is equivalent to the [PointerPoint](../windows.ui.input/pointerpoint.md) object returned by [GetCurrentPoint](pointerroutedeventargs_getcurrentpoint_1761708789.md).
     * @param {UIElement} relativeTo Provides the context for the pointer data. Can be any [UIElement](../windows.ui.xaml/uielement.md)-derived object that is connected to the same object tree. If **null**, location coordinates are in the context of the app.
     * @returns {IVector<PointerPoint>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointerroutedeventargs.getintermediatepoints
     */
    GetIntermediatePoints(relativeTo) {
        if (!this.HasProp("__IPointerRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPointerRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerRoutedEventArgs := IPointerRoutedEventArgs(outPtr)
        }

        return this.__IPointerRoutedEventArgs.GetIntermediatePoints(relativeTo)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGenerated() {
        if (!this.HasProp("__IPointerRoutedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPointerRoutedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerRoutedEventArgs2 := IPointerRoutedEventArgs2(outPtr)
        }

        return this.__IPointerRoutedEventArgs2.get_IsGenerated()
    }

;@endregion Instance Methods
}
