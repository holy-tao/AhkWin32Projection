#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ItemsControl.ahk
#Include .\IAutoSuggestBox.ahk
#Include .\IAutoSuggestBox2.ahk
#Include .\IAutoSuggestBox3.ahk
#Include .\IAutoSuggestBox4.ahk
#Include .\IAutoSuggestBoxStatics3.ahk
#Include .\IAutoSuggestBoxStatics.ahk
#Include .\IAutoSuggestBoxStatics4.ahk
#Include .\IAutoSuggestBoxStatics2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\AutoSuggestBox.ahk
#Include .\AutoSuggestBoxSuggestionChosenEventArgs.ahk
#Include .\AutoSuggestBoxTextChangedEventArgs.ahk
#Include .\AutoSuggestBoxQuerySubmittedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a text control that makes suggestions to users as they enter text using a keyboard or pen (using ink and handwriting recognition). The app is notified when text has been changed by the user and is responsible for providing relevant suggestions for this control to display.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Auto-suggest box](/windows/uwp/design/controls-and-patterns/auto-suggest-box).
 * 
 * Use an AutoSuggestBox to provide a list of suggestions for a user to select from as they type.
 * 
 * By default, the text entry box doesn’t have a query button shown. You can set the [QueryIcon](autosuggestbox_queryicon.md) property to add a button with the specified icon on the right side of the text box. For example, to make the AutoSuggestBox look like a typical search box, add a ‘find’ icon, like this.
 * 
 * ```xaml
 * <AutoSuggestBox QueryIcon="Find"/>
 * ```
 * 
 * Here's an AutoSuggestBox with a 'find' icon. The suggestion list shows suggested results based on the user's entry.
 * 
 * <img src="images/controls/AutoSuggestBox_Open.png" alt="An auto suggest box with an icon and suggestions" />
 * To use an AutoSuggestBox, you need to respond to 3 user actions.
 * 
 * + Text changed - When the user enters text, update the suggestion list.
 * + Suggestion chosen - When the user chooses a suggestion in the suggestion list, update the text box.
 * + Query submitted - When the user submits a query, show the query results.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AutoSuggestBox extends ItemsControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutoSuggestBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutoSuggestBox.IID

    /**
     * Identifies the [LightDismissOverlayMode](autosuggestbox_lightdismissoverlaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.lightdismissoverlaymodeproperty
     * @type {DependencyProperty} 
     */
    static LightDismissOverlayModeProperty {
        get => AutoSuggestBox.get_LightDismissOverlayModeProperty()
    }

    /**
     * Identifies the [MaxSuggestionListHeight](autosuggestbox_maxsuggestionlistheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.maxsuggestionlistheightproperty
     * @type {DependencyProperty} 
     */
    static MaxSuggestionListHeightProperty {
        get => AutoSuggestBox.get_MaxSuggestionListHeightProperty()
    }

    /**
     * Identifies the [IsSuggestionListOpen](autosuggestbox_issuggestionlistopen.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.issuggestionlistopenproperty
     * @type {DependencyProperty} 
     */
    static IsSuggestionListOpenProperty {
        get => AutoSuggestBox.get_IsSuggestionListOpenProperty()
    }

    /**
     * Identifies the [TextMemberPath](autosuggestbox_textmemberpath.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.textmemberpathproperty
     * @type {DependencyProperty} 
     */
    static TextMemberPathProperty {
        get => AutoSuggestBox.get_TextMemberPathProperty()
    }

    /**
     * Identifies the [PlaceholderText](autosuggestbox_placeholdertext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.textproperty
     * @type {DependencyProperty} 
     */
    static TextProperty {
        get => AutoSuggestBox.get_TextProperty()
    }

    /**
     * Identifies the [UpdateTextOnSelect](autosuggestbox_updatetextonselect.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.updatetextonselectproperty
     * @type {DependencyProperty} 
     */
    static UpdateTextOnSelectProperty {
        get => AutoSuggestBox.get_UpdateTextOnSelectProperty()
    }

    /**
     * Identifies the [PlaceholderText](autosuggestbox_placeholdertext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.placeholdertextproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderTextProperty {
        get => AutoSuggestBox.get_PlaceholderTextProperty()
    }

    /**
     * Identifies the [Header](autosuggestbox_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => AutoSuggestBox.get_HeaderProperty()
    }

    /**
     * Identifies the [AutoMaximizeSuggestionArea](autosuggestbox_automaximizesuggestionarea.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.automaximizesuggestionareaproperty
     * @type {DependencyProperty} 
     */
    static AutoMaximizeSuggestionAreaProperty {
        get => AutoSuggestBox.get_AutoMaximizeSuggestionAreaProperty()
    }

    /**
     * Identifies the [TextBoxStyle](autosuggestbox_textboxstyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.textboxstyleproperty
     * @type {DependencyProperty} 
     */
    static TextBoxStyleProperty {
        get => AutoSuggestBox.get_TextBoxStyleProperty()
    }

    /**
     * Identifies the [Description](autosuggestbox_description.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.descriptionproperty
     * @type {DependencyProperty} 
     */
    static DescriptionProperty {
        get => AutoSuggestBox.get_DescriptionProperty()
    }

    /**
     * Identifies the [QueryIcon](autosuggestbox_queryicon.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.queryiconproperty
     * @type {DependencyProperty} 
     */
    static QueryIconProperty {
        get => AutoSuggestBox.get_QueryIconProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightDismissOverlayModeProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics3.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics3 := IAutoSuggestBoxStatics3(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics3.get_LightDismissOverlayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxSuggestionListHeightProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics := IAutoSuggestBoxStatics(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics.get_MaxSuggestionListHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSuggestionListOpenProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics := IAutoSuggestBoxStatics(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics.get_IsSuggestionListOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextMemberPathProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics := IAutoSuggestBoxStatics(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics.get_TextMemberPathProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics := IAutoSuggestBoxStatics(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics.get_TextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UpdateTextOnSelectProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics := IAutoSuggestBoxStatics(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics.get_UpdateTextOnSelectProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderTextProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics := IAutoSuggestBoxStatics(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics.get_PlaceholderTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics := IAutoSuggestBoxStatics(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AutoMaximizeSuggestionAreaProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics := IAutoSuggestBoxStatics(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics.get_AutoMaximizeSuggestionAreaProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextBoxStyleProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics := IAutoSuggestBoxStatics(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics.get_TextBoxStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DescriptionProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics4.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics4 := IAutoSuggestBoxStatics4(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics4.get_DescriptionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_QueryIconProperty() {
        if (!AutoSuggestBox.HasProp("__IAutoSuggestBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxStatics2.IID)
            AutoSuggestBox.__IAutoSuggestBoxStatics2 := IAutoSuggestBoxStatics2(factoryPtr)
        }

        return AutoSuggestBox.__IAutoSuggestBoxStatics2.get_QueryIconProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or set the maximum height for the drop-down portion of the [AutoSuggestBox](autosuggestbox.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.maxsuggestionlistheight
     * @type {Float} 
     */
    MaxSuggestionListHeight {
        get => this.get_MaxSuggestionListHeight()
        set => this.put_MaxSuggestionListHeight(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether the drop-down portion of the [AutoSuggestBox](autosuggestbox.md) is open.
     * @remarks
     * Do not set IsSuggestionListOpen in XAML. It's a state property for runtime interactions, and values set in XAML are ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.issuggestionlistopen
     * @type {Boolean} 
     */
    IsSuggestionListOpen {
        get => this.get_IsSuggestionListOpen()
        set => this.put_IsSuggestionListOpen(value)
    }

    /**
     * Gets or sets the property path that is used to get the value for display in the text box portion of the [AutoSuggestBox](autosuggestbox.md) control, when an item is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.textmemberpath
     * @type {HSTRING} 
     */
    TextMemberPath {
        get => this.get_TextMemberPath()
        set => this.put_TextMemberPath(value)
    }

    /**
     * Gets or sets the text that is shown in the control.
     * @remarks
     * This property is not typically set in XAML.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Used in conjunction with [TextMemberPath](autosuggestbox_textmemberpath.md), gets or sets a value indicating whether items in the view will trigger an update of the editable text part of the [AutoSuggestBox](autosuggestbox.md) when clicked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.updatetextonselect
     * @type {Boolean} 
     */
    UpdateTextOnSelect {
        get => this.get_UpdateTextOnSelect()
        set => this.put_UpdateTextOnSelect(value)
    }

    /**
     * Gets or sets the placeholder text to be displayed in the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.placeholdertext
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * Gets or sets the header object for the text box portion of this control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Indicates if the suggestion area should be automatically maximized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.automaximizesuggestionarea
     * @type {Boolean} 
     */
    AutoMaximizeSuggestionArea {
        get => this.get_AutoMaximizeSuggestionArea()
        set => this.put_AutoMaximizeSuggestionArea(value)
    }

    /**
     * Gets or sets the style of the auto-suggest text box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.textboxstyle
     * @type {Style} 
     */
    TextBoxStyle {
        get => this.get_TextBoxStyle()
        set => this.put_TextBoxStyle(value)
    }

    /**
     * Gets or sets the graphic content of the button that is clicked to initiate a query.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.queryicon
     * @type {IconElement} 
     */
    QueryIcon {
        get => this.get_QueryIcon()
        set => this.put_QueryIcon(value)
    }

    /**
     * Gets or sets a value that specifies whether the area outside of a *light-dismiss* UI is darkened.
     * @remarks
     * Transient UI, such as the suggestion pane of an [AutoSuggestBox](autosuggestbox.md), closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
     * 
     * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set LightDismissOverlayMode to **On** to make your app darken the "overlay" area on all device families, or set it to **Off** to not darken the "overlay" area on all device families.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.lightdismissoverlaymode
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * Gets or sets content that is shown below the control. The content should provide guidance about the input expected by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestbox.description
     * @type {IInspectable} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Raised before the text content of the editable control component is updated.
     * @remarks
     * Respond to this event when you want to display information in the editable part of the control. An alternative way of updating the text when a suggestion is chosen is to use the [TextMemberPath](autosuggestbox_textmemberpath.md) property.
     * @type {TypedEventHandler<AutoSuggestBox, AutoSuggestBoxSuggestionChosenEventArgs>}
    */
    OnSuggestionChosen {
        get {
            if(!this.HasProp("__OnSuggestionChosen")){
                this.__OnSuggestionChosen := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7996a97e-615e-5ff5-be3d-0ff9fe43451c}"),
                    AutoSuggestBox,
                    AutoSuggestBoxSuggestionChosenEventArgs
                )
                this.__OnSuggestionChosenToken := this.add_SuggestionChosen(this.__OnSuggestionChosen.iface)
            }
            return this.__OnSuggestionChosen
        }
    }

    /**
     * Raised after the text content of the editable control component is updated.
     * @remarks
     * Using the [AutoSuggestBoxTextChangedEventArgs](autosuggestboxtextchangedeventargs.md) data for this event, your app can differentiate between changes from a user typing in the [TextBox](textbox.md) versus an item being selected from the drop-down suggestion list.
     * @type {TypedEventHandler<AutoSuggestBox, AutoSuggestBoxTextChangedEventArgs>}
    */
    OnTextChanged {
        get {
            if(!this.HasProp("__OnTextChanged")){
                this.__OnTextChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7e2dc943-5f2f-54fb-816f-8e65e893f90a}"),
                    AutoSuggestBox,
                    AutoSuggestBoxTextChangedEventArgs
                )
                this.__OnTextChangedToken := this.add_TextChanged(this.__OnTextChanged.iface)
            }
            return this.__OnTextChanged
        }
    }

    /**
     * Occurs when the user submits a search query.
     * @remarks
     * See [AutoSuggestBoxQuerySubmittedEventArgs](autosuggestboxquerysubmittedeventargs.md).
     * @type {TypedEventHandler<AutoSuggestBox, AutoSuggestBoxQuerySubmittedEventArgs>}
    */
    OnQuerySubmitted {
        get {
            if(!this.HasProp("__OnQuerySubmitted")){
                this.__OnQuerySubmitted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1fa5f243-7045-56cb-bf2d-f5a425025c21}"),
                    AutoSuggestBox,
                    AutoSuggestBoxQuerySubmittedEventArgs
                )
                this.__OnQuerySubmittedToken := this.add_QuerySubmitted(this.__OnQuerySubmitted.iface)
            }
            return this.__OnQuerySubmitted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AutoSuggestBox](autosuggestbox.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBox")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSuggestionChosenToken")) {
            this.remove_SuggestionChosen(this.__OnSuggestionChosenToken)
            this.__OnSuggestionChosen.iface.Dispose()
        }

        if(this.HasProp("__OnTextChangedToken")) {
            this.remove_TextChanged(this.__OnTextChangedToken)
            this.__OnTextChanged.iface.Dispose()
        }

        if(this.HasProp("__OnQuerySubmittedToken")) {
            this.remove_QuerySubmitted(this.__OnQuerySubmittedToken)
            this.__OnQuerySubmitted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxSuggestionListHeight() {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.get_MaxSuggestionListHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxSuggestionListHeight(value) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.put_MaxSuggestionListHeight(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuggestionListOpen() {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.get_IsSuggestionListOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSuggestionListOpen(value) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.put_IsSuggestionListOpen(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TextMemberPath() {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.get_TextMemberPath()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TextMemberPath(value) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.put_TextMemberPath(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.put_Text(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UpdateTextOnSelect() {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.get_UpdateTextOnSelect()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UpdateTextOnSelect(value) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.put_UpdateTextOnSelect(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.get_PlaceholderText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderText(value) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.put_PlaceholderText(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.put_Header(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoMaximizeSuggestionArea() {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.get_AutoMaximizeSuggestionArea()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoMaximizeSuggestionArea(value) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.put_AutoMaximizeSuggestionArea(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_TextBoxStyle() {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.get_TextBoxStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_TextBoxStyle(value) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.put_TextBoxStyle(value)
    }

    /**
     * 
     * @param {TypedEventHandler<AutoSuggestBox, AutoSuggestBoxSuggestionChosenEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SuggestionChosen(handler) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.add_SuggestionChosen(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SuggestionChosen(token) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.remove_SuggestionChosen(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AutoSuggestBox, AutoSuggestBoxTextChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextChanged(handler) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.add_TextChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextChanged(token) {
        if (!this.HasProp("__IAutoSuggestBox")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox := IAutoSuggestBox(outPtr)
        }

        return this.__IAutoSuggestBox.remove_TextChanged(token)
    }

    /**
     * 
     * @returns {IconElement} 
     */
    get_QueryIcon() {
        if (!this.HasProp("__IAutoSuggestBox2")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox2 := IAutoSuggestBox2(outPtr)
        }

        return this.__IAutoSuggestBox2.get_QueryIcon()
    }

    /**
     * 
     * @param {IconElement} value 
     * @returns {HRESULT} 
     */
    put_QueryIcon(value) {
        if (!this.HasProp("__IAutoSuggestBox2")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox2 := IAutoSuggestBox2(outPtr)
        }

        return this.__IAutoSuggestBox2.put_QueryIcon(value)
    }

    /**
     * 
     * @param {TypedEventHandler<AutoSuggestBox, AutoSuggestBoxQuerySubmittedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuerySubmitted(handler) {
        if (!this.HasProp("__IAutoSuggestBox2")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox2 := IAutoSuggestBox2(outPtr)
        }

        return this.__IAutoSuggestBox2.add_QuerySubmitted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_QuerySubmitted(token) {
        if (!this.HasProp("__IAutoSuggestBox2")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox2 := IAutoSuggestBox2(outPtr)
        }

        return this.__IAutoSuggestBox2.remove_QuerySubmitted(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        if (!this.HasProp("__IAutoSuggestBox3")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox3 := IAutoSuggestBox3(outPtr)
        }

        return this.__IAutoSuggestBox3.get_LightDismissOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LightDismissOverlayMode(value) {
        if (!this.HasProp("__IAutoSuggestBox3")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox3 := IAutoSuggestBox3(outPtr)
        }

        return this.__IAutoSuggestBox3.put_LightDismissOverlayMode(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Description() {
        if (!this.HasProp("__IAutoSuggestBox4")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox4 := IAutoSuggestBox4(outPtr)
        }

        return this.__IAutoSuggestBox4.get_Description()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IAutoSuggestBox4")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBox4 := IAutoSuggestBox4(outPtr)
        }

        return this.__IAutoSuggestBox4.put_Description(value)
    }

;@endregion Instance Methods
}
