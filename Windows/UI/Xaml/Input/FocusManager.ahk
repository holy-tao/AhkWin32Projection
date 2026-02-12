#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFocusManager.ahk
#Include .\IFocusManagerStatics3.ahk
#Include .\IFocusManagerStatics4.ahk
#Include .\IFocusManagerStatics2.ahk
#Include .\IFocusManagerStatics5.ahk
#Include .\IFocusManagerStatics7.ahk
#Include .\IFocusManagerStatics6.ahk
#Include .\IFocusManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A helper class that enables global management of focus actions and events across all elements in an application.
 * @remarks
 * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of FocusManager events whenever possible.
 * 
 * FocusManager is intended for advanced scenarios where specific elements in an application do not receive bubbled events from a [UIElement](../windows.ui.xaml/uielement.md). For example, visual "overlay" objects such as [Popup](../windows.ui.xaml.controls.primitives/popup.md), [Tooltip](../windows.ui.xaml.controls/tooltip.md), or [MenuFlyout](../windows.ui.xaml.controls/menuflyout.md) that appear as part of the app UI but are actually their own focus scope and not part of the visual tree hierarchy. In the case of a [Popup](../windows.ui.xaml.controls.primitives/popup.md), this occurs when you programmatically set [IsOpen](../windows.ui.xaml.controls.primitives/popup_isopen.md) to true and focus moves in and out of the popup.
 * 
 * Here's some basic markup to illustrate the example:
 * 
 * ``` xaml
 * <Page …>
 *     <Grid …>
 *         <Popup …>
 *             <StackPanel Name="StackPanel3" …>
 *                 <TextBlock Text="StackPanel3" />
 *                 <Button Content="Button5" …/>
 *             </StackPanel>
 *         </Popup>
 *         <TextBlock Text="Grid" … />
 *         <StackPanel Name="StackPanel1" …>
 *             <TextBlock Text="StackPanel1" …/>
 *             <Button Content="Button1" …/>
 *             <Button Content="Button2" … />
 *         </StackPanel>
 *         <StackPanel Name="StackPanel2" …>
 *             <TextBlock Text="StackPanel2" …/>
 *             <Button Content="Button3" … />
 *             <Button Content="Button4" … />
 *         </StackPanel>
 *     </Grid>
 * </Page>
 * ```
 * 
 * In this case, a Popup contains StackPanel3, which, in turn, contains Button5. When [IsOpen](../windows.ui.xaml.controls.primitives/popup_isopen.md) is set to true and focus moves from Button1 to Button5, the LosingFocus and LostFocus events bubble up across the visual tree (StackPanel1, the Grid, and the Page get both these events). However, only StackPanel3 receives the subsequent GettingFocus and GotFocus events that bubble up from Button5 (Grid and Page do not, as they are not in a parent-child relationship with Popup).
 * 
 * An application can have multiple elements with logical focus (depending on the number of focus scopes). However, only one element in the application can have keyboard focus.
 * 
 * There can be multiple elements with logical focus, but only one element with logical focus per focus scope. An element with logical focus does not necessarily have keyboard focus, but an element with keyboard focus does have logical focus.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class FocusManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFocusManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFocusManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the element that should receive focus based on the specified navigation direction and hint rectangle.
     * @remarks
     * You can also use either the [FindNextElement(FocusNavigationDirection, FindNextElementOptions)](focusmanager_findnextelement_918683319.md) method or the [FindNextElement(FocusNavigationDirection)](focusmanager_findnextelement_1379272417.md) method to programmatically move focus. These methods retrieve the element (as a [DependencyObject](../windows.ui.xaml/dependencyobject.md)) that will receive focus based on the specified navigation direction (directional navigation only, cannot be used to emulate tab navigation).
     * 
     * > [!NOTE]
     * > We recommend using the FindNextElement method instead of FindNextFocusableElement because FindNextFocusableElement retrieves a UIElement, which returns null if the next focusable element is not a UIElement (such as a [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) object).
     * @param {Integer} focusNavigationDirection_ The direction that focus moves from element to element within the app UI.
     * @returns {UIElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.findnextfocusableelement
     */
    static FindNextFocusableElement(focusNavigationDirection_) {
        if (!FocusManager.HasProp("__IFocusManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics3.IID)
            FocusManager.__IFocusManagerStatics3 := IFocusManagerStatics3(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics3.FindNextFocusableElement(focusNavigationDirection_)
    }

    /**
     * Retrieves the element that should receive focus based on the specified navigation direction.
     * @remarks
     * You can also use either the [FindNextElement(FocusNavigationDirection, FindNextElementOptions)](focusmanager_findnextelement_918683319.md) method or the [FindNextElement(FocusNavigationDirection)](focusmanager_findnextelement_1379272417.md) method to programmatically move focus. These methods retrieve the element (as a [DependencyObject](../windows.ui.xaml/dependencyobject.md)) that will receive focus based on the specified navigation direction (directional navigation only, cannot be used to emulate tab navigation).
     * 
     * > [!NOTE]
     * > We recommend using the FindNextElement method instead of FindNextFocusableElement because FindNextFocusableElement retrieves a UIElement, which returns null if the next focusable element is not a UIElement (such as a [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) object).
     * @param {Integer} focusNavigationDirection_ The direction that focus moves from element to element within the application UI.
     * @param {RECT} hintRect 
     * @returns {UIElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.findnextfocusableelement
     */
    static FindNextFocusableElementWithHint(focusNavigationDirection_, hintRect) {
        if (!FocusManager.HasProp("__IFocusManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics3.IID)
            FocusManager.__IFocusManagerStatics3 := IFocusManagerStatics3(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics3.FindNextFocusableElementWithHint(focusNavigationDirection_, hintRect)
    }

    /**
     * Attempts to change focus from the element with focus to the next focusable element in the specified direction.
     * @remarks
     * The tab order is the order in which a user moves from one control to another by pressing the Tab key (forward) or Shift+Tab (backward).
     * 
     * This method uses tab order sequence and behavior to traverse all focusable elements in the UI.
     * 
     * If the focus is on the first element in the tab order and [FocusNavigationDirection.Previous](focusnavigationdirection.md) is specified, focus moves to the last element.
     * 
     * If the focus is on the last element in the tab order and [FocusNavigationDirection.Next](focusnavigationdirection.md) is specified, focus moves to the first element.
     * 
     * You can also use either the [FindNextElement(FocusNavigationDirection, FindNextElementOptions)](focusmanager_findnextelement_918683319.md) method or the [FindNextElement(FocusNavigationDirection)](focusmanager_findnextelement_1379272417.md) method to programmatically move focus. These methods retrieve the element (as a [DependencyObject](../windows.ui.xaml/dependencyobject.md)) that will receive focus based on the specified navigation direction (directional navigation only, cannot be used to emulate tab navigation).
     * 
     * > [!NOTE]
     * > We recommend using the FindNextElement method instead of FindNextFocusableElement because FindNextFocusableElement retrieves a UIElement, which returns null if the next focusable element is not a UIElement (such as a [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) object).
     * @param {Integer} focusNavigationDirection_ The direction to traverse (in tab order).
     * @param {FindNextElementOptions} focusNavigationOptions 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.trymovefocus
     */
    static TryMoveFocusWithOptions(focusNavigationDirection_, focusNavigationOptions) {
        if (!FocusManager.HasProp("__IFocusManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics4.IID)
            FocusManager.__IFocusManagerStatics4 := IFocusManagerStatics4(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics4.TryMoveFocusWithOptions(focusNavigationDirection_, focusNavigationOptions)
    }

    /**
     * Retrieves the element that should receive focus based on the specified navigation direction (cannot be used with tab navigation, see remarks).
     * @remarks
     * We recommend using this method instead of [FindNextFocusableElement(FocusNavigationDirection)](focusmanager_findnextfocusableelement_745990299.md). FindNextFocusableElement retrieves a UIElement, which returns null if the next focusable element is not a UIElement (such as a [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) object).
     * 
     * Tab navigation ([FocusNavigationDirection.Previous](focusnavigationdirection.md) and [FocusNavigationDirection.Next](focusnavigationdirection.md)) cannot be used with [FindNextElementOptions](findnextelementoptions.md). Only directional navigation ([FocusNavigationDirection.Up](focusnavigationdirection.md), [FocusNavigationDirection.Down](focusnavigationdirection.md), [FocusNavigationDirection.Left](focusnavigationdirection.md), or [FocusNavigationDirection.Right](focusnavigationdirection.md)) is valid.
     * @param {Integer} focusNavigationDirection_ The direction that focus moves from element to element within the app UI.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.findnextelement
     */
    static FindNextElement(focusNavigationDirection_) {
        if (!FocusManager.HasProp("__IFocusManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics4.IID)
            FocusManager.__IFocusManagerStatics4 := IFocusManagerStatics4(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics4.FindNextElement(focusNavigationDirection_)
    }

    /**
     * Retrieves the first element that can receive focus based on the specified scope.
     * @param {DependencyObject} searchScope_ The root object from which to search. If **null**, the search scope is the current window.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.findfirstfocusableelement
     */
    static FindFirstFocusableElement(searchScope_) {
        if (!FocusManager.HasProp("__IFocusManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics4.IID)
            FocusManager.__IFocusManagerStatics4 := IFocusManagerStatics4(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics4.FindFirstFocusableElement(searchScope_)
    }

    /**
     * Retrieves the last element that can receive focus based on the specified scope.
     * @param {DependencyObject} searchScope_ The root object from which to search. If **null**, the search scope is the current window.
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.findlastfocusableelement
     */
    static FindLastFocusableElement(searchScope_) {
        if (!FocusManager.HasProp("__IFocusManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics4.IID)
            FocusManager.__IFocusManagerStatics4 := IFocusManagerStatics4(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics4.FindLastFocusableElement(searchScope_)
    }

    /**
     * Retrieves the element that should receive focus based on the specified navigation direction.
     * @remarks
     * We recommend using this method instead of [FindNextFocusableElement(FocusNavigationDirection)](focusmanager_findnextfocusableelement_745990299.md). FindNextFocusableElement retrieves a UIElement, which returns null if the next focusable element is not a UIElement (such as a [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) object).
     * @param {Integer} focusNavigationDirection_ The direction that focus moves from element to element within the app UI.
     * @param {FindNextElementOptions} focusNavigationOptions 
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.findnextelement
     */
    static FindNextElementWithOptions(focusNavigationDirection_, focusNavigationOptions) {
        if (!FocusManager.HasProp("__IFocusManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics4.IID)
            FocusManager.__IFocusManagerStatics4 := IFocusManagerStatics4(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics4.FindNextElementWithOptions(focusNavigationDirection_, focusNavigationOptions)
    }

    /**
     * Attempts to change focus from the element with focus to the next focusable element in the specified direction, using the specified navigation options.
     * @remarks
     * The tab order is the order in which a user moves from one control to another by pressing the Tab key (forward) or Shift+Tab (backward).
     * 
     * This method uses tab order sequence and behavior to traverse all focusable elements in the UI.
     * 
     * If the focus is on the first element in the tab order and [FocusNavigationDirection.Previous](focusnavigationdirection.md) is specified, focus moves to the last element.
     * 
     * If the focus is on the last element in the tab order and [FocusNavigationDirection.Next](focusnavigationdirection.md) is specified, focus moves to the first element.
     * 
     * You can also use either the [FindNextElement(FocusNavigationDirection, FindNextElementOptions)](focusmanager_findnextelement_918683319.md) method or the [FindNextElement(FocusNavigationDirection)](focusmanager_findnextelement_1379272417.md) method to programmatically move focus. These methods retrieve the element (as a [DependencyObject](../windows.ui.xaml/dependencyobject.md)) that will receive focus based on the specified navigation direction (directional navigation only, cannot be used to emulate tab navigation).
     * 
     * > [!NOTE]
     * > We recommend using the FindNextElement method instead of FindNextFocusableElement because FindNextFocusableElement retrieves a UIElement, which returns null if the next focusable element is not a UIElement (such as a [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) object).
     * @param {Integer} focusNavigationDirection_ The direction to traverse (in tab order).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.trymovefocus
     */
    static TryMoveFocus(focusNavigationDirection_) {
        if (!FocusManager.HasProp("__IFocusManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics2.IID)
            FocusManager.__IFocusManagerStatics2 := IFocusManagerStatics2(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics2.TryMoveFocus(focusNavigationDirection_)
    }

    /**
     * Asynchronously attempts to set focus on an element when the application is initialized.
     * @remarks
     * Some objects, such as a [WebView](../windows.ui.xaml.controls/webview.md), can run in either the app process or in a separate process (see [WebViewExecutionMode.SeparateProcess](../windows.ui.xaml.controls/webviewexecutionmode.md)). 
     * 
     * When an object runs in the app process, the following focus events occur as expected for both the previously focused object and the newly focused object:
     * - [GettingFocus](../windows.ui.xaml/uielement_gettingfocus.md)
     * - [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md)
     * - [GotFocus](../windows.ui.xaml/uielement_gotfocus.md)
     * - [LostFocus](../windows.ui.xaml/uielement_lostfocus.md)
     * 
     * However, if the newly focused object is running in a separate process some of these event behaviors can differ. 
     * 
     * - [GetFocusedElement](focusmanager_getfocusedelement_1183614552.md) does not return the newly focused object until the TryFocusAsync operation completes. 
     * - The control losing focus receives its [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) event synchronously, but does not receive [LostFocus](../windows.ui.xaml/uielement_lostfocus.md) until the asynchronous operation completes. 
     * - The control getting focus receieves its [GettingFocus](../windows.ui.xaml/uielement_gettingfocus.md) event synchronously, but does not receive [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) until the asynchronous operation completes. 
     *  
     * TryFocusAsync completes synchronously when called on an element running in the app process.
     * @param {DependencyObject} element The object on which to set focus.
     * @param {Integer} value One of the values from the [FocusState](/uwp/api/windows.ui.xaml.focusstate) enumeration that specify how an element can obtain focus.
     * @returns {IAsyncOperation<FocusMovementResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.tryfocusasync
     */
    static TryFocusAsync(element, value) {
        if (!FocusManager.HasProp("__IFocusManagerStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics5.IID)
            FocusManager.__IFocusManagerStatics5 := IFocusManagerStatics5(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics5.TryFocusAsync(element, value)
    }

    /**
     * Asynchronously attempts to change focus from the current element with focus to the next focusable element in the specified direction and subject to the specified navigation options.
     * @remarks
     * - [TryMoveFocus(Windows.UI.Xaml.Input.FocusNavigationDirection focusNavigationDirection)](focusmanager_trymovefocus_582274934.md) and [FocusManager.TryMoveFocus(FocusNavigationDirection focusNavigationDirection, FindNextElementOptions focusNavigationOptions)](focusmanager_trymovefocus_1178810148.md) return true (success), before the focus change is complete.   
     * - [GetFocusedElement](focusmanager_getfocusedelement_1183614552.md) does not return the newly focused object until the asynchronous operation completes. 
     * - The control losing focus receives its [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) event synchronously, but does not receive [LostFocus](../windows.ui.xaml/uielement_lostfocus.md) until the asynchronous operation completes. 
     * - The control getting focus receieves its [GettingFocus](../windows.ui.xaml/uielement_gettingfocus.md) event synchronously, but does not receive [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) until the asynchronous operation completes. 
     *  
     * [TryFocusAsync](focusmanager_tryfocusasync_1779533284.md) completes synchronously when called on an element running in the app process. 
     * 
     * You can also use either the [FindNextElement(FocusNavigationDirection, FindNextElementOptions)](focusmanager_findnextelement_918683319.md) method or the [FindNextElement(FocusNavigationDirection)](focusmanager_findnextelement_1379272417.md) method to programmatically move focus. These methods retrieve the element (as a [DependencyObject](../windows.ui.xaml/dependencyobject.md)) that will receive focus based on the specified navigation direction (directional navigation only, cannot be used to emulate tab navigation).
     * 
     * > [!NOTE]
     * > We recommend using the FindNextElement method instead of FindNextFocusableElement because FindNextFocusableElement retrieves a UIElement, which returns null if the next focusable element is not a UIElement (such as a [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) object).
     * @param {Integer} focusNavigationDirection_ The direction that focus moves from element to element within the app UI.
     * @returns {IAsyncOperation<FocusMovementResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.trymovefocusasync
     */
    static TryMoveFocusAsync(focusNavigationDirection_) {
        if (!FocusManager.HasProp("__IFocusManagerStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics5.IID)
            FocusManager.__IFocusManagerStatics5 := IFocusManagerStatics5(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics5.TryMoveFocusAsync(focusNavigationDirection_)
    }

    /**
     * Asynchronously attempts to change focus from the current element with focus to the next focusable element in the specified direction.
     * @remarks
     * - [TryMoveFocus(Windows.UI.Xaml.Input.FocusNavigationDirection focusNavigationDirection)](focusmanager_trymovefocus_582274934.md) and [FocusManager.TryMoveFocus(FocusNavigationDirection focusNavigationDirection, FindNextElementOptions focusNavigationOptions)](focusmanager_trymovefocus_1178810148.md) return true (success), before the focus change is complete.   
     * - [GetFocusedElement](focusmanager_getfocusedelement_1183614552.md) does not return the newly focused object until the asynchronous operation completes. 
     * - The control losing focus receives its [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) event synchronously, but does not receive [LostFocus](../windows.ui.xaml/uielement_lostfocus.md) until the asynchronous operation completes. 
     * - The control getting focus receieves its [GettingFocus](../windows.ui.xaml/uielement_gettingfocus.md) event synchronously, but does not receive [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) until the asynchronous operation completes. 
     * 
     * [TryFocusAsync](focusmanager_tryfocusasync_1779533284.md) completes synchronously when called on an element running in the app process.
     * 
     * You can also use either the [FindNextElement(FocusNavigationDirection, FindNextElementOptions)](focusmanager_findnextelement_918683319.md) method or the [FindNextElement(FocusNavigationDirection)](focusmanager_findnextelement_1379272417.md) method to programmatically move focus. These methods retrieve the element (as a [DependencyObject](../windows.ui.xaml/dependencyobject.md)) that will receive focus based on the specified navigation direction (directional navigation only, cannot be used to emulate tab navigation).
     * 
     * > [!NOTE]
     * > We recommend using the FindNextElement method instead of FindNextFocusableElement because FindNextFocusableElement retrieves a UIElement, which returns null if the next focusable element is not a UIElement (such as a [Hyperlink](../windows.ui.xaml.documents/hyperlink.md) object).
     * @param {Integer} focusNavigationDirection_ The direction that focus moves from element to element within the app UI.
     * @param {FindNextElementOptions} focusNavigationOptions 
     * @returns {IAsyncOperation<FocusMovementResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.trymovefocusasync
     */
    static TryMoveFocusWithOptionsAsync(focusNavigationDirection_, focusNavigationOptions) {
        if (!FocusManager.HasProp("__IFocusManagerStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics5.IID)
            FocusManager.__IFocusManagerStatics5 := IFocusManagerStatics5(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics5.TryMoveFocusWithOptionsAsync(focusNavigationDirection_, focusNavigationOptions)
    }

    /**
     * Retrieves the element in the UI that has focus.
     * @remarks
     * > [!WARNING]
     * > For WinUI 3 apps, this method always returns `null` as it relies on CoreWindow APIs not supported by WinUI 3.
     * >
     * > Instead, use the [FocusManager.GetFocusedElement(XamlRoot)](./windows.ui.xaml.input.focusmanager.getfocusedelement#windows-ui-xaml-input-focusmanager-getfocusedelement(windows-ui-xaml-xamlroot))
     * > overload, where `XamlRoot` can be retrieved from any loaded UIElement through the [XamlRoot](/uwp/api/windows.ui.xaml.uielement.xamlroot) property.
     * @param {XamlRoot} xamlRoot_ 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.getfocusedelement
     */
    static GetFocusedElement(xamlRoot_) {
        if (!FocusManager.HasProp("__IFocusManagerStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics7.IID)
            FocusManager.__IFocusManagerStatics7 := IFocusManagerStatics7(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics7.GetFocusedElement(xamlRoot_)
    }

    /**
     * 
     * @param {EventHandler<FocusManagerGotFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_GotFocus(handler) {
        if (!FocusManager.HasProp("__IFocusManagerStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics6.IID)
            FocusManager.__IFocusManagerStatics6 := IFocusManagerStatics6(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics6.add_GotFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_GotFocus(token) {
        if (!FocusManager.HasProp("__IFocusManagerStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics6.IID)
            FocusManager.__IFocusManagerStatics6 := IFocusManagerStatics6(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics6.remove_GotFocus(token)
    }

    /**
     * 
     * @param {EventHandler<FocusManagerLostFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_LostFocus(handler) {
        if (!FocusManager.HasProp("__IFocusManagerStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics6.IID)
            FocusManager.__IFocusManagerStatics6 := IFocusManagerStatics6(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics6.add_LostFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_LostFocus(token) {
        if (!FocusManager.HasProp("__IFocusManagerStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics6.IID)
            FocusManager.__IFocusManagerStatics6 := IFocusManagerStatics6(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics6.remove_LostFocus(token)
    }

    /**
     * 
     * @param {EventHandler<GettingFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_GettingFocus(handler) {
        if (!FocusManager.HasProp("__IFocusManagerStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics6.IID)
            FocusManager.__IFocusManagerStatics6 := IFocusManagerStatics6(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics6.add_GettingFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_GettingFocus(token) {
        if (!FocusManager.HasProp("__IFocusManagerStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics6.IID)
            FocusManager.__IFocusManagerStatics6 := IFocusManagerStatics6(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics6.remove_GettingFocus(token)
    }

    /**
     * 
     * @param {EventHandler<LosingFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_LosingFocus(handler) {
        if (!FocusManager.HasProp("__IFocusManagerStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics6.IID)
            FocusManager.__IFocusManagerStatics6 := IFocusManagerStatics6(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics6.add_LosingFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_LosingFocus(token) {
        if (!FocusManager.HasProp("__IFocusManagerStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics6.IID)
            FocusManager.__IFocusManagerStatics6 := IFocusManagerStatics6(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics6.remove_LosingFocus(token)
    }

    /**
     * Retrieves the focused element within the Xaml island container.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanager.getfocusedelement
     */
    static GetFocusedElement1() {
        if (!FocusManager.HasProp("__IFocusManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FocusManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFocusManagerStatics.IID)
            FocusManager.__IFocusManagerStatics := IFocusManagerStatics(factoryPtr)
        }

        return FocusManager.__IFocusManagerStatics.GetFocusedElement()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
