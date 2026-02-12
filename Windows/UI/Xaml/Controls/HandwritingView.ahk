#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IHandwritingView.ahk
#Include .\IHandwritingView2.ahk
#Include .\IHandwritingViewFactory.ahk
#Include .\IHandwritingViewStatics2.ahk
#Include .\IHandwritingViewStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\HandwritingView.ahk
#Include .\HandwritingPanelOpenedEventArgs.ahk
#Include .\HandwritingPanelClosedEventArgs.ahk
#Include .\HandwritingViewCandidatesChangedEventArgs.ahk
#Include .\HandwritingViewTextSubmittedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Windows Ink input surface for text input controls.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Text input with the handwriting view](/windows/uwp/design/controls-and-patterns/text-handwriting-view).
 * 
 * The **HandwritingView** is supported by text input controls such as [TextBox](textbox.md), [RichEditBox](richeditbox.md), and composite text controls such as [AutoSuggestBox](autosuggestbox.md).
 * 
 * When a user taps into a text input box using a Windows pen, the text box transforms to let the user write directly into it with a pen, rather than opening a separate input panel.
 * 
 * :::image type="content" source="images/controls/handwritingview-inksuggestion1.gif" alt-text="Text box with ink and suggestions":::
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class HandwritingView extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHandwritingView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHandwritingView.IID

    /**
     * Identifies the [IsSwitchToKeyboardEnabled](handwritingview_isswitchtokeyboardenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.isswitchtokeyboardenabledproperty
     * @type {DependencyProperty} 
     */
    static IsSwitchToKeyboardEnabledProperty {
        get => HandwritingView.get_IsSwitchToKeyboardEnabledProperty()
    }

    /**
     * Identifies the [IsCommandBarOpen](handwritingview_iscommandbaropen.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.iscommandbaropenproperty
     * @type {DependencyProperty} 
     */
    static IsCommandBarOpenProperty {
        get => HandwritingView.get_IsCommandBarOpenProperty()
    }

    /**
     * Identifies the [PlacementTarget](handwritingview_placementtarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.placementtargetproperty
     * @type {DependencyProperty} 
     */
    static PlacementTargetProperty {
        get => HandwritingView.get_PlacementTargetProperty()
    }

    /**
     * Identifies the PlacementAlignment dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.placementalignmentproperty
     * @type {DependencyProperty} 
     */
    static PlacementAlignmentProperty {
        get => HandwritingView.get_PlacementAlignmentProperty()
    }

    /**
     * Identifies the [IsOpen](handwritingview_isopen.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.isopenproperty
     * @type {DependencyProperty} 
     */
    static IsOpenProperty {
        get => HandwritingView.get_IsOpenProperty()
    }

    /**
     * Identifies the AreCandidatesEnabled dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.arecandidatesenabledproperty
     * @type {DependencyProperty} 
     */
    static AreCandidatesEnabledProperty {
        get => HandwritingView.get_AreCandidatesEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HandwritingView} 
     */
    static CreateInstance() {
        if (!HandwritingView.HasProp("__IHandwritingViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HandwritingView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHandwritingViewFactory.IID)
            HandwritingView.__IHandwritingViewFactory := IHandwritingViewFactory(factoryPtr)
        }

        return HandwritingView.__IHandwritingViewFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSwitchToKeyboardEnabledProperty() {
        if (!HandwritingView.HasProp("__IHandwritingViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HandwritingView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHandwritingViewStatics2.IID)
            HandwritingView.__IHandwritingViewStatics2 := IHandwritingViewStatics2(factoryPtr)
        }

        return HandwritingView.__IHandwritingViewStatics2.get_IsSwitchToKeyboardEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCommandBarOpenProperty() {
        if (!HandwritingView.HasProp("__IHandwritingViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HandwritingView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHandwritingViewStatics2.IID)
            HandwritingView.__IHandwritingViewStatics2 := IHandwritingViewStatics2(factoryPtr)
        }

        return HandwritingView.__IHandwritingViewStatics2.get_IsCommandBarOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlacementTargetProperty() {
        if (!HandwritingView.HasProp("__IHandwritingViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HandwritingView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHandwritingViewStatics.IID)
            HandwritingView.__IHandwritingViewStatics := IHandwritingViewStatics(factoryPtr)
        }

        return HandwritingView.__IHandwritingViewStatics.get_PlacementTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlacementAlignmentProperty() {
        if (!HandwritingView.HasProp("__IHandwritingViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HandwritingView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHandwritingViewStatics.IID)
            HandwritingView.__IHandwritingViewStatics := IHandwritingViewStatics(factoryPtr)
        }

        return HandwritingView.__IHandwritingViewStatics.get_PlacementAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsOpenProperty() {
        if (!HandwritingView.HasProp("__IHandwritingViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HandwritingView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHandwritingViewStatics.IID)
            HandwritingView.__IHandwritingViewStatics := IHandwritingViewStatics(factoryPtr)
        }

        return HandwritingView.__IHandwritingViewStatics.get_IsOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AreCandidatesEnabledProperty() {
        if (!HandwritingView.HasProp("__IHandwritingViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HandwritingView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHandwritingViewStatics.IID)
            HandwritingView.__IHandwritingViewStatics := IHandwritingViewStatics(factoryPtr)
        }

        return HandwritingView.__IHandwritingViewStatics.get_AreCandidatesEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the visual element or control that the handwriting view should be positioned in relation to when opened.
     * @remarks
     * If there is no explicit PlacementTarget set, the placement target is the parent text control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.placementtarget
     * @type {UIElement} 
     */
    PlacementTarget {
        get => this.get_PlacementTarget()
        set => this.put_PlacementTarget(value)
    }

    /**
     * Gets or sets a value that specifies the anchor point used to place the handwriting view over the control.
     * @remarks
     * The enumeration has these values: Auto, TopLeft, TopRight, BottomLeft, and BottomRight.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.placementalignment
     * @type {Integer} 
     */
    PlacementAlignment {
        get => this.get_PlacementAlignment()
        set => this.put_PlacementAlignment(value)
    }

    /**
     * Gets a value that indicates whether the handwriting view panel is open.
     * @remarks
     * The value of this property is set after the **Opened** or **Closed** event occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.isopen
     * @type {Boolean} 
     */
    IsOpen {
        get => this.get_IsOpen()
    }

    /**
     * Gets or sets a value that specifies whether auto-completion candidates are shown as the user writes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.arecandidatesenabled
     * @type {Boolean} 
     */
    AreCandidatesEnabled {
        get => this.get_AreCandidatesEnabled()
        set => this.put_AreCandidatesEnabled(value)
    }

    /**
     * Gets or sets whether a button for switching to keyboard input is visible on the [HandwritingView](handwritingview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.isswitchtokeyboardenabled
     * @type {Boolean} 
     */
    IsSwitchToKeyboardEnabled {
        get => this.get_IsSwitchToKeyboardEnabled()
        set => this.put_IsSwitchToKeyboardEnabled(value)
    }

    /**
     * Gets or sets whether the [HandwritingView](handwritingview.md) task menu is displayed in an expanded state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.iscommandbaropen
     * @type {Boolean} 
     */
    IsCommandBarOpen {
        get => this.get_IsCommandBarOpen()
        set => this.put_IsCommandBarOpen(value)
    }

    /**
     * Gets or sets the input device type from which input data is collected by the [HandwritingView](handwritingview.md) to construct and render an [InkStroke](../windows.ui.input.inking/inkstroke.md). The default is [Pen](../windows.ui.core/coreinputdevicetypes.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.inputdevicetypes
     * @type {Integer} 
     */
    InputDeviceTypes {
        get => this.get_InputDeviceTypes()
        set => this.put_InputDeviceTypes(value)
    }

    /**
     * Occurs when the handwriting view panel is opened.
     * @type {TypedEventHandler<HandwritingView, HandwritingPanelOpenedEventArgs>}
    */
    OnOpened {
        get {
            if(!this.HasProp("__OnOpened")){
                this.__OnOpened := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b0c91008-8012-5652-b8e3-5d67c6215b0e}"),
                    HandwritingView,
                    HandwritingPanelOpenedEventArgs
                )
                this.__OnOpenedToken := this.add_Opened(this.__OnOpened.iface)
            }
            return this.__OnOpened
        }
    }

    /**
     * Occurs when the handwriting view panel is closed.
     * @type {TypedEventHandler<HandwritingView, HandwritingPanelClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ec197a50-4cf0-5a33-b068-397e03b8dd80}"),
                    HandwritingView,
                    HandwritingPanelClosedEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * Occurs when the collection of auto-completion candidates for the [HandwritingView](handwritingview.md) changes.
     * @type {TypedEventHandler<HandwritingView, HandwritingViewCandidatesChangedEventArgs>}
    */
    OnCandidatesChanged {
        get {
            if(!this.HasProp("__OnCandidatesChanged")){
                this.__OnCandidatesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{84e981d2-5bf8-5803-9871-3fe3a1b4a734}"),
                    HandwritingView,
                    HandwritingViewCandidatesChangedEventArgs
                )
                this.__OnCandidatesChangedToken := this.add_CandidatesChanged(this.__OnCandidatesChanged.iface)
            }
            return this.__OnCandidatesChanged
        }
    }

    /**
     * Occurs when the Enter button is pressed or the commit gesture is detected on the [HandwritingView](handwritingview.md).
     * @type {TypedEventHandler<HandwritingView, HandwritingViewTextSubmittedEventArgs>}
    */
    OnTextSubmitted {
        get {
            if(!this.HasProp("__OnTextSubmitted")){
                this.__OnTextSubmitted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b4b367e1-ed5b-5920-8e5e-5e2ae4e9621e}"),
                    HandwritingView,
                    HandwritingViewTextSubmittedEventArgs
                )
                this.__OnTextSubmittedToken := this.add_TextSubmitted(this.__OnTextSubmitted.iface)
            }
            return this.__OnTextSubmitted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOpenedToken")) {
            this.remove_Opened(this.__OnOpenedToken)
            this.__OnOpened.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnCandidatesChangedToken")) {
            this.remove_CandidatesChanged(this.__OnCandidatesChangedToken)
            this.__OnCandidatesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTextSubmittedToken")) {
            this.remove_TextSubmitted(this.__OnTextSubmittedToken)
            this.__OnTextSubmitted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_PlacementTarget() {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.get_PlacementTarget()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_PlacementTarget(value) {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.put_PlacementTarget(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlacementAlignment() {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.get_PlacementAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PlacementAlignment(value) {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.put_PlacementAlignment(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpen() {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.get_IsOpen()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreCandidatesEnabled() {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.get_AreCandidatesEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreCandidatesEnabled(value) {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.put_AreCandidatesEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<HandwritingView, HandwritingPanelOpenedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.add_Opened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opened(token) {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.remove_Opened(token)
    }

    /**
     * 
     * @param {TypedEventHandler<HandwritingView, HandwritingPanelClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.remove_Closed(token)
    }

    /**
     * Attempts to close the handwriting view panel.
     * @remarks
     * The **Closed** event is raised if the handwriting view opens successfully.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.tryclose
     */
    TryClose() {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.TryClose()
    }

    /**
     * Attempts to open the handwriting view panel.
     * @remarks
     * There are cases where the handwriting view does not open, such as when the current language is not supported.
     * 
     * The **Opened** event is raised if the handwriting view opens successfully.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.tryopen
     */
    TryOpen() {
        if (!this.HasProp("__IHandwritingView")) {
            if ((queryResult := this.QueryInterface(IHandwritingView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView := IHandwritingView(outPtr)
        }

        return this.__IHandwritingView.TryOpen()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSwitchToKeyboardEnabled() {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.get_IsSwitchToKeyboardEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSwitchToKeyboardEnabled(value) {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.put_IsSwitchToKeyboardEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCommandBarOpen() {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.get_IsCommandBarOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCommandBarOpen(value) {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.put_IsCommandBarOpen(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputDeviceTypes() {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.get_InputDeviceTypes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InputDeviceTypes(value) {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.put_InputDeviceTypes(value)
    }

    /**
     * 
     * @param {TypedEventHandler<HandwritingView, HandwritingViewCandidatesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CandidatesChanged(handler) {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.add_CandidatesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CandidatesChanged(token) {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.remove_CandidatesChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<HandwritingView, HandwritingViewTextSubmittedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextSubmitted(handler) {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.add_TextSubmitted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextSubmitted(token) {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.remove_TextSubmitted(token)
    }

    /**
     * Retrieves the updated collection of auto-completion candidates after a [CandidatesChanged](handwritingview_candidateschanged.md) event.
     * @param {Integer} candidatesSessionId [CandidatesSessionId](handwritingviewcandidateschangedeventargs_candidatessessionid.md)
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.getcandidates
     */
    GetCandidates(candidatesSessionId) {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.GetCandidates(candidatesSessionId)
    }

    /**
     * Retrieves the auto-completion candidate selected by the user.
     * @remarks
     * A candidate is selected only if the [CandidatesSessionId](handwritingviewcandidateschangedeventargs_candidatessessionid.md) is current.
     * @param {Integer} candidatesSessionId The current auto-completion [CandidatesSessionId](handwritingviewcandidateschangedeventargs_candidatessessionid.md).
     * @param {Integer} selectedCandidateIndex The index of the auto-completion candidate selected by the user from the candidate collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingview.selectcandidate
     */
    SelectCandidate(candidatesSessionId, selectedCandidateIndex) {
        if (!this.HasProp("__IHandwritingView2")) {
            if ((queryResult := this.QueryInterface(IHandwritingView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingView2 := IHandwritingView2(outPtr)
        }

        return this.__IHandwritingView2.SelectCandidate(candidatesSessionId, selectedCandidateIndex)
    }

;@endregion Instance Methods
}
