#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextEditContext.ahk
#Include .\ICoreTextEditContext2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreTextEditContext.ahk
#Include .\CoreTextTextRequestedEventArgs.ahk
#Include .\CoreTextSelectionRequestedEventArgs.ahk
#Include .\CoreTextLayoutRequestedEventArgs.ahk
#Include .\CoreTextTextUpdatingEventArgs.ahk
#Include .\CoreTextSelectionUpdatingEventArgs.ahk
#Include .\CoreTextFormatUpdatingEventArgs.ahk
#Include .\CoreTextCompositionStartedEventArgs.ahk
#Include .\CoreTextCompositionCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * The primary object used by text input controls to communicate with the text input server.
 * @remarks
 * To obtain an object of this type, call [CoreTextServicesManager.CreateEditContext](coretextservicesmanager_createeditcontext_759770.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextEditContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextEditContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextEditContext.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a descriptive name for the text input control. An application framework usually uses properties such as "name" or "id" to identify a control, so it’s recommended that you set this property accordingly on the text input server so that input processors can better preserve the input context, and provide better suggestions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets a value that indicates the input scope of the text input control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext.inputscope
     * @type {Integer} 
     */
    InputScope {
        get => this.get_InputScope()
        set => this.put_InputScope(value)
    }

    /**
     * Gets or sets a value that indicates whether the edit control is editable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
        set => this.put_IsReadOnly(value)
    }

    /**
     * Gets or sets a value that indicates whether the input pane should be shown automatically when focus enters your text input control. The default value is **Automatic**, indicating that the input pane will be shown automatically. A value of **Manual** indicates that your app will be responsible for showing and hiding the input pane using [InputPane.TryShow](../windows.ui.viewmanagement/inputpane_tryshow_1077566544.md) and [TryHide](../windows.ui.viewmanagement/inputpane_tryhide_42550069.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext.inputpanedisplaypolicy
     * @type {Integer} 
     */
    InputPaneDisplayPolicy {
        get => this.get_InputPaneDisplayPolicy()
        set => this.put_InputPaneDisplayPolicy(value)
    }

    /**
     * Occurs when the text input server needs to get a range of text from the text input control. The application should handle this event and return the range requested.
     * @type {TypedEventHandler<CoreTextEditContext, CoreTextTextRequestedEventArgs>}
    */
    OnTextRequested {
        get {
            if(!this.HasProp("__OnTextRequested")){
                this.__OnTextRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c7e08176-4134-50b7-bc73-729e9f9ad22a}"),
                    CoreTextEditContext,
                    CoreTextTextRequestedEventArgs
                )
                this.__OnTextRequestedToken := this.add_TextRequested(this.__OnTextRequested.iface)
            }
            return this.__OnTextRequested
        }
    }

    /**
     * Occurs when the text input server needs to get the text range representing the currently selected text in the text input control. The application should handle this event and return the range requested.
     * @type {TypedEventHandler<CoreTextEditContext, CoreTextSelectionRequestedEventArgs>}
    */
    OnSelectionRequested {
        get {
            if(!this.HasProp("__OnSelectionRequested")){
                this.__OnSelectionRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{882e51e1-f4a3-57e5-9392-6a8c38579181}"),
                    CoreTextEditContext,
                    CoreTextSelectionRequestedEventArgs
                )
                this.__OnSelectionRequestedToken := this.add_SelectionRequested(this.__OnSelectionRequested.iface)
            }
            return this.__OnSelectionRequested
        }
    }

    /**
     * Occurs when the text input server needs to get the bounding box of a range of text and of the text input control itself. The application should handle this event and return the geometry information requested.
     * @type {TypedEventHandler<CoreTextEditContext, CoreTextLayoutRequestedEventArgs>}
    */
    OnLayoutRequested {
        get {
            if(!this.HasProp("__OnLayoutRequested")){
                this.__OnLayoutRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1a5f5596-561c-57f6-a4ff-cb85013c6544}"),
                    CoreTextEditContext,
                    CoreTextLayoutRequestedEventArgs
                )
                this.__OnLayoutRequestedToken := this.add_LayoutRequested(this.__OnLayoutRequested.iface)
            }
            return this.__OnLayoutRequested
        }
    }

    /**
     * Occurs when the text input server needs to modify text inside the text input control. This event could be the result of a key event— such as inserting a single character— or the result of processing done by an input processor, such as auto-correction and prediction.
     * 
     * When handling the event, the text input control must replace a range with the new text provided by the server, and also move the caret to the end of the new text.
     * @type {TypedEventHandler<CoreTextEditContext, CoreTextTextUpdatingEventArgs>}
    */
    OnTextUpdating {
        get {
            if(!this.HasProp("__OnTextUpdating")){
                this.__OnTextUpdating := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fd896a84-df7c-50d5-9167-58f616bddb6e}"),
                    CoreTextEditContext,
                    CoreTextTextUpdatingEventArgs
                )
                this.__OnTextUpdatingToken := this.add_TextUpdating(this.__OnTextUpdating.iface)
            }
            return this.__OnTextUpdating
        }
    }

    /**
     * Occurs when the text input server needs to modify the range of text currently selected in the text input control. This event could be the result of an input processor needing to select some text, or to move the caret. The text input control should set its selection range accordingly.
     * @type {TypedEventHandler<CoreTextEditContext, CoreTextSelectionUpdatingEventArgs>}
    */
    OnSelectionUpdating {
        get {
            if(!this.HasProp("__OnSelectionUpdating")){
                this.__OnSelectionUpdating := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6b140a40-d461-555a-b6eb-5dbb8e2101e5}"),
                    CoreTextEditContext,
                    CoreTextSelectionUpdatingEventArgs
                )
                this.__OnSelectionUpdatingToken := this.add_SelectionUpdating(this.__OnSelectionUpdating.iface)
            }
            return this.__OnSelectionUpdating
        }
    }

    /**
     * Occurs when the text input server needs to apply a different format to a particular range of text. This usually happens during composition.
     * @type {TypedEventHandler<CoreTextEditContext, CoreTextFormatUpdatingEventArgs>}
    */
    OnFormatUpdating {
        get {
            if(!this.HasProp("__OnFormatUpdating")){
                this.__OnFormatUpdating := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3e4ef599-4cc2-5248-bf2d-13f17613b0a6}"),
                    CoreTextEditContext,
                    CoreTextFormatUpdatingEventArgs
                )
                this.__OnFormatUpdatingToken := this.add_FormatUpdating(this.__OnFormatUpdating.iface)
            }
            return this.__OnFormatUpdating
        }
    }

    /**
     * Occurs when composition has started.
     * @type {TypedEventHandler<CoreTextEditContext, CoreTextCompositionStartedEventArgs>}
    */
    OnCompositionStarted {
        get {
            if(!this.HasProp("__OnCompositionStarted")){
                this.__OnCompositionStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e671d625-5b59-57e6-a92e-40009507853a}"),
                    CoreTextEditContext,
                    CoreTextCompositionStartedEventArgs
                )
                this.__OnCompositionStartedToken := this.add_CompositionStarted(this.__OnCompositionStarted.iface)
            }
            return this.__OnCompositionStarted
        }
    }

    /**
     * Occurs when composition has completed.
     * @type {TypedEventHandler<CoreTextEditContext, CoreTextCompositionCompletedEventArgs>}
    */
    OnCompositionCompleted {
        get {
            if(!this.HasProp("__OnCompositionCompleted")){
                this.__OnCompositionCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a2d7059e-68ed-5260-8d8e-1dcf3d25d663}"),
                    CoreTextEditContext,
                    CoreTextCompositionCompletedEventArgs
                )
                this.__OnCompositionCompletedToken := this.add_CompositionCompleted(this.__OnCompositionCompleted.iface)
            }
            return this.__OnCompositionCompleted
        }
    }

    /**
     * Occurs when focus was forcibly removed from a text input control. The application should handle this event to remove focus for the text input control accordingly.
     * @type {TypedEventHandler<CoreTextEditContext, IInspectable>}
    */
    OnFocusRemoved {
        get {
            if(!this.HasProp("__OnFocusRemoved")){
                this.__OnFocusRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ef53b467-c472-5b59-a827-38adc3a9d326}"),
                    CoreTextEditContext,
                    IInspectable
                )
                this.__OnFocusRemovedToken := this.add_FocusRemoved(this.__OnFocusRemoved.iface)
            }
            return this.__OnFocusRemoved
        }
    }

    /**
     * Occurs after focus has left the text input control.
     * @type {TypedEventHandler<CoreTextEditContext, IInspectable>}
    */
    OnNotifyFocusLeaveCompleted {
        get {
            if(!this.HasProp("__OnNotifyFocusLeaveCompleted")){
                this.__OnNotifyFocusLeaveCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ef53b467-c472-5b59-a827-38adc3a9d326}"),
                    CoreTextEditContext,
                    IInspectable
                )
                this.__OnNotifyFocusLeaveCompletedToken := this.add_NotifyFocusLeaveCompleted(this.__OnNotifyFocusLeaveCompleted.iface)
            }
            return this.__OnNotifyFocusLeaveCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTextRequestedToken")) {
            this.remove_TextRequested(this.__OnTextRequestedToken)
            this.__OnTextRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSelectionRequestedToken")) {
            this.remove_SelectionRequested(this.__OnSelectionRequestedToken)
            this.__OnSelectionRequested.iface.Dispose()
        }

        if(this.HasProp("__OnLayoutRequestedToken")) {
            this.remove_LayoutRequested(this.__OnLayoutRequestedToken)
            this.__OnLayoutRequested.iface.Dispose()
        }

        if(this.HasProp("__OnTextUpdatingToken")) {
            this.remove_TextUpdating(this.__OnTextUpdatingToken)
            this.__OnTextUpdating.iface.Dispose()
        }

        if(this.HasProp("__OnSelectionUpdatingToken")) {
            this.remove_SelectionUpdating(this.__OnSelectionUpdatingToken)
            this.__OnSelectionUpdating.iface.Dispose()
        }

        if(this.HasProp("__OnFormatUpdatingToken")) {
            this.remove_FormatUpdating(this.__OnFormatUpdatingToken)
            this.__OnFormatUpdating.iface.Dispose()
        }

        if(this.HasProp("__OnCompositionStartedToken")) {
            this.remove_CompositionStarted(this.__OnCompositionStartedToken)
            this.__OnCompositionStarted.iface.Dispose()
        }

        if(this.HasProp("__OnCompositionCompletedToken")) {
            this.remove_CompositionCompleted(this.__OnCompositionCompletedToken)
            this.__OnCompositionCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnFocusRemovedToken")) {
            this.remove_FocusRemoved(this.__OnFocusRemovedToken)
            this.__OnFocusRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnNotifyFocusLeaveCompletedToken")) {
            this.remove_NotifyFocusLeaveCompleted(this.__OnNotifyFocusLeaveCompletedToken)
            this.__OnNotifyFocusLeaveCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.put_Name(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputScope() {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.get_InputScope()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InputScope(value) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.put_InputScope(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.get_IsReadOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsReadOnly(value) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.put_IsReadOnly(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputPaneDisplayPolicy() {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.get_InputPaneDisplayPolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InputPaneDisplayPolicy(value) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.put_InputPaneDisplayPolicy(value)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextTextRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextRequested(handler) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.add_TextRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_TextRequested(cookie) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.remove_TextRequested(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextSelectionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionRequested(handler) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.add_SelectionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_SelectionRequested(cookie) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.remove_SelectionRequested(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextLayoutRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LayoutRequested(handler) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.add_LayoutRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_LayoutRequested(cookie) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.remove_LayoutRequested(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextTextUpdatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextUpdating(handler) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.add_TextUpdating(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_TextUpdating(cookie) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.remove_TextUpdating(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextSelectionUpdatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionUpdating(handler) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.add_SelectionUpdating(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_SelectionUpdating(cookie) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.remove_SelectionUpdating(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextFormatUpdatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FormatUpdating(handler) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.add_FormatUpdating(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_FormatUpdating(cookie) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.remove_FormatUpdating(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextCompositionStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionStarted(handler) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.add_CompositionStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CompositionStarted(cookie) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.remove_CompositionStarted(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextCompositionCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionCompleted(handler) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.add_CompositionCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CompositionCompleted(cookie) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.remove_CompositionCompleted(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusRemoved(handler) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.add_FocusRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_FocusRemoved(cookie) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.remove_FocusRemoved(cookie)
    }

    /**
     * Notifies the text input server that focus has entered the text input control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext.notifyfocusenter
     */
    NotifyFocusEnter() {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.NotifyFocusEnter()
    }

    /**
     * Notifies the text input server that focus has left the text input control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext.notifyfocusleave
     */
    NotifyFocusLeave() {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.NotifyFocusLeave()
    }

    /**
     * Notifies the text input server about any change that the text input control needs to make to the text. This is important in order to keep the internal state of the control and the internal state of the server synchronized. Since a change to the text is also likely to affect the selection range, the method takes the selection range as a parameter.
     * @param {CoreTextRange} modifiedRange The range of text to replace, in terms of the state the text buffer is in prior to this text change.
     * @param {Integer} newLength The length of the text that should replace *modifiedRange*.
     * @param {CoreTextRange} newSelection The range of selection in effect after the text change.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext.notifytextchanged
     */
    NotifyTextChanged(modifiedRange, newLength, newSelection) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.NotifyTextChanged(modifiedRange, newLength, newSelection)
    }

    /**
     * Notifies the text input server about any change that the text input control needs to make to the selection range. This is important in order to keep the internal state of the control and the internal state of the server synchronized.
     * @param {CoreTextRange} selection The range of selection currently in effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext.notifyselectionchanged
     */
    NotifySelectionChanged(selection) {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.NotifySelectionChanged(selection)
    }

    /**
     * Notifies the text input server that the layout of text inside the text input control has changed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexteditcontext.notifylayoutchanged
     */
    NotifyLayoutChanged() {
        if (!this.HasProp("__ICoreTextEditContext")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext := ICoreTextEditContext(outPtr)
        }

        return this.__ICoreTextEditContext.NotifyLayoutChanged()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NotifyFocusLeaveCompleted(handler) {
        if (!this.HasProp("__ICoreTextEditContext2")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext2 := ICoreTextEditContext2(outPtr)
        }

        return this.__ICoreTextEditContext2.add_NotifyFocusLeaveCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_NotifyFocusLeaveCompleted(cookie) {
        if (!this.HasProp("__ICoreTextEditContext2")) {
            if ((queryResult := this.QueryInterface(ICoreTextEditContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextEditContext2 := ICoreTextEditContext2(outPtr)
        }

        return this.__ICoreTextEditContext2.remove_NotifyFocusLeaveCompleted(cookie)
    }

;@endregion Instance Methods
}
