#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ITextBox.ahk
#Include .\ITextBox2.ahk
#Include .\ITextBox3.ahk
#Include .\ITextBox4.ahk
#Include .\ITextBox5.ahk
#Include .\ITextBox6.ahk
#Include .\ITextBox7.ahk
#Include .\ITextBox8.ahk
#Include .\ITextBoxStatics.ahk
#Include .\ITextBoxStatics6.ahk
#Include .\ITextBoxStatics7.ahk
#Include .\ITextBoxStatics3.ahk
#Include .\ITextBoxStatics2.ahk
#Include .\ITextBoxStatics5.ahk
#Include .\ITextBoxFactory.ahk
#Include .\ITextBoxStatics8.ahk
#Include .\TextChangedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\TextChangedEventArgs.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ContextMenuOpeningEventHandler.ahk
#Include .\ContextMenuEventArgs.ahk
#Include .\TextControlPasteEventHandler.ahk
#Include .\TextControlPasteEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\TextBox.ahk
#Include .\TextCompositionStartedEventArgs.ahk
#Include .\TextCompositionChangedEventArgs.ahk
#Include .\TextCompositionEndedEventArgs.ahk
#Include .\CandidateWindowBoundsChangedEventArgs.ahk
#Include .\TextBoxTextChangingEventArgs.ahk
#Include .\TextControlCopyingToClipboardEventArgs.ahk
#Include .\TextControlCuttingToClipboardEventArgs.ahk
#Include .\TextBoxBeforeTextChangingEventArgs.ahk
#Include .\TextBoxSelectionChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that can be used to display and edit plain text (single or multi-line).
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Text box](/windows/uwp/design/controls-and-patterns/text-box).
 * 
 * <img alt="Text box control" src="images/controls/TextBox.png" />
 * 
 * The TextBox control enables a user to enter text into an app. It's typically used to capture a single line of text, but can be configured to capture multiple lines of text. The text displays on the screen in a simple uniform plaintext format.
 * 
 * TextBox has a number of features that can simplify text entry:
 * 
 * - It supports text input from a keyboard  or a pen (using ink and handwriting recognition).
 * - It comes with a familiar, built-in context menu with support for copying and pasting text.
 * - A "clear all" button lets a user quickly delete all text that has been entered.
 * - It also has spell checking capabilities built in and enabled by default.
 * 
 * Here's how to create a TextBox in XAML and in code.
 * 
 * ```xaml
 * <TextBox Width="500" Header="Notes" PlaceholderText="Type your notes here"/>
 * ```
 * 
 * ```csharp
 * TextBox textBox = new TextBox();
 * textBox.Width = 500;
 * textBox.Header = "Notes";
 * textBox.PlaceholderText = "Type your notes here";
 * // Add the TextBox to the visual tree.
 * rootGrid.Children.Add(textBox);
 * ```
 * 
 * The resulting TextBox looks like this. The blue border indicates that the TextBox has focus.
 * 
 * <img src="images/TextBox_Ex1.png" alt="A simple text box" />
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TextBox extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextBox.IID

    /**
     * Identifies the [Text](textbox_text.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.textproperty
     * @type {DependencyProperty} 
     */
    static TextProperty {
        get => TextBox.get_TextProperty()
    }

    /**
     * Identifies the [MaxLength](textbox_maxlength.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.maxlengthproperty
     * @type {DependencyProperty} 
     */
    static MaxLengthProperty {
        get => TextBox.get_MaxLengthProperty()
    }

    /**
     * Identifies the [IsReadOnly](textbox_isreadonly.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.isreadonlyproperty
     * @type {DependencyProperty} 
     */
    static IsReadOnlyProperty {
        get => TextBox.get_IsReadOnlyProperty()
    }

    /**
     * Identifies the [AcceptsReturn](textbox_acceptsreturn.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.acceptsreturnproperty
     * @type {DependencyProperty} 
     */
    static AcceptsReturnProperty {
        get => TextBox.get_AcceptsReturnProperty()
    }

    /**
     * Identifies the [TextAlignment](textbox_textalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.textalignmentproperty
     * @type {DependencyProperty} 
     */
    static TextAlignmentProperty {
        get => TextBox.get_TextAlignmentProperty()
    }

    /**
     * Identifies the [TextWrapping](textbox_textwrapping.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.textwrappingproperty
     * @type {DependencyProperty} 
     */
    static TextWrappingProperty {
        get => TextBox.get_TextWrappingProperty()
    }

    /**
     * Identifies the [IsSpellCheckEnabled](textbox_isspellcheckenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.isspellcheckenabledproperty
     * @type {DependencyProperty} 
     */
    static IsSpellCheckEnabledProperty {
        get => TextBox.get_IsSpellCheckEnabledProperty()
    }

    /**
     * Identifies the [IsTextPredictionEnabled](textbox_istextpredictionenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.istextpredictionenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextPredictionEnabledProperty {
        get => TextBox.get_IsTextPredictionEnabledProperty()
    }

    /**
     * Identifies the InputScope dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.inputscopeproperty
     * @type {DependencyProperty} 
     */
    static InputScopeProperty {
        get => TextBox.get_InputScopeProperty()
    }

    /**
     * Identifies the HorizontalTextAlignment dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.horizontaltextalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalTextAlignmentProperty {
        get => TextBox.get_HorizontalTextAlignmentProperty()
    }

    /**
     * Identifies the CharacterCasing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.charactercasingproperty
     * @type {DependencyProperty} 
     */
    static CharacterCasingProperty {
        get => TextBox.get_CharacterCasingProperty()
    }

    /**
     * Identifies the PlaceholderForeground dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.placeholderforegroundproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderForegroundProperty {
        get => TextBox.get_PlaceholderForegroundProperty()
    }

    /**
     * Identifies the HandwritingView dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.handwritingviewproperty
     * @type {DependencyProperty} 
     */
    static HandwritingViewProperty {
        get => TextBox.get_HandwritingViewProperty()
    }

    /**
     * Identifies the IsHandwritingViewEnabled dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.ishandwritingviewenabledproperty
     * @type {DependencyProperty} 
     */
    static IsHandwritingViewEnabledProperty {
        get => TextBox.get_IsHandwritingViewEnabledProperty()
    }

    /**
     * Identifies the [DesiredCandidateWindowAlignment](textbox_desiredcandidatewindowalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.desiredcandidatewindowalignmentproperty
     * @type {DependencyProperty} 
     */
    static DesiredCandidateWindowAlignmentProperty {
        get => TextBox.get_DesiredCandidateWindowAlignmentProperty()
    }

    /**
     * Identifies the [TextReadingOrder](textbox_textreadingorder.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.textreadingorderproperty
     * @type {DependencyProperty} 
     */
    static TextReadingOrderProperty {
        get => TextBox.get_TextReadingOrderProperty()
    }

    /**
     * Identifies the [Header](textbox_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => TextBox.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](textbox_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => TextBox.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [PlaceholderText](textbox_placeholdertext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.placeholdertextproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderTextProperty {
        get => TextBox.get_PlaceholderTextProperty()
    }

    /**
     * Identifies the [SelectionHighlightColor](textbox_selectionhighlightcolor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectionhighlightcolorproperty
     * @type {DependencyProperty} 
     */
    static SelectionHighlightColorProperty {
        get => TextBox.get_SelectionHighlightColorProperty()
    }

    /**
     * Identifies the [PreventKeyboardDisplayOnProgrammaticFocus](textbox_preventkeyboarddisplayonprogrammaticfocus.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.preventkeyboarddisplayonprogrammaticfocusproperty
     * @type {DependencyProperty} 
     */
    static PreventKeyboardDisplayOnProgrammaticFocusProperty {
        get => TextBox.get_PreventKeyboardDisplayOnProgrammaticFocusProperty()
    }

    /**
     * Identifies the [IsColorFontEnabled](textbox_iscolorfontenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.iscolorfontenabledproperty
     * @type {DependencyProperty} 
     */
    static IsColorFontEnabledProperty {
        get => TextBox.get_IsColorFontEnabledProperty()
    }

    /**
     * Identifies the **SelectionHighlightColorWhenNotFocused** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectionhighlightcolorwhennotfocusedproperty
     * @type {DependencyProperty} 
     */
    static SelectionHighlightColorWhenNotFocusedProperty {
        get => TextBox.get_SelectionHighlightColorWhenNotFocusedProperty()
    }

    /**
     * Identifies the CanPasteClipboardContent dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.canpasteclipboardcontentproperty
     * @type {DependencyProperty} 
     */
    static CanPasteClipboardContentProperty {
        get => TextBox.get_CanPasteClipboardContentProperty()
    }

    /**
     * Identifies the CanUndo dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.canundoproperty
     * @type {DependencyProperty} 
     */
    static CanUndoProperty {
        get => TextBox.get_CanUndoProperty()
    }

    /**
     * Identifies the CanRedo dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.canredoproperty
     * @type {DependencyProperty} 
     */
    static CanRedoProperty {
        get => TextBox.get_CanRedoProperty()
    }

    /**
     * Identifies the SelectionFlyout dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectionflyoutproperty
     * @type {DependencyProperty} 
     */
    static SelectionFlyoutProperty {
        get => TextBox.get_SelectionFlyoutProperty()
    }

    /**
     * Identifies the [ProofingMenuFlyout](textbox_proofingmenuflyout.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.proofingmenuflyoutproperty
     * @type {DependencyProperty} 
     */
    static ProofingMenuFlyoutProperty {
        get => TextBox.get_ProofingMenuFlyoutProperty()
    }

    /**
     * Identifies the Description dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.descriptionproperty
     * @type {DependencyProperty} 
     */
    static DescriptionProperty {
        get => TextBox.get_DescriptionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics.IID)
            TextBox.__ITextBoxStatics := ITextBoxStatics(factoryPtr)
        }

        return TextBox.__ITextBoxStatics.get_TextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxLengthProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics.IID)
            TextBox.__ITextBoxStatics := ITextBoxStatics(factoryPtr)
        }

        return TextBox.__ITextBoxStatics.get_MaxLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsReadOnlyProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics.IID)
            TextBox.__ITextBoxStatics := ITextBoxStatics(factoryPtr)
        }

        return TextBox.__ITextBoxStatics.get_IsReadOnlyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AcceptsReturnProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics.IID)
            TextBox.__ITextBoxStatics := ITextBoxStatics(factoryPtr)
        }

        return TextBox.__ITextBoxStatics.get_AcceptsReturnProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextAlignmentProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics.IID)
            TextBox.__ITextBoxStatics := ITextBoxStatics(factoryPtr)
        }

        return TextBox.__ITextBoxStatics.get_TextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextWrappingProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics.IID)
            TextBox.__ITextBoxStatics := ITextBoxStatics(factoryPtr)
        }

        return TextBox.__ITextBoxStatics.get_TextWrappingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSpellCheckEnabledProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics.IID)
            TextBox.__ITextBoxStatics := ITextBoxStatics(factoryPtr)
        }

        return TextBox.__ITextBoxStatics.get_IsSpellCheckEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextPredictionEnabledProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics.IID)
            TextBox.__ITextBoxStatics := ITextBoxStatics(factoryPtr)
        }

        return TextBox.__ITextBoxStatics.get_IsTextPredictionEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_InputScopeProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics.IID)
            TextBox.__ITextBoxStatics := ITextBoxStatics(factoryPtr)
        }

        return TextBox.__ITextBoxStatics.get_InputScopeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalTextAlignmentProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics6.IID)
            TextBox.__ITextBoxStatics6 := ITextBoxStatics6(factoryPtr)
        }

        return TextBox.__ITextBoxStatics6.get_HorizontalTextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CharacterCasingProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics6.IID)
            TextBox.__ITextBoxStatics6 := ITextBoxStatics6(factoryPtr)
        }

        return TextBox.__ITextBoxStatics6.get_CharacterCasingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderForegroundProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics6.IID)
            TextBox.__ITextBoxStatics6 := ITextBoxStatics6(factoryPtr)
        }

        return TextBox.__ITextBoxStatics6.get_PlaceholderForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HandwritingViewProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics7.IID)
            TextBox.__ITextBoxStatics7 := ITextBoxStatics7(factoryPtr)
        }

        return TextBox.__ITextBoxStatics7.get_HandwritingViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHandwritingViewEnabledProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics7.IID)
            TextBox.__ITextBoxStatics7 := ITextBoxStatics7(factoryPtr)
        }

        return TextBox.__ITextBoxStatics7.get_IsHandwritingViewEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DesiredCandidateWindowAlignmentProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics3.IID)
            TextBox.__ITextBoxStatics3 := ITextBoxStatics3(factoryPtr)
        }

        return TextBox.__ITextBoxStatics3.get_DesiredCandidateWindowAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextReadingOrderProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics3.IID)
            TextBox.__ITextBoxStatics3 := ITextBoxStatics3(factoryPtr)
        }

        return TextBox.__ITextBoxStatics3.get_TextReadingOrderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics2.IID)
            TextBox.__ITextBoxStatics2 := ITextBoxStatics2(factoryPtr)
        }

        return TextBox.__ITextBoxStatics2.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics2.IID)
            TextBox.__ITextBoxStatics2 := ITextBoxStatics2(factoryPtr)
        }

        return TextBox.__ITextBoxStatics2.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderTextProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics2.IID)
            TextBox.__ITextBoxStatics2 := ITextBoxStatics2(factoryPtr)
        }

        return TextBox.__ITextBoxStatics2.get_PlaceholderTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionHighlightColorProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics2.IID)
            TextBox.__ITextBoxStatics2 := ITextBoxStatics2(factoryPtr)
        }

        return TextBox.__ITextBoxStatics2.get_SelectionHighlightColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PreventKeyboardDisplayOnProgrammaticFocusProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics2.IID)
            TextBox.__ITextBoxStatics2 := ITextBoxStatics2(factoryPtr)
        }

        return TextBox.__ITextBoxStatics2.get_PreventKeyboardDisplayOnProgrammaticFocusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsColorFontEnabledProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics2.IID)
            TextBox.__ITextBoxStatics2 := ITextBoxStatics2(factoryPtr)
        }

        return TextBox.__ITextBoxStatics2.get_IsColorFontEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionHighlightColorWhenNotFocusedProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics5.IID)
            TextBox.__ITextBoxStatics5 := ITextBoxStatics5(factoryPtr)
        }

        return TextBox.__ITextBoxStatics5.get_SelectionHighlightColorWhenNotFocusedProperty()
    }

    /**
     * 
     * @returns {TextBox} 
     */
    static CreateInstance() {
        if (!TextBox.HasProp("__ITextBoxFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxFactory.IID)
            TextBox.__ITextBoxFactory := ITextBoxFactory(factoryPtr)
        }

        return TextBox.__ITextBoxFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanPasteClipboardContentProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics8.IID)
            TextBox.__ITextBoxStatics8 := ITextBoxStatics8(factoryPtr)
        }

        return TextBox.__ITextBoxStatics8.get_CanPasteClipboardContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanUndoProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics8.IID)
            TextBox.__ITextBoxStatics8 := ITextBoxStatics8(factoryPtr)
        }

        return TextBox.__ITextBoxStatics8.get_CanUndoProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanRedoProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics8.IID)
            TextBox.__ITextBoxStatics8 := ITextBoxStatics8(factoryPtr)
        }

        return TextBox.__ITextBoxStatics8.get_CanRedoProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionFlyoutProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics8.IID)
            TextBox.__ITextBoxStatics8 := ITextBoxStatics8(factoryPtr)
        }

        return TextBox.__ITextBoxStatics8.get_SelectionFlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ProofingMenuFlyoutProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics8.IID)
            TextBox.__ITextBoxStatics8 := ITextBoxStatics8(factoryPtr)
        }

        return TextBox.__ITextBoxStatics8.get_ProofingMenuFlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DescriptionProperty() {
        if (!TextBox.HasProp("__ITextBoxStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBoxStatics8.IID)
            TextBox.__ITextBoxStatics8 := ITextBoxStatics8(factoryPtr)
        }

        return TextBox.__ITextBoxStatics8.get_DescriptionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the text contents of the text box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the content of the current selection in the text box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectedtext
     * @type {HSTRING} 
     */
    SelectedText {
        get => this.get_SelectedText()
        set => this.put_SelectedText(value)
    }

    /**
     * Gets or sets the number of characters in the current selection in the text box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectionlength
     * @type {Integer} 
     */
    SelectionLength {
        get => this.get_SelectionLength()
        set => this.put_SelectionLength(value)
    }

    /**
     * Gets or sets the starting position of the text selected in the text box. When the SelectionLength is 0 (there is no selected text), the SelectionStart property corresponds to the cursor position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectionstart
     * @type {Integer} 
     */
    SelectionStart {
        get => this.get_SelectionStart()
        set => this.put_SelectionStart(value)
    }

    /**
     * Gets or sets the value that specifies the maximum number of characters allowed for user input.
     * @remarks
     * A MaxLength value of 0 specifies that there is no limit on the number of characters allowed for user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.maxlength
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
        set => this.put_MaxLength(value)
    }

    /**
     * Gets or sets the value that determines if the user can change the text in the text box.
     * @remarks
     * The default control template for [TextBox](textbox.md) has a visual state that tracks whether the [TextBox](textbox.md) is read-only. If the [TextBox](textbox.md) is read-only, it appears in a gray color in most themes. This also tracks if [Control.IsEnabled](control_isenabled.md) is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
        set => this.put_IsReadOnly(value)
    }

    /**
     * Gets or sets the value that determines whether the text box allows and displays the newline or return characters.
     * @remarks
     * If you change the AcceptsReturn property to **true**, text might be displayed differently due to text containing newline characters.
     * 
     * You can enable multi-line text in a [TextBox](textbox.md) control by using the AcceptsReturn property. Use the [ScrollViewer.HorizontalScrollBarVisibility](scrollviewer_horizontalscrollbarvisibility.md) or [ScrollViewer.VerticalScrollBarVisibility](scrollviewer_verticalscrollbarvisibilityproperty.md) attached properties to change scrollbar behavior. By default the scrollbars appear when the layout system calculates that the text exceeds the dimensions of the viewport for the [TextBox](textbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.acceptsreturn
     * @type {Boolean} 
     */
    AcceptsReturn {
        get => this.get_AcceptsReturn()
        set => this.put_AcceptsReturn(value)
    }

    /**
     * Gets or sets how the text should be horizontally aligned in the text box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.textalignment
     * @type {Integer} 
     */
    TextAlignment {
        get => this.get_TextAlignment()
        set => this.put_TextAlignment(value)
    }

    /**
     * Gets or sets how line breaking occurs if a line of text extends beyond the available width of the text box.
     * @remarks
     * [TextBox](textbox.md) and [RichEditBox](richeditbox.md) don't support the **WrapWholeWords** value for their **TextWrapping** properties. If you try to use **WrapWholeWords** as a value for TextBox.TextWrapping or [RichEditBox.TextWrapping](richeditbox_textwrapping.md), an exception is thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.textwrapping
     * @type {Integer} 
     */
    TextWrapping {
        get => this.get_TextWrapping()
        set => this.put_TextWrapping(value)
    }

    /**
     * Gets or sets a value that specifies whether the [TextBox](textbox.md) input interacts with a spell check engine.
     * @remarks
     * When using the Soft Input Panel (SIP), this property enables the following features:
     * 
     * + auto-cap (Mobile only)
     * + spell check
     * + auto-correction
     * + spelling candidates on-demand when the user taps on a misspelled word
     * 
     * 
     * > **Windows 8**
     * > For Universal Windows 8 app, the default is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.isspellcheckenabled
     * @type {Boolean} 
     */
    IsSpellCheckEnabled {
        get => this.get_IsSpellCheckEnabled()
        set => this.put_IsSpellCheckEnabled(value)
    }

    /**
     * Gets or sets a value that determines whether text prediction features ("autocomplete") should be enabled for this [TextBox](textbox.md). 
     * <!--TBW discuss how this interacts with client features rather than app features.-->
     * @remarks
     * Text prediction is not enabled if the user is using a physical keyboard device.
     * 
     * Text prediction is built-in for the[TextBox](textbox.md) control, using language-specific dictionaries. Setting the value to **true** doesn't automatically enable the feature on a custom class.
     * 
     * This property doesn't affect Input Method Editor (IME) for Japanese or Chinese languages. Text prediction for these languages is shown even if this property is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.istextpredictionenabled
     * @type {Boolean} 
     */
    IsTextPredictionEnabled {
        get => this.get_IsTextPredictionEnabled()
        set => this.put_IsTextPredictionEnabled(value)
    }

    /**
     * Gets or sets the context for input used by this [TextBox](textbox.md).
     * @remarks
     * The input scope provides a hint at the type of text input expected by the control. Various elements of the system can respond to the hint provided by the input scope and provide a specialized UI for the input type. For example, the touch keyboard might show a number pad for text input when the control has its [InputScope](../windows.ui.xaml.input/inputscope.md) set to **Number**. See the [InputScopeNameValue](../windows.ui.xaml.input/inputscopenamevalue.md) enumeration for a complete list of input scope values.
     * 
     * The control might also interpret the data being entered differently (typically for East Asian related input scopes). The input scope does not perform any validation, and does not prevent the user from providing any input through a hardware keyboard or other input device.
     * 
     * Other properties that affect the touch keyboard are [IsSpellCheckEnabled](textbox_isspellcheckenabledproperty.md), [IsTextPredictionEnabled](textbox_istextpredictionenabledproperty.md), and [PreventKeyboardDisplayOnProgrammaticFocus](textbox_preventkeyboarddisplayonprogrammaticfocus.md). For more info and examples, see [Use input scope to change the touch keyboard](/windows/uwp/design/input/use-input-scope-to-change-the-touch-keyboard).
     * 
     * > [!NOTE]
     * > While this property can hold a collection of [InputScopeName](../windows.ui.xaml.input/inputscopename.md) values, only the first is used, and the rest are ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.inputscope
     * @type {InputScope} 
     */
    InputScope {
        get => this.get_InputScope()
        set => this.put_InputScope(value)
    }

    /**
     * Gets or sets the content for the control's header.
     * @remarks
     * You can set a data template for the Header by using the [HeaderTemplate](textbox_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the control's header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the text that is displayed in the control until the value is changed by a user action or some other operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.placeholdertext
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * Gets or sets the brush used to highlight the selected text.
     * @remarks
     * The control template sets the default selection highlight color to the system resource **TextSelectionHighlightColorThemeBrush**. To change the selection highlight color for all editable text controls in your app, you can override the **TextSelectionHighlightColorThemeBrush** system resource in App.xaml. This will affect [PasswordBox](passwordbox.md), [TextBox](textbox.md), and [RichEditBox](richeditbox.md) controls.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectionhighlightcolor
     * @type {SolidColorBrush} 
     */
    SelectionHighlightColor {
        get => this.get_SelectionHighlightColor()
        set => this.put_SelectionHighlightColor(value)
    }

    /**
     * Gets or sets a value that indicates whether the on-screen keyboard is shown when the control receives focus programmatically.
     * @remarks
     * Set this property to **true** to prevent the onscreen touch keyboard from showing when focus is programmatically set on a text box. By default, the onscreen touch keyboard is displayed whenever focus moves to an editable text box and the most recent input was generated by touch. This happens whether focus is set programmatically or by user interaction. In some situations, you might not want the keyboard to show when focus is set programmatically. For example, you might want to prevent the keyboard from covering part of your UI until the user is ready to continue their interaction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.preventkeyboarddisplayonprogrammaticfocus
     * @type {Boolean} 
     */
    PreventKeyboardDisplayOnProgrammaticFocus {
        get => this.get_PreventKeyboardDisplayOnProgrammaticFocus()
        set => this.put_PreventKeyboardDisplayOnProgrammaticFocus(value)
    }

    /**
     * Gets or sets a value that determines whether font glyphs that contain color layers, such as Segoe UI Emoji, are rendered in color.
     * @remarks
     * Windows 8.1 introduces the ability for fonts to include multiple colored layers for each glyph. For example, the Segoe UI Emoji font defines color versions of the Emoticon and other Emoji characters. By default, the IsColorFontEnabled property is **true** and fonts with these additional layers are rendered in color.
     * 
     * 
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See Windows Blue bug 452226.-->
     * In Windows 8, Extensible Application Markup Language (XAML) text controls don't render multi-color fonts in color. When an app that was compiled for Windows 8 is recompiled for Windows 8.1, color rendering of multi-color fonts is enabled by default. Some glyphs in multi-color fonts have different layout metrics when rendered in color. This could cause different layout in apps when they are recompiled for Windows 8.1. To retain the Windows 8 behavior when your app is recompiled for Windows 8.1, set IsColorFontEnabled to **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.iscolorfontenabled
     * @type {Boolean} 
     */
    IsColorFontEnabled {
        get => this.get_IsColorFontEnabled()
        set => this.put_IsColorFontEnabled(value)
    }

    /**
     * Gets or sets a value that indicates how the reading order is determined for the [TextBox](textbox.md).
     * @remarks
     * This property can be useful when the base direction of the text is unknown, and may not match the user's language or direction. For more info, see the Remarks section of the [TextReadingOrder](../windows.ui.xaml/textreadingorder.md) enumeration or [How to support bidirectional UI](/previous-versions/windows/apps/jj712703(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.textreadingorder
     * @type {Integer} 
     */
    TextReadingOrder {
        get => this.get_TextReadingOrder()
        set => this.put_TextReadingOrder(value)
    }

    /**
     * Gets or sets a value that indicates the preferred alignment of the Input Method Editor (IME).
     * @remarks
     * Users sometimes enter text through an Input Method Editor (IME) that shows in a window just below a text input box (typically for East Asian languages). The Input Method Editor (IME) window can cover important parts of your app UI that the user might need to see while entering text. Use the DesiredCandidateWindowAlignment property to specify a preferred placement of the Input Method Editor (IME) window in relation to the text input box.
     * 
     * By default, when the hardware keyboard is used, the Input Method Editor (IME) follows the cursor. You can set DesiredCandidateWindowAlignment to [BottomEdge](candidatewindowalignment.md) to align the Input Method Editor (IME) to the bottom edge and left side of the text edit control.
     * 
     * When the Soft Input Panel (SIP) is used, DesiredCandidateWindowAlignment doesn't have any effect. The Input Method Editor (IME) remains docked to the Soft Input Panel (SIP) whenever the Soft Input Panel (SIP) is used.
     * 
     * You can also handle the [CandidateWindowBoundsChanged](textbox_candidatewindowboundschanged.md) event to adapt your UI to the placement of the Input Method Editor (IME).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.desiredcandidatewindowalignment
     * @type {Integer} 
     */
    DesiredCandidateWindowAlignment {
        get => this.get_DesiredCandidateWindowAlignment()
        set => this.put_DesiredCandidateWindowAlignment(value)
    }

    /**
     * Gets or sets the brush used to highlight the selected text when the TextBox does not have focus.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectionhighlightcolorwhennotfocused
     * @type {SolidColorBrush} 
     */
    SelectionHighlightColorWhenNotFocused {
        get => this.get_SelectionHighlightColorWhenNotFocused()
        set => this.put_SelectionHighlightColorWhenNotFocused(value)
    }

    /**
     * Gets or sets a value that indicates how text is aligned in the TextBox.
     * @remarks
     * This property provides the same functionality as the **TextAlignment** property. If both properties are set to conflicting values, the last one set is used.
     * 
     * Apps that target the Fall Creators Update (SDK 16299) or later should use this property instead of **TextAlignment**. If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.horizontaltextalignment
     * @type {Integer} 
     */
    HorizontalTextAlignment {
        get => this.get_HorizontalTextAlignment()
        set => this.put_HorizontalTextAlignment(value)
    }

    /**
     * Gets or sets a value that indicates how the control modifies the case of characters as they are typed.
     * @remarks
     * > [!NOTE]
     * > This property modifies the case of characters as they are typed. It doesn’t modify characters that are entered in other ways, like paste or ink.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.charactercasing
     * @type {Integer} 
     */
    CharacterCasing {
        get => this.get_CharacterCasing()
        set => this.put_CharacterCasing(value)
    }

    /**
     * Gets or sets a brush that describes the color of placeholder text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.placeholderforeground
     * @type {Brush} 
     */
    PlaceholderForeground {
        get => this.get_PlaceholderForeground()
        set => this.put_PlaceholderForeground(value)
    }

    /**
     * Gets or sets the [HandwritingView](handwritingview.md) associated with this text control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.handwritingview
     * @type {HandwritingView} 
     */
    HandwritingView {
        get => this.get_HandwritingView()
        set => this.put_HandwritingView(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can enter text in the handwriting view.
     * @remarks
     * When a user taps into a text input box using a Windows pen, the text box transforms to let the user write directly into it with a pen, rather than opening a separate input panel.
     * 
     * <img src="images/controls/handwritingview-inksuggestion1.gif" alt="Text box with ink and suggestions" />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.ishandwritingviewenabled
     * @type {Boolean} 
     */
    IsHandwritingViewEnabled {
        get => this.get_IsHandwritingViewEnabled()
        set => this.put_IsHandwritingViewEnabled(value)
    }

    /**
     * Gets a value that indicates whether clipboard content can be pasted into the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.canpasteclipboardcontent
     * @type {Boolean} 
     */
    CanPasteClipboardContent {
        get => this.get_CanPasteClipboardContent()
    }

    /**
     * Gets a value that indicates whether the undo buffer contains an action that can be undone.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.canundo
     * @type {Boolean} 
     */
    CanUndo {
        get => this.get_CanUndo()
    }

    /**
     * Gets a value that indicates whether the redo buffer contains an action that can be redone.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.canredo
     * @type {Boolean} 
     */
    CanRedo {
        get => this.get_CanRedo()
    }

    /**
     * Gets or sets the flyout shown when text is selected with touch or pen input.
     * @remarks
     * This property has no effect when text is selected with the mouse or touchpad.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectionflyout
     * @type {FlyoutBase} 
     */
    SelectionFlyout {
        get => this.get_SelectionFlyout()
        set => this.put_SelectionFlyout(value)
    }

    /**
     * Gets the flyout that shows proofing commands.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.proofingmenuflyout
     * @type {FlyoutBase} 
     */
    ProofingMenuFlyout {
        get => this.get_ProofingMenuFlyout()
    }

    /**
     * Gets or sets content that is shown below the control. The content should provide guidance about the input expected by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.description
     * @type {IInspectable} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Occurs when content changes in the text box.
     * @type {TextChangedEventHandler}
    */
    OnTextChanged {
        get {
            if(!this.HasProp("__OnTextChanged")){
                this.__OnTextChanged := WinRTEventHandler(
                    TextChangedEventHandler,
                    TextChangedEventHandler.IID,
                    IInspectable,
                    TextChangedEventArgs
                )
                this.__OnTextChangedToken := this.add_TextChanged(this.__OnTextChanged.iface)
            }
            return this.__OnTextChanged
        }
    }

    /**
     * Occurs when the text selection has changed.
     * @type {RoutedEventHandler}
    */
    OnSelectionChanged {
        get {
            if(!this.HasProp("__OnSelectionChanged")){
                this.__OnSelectionChanged := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnSelectionChangedToken := this.add_SelectionChanged(this.__OnSelectionChanged.iface)
            }
            return this.__OnSelectionChanged
        }
    }

    /**
     * Occurs when the system processes an interaction that displays a context menu.
     * @remarks
     * To override or add commands to the context menu, you can handle the ContextMenuOpening event and replace the default menu with a custom menu. For an example of this, see the **Customizing RichEditBox's CommandBarFlyout - adding 'Share'** example in the <a href="winui2gallery:/item/RichEditBox">WinUI 2 Gallery</a>. For design info, see [Guidelines for context menus](/windows/uwp/design/controls-and-patterns/menus).
     * @type {ContextMenuOpeningEventHandler}
    */
    OnContextMenuOpening {
        get {
            if(!this.HasProp("__OnContextMenuOpening")){
                this.__OnContextMenuOpening := WinRTEventHandler(
                    ContextMenuOpeningEventHandler,
                    ContextMenuOpeningEventHandler.IID,
                    IInspectable,
                    ContextMenuEventArgs
                )
                this.__OnContextMenuOpeningToken := this.add_ContextMenuOpening(this.__OnContextMenuOpening.iface)
            }
            return this.__OnContextMenuOpening
        }
    }

    /**
     * Occurs when text is pasted into the control.
     * @remarks
     * The Paste event occurs before any content is inserted into the control. You can handle this event to check the contents of the clipboard and perform any actions on the content before it's inserted. If you perform any action, set the [Handled](textcontrolpasteeventargs_handled.md) property of the event args to **true**; otherwise, the default paste action is performed. If you mark the event as handled, then it's assumed the app has handled the paste operation, and no default action is performed. You are responsible for determining the insertion point and clipboard content to insert, and inserting the content.
     * 
     * You should set the [Handled](textcontrolpasteeventargs_handled.md) property to **true** in your handler before the code to perform a custom paste action. Otherwise, the default paste action is performed, and then the custom action is performed. The user can see the content changing in the [TextBox](textbox.md).
     * @type {TextControlPasteEventHandler}
    */
    OnPaste {
        get {
            if(!this.HasProp("__OnPaste")){
                this.__OnPaste := WinRTEventHandler(
                    TextControlPasteEventHandler,
                    TextControlPasteEventHandler.IID,
                    IInspectable,
                    TextControlPasteEventArgs
                )
                this.__OnPasteToken := this.add_Paste(this.__OnPaste.iface)
            }
            return this.__OnPaste
        }
    }

    /**
     * Occurs when a user starts composing text through an Input Method Editor (IME).
     * @remarks
     * For event data, see [TextCompositionStartedEventArgs](textcompositionstartedeventargs.md).
     * 
     * This event occurs only when text is composed through an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)). Text composition events occur in the following order:
     * 
     * + TextCompositionStarted
     * + [TextChanging](textbox_textchanging.md)
     * + [TextChanged](textbox_textchanged.md)
     * + [TextCompositionChanged](textbox_textcompositionchanged.md)
     * + [TextCompositionEnded](textbox_textcompositionended.md)
     * 
     * After the TextCompositionStarted event, the [TextChanging](textbox_textchanging.md) &gt; [TextChanged](textbox_textchanged.md) &gt; [TextCompositionChanged](textbox_textcompositionchanged.md) event cycle can occur multiple times before the [TextCompositionEnded](textbox_textcompositionended.md) event occurs.
     * @type {TypedEventHandler<TextBox, TextCompositionStartedEventArgs>}
    */
    OnTextCompositionStarted {
        get {
            if(!this.HasProp("__OnTextCompositionStarted")){
                this.__OnTextCompositionStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{98fee2a4-211d-5a3d-a832-c5ddeb8444a9}"),
                    TextBox,
                    TextCompositionStartedEventArgs
                )
                this.__OnTextCompositionStartedToken := this.add_TextCompositionStarted(this.__OnTextCompositionStarted.iface)
            }
            return this.__OnTextCompositionStarted
        }
    }

    /**
     * Occurs when text being composed through an Input Method Editor (IME) changes.
     * @remarks
     * For event data, see [TextCompositionChangedEventArgs](textcompositionchangedeventargs.md).
     * 
     * This event occurs only when text is composed through an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)). Text composition events occur in the following order:
     * 
     * + [TextCompositionStarted](textbox_textcompositionstarted.md)
     * + [TextChanging](textbox_textchanging.md)
     * + [TextChanged](textbox_textchanged.md)
     * + TextCompositionChanged
     * + [TextCompositionEnded](textbox_textcompositionended.md)
     * 
     * After the [TextCompositionStarted](textbox_textcompositionstarted.md) event, the [TextChanging](textbox_textchanging.md) &gt; [TextChanged](textbox_textchanged.md) &gt; TextCompositionChanged event cycle can occur multiple times before the [TextCompositionEnded](textbox_textcompositionended.md) event occurs.
     * @type {TypedEventHandler<TextBox, TextCompositionChangedEventArgs>}
    */
    OnTextCompositionChanged {
        get {
            if(!this.HasProp("__OnTextCompositionChanged")){
                this.__OnTextCompositionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{61107067-2cfb-5de1-92b6-d332c17f756e}"),
                    TextBox,
                    TextCompositionChangedEventArgs
                )
                this.__OnTextCompositionChangedToken := this.add_TextCompositionChanged(this.__OnTextCompositionChanged.iface)
            }
            return this.__OnTextCompositionChanged
        }
    }

    /**
     * Occurs when a user stops composing text through an Input Method Editor (IME).
     * @remarks
     * For event data, see [TextCompositionEndedEventArgs](textcompositionendedeventargs.md).
     * 
     * This event occurs only when text is composed through an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)). Text composition events occur in the following order:
     * 
     * + [TextCompositionStarted](textbox_textcompositionstarted.md)
     * + [TextChanging](textbox_textchanging.md)
     * + [TextChanged](textbox_textchanged.md)
     * + [TextCompositionChanged](textbox_textcompositionchanged.md)
     * + TextCompositionEnded
     * 
     * After the [TextCompositionStarted](textbox_textcompositionstarted.md) event, the [TextChanging](textbox_textchanging.md) &gt; [TextChanged](textbox_textchanged.md) &gt; [TextCompositionChanged](textbox_textcompositionchanged.md) event cycle can occur multiple times before the TextCompositionEnded event occurs.
     * @type {TypedEventHandler<TextBox, TextCompositionEndedEventArgs>}
    */
    OnTextCompositionEnded {
        get {
            if(!this.HasProp("__OnTextCompositionEnded")){
                this.__OnTextCompositionEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b9ac0e9e-5b32-52b7-a8f9-b85e4be14b16}"),
                    TextBox,
                    TextCompositionEndedEventArgs
                )
                this.__OnTextCompositionEndedToken := this.add_TextCompositionEnded(this.__OnTextCompositionEnded.iface)
            }
            return this.__OnTextCompositionEnded
        }
    }

    /**
     * Occurs when the Input Method Editor (IME) window open, updates, or closes.
     * @remarks
     * For event data, see [CandidateWindowBoundsChangedEventArgs](candidatewindowboundschangedeventargs.md).
     * 
     * Users sometimes enter text through an Input Method Editor (IME) that shows in a window just below a text input box (typically for East Asian languages). The Input Method Editor (IME) window can cover important parts of your app UI that the user might need to see while entering text. This event notifies your app of the coordinates where the Input Method Editor (IME) window is currently displayed. You can use this info to draw your UI in a location that doesn't conflict with the Input Method Editor (IME) window.
     * 
     * You can also use the [DesiredCandidateWindowAlignment](textbox_desiredcandidatewindowalignment.md) property to specify a preferred placement of the Input Method Editor (IME) window in relation to the text input box.
     * @type {TypedEventHandler<TextBox, CandidateWindowBoundsChangedEventArgs>}
    */
    OnCandidateWindowBoundsChanged {
        get {
            if(!this.HasProp("__OnCandidateWindowBoundsChanged")){
                this.__OnCandidateWindowBoundsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b6b53bf8-1ac8-51c4-bafc-95f8e01637b0}"),
                    TextBox,
                    CandidateWindowBoundsChangedEventArgs
                )
                this.__OnCandidateWindowBoundsChangedToken := this.add_CandidateWindowBoundsChanged(this.__OnCandidateWindowBoundsChanged.iface)
            }
            return this.__OnCandidateWindowBoundsChanged
        }
    }

    /**
     * Occurs synchronously when the text in the text box starts to change, but before it is rendered.
     * @remarks
     * For event data, see [TextBoxTextChangingEventArgs](textboxtextchangingeventargs.md).
     * 
     * The TextChanging event occurs synchronously before the new text is rendered. In contrast, the [TextChanged](textbox_textchanged.md) event is asynchronous and occurs after the new text is rendered.
     * 
     * When the TextChanging event occurs, the [Text](textbox_text.md) property already reflects the new value (but it's not rendered in the UI). You typically handle this event to update the [Text](textbox_text.md) value and selection before the text is rendered. This prevents the text flickering that can happen when text is rendered, updated, and re-rendered rapidly.
     * 
     * > [!NOTE]
     * > This is a synchronous event that can occur at times when changes to the XAML visual tree are not allowed, such as during layout. Therefore, you should limit code within the TextChanging event handler primarily to inspecting and updating the [Text](textbox_text.md) property. Attempting to perform other actions, such as showing a popup or adding/removing elements from the visual tree, might cause potentially fatal errors that can lead to a crash. We recommend that you perform these other changes either in a [TextChanged](textbox_textchanged.md) event handler, or run them as a separate asynchronous operation.
     * @type {TypedEventHandler<TextBox, TextBoxTextChangingEventArgs>}
    */
    OnTextChanging {
        get {
            if(!this.HasProp("__OnTextChanging")){
                this.__OnTextChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1e65e112-e634-55c3-befb-dbf5cfcb30b1}"),
                    TextBox,
                    TextBoxTextChangingEventArgs
                )
                this.__OnTextChangingToken := this.add_TextChanging(this.__OnTextChanging.iface)
            }
            return this.__OnTextChanging
        }
    }

    /**
     * Occurs before copied text is moved to the clipboard.
     * @type {TypedEventHandler<TextBox, TextControlCopyingToClipboardEventArgs>}
    */
    OnCopyingToClipboard {
        get {
            if(!this.HasProp("__OnCopyingToClipboard")){
                this.__OnCopyingToClipboard := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{50c332f2-58d1-5228-a3a9-1ccbded70537}"),
                    TextBox,
                    TextControlCopyingToClipboardEventArgs
                )
                this.__OnCopyingToClipboardToken := this.add_CopyingToClipboard(this.__OnCopyingToClipboard.iface)
            }
            return this.__OnCopyingToClipboard
        }
    }

    /**
     * Occurs before cut text is moved to the clipboard.
     * @type {TypedEventHandler<TextBox, TextControlCuttingToClipboardEventArgs>}
    */
    OnCuttingToClipboard {
        get {
            if(!this.HasProp("__OnCuttingToClipboard")){
                this.__OnCuttingToClipboard := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c1033f73-f81a-50d8-8d3a-07b38d8d177e}"),
                    TextBox,
                    TextControlCuttingToClipboardEventArgs
                )
                this.__OnCuttingToClipboardToken := this.add_CuttingToClipboard(this.__OnCuttingToClipboard.iface)
            }
            return this.__OnCuttingToClipboard
        }
    }

    /**
     * Occurs synchronously when the text in the text box starts to change, but before the **Text** property is updated.
     * @type {TypedEventHandler<TextBox, TextBoxBeforeTextChangingEventArgs>}
    */
    OnBeforeTextChanging {
        get {
            if(!this.HasProp("__OnBeforeTextChanging")){
                this.__OnBeforeTextChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{40c0c57b-7c67-52f4-b318-bea8fd033610}"),
                    TextBox,
                    TextBoxBeforeTextChangingEventArgs
                )
                this.__OnBeforeTextChangingToken := this.add_BeforeTextChanging(this.__OnBeforeTextChanging.iface)
            }
            return this.__OnBeforeTextChanging
        }
    }

    /**
     * Occurs when the text selection starts to change.
     * @type {TypedEventHandler<TextBox, TextBoxSelectionChangingEventArgs>}
    */
    OnSelectionChanging {
        get {
            if(!this.HasProp("__OnSelectionChanging")){
                this.__OnSelectionChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{087a02f7-a5f0-569d-8f2f-f4d5e778afc4}"),
                    TextBox,
                    TextBoxSelectionChangingEventArgs
                )
                this.__OnSelectionChangingToken := this.add_SelectionChanging(this.__OnSelectionChanging.iface)
            }
            return this.__OnSelectionChanging
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTextChangedToken")) {
            this.remove_TextChanged(this.__OnTextChangedToken)
            this.__OnTextChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSelectionChangedToken")) {
            this.remove_SelectionChanged(this.__OnSelectionChangedToken)
            this.__OnSelectionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnContextMenuOpeningToken")) {
            this.remove_ContextMenuOpening(this.__OnContextMenuOpeningToken)
            this.__OnContextMenuOpening.iface.Dispose()
        }

        if(this.HasProp("__OnPasteToken")) {
            this.remove_Paste(this.__OnPasteToken)
            this.__OnPaste.iface.Dispose()
        }

        if(this.HasProp("__OnTextCompositionStartedToken")) {
            this.remove_TextCompositionStarted(this.__OnTextCompositionStartedToken)
            this.__OnTextCompositionStarted.iface.Dispose()
        }

        if(this.HasProp("__OnTextCompositionChangedToken")) {
            this.remove_TextCompositionChanged(this.__OnTextCompositionChangedToken)
            this.__OnTextCompositionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTextCompositionEndedToken")) {
            this.remove_TextCompositionEnded(this.__OnTextCompositionEndedToken)
            this.__OnTextCompositionEnded.iface.Dispose()
        }

        if(this.HasProp("__OnCandidateWindowBoundsChangedToken")) {
            this.remove_CandidateWindowBoundsChanged(this.__OnCandidateWindowBoundsChangedToken)
            this.__OnCandidateWindowBoundsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTextChangingToken")) {
            this.remove_TextChanging(this.__OnTextChangingToken)
            this.__OnTextChanging.iface.Dispose()
        }

        if(this.HasProp("__OnCopyingToClipboardToken")) {
            this.remove_CopyingToClipboard(this.__OnCopyingToClipboardToken)
            this.__OnCopyingToClipboard.iface.Dispose()
        }

        if(this.HasProp("__OnCuttingToClipboardToken")) {
            this.remove_CuttingToClipboard(this.__OnCuttingToClipboardToken)
            this.__OnCuttingToClipboard.iface.Dispose()
        }

        if(this.HasProp("__OnBeforeTextChangingToken")) {
            this.remove_BeforeTextChanging(this.__OnBeforeTextChangingToken)
            this.__OnBeforeTextChanging.iface.Dispose()
        }

        if(this.HasProp("__OnSelectionChangingToken")) {
            this.remove_SelectionChanging(this.__OnSelectionChangingToken)
            this.__OnSelectionChanging.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_Text(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SelectedText() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_SelectedText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SelectedText(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_SelectedText(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionLength() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_SelectionLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionLength(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_SelectionLength(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionStart() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_SelectionStart()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionStart(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_SelectionStart(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLength() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_MaxLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxLength(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_MaxLength(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_IsReadOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsReadOnly(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_IsReadOnly(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AcceptsReturn() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_AcceptsReturn()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AcceptsReturn(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_AcceptsReturn(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextAlignment() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_TextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextAlignment(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_TextAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextWrapping() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_TextWrapping()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextWrapping(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_TextWrapping(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSpellCheckEnabled() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_IsSpellCheckEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSpellCheckEnabled(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_IsSpellCheckEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextPredictionEnabled() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_IsTextPredictionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextPredictionEnabled(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_IsTextPredictionEnabled(value)
    }

    /**
     * 
     * @returns {InputScope} 
     */
    get_InputScope() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.get_InputScope()
    }

    /**
     * 
     * @param {InputScope} value 
     * @returns {HRESULT} 
     */
    put_InputScope(value) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.put_InputScope(value)
    }

    /**
     * 
     * @param {TextChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextChanged(handler) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.add_TextChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextChanged(token) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.remove_TextChanged(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.add_SelectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.remove_SelectionChanged(token)
    }

    /**
     * 
     * @param {ContextMenuOpeningEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextMenuOpening(handler) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.add_ContextMenuOpening(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContextMenuOpening(token) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.remove_ContextMenuOpening(token)
    }

    /**
     * Selects a range of text in the text box.
     * @param {Integer} start The zero-based index of the first character in the selection.
     * @param {Integer} length The length of the selection, in characters.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.select
     */
    Select(start, length) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.Select(start, length)
    }

    /**
     * Selects the entire contents of the text box.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.selectall
     */
    SelectAll() {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.SelectAll()
    }

    /**
     * Returns a rectangular region for the leading or trailing edge of a character at a specific character index.
     * @remarks
     * To override the context menu, handle the [ContextMenuOpening](textbox_contextmenuopening.md) event and replace the default menu with a custom menu. Use GetRectFromCharacterIndex to determine where to position the custom menu. For an example of this, see Scenario 2 of the [ContextMenu sample](https://github.com/microsoft/Windows-universal-samples/tree/master/archived/ContextMenu). For design info, see [Guidelines for context menus](/windows/uwp/design/controls-and-patterns/index).
     * 
     * Because this method returns a rectangle that represents a character edge, the width of the rectangle that's returned is always 0. To get the width of a character, you must subtract the **X** value of the leading [Rect](../windows.foundation/rect.md) from the **X** value of the trailing [Rect](../windows.foundation/rect.md).
     * @param {Integer} charIndex A zero-based index of the character for which to retrieve the rectangle.
     * @param {Boolean} trailingEdge **true** to get the trailing edge; **false** to get the leading edge of the character.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.getrectfromcharacterindex
     */
    GetRectFromCharacterIndex(charIndex, trailingEdge) {
        if (!this.HasProp("__ITextBox")) {
            if ((queryResult := this.QueryInterface(ITextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox := ITextBox(outPtr)
        }

        return this.__ITextBox.GetRectFromCharacterIndex(charIndex, trailingEdge)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.get_PlaceholderText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderText(value) {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.put_PlaceholderText(value)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_SelectionHighlightColor() {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.get_SelectionHighlightColor()
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_SelectionHighlightColor(value) {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.put_SelectionHighlightColor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreventKeyboardDisplayOnProgrammaticFocus() {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.get_PreventKeyboardDisplayOnProgrammaticFocus()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PreventKeyboardDisplayOnProgrammaticFocus(value) {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.put_PreventKeyboardDisplayOnProgrammaticFocus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorFontEnabled() {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.get_IsColorFontEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorFontEnabled(value) {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.put_IsColorFontEnabled(value)
    }

    /**
     * 
     * @param {TextControlPasteEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Paste(handler) {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.add_Paste(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Paste(token) {
        if (!this.HasProp("__ITextBox2")) {
            if ((queryResult := this.QueryInterface(ITextBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox2 := ITextBox2(outPtr)
        }

        return this.__ITextBox2.remove_Paste(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, TextCompositionStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextCompositionStarted(handler) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.add_TextCompositionStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextCompositionStarted(token) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.remove_TextCompositionStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, TextCompositionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextCompositionChanged(handler) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.add_TextCompositionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextCompositionChanged(token) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.remove_TextCompositionChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, TextCompositionEndedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextCompositionEnded(handler) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.add_TextCompositionEnded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextCompositionEnded(token) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.remove_TextCompositionEnded(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextReadingOrder() {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.get_TextReadingOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextReadingOrder(value) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.put_TextReadingOrder(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredCandidateWindowAlignment() {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.get_DesiredCandidateWindowAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredCandidateWindowAlignment(value) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.put_DesiredCandidateWindowAlignment(value)
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, CandidateWindowBoundsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CandidateWindowBoundsChanged(handler) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.add_CandidateWindowBoundsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CandidateWindowBoundsChanged(token) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.remove_CandidateWindowBoundsChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, TextBoxTextChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextChanging(handler) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.add_TextChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextChanging(token) {
        if (!this.HasProp("__ITextBox3")) {
            if ((queryResult := this.QueryInterface(ITextBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox3 := ITextBox3(outPtr)
        }

        return this.__ITextBox3.remove_TextChanging(token)
    }

    /**
     * Asynchronously gets a list of candidate words based on the provided phonetic characters in an Input Method Editor (IME).
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.getlinguisticalternativesasync
     */
    GetLinguisticAlternativesAsync() {
        if (!this.HasProp("__ITextBox4")) {
            if ((queryResult := this.QueryInterface(ITextBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox4 := ITextBox4(outPtr)
        }

        return this.__ITextBox4.GetLinguisticAlternativesAsync()
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_SelectionHighlightColorWhenNotFocused() {
        if (!this.HasProp("__ITextBox5")) {
            if ((queryResult := this.QueryInterface(ITextBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox5 := ITextBox5(outPtr)
        }

        return this.__ITextBox5.get_SelectionHighlightColorWhenNotFocused()
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_SelectionHighlightColorWhenNotFocused(value) {
        if (!this.HasProp("__ITextBox5")) {
            if ((queryResult := this.QueryInterface(ITextBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox5 := ITextBox5(outPtr)
        }

        return this.__ITextBox5.put_SelectionHighlightColorWhenNotFocused(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalTextAlignment() {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.get_HorizontalTextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalTextAlignment(value) {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.put_HorizontalTextAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterCasing() {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.get_CharacterCasing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterCasing(value) {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.put_CharacterCasing(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PlaceholderForeground() {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.get_PlaceholderForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderForeground(value) {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.put_PlaceholderForeground(value)
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, TextControlCopyingToClipboardEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CopyingToClipboard(handler) {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.add_CopyingToClipboard(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CopyingToClipboard(token) {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.remove_CopyingToClipboard(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, TextControlCuttingToClipboardEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CuttingToClipboard(handler) {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.add_CuttingToClipboard(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CuttingToClipboard(token) {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.remove_CuttingToClipboard(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, TextBoxBeforeTextChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BeforeTextChanging(handler) {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.add_BeforeTextChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BeforeTextChanging(token) {
        if (!this.HasProp("__ITextBox6")) {
            if ((queryResult := this.QueryInterface(ITextBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox6 := ITextBox6(outPtr)
        }

        return this.__ITextBox6.remove_BeforeTextChanging(token)
    }

    /**
     * 
     * @returns {HandwritingView} 
     */
    get_HandwritingView() {
        if (!this.HasProp("__ITextBox7")) {
            if ((queryResult := this.QueryInterface(ITextBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox7 := ITextBox7(outPtr)
        }

        return this.__ITextBox7.get_HandwritingView()
    }

    /**
     * 
     * @param {HandwritingView} value 
     * @returns {HRESULT} 
     */
    put_HandwritingView(value) {
        if (!this.HasProp("__ITextBox7")) {
            if ((queryResult := this.QueryInterface(ITextBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox7 := ITextBox7(outPtr)
        }

        return this.__ITextBox7.put_HandwritingView(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHandwritingViewEnabled() {
        if (!this.HasProp("__ITextBox7")) {
            if ((queryResult := this.QueryInterface(ITextBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox7 := ITextBox7(outPtr)
        }

        return this.__ITextBox7.get_IsHandwritingViewEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHandwritingViewEnabled(value) {
        if (!this.HasProp("__ITextBox7")) {
            if ((queryResult := this.QueryInterface(ITextBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox7 := ITextBox7(outPtr)
        }

        return this.__ITextBox7.put_IsHandwritingViewEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPasteClipboardContent() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.get_CanPasteClipboardContent()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanUndo() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.get_CanUndo()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRedo() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.get_CanRedo()
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_SelectionFlyout() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.get_SelectionFlyout()
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_SelectionFlyout(value) {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.put_SelectionFlyout(value)
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_ProofingMenuFlyout() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.get_ProofingMenuFlyout()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Description() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.get_Description()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.put_Description(value)
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, TextBoxSelectionChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanging(handler) {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.add_SelectionChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanging(token) {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.remove_SelectionChanging(token)
    }

    /**
     * Undoes the first action in the undo buffer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.undo
     */
    Undo() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.Undo()
    }

    /**
     * Reapplies the first action in the redo buffer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.redo
     */
    Redo() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.Redo()
    }

    /**
     * Copies content from the Windows clipboard into the text control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.pastefromclipboard
     */
    PasteFromClipboard() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.PasteFromClipboard()
    }

    /**
     * Copies the selected content to the Windows clipboard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.copyselectiontoclipboard
     */
    CopySelectionToClipboard() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.CopySelectionToClipboard()
    }

    /**
     * Moves the selected content to the Windows clipboard and removes it from the text control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.cutselectiontoclipboard
     */
    CutSelectionToClipboard() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.CutSelectionToClipboard()
    }

    /**
     * Empties the undo and redo buffers.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox.clearundoredohistory
     */
    ClearUndoRedoHistory() {
        if (!this.HasProp("__ITextBox8")) {
            if ((queryResult := this.QueryInterface(ITextBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBox8 := ITextBox8(outPtr)
        }

        return this.__ITextBox8.ClearUndoRedoHistory()
    }

;@endregion Instance Methods
}
