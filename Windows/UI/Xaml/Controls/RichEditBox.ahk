#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IRichEditBox.ahk
#Include .\IRichEditBox2.ahk
#Include .\IRichEditBox3.ahk
#Include .\IRichEditBox4.ahk
#Include .\IRichEditBox5.ahk
#Include .\IRichEditBox6.ahk
#Include .\IRichEditBox7.ahk
#Include .\IRichEditBox8.ahk
#Include .\IRichEditBoxStatics5.ahk
#Include .\IRichEditBoxStatics3.ahk
#Include .\IRichEditBoxFactory.ahk
#Include .\IRichEditBoxStatics4.ahk
#Include .\IRichEditBoxStatics.ahk
#Include .\IRichEditBoxStatics2.ahk
#Include .\IRichEditBoxStatics7.ahk
#Include .\IRichEditBoxStatics8.ahk
#Include .\IRichEditBoxStatics6.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ContextMenuOpeningEventHandler.ahk
#Include .\ContextMenuEventArgs.ahk
#Include .\TextControlPasteEventHandler.ahk
#Include .\TextControlPasteEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\RichEditBox.ahk
#Include .\TextCompositionStartedEventArgs.ahk
#Include .\TextCompositionChangedEventArgs.ahk
#Include .\TextCompositionEndedEventArgs.ahk
#Include .\CandidateWindowBoundsChangedEventArgs.ahk
#Include .\RichEditBoxTextChangingEventArgs.ahk
#Include .\TextControlCopyingToClipboardEventArgs.ahk
#Include .\TextControlCuttingToClipboardEventArgs.ahk
#Include .\ContentLinkChangedEventArgs.ahk
#Include ..\Documents\ContentLinkInvokedEventArgs.ahk
#Include .\RichEditBoxSelectionChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a rich text editing control that supports formatted text, hyperlinks, and other rich content.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Rich edit box](/windows/uwp/design/controls-and-patterns/rich-edit-box).
 * 
 * RichEditBox is a control that lets a user enter formatted text such as bold, italic, and underlined. RichEditBox can also display Rich Text Format (.rtf) documents including hyperlinks and images (.jpg, .png, etc). This control is designed for advanced text editing scenarios. For simple plain text input, like on a form, consider using [TextBox](textbox.md).
 * 
 * You use the [Document](richeditbox_document.md) property of the RichEditBox to get its content. The content of a RichEditBox is a [Windows.UI.Text.ITextDocument](../windows.ui.text/itextdocument.md) object, which gives you access to the underlying [Text Object Model](/windows/desktop/Controls/text-object-model) APIs. See the [Windows.UI.Text](../windows.ui.text/windows_ui_text.md) namespace for APIs that you can use to work with the text document.
 * 
 * For more info and examples, see the [RichEditBox control guide](/windows/uwp/controls-and-patterns/rich-edit-box).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RichEditBox extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRichEditBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRichEditBox.IID

    /**
     * Identifies the **SelectionHighlightColorWhenNotFocused** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.selectionhighlightcolorwhennotfocusedproperty
     * @type {DependencyProperty} 
     */
    static SelectionHighlightColorWhenNotFocusedProperty {
        get => RichEditBox.get_SelectionHighlightColorWhenNotFocusedProperty()
    }

    /**
     * Identifies the **MaxLength** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.maxlengthproperty
     * @type {DependencyProperty} 
     */
    static MaxLengthProperty {
        get => RichEditBox.get_MaxLengthProperty()
    }

    /**
     * Identifies the [DesiredCandidateWindowAlignment](richeditbox_desiredcandidatewindowalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.desiredcandidatewindowalignmentproperty
     * @type {DependencyProperty} 
     */
    static DesiredCandidateWindowAlignmentProperty {
        get => RichEditBox.get_DesiredCandidateWindowAlignmentProperty()
    }

    /**
     * Identifies the [TextReadingOrder](richeditbox_textreadingorder.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.textreadingorderproperty
     * @type {DependencyProperty} 
     */
    static TextReadingOrderProperty {
        get => RichEditBox.get_TextReadingOrderProperty()
    }

    /**
     * Identifies the [ClipboardCopyFormat](richeditbox_clipboardcopyformat.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.clipboardcopyformatproperty
     * @type {DependencyProperty} 
     */
    static ClipboardCopyFormatProperty {
        get => RichEditBox.get_ClipboardCopyFormatProperty()
    }

    /**
     * Identifies the [IsReadOnly](richeditbox_isreadonly.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.isreadonlyproperty
     * @type {DependencyProperty} 
     */
    static IsReadOnlyProperty {
        get => RichEditBox.get_IsReadOnlyProperty()
    }

    /**
     * Identifies the [AcceptsReturn](richeditbox_acceptsreturn.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.acceptsreturnproperty
     * @type {DependencyProperty} 
     */
    static AcceptsReturnProperty {
        get => RichEditBox.get_AcceptsReturnProperty()
    }

    /**
     * Identifies the [TextAlignment](richeditbox_textalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.textalignmentproperty
     * @type {DependencyProperty} 
     */
    static TextAlignmentProperty {
        get => RichEditBox.get_TextAlignmentProperty()
    }

    /**
     * Identifies the [TextWrapping](richeditbox_textwrapping.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.textwrappingproperty
     * @type {DependencyProperty} 
     */
    static TextWrappingProperty {
        get => RichEditBox.get_TextWrappingProperty()
    }

    /**
     * Identifies the [IsSpellCheckEnabled](richeditbox_isspellcheckenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.isspellcheckenabledproperty
     * @type {DependencyProperty} 
     */
    static IsSpellCheckEnabledProperty {
        get => RichEditBox.get_IsSpellCheckEnabledProperty()
    }

    /**
     * Identifies the [IsTextPredictionEnabled](richeditbox_istextpredictionenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.istextpredictionenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextPredictionEnabledProperty {
        get => RichEditBox.get_IsTextPredictionEnabledProperty()
    }

    /**
     * Identifies the [InputScope](richeditbox_inputscope.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.inputscopeproperty
     * @type {DependencyProperty} 
     */
    static InputScopeProperty {
        get => RichEditBox.get_InputScopeProperty()
    }

    /**
     * Identifies the [Header](richeditbox_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => RichEditBox.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](richeditbox_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => RichEditBox.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [PlaceholderText](richeditbox_placeholdertext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.placeholdertextproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderTextProperty {
        get => RichEditBox.get_PlaceholderTextProperty()
    }

    /**
     * Identifies the [SelectionHighlightColor](richeditbox_selectionhighlightcolor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.selectionhighlightcolorproperty
     * @type {DependencyProperty} 
     */
    static SelectionHighlightColorProperty {
        get => RichEditBox.get_SelectionHighlightColorProperty()
    }

    /**
     * Identifies the [PreventKeyboardDisplayOnProgrammaticFocus](richeditbox_preventkeyboarddisplayonprogrammaticfocus.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.preventkeyboarddisplayonprogrammaticfocusproperty
     * @type {DependencyProperty} 
     */
    static PreventKeyboardDisplayOnProgrammaticFocusProperty {
        get => RichEditBox.get_PreventKeyboardDisplayOnProgrammaticFocusProperty()
    }

    /**
     * Identifies the [IsColorFontEnabled](richeditbox_iscolorfontenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.iscolorfontenabledproperty
     * @type {DependencyProperty} 
     */
    static IsColorFontEnabledProperty {
        get => RichEditBox.get_IsColorFontEnabledProperty()
    }

    /**
     * Identifies the ContentLinkForegroundColor dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.contentlinkforegroundcolorproperty
     * @type {DependencyProperty} 
     */
    static ContentLinkForegroundColorProperty {
        get => RichEditBox.get_ContentLinkForegroundColorProperty()
    }

    /**
     * Identifies the ContentLinkBackgroundColor dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.contentlinkbackgroundcolorproperty
     * @type {DependencyProperty} 
     */
    static ContentLinkBackgroundColorProperty {
        get => RichEditBox.get_ContentLinkBackgroundColorProperty()
    }

    /**
     * Identifies the ContentLinkProviders dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.contentlinkprovidersproperty
     * @type {DependencyProperty} 
     */
    static ContentLinkProvidersProperty {
        get => RichEditBox.get_ContentLinkProvidersProperty()
    }

    /**
     * Identifies the HandwritingView dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.handwritingviewproperty
     * @type {DependencyProperty} 
     */
    static HandwritingViewProperty {
        get => RichEditBox.get_HandwritingViewProperty()
    }

    /**
     * Identifies the IsHandwritingViewEnabled dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.ishandwritingviewenabledproperty
     * @type {DependencyProperty} 
     */
    static IsHandwritingViewEnabledProperty {
        get => RichEditBox.get_IsHandwritingViewEnabledProperty()
    }

    /**
     * Identifies the [SelectionFlyout](richeditbox_selectionflyout.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.selectionflyoutproperty
     * @type {DependencyProperty} 
     */
    static SelectionFlyoutProperty {
        get => RichEditBox.get_SelectionFlyoutProperty()
    }

    /**
     * Identifies the [ProofingMenuFlyout](richeditbox_proofingmenuflyout.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.proofingmenuflyoutproperty
     * @type {DependencyProperty} 
     */
    static ProofingMenuFlyoutProperty {
        get => RichEditBox.get_ProofingMenuFlyoutProperty()
    }

    /**
     * Identifies the [Description](richeditbox_description.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.descriptionproperty
     * @type {DependencyProperty} 
     */
    static DescriptionProperty {
        get => RichEditBox.get_DescriptionProperty()
    }

    /**
     * Identifies the HorizontalTextAlignment dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.horizontaltextalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalTextAlignmentProperty {
        get => RichEditBox.get_HorizontalTextAlignmentProperty()
    }

    /**
     * Identifies the CharacterCasing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.charactercasingproperty
     * @type {DependencyProperty} 
     */
    static CharacterCasingProperty {
        get => RichEditBox.get_CharacterCasingProperty()
    }

    /**
     * Identifies the DisabledFormattingAccelerators dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.disabledformattingacceleratorsproperty
     * @type {DependencyProperty} 
     */
    static DisabledFormattingAcceleratorsProperty {
        get => RichEditBox.get_DisabledFormattingAcceleratorsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionHighlightColorWhenNotFocusedProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics5.IID)
            RichEditBox.__IRichEditBoxStatics5 := IRichEditBoxStatics5(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics5.get_SelectionHighlightColorWhenNotFocusedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxLengthProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics5.IID)
            RichEditBox.__IRichEditBoxStatics5 := IRichEditBoxStatics5(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics5.get_MaxLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DesiredCandidateWindowAlignmentProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics3.IID)
            RichEditBox.__IRichEditBoxStatics3 := IRichEditBoxStatics3(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics3.get_DesiredCandidateWindowAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextReadingOrderProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics3.IID)
            RichEditBox.__IRichEditBoxStatics3 := IRichEditBoxStatics3(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics3.get_TextReadingOrderProperty()
    }

    /**
     * 
     * @returns {RichEditBox} 
     */
    static CreateInstance() {
        if (!RichEditBox.HasProp("__IRichEditBoxFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxFactory.IID)
            RichEditBox.__IRichEditBoxFactory := IRichEditBoxFactory(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClipboardCopyFormatProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics4.IID)
            RichEditBox.__IRichEditBoxStatics4 := IRichEditBoxStatics4(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics4.get_ClipboardCopyFormatProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsReadOnlyProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics.IID)
            RichEditBox.__IRichEditBoxStatics := IRichEditBoxStatics(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics.get_IsReadOnlyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AcceptsReturnProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics.IID)
            RichEditBox.__IRichEditBoxStatics := IRichEditBoxStatics(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics.get_AcceptsReturnProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextAlignmentProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics.IID)
            RichEditBox.__IRichEditBoxStatics := IRichEditBoxStatics(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics.get_TextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextWrappingProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics.IID)
            RichEditBox.__IRichEditBoxStatics := IRichEditBoxStatics(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics.get_TextWrappingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSpellCheckEnabledProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics.IID)
            RichEditBox.__IRichEditBoxStatics := IRichEditBoxStatics(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics.get_IsSpellCheckEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextPredictionEnabledProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics.IID)
            RichEditBox.__IRichEditBoxStatics := IRichEditBoxStatics(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics.get_IsTextPredictionEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_InputScopeProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics.IID)
            RichEditBox.__IRichEditBoxStatics := IRichEditBoxStatics(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics.get_InputScopeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics2.IID)
            RichEditBox.__IRichEditBoxStatics2 := IRichEditBoxStatics2(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics2.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics2.IID)
            RichEditBox.__IRichEditBoxStatics2 := IRichEditBoxStatics2(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics2.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderTextProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics2.IID)
            RichEditBox.__IRichEditBoxStatics2 := IRichEditBoxStatics2(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics2.get_PlaceholderTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionHighlightColorProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics2.IID)
            RichEditBox.__IRichEditBoxStatics2 := IRichEditBoxStatics2(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics2.get_SelectionHighlightColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PreventKeyboardDisplayOnProgrammaticFocusProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics2.IID)
            RichEditBox.__IRichEditBoxStatics2 := IRichEditBoxStatics2(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics2.get_PreventKeyboardDisplayOnProgrammaticFocusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsColorFontEnabledProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics2.IID)
            RichEditBox.__IRichEditBoxStatics2 := IRichEditBoxStatics2(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics2.get_IsColorFontEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentLinkForegroundColorProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics7.IID)
            RichEditBox.__IRichEditBoxStatics7 := IRichEditBoxStatics7(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics7.get_ContentLinkForegroundColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentLinkBackgroundColorProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics7.IID)
            RichEditBox.__IRichEditBoxStatics7 := IRichEditBoxStatics7(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics7.get_ContentLinkBackgroundColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentLinkProvidersProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics7.IID)
            RichEditBox.__IRichEditBoxStatics7 := IRichEditBoxStatics7(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics7.get_ContentLinkProvidersProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HandwritingViewProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics7.IID)
            RichEditBox.__IRichEditBoxStatics7 := IRichEditBoxStatics7(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics7.get_HandwritingViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHandwritingViewEnabledProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics7.IID)
            RichEditBox.__IRichEditBoxStatics7 := IRichEditBoxStatics7(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics7.get_IsHandwritingViewEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionFlyoutProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics8.IID)
            RichEditBox.__IRichEditBoxStatics8 := IRichEditBoxStatics8(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics8.get_SelectionFlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ProofingMenuFlyoutProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics8.IID)
            RichEditBox.__IRichEditBoxStatics8 := IRichEditBoxStatics8(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics8.get_ProofingMenuFlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DescriptionProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics8.IID)
            RichEditBox.__IRichEditBoxStatics8 := IRichEditBoxStatics8(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics8.get_DescriptionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalTextAlignmentProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics6.IID)
            RichEditBox.__IRichEditBoxStatics6 := IRichEditBoxStatics6(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics6.get_HorizontalTextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CharacterCasingProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics6.IID)
            RichEditBox.__IRichEditBoxStatics6 := IRichEditBoxStatics6(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics6.get_CharacterCasingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisabledFormattingAcceleratorsProperty() {
        if (!RichEditBox.HasProp("__IRichEditBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichEditBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichEditBoxStatics6.IID)
            RichEditBox.__IRichEditBoxStatics6 := IRichEditBoxStatics6(factoryPtr)
        }

        return RichEditBox.__IRichEditBoxStatics6.get_DisabledFormattingAcceleratorsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the user can change the text in the [RichEditBox](richeditbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
        set => this.put_IsReadOnly(value)
    }

    /**
     * Gets or sets a value that indicates whether the [RichEditBox](richeditbox.md) allows and displays the newline or return characters when the ENTER or RETURN keys are pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.acceptsreturn
     * @type {Boolean} 
     */
    AcceptsReturn {
        get => this.get_AcceptsReturn()
        set => this.put_AcceptsReturn(value)
    }

    /**
     * Gets or sets a value that indicates how text is aligned in the [RichEditBox](richeditbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.textalignment
     * @type {Integer} 
     */
    TextAlignment {
        get => this.get_TextAlignment()
        set => this.put_TextAlignment(value)
    }

    /**
     * Gets or sets a value that indicates how text wrapping occurs if a line of text extends beyond the available width of the [RichEditBox](richeditbox.md).
     * @remarks
     * [TextBox](textbox.md) and [RichEditBox](richeditbox.md) don't support the **WrapWholeWords** value for their **TextWrapping** properties. If you try to use **WrapWholeWords** as a value for [TextBox.TextWrapping](textbox_textwrapping.md) or RichEditBox.TextWrapping an invalid argument exception is thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.textwrapping
     * @type {Integer} 
     */
    TextWrapping {
        get => this.get_TextWrapping()
        set => this.put_TextWrapping(value)
    }

    /**
     * Gets or sets a value that indicates whether the text input should interact with a spell check engine.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.isspellcheckenabled
     * @type {Boolean} 
     */
    IsSpellCheckEnabled {
        get => this.get_IsSpellCheckEnabled()
        set => this.put_IsSpellCheckEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether text prediction features ("autocomplete") are enabled for this [RichEditBox](richeditbox.md).
     * @remarks
     * This property doesn't affect Input Method Editor (IME) for Japanese or Chinese languages. Text prediction for these languages is shown even if this property is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.istextpredictionenabled
     * @type {Boolean} 
     */
    IsTextPredictionEnabled {
        get => this.get_IsTextPredictionEnabled()
        set => this.put_IsTextPredictionEnabled(value)
    }

    /**
     * Gets an object that enables access to the text object model for the text contained in a [RichEditBox](richeditbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.document
     * @type {ITextDocument} 
     */
    Document {
        get => this.get_Document()
    }

    /**
     * Gets or sets the context for input used by this [RichEditBox](richeditbox.md).
     * @remarks
     * The input scope provides a hint at the type of text input expected by the control. Various elements of the system can respond to the hint provided by the input scope and provide a specialized UI for the input type. For example, the soft keyboard might show a number pad for text input when the control has its [InputScope](../windows.ui.xaml.input/inputscope.md) set to **Number**. See the [InputScopeNameValue](../windows.ui.xaml.input/inputscopenamevalue.md) enumeration for a complete list of input scope values.
     * 
     * The control might also interpret the data being entered differently (typically for East Asian related input scopes). The input scope does not perform any validation, and does not prevent the user from providing input through a hardware keyboard or other input device.
     * 
     * > [!Important]
     * > While this property can hold a collection of [InputScopeName](../windows.ui.xaml.input/inputscopename.md) values, in most cases only the first is used. The only exception to this is when `Private` is specified as a value. `Private` is never ignored, regardless of its location in the collection.  If `Private` is the first item in the collection, the next item in the collection (if present) is also used.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.inputscope
     * @type {InputScope} 
     */
    InputScope {
        get => this.get_InputScope()
        set => this.put_InputScope(value)
    }

    /**
     * Gets or sets the content for the control's header.
     * @remarks
     * You can set a data template for the Header by using the [HeaderTemplate](richeditbox_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the control's header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the text that is displayed in the control until the value is changed by a user action or some other operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.placeholdertext
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * Gets or sets the brush used to highlight the selected text.
     * @remarks
     * The control template sets the default selection highlight color to the system resource **TextSelectionHighlightColorThemeBrush**. To change the selection highlight color for all editable text controls in your app, you can override the **TextSelectionHighlightColorThemeBrush** system resource in App.xaml. This will affect [PasswordBox](passwordbox.md), [TextBox](textbox.md), and [RichEditBox](richeditbox.md) controls. For more info, see [XAML theme resources](/windows/apps/design/style/xaml-theme-resources).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.selectionhighlightcolor
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.preventkeyboarddisplayonprogrammaticfocus
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.iscolorfontenabled
     * @type {Boolean} 
     */
    IsColorFontEnabled {
        get => this.get_IsColorFontEnabled()
        set => this.put_IsColorFontEnabled(value)
    }

    /**
     * Gets or sets a value that indicates how the reading order is determined for the [RichEditBox](richeditbox.md).
     * @remarks
     * This property can be useful when the base direction of the text is unknown, and may not match the user's language or direction. For more info, see the Remarks section of the [TextReadingOrder](../windows.ui.xaml/textreadingorder.md) enumeration or [How to support bidirectional UI](/previous-versions/windows/apps/jj712703(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.textreadingorder
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
     * You can also handle the [CandidateWindowBoundsChanged](richeditbox_candidatewindowboundschanged.md) event to adapt your UI to the placement of the Input Method Editor (IME).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.desiredcandidatewindowalignment
     * @type {Integer} 
     */
    DesiredCandidateWindowAlignment {
        get => this.get_DesiredCandidateWindowAlignment()
        set => this.put_DesiredCandidateWindowAlignment(value)
    }

    /**
     * Gets or sets a value that specifies whether text is copied with all formats, or as plain text only.
     * @remarks
     * By default, text copied from a [RichEditBox](richeditbox.md) is copied as both plain text and rich text. When the text is pasted into another app, the receiving app determines whether the plain text or rich text is used. To ensure that only plain text is pasted into a receiving app, set this property to **PlainText** to copy only plain text from the [RichEditBox](richeditbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.clipboardcopyformat
     * @type {Integer} 
     */
    ClipboardCopyFormat {
        get => this.get_ClipboardCopyFormat()
        set => this.put_ClipboardCopyFormat(value)
    }

    /**
     * Gets or sets the brush used to highlight the selected text when the RichEditBox does not have focus.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.selectionhighlightcolorwhennotfocused
     * @type {SolidColorBrush} 
     */
    SelectionHighlightColorWhenNotFocused {
        get => this.get_SelectionHighlightColorWhenNotFocused()
        set => this.put_SelectionHighlightColorWhenNotFocused(value)
    }

    /**
     * Gets or sets the value that specifies the maximum number of characters allowed for user input.
     * @remarks
     * A **MaxLength** value of 0 specifies that there is no limit on the number of characters allowed for user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.maxlength
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
        set => this.put_MaxLength(value)
    }

    /**
     * Gets or sets a value that indicates how text is aligned in the RichEditBox.
     * @remarks
     * This property provides the same functionality as the **TextAlignment** property. If both properties are set to conflicting values, the last one set is used.
     * 
     * Apps that target the Fall Creators Update (SDK 16299) or later should use this property instead of **TextAlignment**. If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.horizontaltextalignment
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.charactercasing
     * @type {Integer} 
     */
    CharacterCasing {
        get => this.get_CharacterCasing()
        set => this.put_CharacterCasing(value)
    }

    /**
     * Gets or sets a value that indicates which keyboard shortcuts for formatting are disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.disabledformattingaccelerators
     * @type {Integer} 
     */
    DisabledFormattingAccelerators {
        get => this.get_DisabledFormattingAccelerators()
        set => this.put_DisabledFormattingAccelerators(value)
    }

    /**
     * Get or sets the brush used to color the link text.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.contentlinkforegroundcolor
     * @type {SolidColorBrush} 
     */
    ContentLinkForegroundColor {
        get => this.get_ContentLinkForegroundColor()
        set => this.put_ContentLinkForegroundColor(value)
    }

    /**
     * Get or sets the brush used to color the link background.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.contentlinkbackgroundcolor
     * @type {SolidColorBrush} 
     */
    ContentLinkBackgroundColor {
        get => this.get_ContentLinkBackgroundColor()
        set => this.put_ContentLinkBackgroundColor(value)
    }

    /**
     * Gets or sets the collection of [ContentLinkProvider](../windows.ui.xaml.documents/contentlinkprovider.md)s that define the types of [ContentLink](../windows.ui.xaml.documents/contentlink.md)s used in this RichEditBox.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.contentlinkproviders
     * @type {ContentLinkProviderCollection} 
     */
    ContentLinkProviders {
        get => this.get_ContentLinkProviders()
        set => this.put_ContentLinkProviders(value)
    }

    /**
     * Gets or sets the [HandwritingView](handwritingview.md) associated with this text control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.handwritingview
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.ishandwritingviewenabled
     * @type {Boolean} 
     */
    IsHandwritingViewEnabled {
        get => this.get_IsHandwritingViewEnabled()
        set => this.put_IsHandwritingViewEnabled(value)
    }

    /**
     * Gets an object that enables access to the text object model for the text contained in a [RichEditBox](richeditbox.md).
     * @remarks
     * The TextDocument property is equivalent to the [Document](richeditbox_document.md) property except for the type. The Document property is of type [ITextDocument](/windows.ui.text/itextdocument.md), and can be type cast to RichEditTextDocument. The TextDocument property, on the other hand, is already typed as RichEditTextDocument, so no type cast is necessary.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.textdocument
     * @type {RichEditTextDocument} 
     */
    TextDocument {
        get => this.get_TextDocument()
    }

    /**
     * Gets or sets the flyout that is shown when text is selected using mouse, touch, or pen; or **null** if no flyout is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.selectionflyout
     * @type {FlyoutBase} 
     */
    SelectionFlyout {
        get => this.get_SelectionFlyout()
        set => this.put_SelectionFlyout(value)
    }

    /**
     * Gets the flyout that shows proofing commands.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.proofingmenuflyout
     * @type {FlyoutBase} 
     */
    ProofingMenuFlyout {
        get => this.get_ProofingMenuFlyout()
    }

    /**
     * Gets or sets content that is shown below the control. The content should provide guidance about the input expected by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.description
     * @type {IInspectable} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Occurs when content changes in the [RichEditBox](richeditbox.md).
     * @type {RoutedEventHandler}
    */
    OnTextChanged {
        get {
            if(!this.HasProp("__OnTextChanged")){
                this.__OnTextChanged := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
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
     * The Paste event occurs before any content is inserted into the control. You can handle this event to check the contents of the clipboard and perform any actions on the content before it's inserted. If you perform any action, set the handled property to true; otherwise, the default paste action is performed. If you set the handled property to true, then it's assumed the app has handled the insertion, and no default action is performed. You are responsible for determining the insertion point and clipboard content to insert, and inserting the content.
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
     * + TextCompositionStarted
     * + [TextChanging](richeditbox_textchanging.md)
     * + [TextChanged](richeditbox_textchanged.md)
     * + [TextCompositionChanged](richeditbox_textcompositionchanged.md)
     * + [TextCompositionEnded](richeditbox_textcompositionended.md)
     * 
     * 
     * After the TextCompositionStarted event, the [TextChanging](richeditbox_textchanging.md) &gt; [TextChanged](richeditbox_textchanged.md) &gt; [TextCompositionChanged](richeditbox_textcompositionchanged.md) event cycle can occur multiple times before the [TextCompositionEnded](richeditbox_textcompositionended.md) event occurs.
     * @type {TypedEventHandler<RichEditBox, TextCompositionStartedEventArgs>}
    */
    OnTextCompositionStarted {
        get {
            if(!this.HasProp("__OnTextCompositionStarted")){
                this.__OnTextCompositionStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{297dde84-d0c7-5d21-b1ed-f96c4ea4772f}"),
                    RichEditBox,
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
     * + [TextCompositionStarted](richeditbox_textcompositionstarted.md)
     * + [TextChanging](richeditbox_textchanging.md)
     * + [TextChanged](richeditbox_textchanged.md)
     * + TextCompositionChanged
     * + [TextCompositionEnded](richeditbox_textcompositionended.md)
     * 
     * 
     * After the [TextCompositionStarted](richeditbox_textcompositionstarted.md) event, the [TextChanging](richeditbox_textchanging.md) &gt; [TextChanged](richeditbox_textchanged.md) &gt; TextCompositionChanged event cycle can occur multiple times before the [TextCompositionEnded](richeditbox_textcompositionended.md) event occurs.
     * @type {TypedEventHandler<RichEditBox, TextCompositionChangedEventArgs>}
    */
    OnTextCompositionChanged {
        get {
            if(!this.HasProp("__OnTextCompositionChanged")){
                this.__OnTextCompositionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c080b01b-eec0-542c-b1f1-d00e207ee1e0}"),
                    RichEditBox,
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
     * + [TextCompositionStarted](richeditbox_textcompositionstarted.md)
     * + [TextChanging](richeditbox_textchanging.md)
     * + [TextChanged](richeditbox_textchanged.md)
     * + [TextCompositionChanged](richeditbox_textcompositionchanged.md)
     * + TextCompositionEnded
     * 
     * 
     * After the [TextCompositionStarted](richeditbox_textcompositionstarted.md) event, the [TextChanging](richeditbox_textchanging.md) &gt; [TextChanged](richeditbox_textchanged.md) &gt; [TextCompositionChanged](richeditbox_textcompositionchanged.md) event cycle can occur multiple times before the TextCompositionEnded event occurs.
     * @type {TypedEventHandler<RichEditBox, TextCompositionEndedEventArgs>}
    */
    OnTextCompositionEnded {
        get {
            if(!this.HasProp("__OnTextCompositionEnded")){
                this.__OnTextCompositionEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e6750b95-305f-52fd-bb80-cfcf72bc5421}"),
                    RichEditBox,
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
     * You can also use the [DesiredCandidateWindowAlignment](richeditbox_desiredcandidatewindowalignment.md) property to specify a preferred placement of the Input Method Editor (IME) window in relation to the text input box.
     * @type {TypedEventHandler<RichEditBox, CandidateWindowBoundsChangedEventArgs>}
    */
    OnCandidateWindowBoundsChanged {
        get {
            if(!this.HasProp("__OnCandidateWindowBoundsChanged")){
                this.__OnCandidateWindowBoundsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b0b3c248-7604-5108-aec9-6f3aecca2737}"),
                    RichEditBox,
                    CandidateWindowBoundsChangedEventArgs
                )
                this.__OnCandidateWindowBoundsChangedToken := this.add_CandidateWindowBoundsChanged(this.__OnCandidateWindowBoundsChanged.iface)
            }
            return this.__OnCandidateWindowBoundsChanged
        }
    }

    /**
     * Occurs synchronously when the text in the edit box starts to change, but before it is rendered.
     * @remarks
     * For event data, see [RichEditBoxTextChangingEventArgs](richeditboxtextchangingeventargs.md).
     * 
     * The TextChanging event occurs synchronously before the new text is rendered. In contrast, the [TextChanged](richeditbox_textchanged.md) event is asynchronous and occurs after the new text is rendered.
     * 
     * When the TextChanging event occurs, the [Document](richeditbox_document.md) property already reflects the new value (but it's not rendered in the UI). You typically handle this event to update the text value and selection before the text is rendered. This prevents the text flickering that can happen when text is rendered, updated, and re-rendered rapidly.
     * 
     * > [!NOTE]
     * > This is a synchronous event that can occur at times when changes to the XAML visual tree are not allowed, such as during layout. Therefore, you should limit code within the TextChanging event handler primarily to inspecting and updating the [Document](richeditbox_document.md) property. Attempting to perform other actions, such as showing a popup or adding/removing elements from the visual tree, might cause potentially fatal errors that can lead to a crash. We recommend that you perform these other changes either in a [TextChanged](richeditbox_textchanged.md) event handler, or run them as a separate asynchronous operation.
     * @type {TypedEventHandler<RichEditBox, RichEditBoxTextChangingEventArgs>}
    */
    OnTextChanging {
        get {
            if(!this.HasProp("__OnTextChanging")){
                this.__OnTextChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fad2ffb9-d2d9-563c-88ca-1323b133fbf3}"),
                    RichEditBox,
                    RichEditBoxTextChangingEventArgs
                )
                this.__OnTextChangingToken := this.add_TextChanging(this.__OnTextChanging.iface)
            }
            return this.__OnTextChanging
        }
    }

    /**
     * Occurs before copied text is moved to the clipboard.
     * @type {TypedEventHandler<RichEditBox, TextControlCopyingToClipboardEventArgs>}
    */
    OnCopyingToClipboard {
        get {
            if(!this.HasProp("__OnCopyingToClipboard")){
                this.__OnCopyingToClipboard := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b8cb973a-91c4-5ae4-8b4e-01b968dc1a57}"),
                    RichEditBox,
                    TextControlCopyingToClipboardEventArgs
                )
                this.__OnCopyingToClipboardToken := this.add_CopyingToClipboard(this.__OnCopyingToClipboard.iface)
            }
            return this.__OnCopyingToClipboard
        }
    }

    /**
     * Occurs before cut text is moved to the clipboard.
     * @type {TypedEventHandler<RichEditBox, TextControlCuttingToClipboardEventArgs>}
    */
    OnCuttingToClipboard {
        get {
            if(!this.HasProp("__OnCuttingToClipboard")){
                this.__OnCuttingToClipboard := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c3feed97-c386-5d87-a320-e95ccb365a6b}"),
                    RichEditBox,
                    TextControlCuttingToClipboardEventArgs
                )
                this.__OnCuttingToClipboardToken := this.add_CuttingToClipboard(this.__OnCuttingToClipboard.iface)
            }
            return this.__OnCuttingToClipboard
        }
    }

    /**
     * Occurs when a content link is added, removed, or edited.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * This event occurs after the **TextChanging** event and before the **TextChanged** event.
     * @type {TypedEventHandler<RichEditBox, ContentLinkChangedEventArgs>}
    */
    OnContentLinkChanged {
        get {
            if(!this.HasProp("__OnContentLinkChanged")){
                this.__OnContentLinkChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6ad0c1d8-3d49-53f8-b295-b3a92445019a}"),
                    RichEditBox,
                    ContentLinkChangedEventArgs
                )
                this.__OnContentLinkChangedToken := this.add_ContentLinkChanged(this.__OnContentLinkChanged.iface)
            }
            return this.__OnContentLinkChanged
        }
    }

    /**
     * Occurs when the link is activated by user interaction.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @type {TypedEventHandler<RichEditBox, ContentLinkInvokedEventArgs>}
    */
    OnContentLinkInvoked {
        get {
            if(!this.HasProp("__OnContentLinkInvoked")){
                this.__OnContentLinkInvoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e261fba5-7714-5e51-b12e-9c0d12da4006}"),
                    RichEditBox,
                    ContentLinkInvokedEventArgs
                )
                this.__OnContentLinkInvokedToken := this.add_ContentLinkInvoked(this.__OnContentLinkInvoked.iface)
            }
            return this.__OnContentLinkInvoked
        }
    }

    /**
     * Occurs when the text selection starts to change.
     * @type {TypedEventHandler<RichEditBox, RichEditBoxSelectionChangingEventArgs>}
    */
    OnSelectionChanging {
        get {
            if(!this.HasProp("__OnSelectionChanging")){
                this.__OnSelectionChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a71cb2c7-9ba0-5e37-b5fe-015f8586bfd2}"),
                    RichEditBox,
                    RichEditBoxSelectionChangingEventArgs
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

        if(this.HasProp("__OnContentLinkChangedToken")) {
            this.remove_ContentLinkChanged(this.__OnContentLinkChangedToken)
            this.__OnContentLinkChanged.iface.Dispose()
        }

        if(this.HasProp("__OnContentLinkInvokedToken")) {
            this.remove_ContentLinkInvoked(this.__OnContentLinkInvokedToken)
            this.__OnContentLinkInvoked.iface.Dispose()
        }

        if(this.HasProp("__OnSelectionChangingToken")) {
            this.remove_SelectionChanging(this.__OnSelectionChangingToken)
            this.__OnSelectionChanging.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.get_IsReadOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsReadOnly(value) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.put_IsReadOnly(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AcceptsReturn() {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.get_AcceptsReturn()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AcceptsReturn(value) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.put_AcceptsReturn(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextAlignment() {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.get_TextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextAlignment(value) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.put_TextAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextWrapping() {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.get_TextWrapping()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextWrapping(value) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.put_TextWrapping(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSpellCheckEnabled() {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.get_IsSpellCheckEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSpellCheckEnabled(value) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.put_IsSpellCheckEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextPredictionEnabled() {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.get_IsTextPredictionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextPredictionEnabled(value) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.put_IsTextPredictionEnabled(value)
    }

    /**
     * 
     * @returns {ITextDocument} 
     */
    get_Document() {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.get_Document()
    }

    /**
     * 
     * @returns {InputScope} 
     */
    get_InputScope() {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.get_InputScope()
    }

    /**
     * 
     * @param {InputScope} value 
     * @returns {HRESULT} 
     */
    put_InputScope(value) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.put_InputScope(value)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextChanged(handler) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.add_TextChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextChanged(token) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.remove_TextChanged(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.add_SelectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.remove_SelectionChanged(token)
    }

    /**
     * 
     * @param {ContextMenuOpeningEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextMenuOpening(handler) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.add_ContextMenuOpening(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContextMenuOpening(token) {
        if (!this.HasProp("__IRichEditBox")) {
            if ((queryResult := this.QueryInterface(IRichEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox := IRichEditBox(outPtr)
        }

        return this.__IRichEditBox.remove_ContextMenuOpening(token)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.get_PlaceholderText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderText(value) {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.put_PlaceholderText(value)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_SelectionHighlightColor() {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.get_SelectionHighlightColor()
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_SelectionHighlightColor(value) {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.put_SelectionHighlightColor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreventKeyboardDisplayOnProgrammaticFocus() {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.get_PreventKeyboardDisplayOnProgrammaticFocus()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PreventKeyboardDisplayOnProgrammaticFocus(value) {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.put_PreventKeyboardDisplayOnProgrammaticFocus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorFontEnabled() {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.get_IsColorFontEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorFontEnabled(value) {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.put_IsColorFontEnabled(value)
    }

    /**
     * 
     * @param {TextControlPasteEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Paste(handler) {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.add_Paste(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Paste(token) {
        if (!this.HasProp("__IRichEditBox2")) {
            if ((queryResult := this.QueryInterface(IRichEditBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox2 := IRichEditBox2(outPtr)
        }

        return this.__IRichEditBox2.remove_Paste(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, TextCompositionStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextCompositionStarted(handler) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.add_TextCompositionStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextCompositionStarted(token) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.remove_TextCompositionStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, TextCompositionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextCompositionChanged(handler) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.add_TextCompositionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextCompositionChanged(token) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.remove_TextCompositionChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, TextCompositionEndedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextCompositionEnded(handler) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.add_TextCompositionEnded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextCompositionEnded(token) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.remove_TextCompositionEnded(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextReadingOrder() {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.get_TextReadingOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextReadingOrder(value) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.put_TextReadingOrder(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredCandidateWindowAlignment() {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.get_DesiredCandidateWindowAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredCandidateWindowAlignment(value) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.put_DesiredCandidateWindowAlignment(value)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, CandidateWindowBoundsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CandidateWindowBoundsChanged(handler) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.add_CandidateWindowBoundsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CandidateWindowBoundsChanged(token) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.remove_CandidateWindowBoundsChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, RichEditBoxTextChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextChanging(handler) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.add_TextChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextChanging(token) {
        if (!this.HasProp("__IRichEditBox3")) {
            if ((queryResult := this.QueryInterface(IRichEditBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox3 := IRichEditBox3(outPtr)
        }

        return this.__IRichEditBox3.remove_TextChanging(token)
    }

    /**
     * Asynchronously gets a list of candidate words based on the provided phonetic characters in an Input Method Editor (IME).
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditbox.getlinguisticalternativesasync
     */
    GetLinguisticAlternativesAsync() {
        if (!this.HasProp("__IRichEditBox4")) {
            if ((queryResult := this.QueryInterface(IRichEditBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox4 := IRichEditBox4(outPtr)
        }

        return this.__IRichEditBox4.GetLinguisticAlternativesAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClipboardCopyFormat() {
        if (!this.HasProp("__IRichEditBox4")) {
            if ((queryResult := this.QueryInterface(IRichEditBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox4 := IRichEditBox4(outPtr)
        }

        return this.__IRichEditBox4.get_ClipboardCopyFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ClipboardCopyFormat(value) {
        if (!this.HasProp("__IRichEditBox4")) {
            if ((queryResult := this.QueryInterface(IRichEditBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox4 := IRichEditBox4(outPtr)
        }

        return this.__IRichEditBox4.put_ClipboardCopyFormat(value)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_SelectionHighlightColorWhenNotFocused() {
        if (!this.HasProp("__IRichEditBox5")) {
            if ((queryResult := this.QueryInterface(IRichEditBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox5 := IRichEditBox5(outPtr)
        }

        return this.__IRichEditBox5.get_SelectionHighlightColorWhenNotFocused()
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_SelectionHighlightColorWhenNotFocused(value) {
        if (!this.HasProp("__IRichEditBox5")) {
            if ((queryResult := this.QueryInterface(IRichEditBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox5 := IRichEditBox5(outPtr)
        }

        return this.__IRichEditBox5.put_SelectionHighlightColorWhenNotFocused(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLength() {
        if (!this.HasProp("__IRichEditBox5")) {
            if ((queryResult := this.QueryInterface(IRichEditBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox5 := IRichEditBox5(outPtr)
        }

        return this.__IRichEditBox5.get_MaxLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxLength(value) {
        if (!this.HasProp("__IRichEditBox5")) {
            if ((queryResult := this.QueryInterface(IRichEditBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox5 := IRichEditBox5(outPtr)
        }

        return this.__IRichEditBox5.put_MaxLength(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalTextAlignment() {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.get_HorizontalTextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalTextAlignment(value) {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.put_HorizontalTextAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterCasing() {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.get_CharacterCasing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterCasing(value) {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.put_CharacterCasing(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisabledFormattingAccelerators() {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.get_DisabledFormattingAccelerators()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DisabledFormattingAccelerators(value) {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.put_DisabledFormattingAccelerators(value)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, TextControlCopyingToClipboardEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CopyingToClipboard(handler) {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.add_CopyingToClipboard(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CopyingToClipboard(token) {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.remove_CopyingToClipboard(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, TextControlCuttingToClipboardEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CuttingToClipboard(handler) {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.add_CuttingToClipboard(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CuttingToClipboard(token) {
        if (!this.HasProp("__IRichEditBox6")) {
            if ((queryResult := this.QueryInterface(IRichEditBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox6 := IRichEditBox6(outPtr)
        }

        return this.__IRichEditBox6.remove_CuttingToClipboard(token)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_ContentLinkForegroundColor() {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.get_ContentLinkForegroundColor()
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_ContentLinkForegroundColor(value) {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.put_ContentLinkForegroundColor(value)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_ContentLinkBackgroundColor() {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.get_ContentLinkBackgroundColor()
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_ContentLinkBackgroundColor(value) {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.put_ContentLinkBackgroundColor(value)
    }

    /**
     * 
     * @returns {ContentLinkProviderCollection} 
     */
    get_ContentLinkProviders() {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.get_ContentLinkProviders()
    }

    /**
     * 
     * @param {ContentLinkProviderCollection} value 
     * @returns {HRESULT} 
     */
    put_ContentLinkProviders(value) {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.put_ContentLinkProviders(value)
    }

    /**
     * 
     * @returns {HandwritingView} 
     */
    get_HandwritingView() {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.get_HandwritingView()
    }

    /**
     * 
     * @param {HandwritingView} value 
     * @returns {HRESULT} 
     */
    put_HandwritingView(value) {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.put_HandwritingView(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHandwritingViewEnabled() {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.get_IsHandwritingViewEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHandwritingViewEnabled(value) {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.put_IsHandwritingViewEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, ContentLinkChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentLinkChanged(handler) {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.add_ContentLinkChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContentLinkChanged(token) {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.remove_ContentLinkChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, ContentLinkInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentLinkInvoked(handler) {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.add_ContentLinkInvoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContentLinkInvoked(token) {
        if (!this.HasProp("__IRichEditBox7")) {
            if ((queryResult := this.QueryInterface(IRichEditBox7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox7 := IRichEditBox7(outPtr)
        }

        return this.__IRichEditBox7.remove_ContentLinkInvoked(token)
    }

    /**
     * 
     * @returns {RichEditTextDocument} 
     */
    get_TextDocument() {
        if (!this.HasProp("__IRichEditBox8")) {
            if ((queryResult := this.QueryInterface(IRichEditBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox8 := IRichEditBox8(outPtr)
        }

        return this.__IRichEditBox8.get_TextDocument()
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_SelectionFlyout() {
        if (!this.HasProp("__IRichEditBox8")) {
            if ((queryResult := this.QueryInterface(IRichEditBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox8 := IRichEditBox8(outPtr)
        }

        return this.__IRichEditBox8.get_SelectionFlyout()
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_SelectionFlyout(value) {
        if (!this.HasProp("__IRichEditBox8")) {
            if ((queryResult := this.QueryInterface(IRichEditBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox8 := IRichEditBox8(outPtr)
        }

        return this.__IRichEditBox8.put_SelectionFlyout(value)
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_ProofingMenuFlyout() {
        if (!this.HasProp("__IRichEditBox8")) {
            if ((queryResult := this.QueryInterface(IRichEditBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox8 := IRichEditBox8(outPtr)
        }

        return this.__IRichEditBox8.get_ProofingMenuFlyout()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Description() {
        if (!this.HasProp("__IRichEditBox8")) {
            if ((queryResult := this.QueryInterface(IRichEditBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox8 := IRichEditBox8(outPtr)
        }

        return this.__IRichEditBox8.get_Description()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IRichEditBox8")) {
            if ((queryResult := this.QueryInterface(IRichEditBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox8 := IRichEditBox8(outPtr)
        }

        return this.__IRichEditBox8.put_Description(value)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, RichEditBoxSelectionChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanging(handler) {
        if (!this.HasProp("__IRichEditBox8")) {
            if ((queryResult := this.QueryInterface(IRichEditBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox8 := IRichEditBox8(outPtr)
        }

        return this.__IRichEditBox8.add_SelectionChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanging(token) {
        if (!this.HasProp("__IRichEditBox8")) {
            if ((queryResult := this.QueryInterface(IRichEditBox8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBox8 := IRichEditBox8(outPtr)
        }

        return this.__IRichEditBox8.remove_SelectionChanging(token)
    }

;@endregion Instance Methods
}
