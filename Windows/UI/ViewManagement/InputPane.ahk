#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInputPane.ahk
#Include .\IInputPane2.ahk
#Include .\IInputPaneControl.ahk
#Include .\IInputPaneStatics2.ahk
#Include .\IInputPaneStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\InputPane.ahk
#Include .\InputPaneVisibilityEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enables an app to receive notifications when the docked touch keyboard, or Soft Input Panel (SIP), is about to be displayed or hidden, and to determine which portion of the application's window is obscured by the input pane.
  * 
  * > [!NOTE]
  * > The InputPane APIs provide accurate occlusion information for a docked panel only. For Windows 10 Creators Fall Update and newer, we reccomend using the following APIs to handle occlusion by docked, undocked, moveable, and transitory input panes such as Soft Input Panels (SIP), Input Method Editor (IME) candidate windows, floating toolbars, and so on.
  * >
  * > - [CoreInputView](../windows.ui.viewmanagement.core/coreinputview.md)
  * > - [CoreInputViewOcclusion](../windows.ui.viewmanagement.core/coreinputviewocclusion.md)
  * > - [CoreInputViewOcclusionKind](../windows.ui.viewmanagement.core/coreinputviewocclusionkind.md)
 * @remarks
 * The input pane appears when the user performs an action that requires them to enter information, such as selecting a text entry field. By default, Windows handles the input pane events and repositions content so that users can see where they are typing. If you set [CoreTextEditContext.InputPaneDisplayPolicy](../windows.ui.text.core/coretexteditcontext_inputpanedisplaypolicy.md) to **Manual** in your app, you are responsible for showing and hiding the input pane using TryShow and TryHide. Use this class to override the default behavior and customize the input pane.
 * 
 * In some cases, overlay UI such as an InputPane is not fully supported. This includes:
 * 
 * - apps in full-screen mode, like [games](/windows/uwp/gaming/index).
 * - Windows Holographic apps in [holographic view](https://developer.microsoft.com/mixed-reality#app_views).
 * 
 * Call [GetForCurrentView](inputpane_getforcurrentview_1363600702.md) to get an InputPane object.
 * 
 * After you register to receive input pane notifications, the system calls your event delegate whenever the input pane is shown or hidden for the window that was visible when you called the [GetForCurrentView](inputpane_getforcurrentview_1363600702.md) method.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class InputPane extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputPane

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputPane.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the [InputPane](inputpane.md) object associated with the view with the specified context identifier.
     * @remarks
     * This method fails if it is called in a windowless thread.
     * @param {UIContext} context_ The context identifier of the view to get the input pane for.
     * @returns {InputPane} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane.getforuicontext
     */
    static GetForUIContext(context_) {
        if (!InputPane.HasProp("__IInputPaneStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.InputPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInputPaneStatics2.IID)
            InputPane.__IInputPaneStatics2 := IInputPaneStatics2(factoryPtr)
        }

        return InputPane.__IInputPaneStatics2.GetForUIContext(context_)
    }

    /**
     * Gets the [InputPane](inputpane.md) object associated with the application window that is currently visible.
     * @remarks
     * This method is the only way to get an input pane object; you can't use the **new** operator to get a new input pane object.
     * @returns {InputPane} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane.getforcurrentview
     */
    static GetForCurrentView() {
        if (!InputPane.HasProp("__IInputPaneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.InputPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInputPaneStatics.IID)
            InputPane.__IInputPaneStatics := IInputPaneStatics(factoryPtr)
        }

        return InputPane.__IInputPaneStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the region of the app window obscured by the input pane.
     * @remarks
     * Universal apps should use this property, rather than [Visible](inputpane_visible.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane.occludedrect
     * @type {RECT} 
     */
    OccludedRect {
        get => this.get_OccludedRect()
    }

    /**
     * Gets or sets a value that indicates whether the input pane is shown.
     * 
     * > [!IMPORTANT]
     * > Valid for Xbox device family only.
     * 
     * For universal apps, the [OccludedRect](inputpane_occludedrect.md) property indicates the region of the app window obstructed by the input pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * Occurs when the input pane starts sliding into view.
     * @remarks
     * The system associates the input pane with the application window that was visible when you called the [GetForCurrentView](inputpane_getforcurrentview_1363600702.md) method. This implies that you must create a new input pane object and register for the Showing event each time you create a new window.
     * 
     * When the system calls your event handler, the input pane has not started to slide into view. After your event handler returns, the input pane starts to slide into view. If your event handler doesn't respond quickly enough (within 200 milliseconds), the input pane starts to slide into view without waiting for your event handler to return.
     * 
     * You can use the Showing event to create a custom user experience when the input pane is displayed. For example, in an instant messenger app, you might want to resize the chat window and input box to fit above the input pane so that the user never has to scroll to see new messages. If you do create a custom user experience, make sure to set the [EnsuredFocusedElementInView](inputpanevisibilityeventargs_ensuredfocusedelementinview.md) property on the event arguments to notify the app framework that you have handled the input pane event and it should not try to do so for you.
     * 
     * You should minimize the amount of work you do while the input pane is being shown because multiple animations and content resizes may be happening simultaneously. The more work you do during this period affects the overall system performance, causing a poor user experience.
     * @type {TypedEventHandler<InputPane, InputPaneVisibilityEventArgs>}
    */
    OnShowing {
        get {
            if(!this.HasProp("__OnShowing")){
                this.__OnShowing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b813d684-d953-5a8a-9b30-78b79fb9147b}"),
                    InputPane,
                    InputPaneVisibilityEventArgs
                )
                this.__OnShowingToken := this.add_Showing(this.__OnShowing.iface)
            }
            return this.__OnShowing
        }
    }

    /**
     * Occurs when the input pane starts sliding out of view.
     * @remarks
     * The system associates the input pane with the application window that was visible when you called the [GetForCurrentView](inputpane_getforcurrentview_1363600702.md) method. This implies that you must create a new input pane object and register for the [Showing](inputpane_showing.md) event each time you create a new window. You can use the Hiding event to undo changes you may have made to your app's layout during the [Showing](inputpane_showing.md) event.
     * 
     * When the system calls your event handler, the input pane has not started to slide out of view. After your event handler returns, the input pane starts to slide out of view. If your event handler doesn't respond quickly enough (within 200 milliseconds), the input pane starts to slide out of view without waiting for your event handler to return.
     * 
     * If you create a custom user experience for the input pane, make sure to set the [EnsuredFocusedElementInView](inputpanevisibilityeventargs_ensuredfocusedelementinview.md) property on the event arguments to notify the app framework that you have handled the input pane event and it should not try to do so for you.
     * 
     * You should minimize the amount of work you do while the input pane is being hidden because multiple animations and content resizes may be happening simultaneously. The more work you do during this period affects the overall system performance, causing a poor user experience.
     * @type {TypedEventHandler<InputPane, InputPaneVisibilityEventArgs>}
    */
    OnHiding {
        get {
            if(!this.HasProp("__OnHiding")){
                this.__OnHiding := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b813d684-d953-5a8a-9b30-78b79fb9147b}"),
                    InputPane,
                    InputPaneVisibilityEventArgs
                )
                this.__OnHidingToken := this.add_Hiding(this.__OnHiding.iface)
            }
            return this.__OnHiding
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnShowingToken")) {
            this.remove_Showing(this.__OnShowingToken)
            this.__OnShowing.iface.Dispose()
        }

        if(this.HasProp("__OnHidingToken")) {
            this.remove_Hiding(this.__OnHidingToken)
            this.__OnHiding.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<InputPane, InputPaneVisibilityEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Showing(handler) {
        if (!this.HasProp("__IInputPane")) {
            if ((queryResult := this.QueryInterface(IInputPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPane := IInputPane(outPtr)
        }

        return this.__IInputPane.add_Showing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Showing(token) {
        if (!this.HasProp("__IInputPane")) {
            if ((queryResult := this.QueryInterface(IInputPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPane := IInputPane(outPtr)
        }

        return this.__IInputPane.remove_Showing(token)
    }

    /**
     * 
     * @param {TypedEventHandler<InputPane, InputPaneVisibilityEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Hiding(handler) {
        if (!this.HasProp("__IInputPane")) {
            if ((queryResult := this.QueryInterface(IInputPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPane := IInputPane(outPtr)
        }

        return this.__IInputPane.add_Hiding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Hiding(token) {
        if (!this.HasProp("__IInputPane")) {
            if ((queryResult := this.QueryInterface(IInputPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPane := IInputPane(outPtr)
        }

        return this.__IInputPane.remove_Hiding(token)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OccludedRect() {
        if (!this.HasProp("__IInputPane")) {
            if ((queryResult := this.QueryInterface(IInputPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPane := IInputPane(outPtr)
        }

        return this.__IInputPane.get_OccludedRect()
    }

    /**
     * Tries to show the [InputPane](inputpane.md), if it is hidden.
     * 
     * This method is a "best effort" and guarantees only that the user has a way to enter text in the focused control. The touch keyboard, or Soft Input Panel (SIP), is shown only if a hardware keyboard is not available.
     * @remarks
     * If you set [CoreTextEditContext.InputPaneDisplayPolicy](../windows.ui.text.core/coretexteditcontext_inputpanedisplaypolicy.md) to **Manual** in your app, you are responsible for showing and hiding the input pane using TryShow and TryHide.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane.tryshow
     */
    TryShow() {
        if (!this.HasProp("__IInputPane2")) {
            if ((queryResult := this.QueryInterface(IInputPane2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPane2 := IInputPane2(outPtr)
        }

        return this.__IInputPane2.TryShow()
    }

    /**
     * Tries to hide the [InputPane](inputpane.md), if it is visible.
     * @remarks
     * If you set [CoreTextEditContext.InputPaneDisplayPolicy](../windows.ui.text.core/coretexteditcontext_inputpanedisplaypolicy.md) to **Manual** in your app, you are responsible for showing and hiding the input pane using TryShow and TryHide.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpane.tryhide
     */
    TryHide() {
        if (!this.HasProp("__IInputPane2")) {
            if ((queryResult := this.QueryInterface(IInputPane2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPane2 := IInputPane2(outPtr)
        }

        return this.__IInputPane2.TryHide()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        if (!this.HasProp("__IInputPaneControl")) {
            if ((queryResult := this.QueryInterface(IInputPaneControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPaneControl := IInputPaneControl(outPtr)
        }

        return this.__IInputPaneControl.get_Visible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Visible(value) {
        if (!this.HasProp("__IInputPaneControl")) {
            if ((queryResult := this.QueryInterface(IInputPaneControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPaneControl := IInputPaneControl(outPtr)
        }

        return this.__IInputPaneControl.put_Visible(value)
    }

;@endregion Instance Methods
}
