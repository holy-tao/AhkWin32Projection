#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInputView.ahk
#Include .\ICoreInputView2.ahk
#Include .\ICoreInputView3.ahk
#Include .\ICoreInputView4.ahk
#Include .\ICoreInputView5.ahk
#Include .\ICoreInputViewStatics2.ahk
#Include .\ICoreInputViewStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreInputView.ahk
#Include .\CoreInputViewOcclusionsChangedEventArgs.ahk
#Include .\CoreInputViewTransferringXYFocusEventArgs.ahk
#Include .\CoreInputViewShowingEventArgs.ahk
#Include .\CoreInputViewHidingEventArgs.ahk
#Include .\CoreInputViewAnimationStartingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Enables an app to control the display of a docked, undocked, moveable, or transitory input pane (and associated UI), receive notifications when the pane is moved, displayed, or hidden, and to determine which portion of the app's window is obscured by the pane.
  * 
  * > [!NOTE]
  * > Not supported on HoloLens.
 * @remarks
 * Primary view refers to either of the [CoreInputViewKind.Keyboard](coreinputviewkind.md) or [CoreInputViewKind.Handwriting](coreinputviewkind.md) views, while CoreInputView can be any of the values from [CoreInputViewKind.Handwriting](coreinputviewkind.md).
 * 
 * Used by frameworks (such as XAML) or custom text controls only.
 * 
 * Your app can use the info exposed by this object to adjust and reflow its UI to account for any occlusion.
 * 
 * The CoreInputView APIs support the following types of input panes.  
 * 
 * - Docked Soft Input Panel (SIP) like the **Touch keyboard and handwriting panel** – typically, your app UI reflows.
 * - Floating toolbar or SIP – typically, your app UI does not reflow.
 * - Overlay panels such as inline Ink or IME candidate windows – typically, your app UI does not reflow for the edit control, but does reflow for the text/search suggestions.
 * 
 * The input pane appears when the user performs an action that requires them to provide information, such as entering a text field.
 * 
 * By default, Windows handles input pane events and repositions content so that users can see the control with focus. If you set [CoreTextEditContext.InputPaneDisplayPolicy](../windows.ui.text.core/coretexteditcontext_inputpanedisplaypolicy.md) to **Manual** in your app, you are responsible for showing and hiding the input pane using [TryShowPrimaryView](coreinputview_tryshowprimaryview_1925215151.md) and [TryHidePrimaryView](coreinputview_tryhideprimaryview_908065025.md). Use this class to override the default behavior and customize the input pane.
 * 
 * Call [GetForCurrentView](coreinputview_getforcurrentview_1363600702.md) to get a CoreInputView object.
 * 
 * After you register to receive input pane notifications, the system calls your event delegate whenever the pane is shown or hidden for the window that was visible when you called the [GetForCurrentView](coreinputview_getforcurrentview_1363600702.md) method.
 * 
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInputView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInputView.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a [CoreInputView](coreinputview.md) object associated with the view having the specified context identifier.
     * @remarks
     * This method fails if it is called in a windowless thread.
     * @param {UIContext} context_ The context identifier of the view for which to get the [CoreInputView](coreinputview.md).
     * @returns {CoreInputView} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.getforuicontext
     */
    static GetForUIContext(context_) {
        if (!CoreInputView.HasProp("__ICoreInputViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.Core.CoreInputView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreInputViewStatics2.IID)
            CoreInputView.__ICoreInputViewStatics2 := ICoreInputViewStatics2(factoryPtr)
        }

        return CoreInputView.__ICoreInputViewStatics2.GetForUIContext(context_)
    }

    /**
     * Retrieves the [CoreInputView](coreinputview.md) object associated with the current window.
     * @returns {CoreInputView} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.getforcurrentview
     */
    static GetForCurrentView() {
        if (!CoreInputView.HasProp("__ICoreInputViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.Core.CoreInputView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreInputViewStatics.IID)
            CoreInputView.__ICoreInputViewStatics := ICoreInputViewStatics(factoryPtr)
        }

        return CoreInputView.__ICoreInputViewStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOcclusionsChangedToken")) {
            this.remove_OcclusionsChanged(this.__OnOcclusionsChangedToken)
            this.__OnOcclusionsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnXYFocusTransferringFromPrimaryViewToken")) {
            this.remove_XYFocusTransferringFromPrimaryView(this.__OnXYFocusTransferringFromPrimaryViewToken)
            this.__OnXYFocusTransferringFromPrimaryView.iface.Dispose()
        }

        if(this.HasProp("__OnXYFocusTransferredToPrimaryViewToken")) {
            this.remove_XYFocusTransferredToPrimaryView(this.__OnXYFocusTransferredToPrimaryViewToken)
            this.__OnXYFocusTransferredToPrimaryView.iface.Dispose()
        }

        if(this.HasProp("__OnPrimaryViewShowingToken")) {
            this.remove_PrimaryViewShowing(this.__OnPrimaryViewShowingToken)
            this.__OnPrimaryViewShowing.iface.Dispose()
        }

        if(this.HasProp("__OnPrimaryViewHidingToken")) {
            this.remove_PrimaryViewHiding(this.__OnPrimaryViewHidingToken)
            this.__OnPrimaryViewHiding.iface.Dispose()
        }

        if(this.HasProp("__OnSupportedKindsChangedToken")) {
            this.remove_SupportedKindsChanged(this.__OnSupportedKindsChangedToken)
            this.__OnSupportedKindsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPrimaryViewAnimationStartingToken")) {
            this.remove_PrimaryViewAnimationStarting(this.__OnPrimaryViewAnimationStartingToken)
            this.__OnPrimaryViewAnimationStarting.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, CoreInputViewOcclusionsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OcclusionsChanged(handler) {
        if (!this.HasProp("__ICoreInputView")) {
            if ((queryResult := this.QueryInterface(ICoreInputView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView := ICoreInputView(outPtr)
        }

        return this.__ICoreInputView.add_OcclusionsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OcclusionsChanged(token) {
        if (!this.HasProp("__ICoreInputView")) {
            if ((queryResult := this.QueryInterface(ICoreInputView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView := ICoreInputView(outPtr)
        }

        return this.__ICoreInputView.remove_OcclusionsChanged(token)
    }

    /**
     * Retrieves a reference to each input pane currently occluding the app.
     * @returns {IVectorView<CoreInputViewOcclusion>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.getcoreinputviewocclusions
     */
    GetCoreInputViewOcclusions() {
        if (!this.HasProp("__ICoreInputView")) {
            if ((queryResult := this.QueryInterface(ICoreInputView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView := ICoreInputView(outPtr)
        }

        return this.__ICoreInputView.GetCoreInputViewOcclusions()
    }

    /**
     * Attempts to show (if hidden) the [CoreInputView](coreinputview.md) pane.
     * 
     * This method is a "best effort" and guarantees only that the user has a way to interact with the focused control. For a docked a Soft Input Panel (SIP) like the **Touch keyboard and handwriting panel**, the pane is shown only if a hardware keyboard is not available.
     * @remarks
     * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
     * 
     * If you set [CoreTextEditContext.InputPaneDisplayPolicy](../windows.ui.text.core/coretexteditcontext_inputpanedisplaypolicy.md) to **Manual** in your app, you are responsible for showing and hiding the input pane using [TryShowPrimaryView](coreinputview_tryshowprimaryview_1925215151.md) and [TryHidePrimaryView](coreinputview_tryhideprimaryview_908065025.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.tryshowprimaryview
     */
    TryShowPrimaryView() {
        if (!this.HasProp("__ICoreInputView")) {
            if ((queryResult := this.QueryInterface(ICoreInputView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView := ICoreInputView(outPtr)
        }

        return this.__ICoreInputView.TryShowPrimaryView()
    }

    /**
     * Attempts to hide (if visible) the input pane associated with the [CoreInputView](coreinputview.md).
     * @remarks
     * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
     * 
     * If you set [CoreTextEditContext.InputPaneDisplayPolicy](../windows.ui.text.core/coretexteditcontext_inputpanedisplaypolicy.md) to **Manual**, use [TryShow](coreinputview_tryshow_1077566544.md) or [TryShowPrimaryView](coreinputview_tryshowprimaryview_1925215151.md) to display the input pane, and [TryHide](coreinputview_tryhide_42550069.md) or TryHidePrimaryView to hide the input pane.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.tryhideprimaryview
     */
    TryHidePrimaryView() {
        if (!this.HasProp("__ICoreInputView")) {
            if ((queryResult := this.QueryInterface(ICoreInputView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView := ICoreInputView(outPtr)
        }

        return this.__ICoreInputView.TryHidePrimaryView()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, CoreInputViewTransferringXYFocusEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_XYFocusTransferringFromPrimaryView(handler) {
        if (!this.HasProp("__ICoreInputView2")) {
            if ((queryResult := this.QueryInterface(ICoreInputView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView2 := ICoreInputView2(outPtr)
        }

        return this.__ICoreInputView2.add_XYFocusTransferringFromPrimaryView(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_XYFocusTransferringFromPrimaryView(token) {
        if (!this.HasProp("__ICoreInputView2")) {
            if ((queryResult := this.QueryInterface(ICoreInputView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView2 := ICoreInputView2(outPtr)
        }

        return this.__ICoreInputView2.remove_XYFocusTransferringFromPrimaryView(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_XYFocusTransferredToPrimaryView(handler) {
        if (!this.HasProp("__ICoreInputView2")) {
            if ((queryResult := this.QueryInterface(ICoreInputView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView2 := ICoreInputView2(outPtr)
        }

        return this.__ICoreInputView2.add_XYFocusTransferredToPrimaryView(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_XYFocusTransferredToPrimaryView(token) {
        if (!this.HasProp("__ICoreInputView2")) {
            if ((queryResult := this.QueryInterface(ICoreInputView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView2 := ICoreInputView2(outPtr)
        }

        return this.__ICoreInputView2.remove_XYFocusTransferredToPrimaryView(token)
    }

    /**
     * Attempts to move focus from the application UI to the input pane.
     * @remarks
     * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
     * @param {RECT} origin The rectangle, in client coordinates, representing the previously focused UI element. Specified in device-independent pixels (DIP).
     * @param {Integer} direction_ The direction of navigation. If the input pane is not located in the specified direction, this method fails and returns false.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.trytransferxyfocustoprimaryview
     */
    TryTransferXYFocusToPrimaryView(origin, direction_) {
        if (!this.HasProp("__ICoreInputView2")) {
            if ((queryResult := this.QueryInterface(ICoreInputView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView2 := ICoreInputView2(outPtr)
        }

        return this.__ICoreInputView2.TryTransferXYFocusToPrimaryView(origin, direction_)
    }

    /**
     * Attempts to show (if hidden) the specified [type](coreinputviewkind.md) of input pane associated with the [CoreInputView](coreinputview.md).
     * @remarks
     * If *type* is set to **[Default](coreinputviewkind.md)**, a "best effort" is made to show the input pane while ensuring the user can still interact with the focused control. For example, a docked a Soft Input Panel (SIP), such as the **Touch keyboard and handwriting panel**, is shown only if a hardware keyboard is not available.
     * 
     * Use this method if you want to provide a specific user experience based on a specific input pane, such as the Windows emoji pane.
     * 
     * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
     * 
     * If you set [CoreTextEditContext.InputPaneDisplayPolicy](../windows.ui.text.core/coretexteditcontext_inputpanedisplaypolicy.md) to 'Manual', use [TryShow](coreinputview_tryshow_1077566544.md) or [TryShowPrimaryView](coreinputview_tryshowprimaryview_1925215151.md) to display the input pane, and [TryHide](coreinputview_tryhide_42550069.md) or [TryHidePrimaryView](coreinputview_tryhideprimaryview_908065025.md) to hide the input pane.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.tryshow
     */
    TryShow() {
        if (!this.HasProp("__ICoreInputView3")) {
            if ((queryResult := this.QueryInterface(ICoreInputView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView3 := ICoreInputView3(outPtr)
        }

        return this.__ICoreInputView3.TryShow()
    }

    /**
     * Attempts to show (if hidden) the input pane associated with the [CoreInputView](coreinputview.md).
     * @remarks
     * This method is a "best effort" and guarantees only that the user has a way to interact with the focused control. For a docked a Soft Input Panel (SIP) like the **Touch keyboard and handwriting panel**, the pane is shown only if a hardware keyboard is not available.
     * 
     * If you set [CoreTextEditContext.InputPaneDisplayPolicy](../windows.ui.text.core/coretexteditcontext_inputpanedisplaypolicy.md) to `Manual`, use TryShow or [TryShowPrimaryView](coreinputview_tryshowprimaryview_1925215151.md) to display the input pane, and [TryHide](coreinputview_tryhide_42550069.md) or [TryHidePrimaryView](coreinputview_tryhideprimaryview_908065025.md) to hide the input pane.
     * @param {Integer} type 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.tryshow
     */
    TryShowWithKind(type) {
        if (!this.HasProp("__ICoreInputView3")) {
            if ((queryResult := this.QueryInterface(ICoreInputView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView3 := ICoreInputView3(outPtr)
        }

        return this.__ICoreInputView3.TryShowWithKind(type)
    }

    /**
     * Attempts to hide (if visible) the input pane associated with the [CoreInputView](coreinputview.md) pane.
     * @remarks
     * If you set [CoreTextEditContext.InputPaneDisplayPolicy](../windows.ui.text.core/coretexteditcontext_inputpanedisplaypolicy.md) to **Manual**, use [TryShow](coreinputview_tryshow_1077566544.md) or [TryShowPrimaryView](coreinputview_tryshowprimaryview_1925215151.md) to display the input pane, and TryHide or [TryHidePrimaryView](coreinputview_tryhideprimaryview_908065025.md) to hide the input pane.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.tryhide
     */
    TryHide() {
        if (!this.HasProp("__ICoreInputView3")) {
            if ((queryResult := this.QueryInterface(ICoreInputView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView3 := ICoreInputView3(outPtr)
        }

        return this.__ICoreInputView3.TryHide()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, CoreInputViewShowingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrimaryViewShowing(handler) {
        if (!this.HasProp("__ICoreInputView4")) {
            if ((queryResult := this.QueryInterface(ICoreInputView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView4 := ICoreInputView4(outPtr)
        }

        return this.__ICoreInputView4.add_PrimaryViewShowing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrimaryViewShowing(token) {
        if (!this.HasProp("__ICoreInputView4")) {
            if ((queryResult := this.QueryInterface(ICoreInputView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView4 := ICoreInputView4(outPtr)
        }

        return this.__ICoreInputView4.remove_PrimaryViewShowing(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, CoreInputViewHidingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrimaryViewHiding(handler) {
        if (!this.HasProp("__ICoreInputView4")) {
            if ((queryResult := this.QueryInterface(ICoreInputView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView4 := ICoreInputView4(outPtr)
        }

        return this.__ICoreInputView4.add_PrimaryViewHiding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrimaryViewHiding(token) {
        if (!this.HasProp("__ICoreInputView4")) {
            if ((queryResult := this.QueryInterface(ICoreInputView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView4 := ICoreInputView4(outPtr)
        }

        return this.__ICoreInputView4.remove_PrimaryViewHiding(token)
    }

    /**
     * Gets whether the type of [CoreInputView](coreinputview.md) specified is supported.
     * @param {Integer} type The type of [CoreInputView](coreinputview.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputview.iskindsupported
     */
    IsKindSupported(type) {
        if (!this.HasProp("__ICoreInputView5")) {
            if ((queryResult := this.QueryInterface(ICoreInputView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView5 := ICoreInputView5(outPtr)
        }

        return this.__ICoreInputView5.IsKindSupported(type)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SupportedKindsChanged(handler) {
        if (!this.HasProp("__ICoreInputView5")) {
            if ((queryResult := this.QueryInterface(ICoreInputView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView5 := ICoreInputView5(outPtr)
        }

        return this.__ICoreInputView5.add_SupportedKindsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SupportedKindsChanged(token) {
        if (!this.HasProp("__ICoreInputView5")) {
            if ((queryResult := this.QueryInterface(ICoreInputView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView5 := ICoreInputView5(outPtr)
        }

        return this.__ICoreInputView5.remove_SupportedKindsChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, CoreInputViewAnimationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrimaryViewAnimationStarting(handler) {
        if (!this.HasProp("__ICoreInputView5")) {
            if ((queryResult := this.QueryInterface(ICoreInputView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView5 := ICoreInputView5(outPtr)
        }

        return this.__ICoreInputView5.add_PrimaryViewAnimationStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrimaryViewAnimationStarting(token) {
        if (!this.HasProp("__ICoreInputView5")) {
            if ((queryResult := this.QueryInterface(ICoreInputView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputView5 := ICoreInputView5(outPtr)
        }

        return this.__ICoreInputView5.remove_PrimaryViewAnimationStarting(token)
    }

;@endregion Instance Methods
}
