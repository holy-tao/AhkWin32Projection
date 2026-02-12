#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IRichTextBlock.ahk
#Include .\IRichTextBlock2.ahk
#Include .\IRichTextBlock3.ahk
#Include .\IRichTextBlock4.ahk
#Include .\IRichTextBlock5.ahk
#Include .\IRichTextBlock6.ahk
#Include .\IRichTextBlockStatics4.ahk
#Include .\IRichTextBlockStatics3.ahk
#Include .\IRichTextBlockStatics2.ahk
#Include .\IRichTextBlockStatics.ahk
#Include .\IRichTextBlockStatics5.ahk
#Include .\IRichTextBlockStatics6.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ContextMenuOpeningEventHandler.ahk
#Include .\ContextMenuEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\RichTextBlock.ahk
#Include .\IsTextTrimmedChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a rich text display container that supports formatted text, hyperlinks, inline images, and other rich content. RichTextBlock supports a built-in overflow model.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Rich text block](/windows/uwp/design/controls-and-patterns/rich-text-block).
 * 
 * The RichTextBlock control displays read-only text, and provides several features for advanced text layout. Use a RichTextBlock when you need support for paragraphs, inline UI elements, or overflow text.
 * 
 * [TextBlock](textblock.md) provides a simpler content model, so it’s typically easier to use, and it can provide better text rendering performance than RichTextBlock. It also provides many of the same formatting options for customizing how your text is rendered. However, RichTextBlock provides several unique features that [TextBlock](textblock.md) doesn’t provide.
 * 
 * For more info and examples, see the [RichTextBlock control guide](/windows/uwp/controls-and-patterns/rich-text-block).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RichTextBlock extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRichTextBlock

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRichTextBlock.IID

    /**
     * Identifies the **TextDecorations** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textdecorationsproperty
     * @type {DependencyProperty} 
     */
    static TextDecorationsProperty {
        get => RichTextBlock.get_TextDecorationsProperty()
    }

    /**
     * Identifies the [IsTextScaleFactorEnabled](richtextblock_istextscalefactorenabled.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.istextscalefactorenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextScaleFactorEnabledProperty {
        get => RichTextBlock.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * Identifies the [MaxLines](richtextblock_maxlines.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.maxlinesproperty
     * @type {DependencyProperty} 
     */
    static MaxLinesProperty {
        get => RichTextBlock.get_MaxLinesProperty()
    }

    /**
     * Identifies the [TextLineBounds](richtextblock_textlinebounds.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textlineboundsproperty
     * @type {DependencyProperty} 
     */
    static TextLineBoundsProperty {
        get => RichTextBlock.get_TextLineBoundsProperty()
    }

    /**
     * Identifies the [SelectionHighlightColor](richtextblock_selectionhighlightcolor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.selectionhighlightcolorproperty
     * @type {DependencyProperty} 
     */
    static SelectionHighlightColorProperty {
        get => RichTextBlock.get_SelectionHighlightColorProperty()
    }

    /**
     * Identifies the [OpticalMarginAlignment](richtextblock_opticalmarginalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.opticalmarginalignmentproperty
     * @type {DependencyProperty} 
     */
    static OpticalMarginAlignmentProperty {
        get => RichTextBlock.get_OpticalMarginAlignmentProperty()
    }

    /**
     * Identifies the [IsColorFontEnabled](richtextblock_iscolorfontenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.iscolorfontenabledproperty
     * @type {DependencyProperty} 
     */
    static IsColorFontEnabledProperty {
        get => RichTextBlock.get_IsColorFontEnabledProperty()
    }

    /**
     * Identifies the [TextReadingOrder](richtextblock_textreadingorder.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textreadingorderproperty
     * @type {DependencyProperty} 
     */
    static TextReadingOrderProperty {
        get => RichTextBlock.get_TextReadingOrderProperty()
    }

    /**
     * Identifies the [FontSize](richtextblock_fontsize.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontsizeproperty
     * @type {DependencyProperty} 
     */
    static FontSizeProperty {
        get => RichTextBlock.get_FontSizeProperty()
    }

    /**
     * Identifies the [FontFamily](richtextblock_fontfamily.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontfamilyproperty
     * @type {DependencyProperty} 
     */
    static FontFamilyProperty {
        get => RichTextBlock.get_FontFamilyProperty()
    }

    /**
     * Identifies the [FontWeight](richtextblock_fontweight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontweightproperty
     * @type {DependencyProperty} 
     */
    static FontWeightProperty {
        get => RichTextBlock.get_FontWeightProperty()
    }

    /**
     * Identifies the [FontStyle](richtextblock_fontstyle.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontstyleproperty
     * @type {DependencyProperty} 
     */
    static FontStyleProperty {
        get => RichTextBlock.get_FontStyleProperty()
    }

    /**
     * Identifies the [FontStretch](richtextblock_fontstretch.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontstretchproperty
     * @type {DependencyProperty} 
     */
    static FontStretchProperty {
        get => RichTextBlock.get_FontStretchProperty()
    }

    /**
     * Identifies the [Foreground](richtextblock_foreground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.foregroundproperty
     * @type {DependencyProperty} 
     */
    static ForegroundProperty {
        get => RichTextBlock.get_ForegroundProperty()
    }

    /**
     * Identifies the [TextWrapping](richtextblock_textwrapping.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textwrappingproperty
     * @type {DependencyProperty} 
     */
    static TextWrappingProperty {
        get => RichTextBlock.get_TextWrappingProperty()
    }

    /**
     * Identifies the [TextTrimming](richtextblock_texttrimming.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.texttrimmingproperty
     * @type {DependencyProperty} 
     */
    static TextTrimmingProperty {
        get => RichTextBlock.get_TextTrimmingProperty()
    }

    /**
     * Identifies the [TextAlignment](richtextblock_textalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textalignmentproperty
     * @type {DependencyProperty} 
     */
    static TextAlignmentProperty {
        get => RichTextBlock.get_TextAlignmentProperty()
    }

    /**
     * Identifies the [Padding](richtextblock_padding.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => RichTextBlock.get_PaddingProperty()
    }

    /**
     * Identifies the [LineHeight](richtextblock_lineheight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.lineheightproperty
     * @type {DependencyProperty} 
     */
    static LineHeightProperty {
        get => RichTextBlock.get_LineHeightProperty()
    }

    /**
     * Identifies the [LineStackingStrategy](richtextblock_linestackingstrategy.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.linestackingstrategyproperty
     * @type {DependencyProperty} 
     */
    static LineStackingStrategyProperty {
        get => RichTextBlock.get_LineStackingStrategyProperty()
    }

    /**
     * Identifies the [CharacterSpacing](richtextblock_characterspacing.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.characterspacingproperty
     * @type {DependencyProperty} 
     */
    static CharacterSpacingProperty {
        get => RichTextBlock.get_CharacterSpacingProperty()
    }

    /**
     * Identifies the [OverflowContentTarget](richtextblock_overflowcontenttarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.overflowcontenttargetproperty
     * @type {DependencyProperty} 
     */
    static OverflowContentTargetProperty {
        get => RichTextBlock.get_OverflowContentTargetProperty()
    }

    /**
     * Identifies the [IsTextSelectionEnabled](richtextblock_istextselectionenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.istextselectionenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextSelectionEnabledProperty {
        get => RichTextBlock.get_IsTextSelectionEnabledProperty()
    }

    /**
     * Identifies the [HasOverflowContent](richtextblock_hasoverflowcontent.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.hasoverflowcontentproperty
     * @type {DependencyProperty} 
     */
    static HasOverflowContentProperty {
        get => RichTextBlock.get_HasOverflowContentProperty()
    }

    /**
     * Identifies the [SelectedText](richtextblock_selectedtext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.selectedtextproperty
     * @type {DependencyProperty} 
     */
    static SelectedTextProperty {
        get => RichTextBlock.get_SelectedTextProperty()
    }

    /**
     * Identifies the [TextIndent](richtextblock_textindent.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textindentproperty
     * @type {DependencyProperty} 
     */
    static TextIndentProperty {
        get => RichTextBlock.get_TextIndentProperty()
    }

    /**
     * Identifies the IsTextTrimmed dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.istexttrimmedproperty
     * @type {DependencyProperty} 
     */
    static IsTextTrimmedProperty {
        get => RichTextBlock.get_IsTextTrimmedProperty()
    }

    /**
     * Identifies the HorizontalTextAlignment dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.horizontaltextalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalTextAlignmentProperty {
        get => RichTextBlock.get_HorizontalTextAlignmentProperty()
    }

    /**
     * Identifies the SelectionFlyout dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.selectionflyoutproperty
     * @type {DependencyProperty} 
     */
    static SelectionFlyoutProperty {
        get => RichTextBlock.get_SelectionFlyoutProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextDecorationsProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics4.IID)
            RichTextBlock.__IRichTextBlockStatics4 := IRichTextBlockStatics4(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics4.get_TextDecorationsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextScaleFactorEnabledProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics3.IID)
            RichTextBlock.__IRichTextBlockStatics3 := IRichTextBlockStatics3(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics3.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxLinesProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics2.IID)
            RichTextBlock.__IRichTextBlockStatics2 := IRichTextBlockStatics2(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics2.get_MaxLinesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextLineBoundsProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics2.IID)
            RichTextBlock.__IRichTextBlockStatics2 := IRichTextBlockStatics2(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics2.get_TextLineBoundsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionHighlightColorProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics2.IID)
            RichTextBlock.__IRichTextBlockStatics2 := IRichTextBlockStatics2(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics2.get_SelectionHighlightColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpticalMarginAlignmentProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics2.IID)
            RichTextBlock.__IRichTextBlockStatics2 := IRichTextBlockStatics2(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics2.get_OpticalMarginAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsColorFontEnabledProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics2.IID)
            RichTextBlock.__IRichTextBlockStatics2 := IRichTextBlockStatics2(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics2.get_IsColorFontEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextReadingOrderProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics2.IID)
            RichTextBlock.__IRichTextBlockStatics2 := IRichTextBlockStatics2(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics2.get_TextReadingOrderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontSizeProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_FontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontFamilyProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_FontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontWeightProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_FontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStyleProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_FontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStretchProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_FontStretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForegroundProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_ForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextWrappingProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_TextWrappingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextTrimmingProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_TextTrimmingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextAlignmentProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_TextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_PaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LineHeightProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_LineHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LineStackingStrategyProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_LineStackingStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CharacterSpacingProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_CharacterSpacingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OverflowContentTargetProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_OverflowContentTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextSelectionEnabledProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_IsTextSelectionEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HasOverflowContentProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_HasOverflowContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedTextProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_SelectedTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextIndentProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics.IID)
            RichTextBlock.__IRichTextBlockStatics := IRichTextBlockStatics(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics.get_TextIndentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextTrimmedProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics5.IID)
            RichTextBlock.__IRichTextBlockStatics5 := IRichTextBlockStatics5(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics5.get_IsTextTrimmedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalTextAlignmentProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics5.IID)
            RichTextBlock.__IRichTextBlockStatics5 := IRichTextBlockStatics5(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics5.get_HorizontalTextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionFlyoutProperty() {
        if (!RichTextBlock.HasProp("__IRichTextBlockStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockStatics6.IID)
            RichTextBlock.__IRichTextBlockStatics6 := IRichTextBlockStatics6(factoryPtr)
        }

        return RichTextBlock.__IRichTextBlockStatics6.get_SelectionFlyoutProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the font size for the text content in this element.
     * @remarks
     * Set the FontSize property to specify the default font size to use for all text in the [RichTextBlock](richtextblock.md). You can override this value for specific text elements in the [RichTextBlock](richtextblock.md) by setting the [TextElement.FontSize](../windows.ui.xaml.documents/textelement_fontsize.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontsize
     * @type {Float} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * Gets or sets the preferred top-level font family for the text content in this element.
     * @remarks
     * Set the FontFamily property to specify the default font family to use for all text in the [RichTextBlock](richtextblock.md). You can override this value for specific text elements in the [RichTextBlock](richtextblock.md) by setting the [TextElement.FontFamily](../windows.ui.xaml.documents/textelement_fontfamily.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontfamily
     * @type {FontFamily} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * Gets or sets the top-level font weight for the [RichTextBlock](richtextblock.md).
     * @remarks
     * Set the FontWeight property to specify the default font stretch to use for all text in the [RichTextBlock](richtextblock.md). You can override this value for specific text elements in the [RichTextBlock](richtextblock.md) by setting the [TextElement.FontWeight](../windows.ui.xaml.documents/textelement_fontweight.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontweight
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * Gets or sets the font style for the content in this element.
     * @remarks
     * Set the FontStyle property to specify the default font stretch to use for all text in the [RichTextBlock](richtextblock.md). You can override this value for specific text elements in the [RichTextBlock](richtextblock.md) by setting the [TextElement.FontStyle](../windows.ui.xaml.documents/textelement_fontstyle.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * Gets or sets the font stretch for the text content in this element.
     * @remarks
     * Set the FontStretch property to specify the default font stretch to use for all text in the [RichTextBlock](richtextblock.md). You can override this value for specific text elements in the [RichTextBlock](richtextblock.md) by setting the [TextElement.FontStretch](../windows.ui.xaml.documents/textelement_fontstretch.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.fontstretch
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
        set => this.put_FontStretch(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) to apply to the text contents of the [RichTextBlock](richtextblock.md).
     * @remarks
     * Set the Foreground property to specify the default brush to use for all text in the [RichTextBlock](richtextblock.md). You can override this value for specific text elements (such as a [Run](../windows.ui.xaml.documents/run.md)) in the [RichTextBlock](richtextblock.md) by setting the [TextElement.Foreground](../windows.ui.xaml.documents/textelement_foreground.md) property.
     * 
     * The default appearance of text and text styles depends heavily on the active theme and other settings. The theme and various styles and behaviors that are using default system settings or user preferences are the source of the effective runtime appearance of [RichTextBlock](richtextblock.md) foreground color of text as well as other text characteristics. You can change these defaults by changing the property values, or by applying a different style to specific [RichTextBlock](richtextblock.md) instances. You can change the foreground value for all default text by overriding the resource named **DefaultTextForegroundThemeBrush** in App.xaml.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.foreground
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * Gets or sets a value that indicates whether text wrapping occurs if a line of text extends beyond the available width of the [RichTextBlock](richtextblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textwrapping
     * @type {Integer} 
     */
    TextWrapping {
        get => this.get_TextWrapping()
        set => this.put_TextWrapping(value)
    }

    /**
     * Gets or sets a value that indicates how text is trimmed when it overflows the content area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.texttrimming
     * @type {Integer} 
     */
    TextTrimming {
        get => this.get_TextTrimming()
        set => this.put_TextTrimming(value)
    }

    /**
     * Gets or sets a value that indicates how the text is aligned in the [RichTextBlock](richtextblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textalignment
     * @type {Integer} 
     */
    TextAlignment {
        get => this.get_TextAlignment()
        set => this.put_TextAlignment(value)
    }

    /**
     * Gets the contents of the [RichTextBlock](richtextblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.blocks
     * @type {BlockCollection} 
     */
    Blocks {
        get => this.get_Blocks()
    }

    /**
     * Gets or sets a value that indicates the thickness of padding space between the boundaries of the content area and the content displayed by a [RichTextBlock](richtextblock.md).
     * @remarks
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets the height of each line of content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.lineheight
     * @type {Float} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets a value that indicates how a line box is determined for each line of text in the [RichTextBlock](richtextblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.linestackingstrategy
     * @type {Integer} 
     */
    LineStackingStrategy {
        get => this.get_LineStackingStrategy()
        set => this.put_LineStackingStrategy(value)
    }

    /**
     * Gets or sets the uniform spacing between characters, in units of 1/1000 of an em.
     * @remarks
     * *Tracking* is the typographic term for an amount of space added or removed between all pairs of characters in a portion of text. This feature can be accessed through the CharacterSpacing property on [TextBlock](textblock.md) and [RichTextBlock](richtextblock.md). CharacterSpacing is measured in 1/1000 of an "em". One "em" is equivalent to the current font size of the control. For example, an additional 14 pixels will be inserted between each character in a text control with `FontSize="14"` and `CharacterSpacing="1000"`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.characterspacing
     * @type {Integer} 
     */
    CharacterSpacing {
        get => this.get_CharacterSpacing()
        set => this.put_CharacterSpacing(value)
    }

    /**
     * Gets or sets a reference to a [RichTextBlockOverflow](richtextblockoverflow.md) that is the linked target for any text overflow from this [RichTextBlock](richtextblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.overflowcontenttarget
     * @type {RichTextBlockOverflow} 
     */
    OverflowContentTarget {
        get => this.get_OverflowContentTarget()
        set => this.put_OverflowContentTarget(value)
    }

    /**
     * Gets or sets a value that determines whether text content of the [RichTextBlock](richtextblock.md) can be selected for clipboard or drag purposes, or for UI styling changes that indicate selected text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.istextselectionenabled
     * @type {Boolean} 
     */
    IsTextSelectionEnabled {
        get => this.get_IsTextSelectionEnabled()
        set => this.put_IsTextSelectionEnabled(value)
    }

    /**
     * Gets a value that indicates whether the [RichTextBlock](richtextblock.md) has content that extends beyond its bounds, that can provide content to an [OverflowContentTarget](richtextblock_overflowcontenttarget.md) element.
     * @remarks
     * If HasOverflowContent is **true** and the [OverflowContentTarget](richtextblock_overflowcontenttarget.md) property is set, the extra content flows into the [OverflowContentTarget](richtextblock_overflowcontenttarget.md) element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.hasoverflowcontent
     * @type {Boolean} 
     */
    HasOverflowContent {
        get => this.get_HasOverflowContent()
    }

    /**
     * Gets a text range of selected text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.selectedtext
     * @type {HSTRING} 
     */
    SelectedText {
        get => this.get_SelectedText()
    }

    /**
     * Gets a [TextPointer](../windows.ui.xaml.documents/textpointer.md) that indicates the start of content in the [RichTextBlock](richtextblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.contentstart
     * @type {TextPointer} 
     */
    ContentStart {
        get => this.get_ContentStart()
    }

    /**
     * Gets a [TextPointer](../windows.ui.xaml.documents/textpointer.md) that indicates the end of content in the [RichTextBlock](richtextblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.contentend
     * @type {TextPointer} 
     */
    ContentEnd {
        get => this.get_ContentEnd()
    }

    /**
     * Gets the starting position of the text selected in the [RichTextBlock](richtextblock.md).
     * @remarks
     * Use [Select](richtextblock_select_694729799.md) to set the selection start and end.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.selectionstart
     * @type {TextPointer} 
     */
    SelectionStart {
        get => this.get_SelectionStart()
    }

    /**
     * Gets the end position of the text selected in the [RichTextBlock](richtextblock.md).
     * @remarks
     * Use [Select](richtextblock_select_694729799.md) to set the selection start and end.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.selectionend
     * @type {TextPointer} 
     */
    SelectionEnd {
        get => this.get_SelectionEnd()
    }

    /**
     * Gets a value that represents the offset in pixels from the top of the content to the baseline of the first paragraph. The baseline of the paragraph is the baseline of the first line in it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.baselineoffset
     * @type {Float} 
     */
    BaselineOffset {
        get => this.get_BaselineOffset()
    }

    /**
     * Gets or sets the indentation of the first line of text in each paragraph in the [RichTextBlock](richtextblock.md).
     * @remarks
     * You can override this setting for specific paragraphs in a [RichTextBlock](richtextblock.md) by setting the [Paragraph.TextIndent](../windows.ui.xaml.documents/paragraph_textindent.md) property to a different value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textindent
     * @type {Float} 
     */
    TextIndent {
        get => this.get_TextIndent()
        set => this.put_TextIndent(value)
    }

    /**
     * Gets or sets the maximum lines of text shown in the [RichTextBlock](richtextblock.md).
     * @remarks
     * Use the **MaxLines** property to specify the maximum lines of text shown in a text block. The text control will adjust it’s height to show no more than the specified number of lines, regardless of the font size, font style, or text length.
     * 
     * Negative integer values are invalid, and will cause a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.maxlines
     * @type {Integer} 
     */
    MaxLines {
        get => this.get_MaxLines()
        set => this.put_MaxLines(value)
    }

    /**
     * Gets or sets a value that indicates how the line box height is determined for each line of text in the [RichTextBlock](richtextblock.md).
     * @remarks
     * For illustrations of how the different values for [TextLineBounds](../windows.ui.xaml/textlinebounds.md) affect adjacent lines of text, see [TextLineBounds](../windows.ui.xaml/textlinebounds.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textlinebounds
     * @type {Integer} 
     */
    TextLineBounds {
        get => this.get_TextLineBounds()
        set => this.put_TextLineBounds(value)
    }

    /**
     * Gets or sets the brush used to highlight the selected text.
     * @remarks
     * A default text style sets the default selection highlight color to the system resource **TextSelectionHighlightColorThemeBrush**. To change the selection highlight color for all editable text controls in your app, you can override the **TextSelectionHighlightColorThemeBrush** system resource in App.xaml. This will affect [PasswordBox](passwordbox.md), [TextBox](textbox.md), and [RichEditBox](richeditbox.md) controls as well as [RichTextBlock](richtextblock.md) content. For more info, see [XAML theme resources](/windows/apps/design/style/xaml-theme-resources).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.selectionhighlightcolor
     * @type {SolidColorBrush} 
     */
    SelectionHighlightColor {
        get => this.get_SelectionHighlightColor()
        set => this.put_SelectionHighlightColor(value)
    }

    /**
     * Get or sets a value that indicates how the font is modified to align with fonts of different sizes.
     * @remarks
     * When OpticalMarginAlignment is set to [TrimSideBearings](../windows.ui.xaml/opticalmarginalignment.md), the text is trimmed to the leftmost stroke of the first character and the rightmost stroke of the last character on a line. For example, an "L" has a small amount of space to the left of the vertical stroke, which scales with font size. When [TrimSideBearings](../windows.ui.xaml/opticalmarginalignment.md) is set, the left of the vertical stroke is directly aligned without the spacing. This enables easier alignment to the Windows grid system as explained in [Laying out an app page](/previous-versions/windows/apps/hh872191(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.opticalmarginalignment
     * @type {Integer} 
     */
    OpticalMarginAlignment {
        get => this.get_OpticalMarginAlignment()
        set => this.put_OpticalMarginAlignment(value)
    }

    /**
     * Gets or sets a value that determines whether font glyphs that contain color layers, such as Segoe UI Emoji, are rendered in color.
     * @remarks
     * Windows 8.1 introduces the ability for fonts to include multiple colored layers for each glyph. For example, the Segoe UI Emoji font defines color versions of the Emoticon and other Emoji characters. By default, the IsColorFontEnabled property is **true** and fonts with these additional layers are rendered in color.
     * 
     * 
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See Windows Blue bug 452226.-->
     * In Windows 8, Extensible Application Markup Language (XAML) text controls don't render multi-color fonts in color. When an app that was compiled for Windows 8 is recompiled for Windows 8.1, color rendering of multi-color fonts is enabled by default. Some glyphs in multi-color fonts have different layout metrics when rendered in color. This could cause different layout in apps when they are recompiled for Windows 8.1. To retain the Windows 8 behavior when your app is recompiled for Windows 8.1, set IsColorFontEnabled to **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.iscolorfontenabled
     * @type {Boolean} 
     */
    IsColorFontEnabled {
        get => this.get_IsColorFontEnabled()
        set => this.put_IsColorFontEnabled(value)
    }

    /**
     * Gets or sets a value that indicates how the reading order is determined for the [RichTextBlock](richtextblock.md).
     * @remarks
     * This property can be useful when the base direction of the text is unknown, and may not match the user's language or direction. For more info, see the Remarks section of the [TextReadingOrder](../windows.ui.xaml/textreadingorder.md) enumeration or [How to support bidirectional UI](/previous-versions/windows/apps/jj712703(v=win.10)).
     * 
     * > [!NOTE]
     * > In Windows 8.1, the default value is **0**, **Default**. Starting with Windows 10, the enumeration value **0** has the constant name **UseFlowDirection**, and is not the default value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textreadingorder
     * @type {Integer} 
     */
    TextReadingOrder {
        get => this.get_TextReadingOrder()
        set => this.put_TextReadingOrder(value)
    }

    /**
     * Gets or sets whether automatic text enlargement, to reflect the system text size setting, is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.istextscalefactorenabled
     * @type {Boolean} 
     */
    IsTextScaleFactorEnabled {
        get => this.get_IsTextScaleFactorEnabled()
        set => this.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * Gets or sets a value that indicates what decorations are applied to the text.
     * @remarks
     * Starting with the Windows 10 Creators Update (SDK version 15063), this property is the preferred way to strikethrough or underline text.
     * 
     * For earlier versions of Windows, you can underline text with the [Underline](../windows.ui.xaml.documents/underline.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.textdecorations
     * @type {Integer} 
     */
    TextDecorations {
        get => this.get_TextDecorations()
        set => this.put_TextDecorations(value)
    }

    /**
     * Gets a value that indicates whether the control has trimmed text that overflows the content area.
     * @remarks
     * See the TextTrimming property and [TextTrimming](../windows.ui.xaml/texttrimming.md) enumeration for more info about how text is trimmed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.istexttrimmed
     * @type {Boolean} 
     */
    IsTextTrimmed {
        get => this.get_IsTextTrimmed()
    }

    /**
     * Gets or sets a value that indicates how text is aligned in the RichTextBlock.
     * @remarks
     * This property provides the same functionality as the **TextAlignment** property. If both properties are set to conflicting values, the last one set is used.
     * 
     * Apps that target the Fall Creators Update (SDK 16299) or later should use this property instead of **TextAlignment**. If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.horizontaltextalignment
     * @type {Integer} 
     */
    HorizontalTextAlignment {
        get => this.get_HorizontalTextAlignment()
        set => this.put_HorizontalTextAlignment(value)
    }

    /**
     * Gets the collection of text highlights.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.texthighlighters
     * @type {IVector<TextHighlighter>} 
     */
    TextHighlighters {
        get => this.get_TextHighlighters()
    }

    /**
     * Gets or sets the flyout that is shown when text is selected using touch or pen, or **null** if no flyout is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.selectionflyout
     * @type {FlyoutBase} 
     */
    SelectionFlyout {
        get => this.get_SelectionFlyout()
        set => this.put_SelectionFlyout(value)
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
     * Occurs when the [IsTextTrimmed](richtextblock_istexttrimmed.md) property value has changed.
     * @remarks
     * If the [TextTrimming](richtextblock_texttrimming.md) property is set to None (default), no trim indicator is drawn and the [IsTextTrimmedChanged](richtextblock_istexttrimmedchanged.md) event does not fire.
     * @type {TypedEventHandler<RichTextBlock, IsTextTrimmedChangedEventArgs>}
    */
    OnIsTextTrimmedChanged {
        get {
            if(!this.HasProp("__OnIsTextTrimmedChanged")){
                this.__OnIsTextTrimmedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1e9d65a8-7312-5d13-a3b9-27a91b906324}"),
                    RichTextBlock,
                    IsTextTrimmedChangedEventArgs
                )
                this.__OnIsTextTrimmedChangedToken := this.add_IsTextTrimmedChanged(this.__OnIsTextTrimmedChanged.iface)
            }
            return this.__OnIsTextTrimmedChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [RichTextBlock](richtextblock.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlock")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSelectionChangedToken")) {
            this.remove_SelectionChanged(this.__OnSelectionChangedToken)
            this.__OnSelectionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnContextMenuOpeningToken")) {
            this.remove_ContextMenuOpening(this.__OnContextMenuOpeningToken)
            this.__OnContextMenuOpening.iface.Dispose()
        }

        if(this.HasProp("__OnIsTextTrimmedChangedToken")) {
            this.remove_IsTextTrimmedChanged(this.__OnIsTextTrimmedChangedToken)
            this.__OnIsTextTrimmedChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontSize() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_FontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontSize(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_FontSize(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FontFamily() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_FontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_FontFamily(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_FontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_FontWeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_FontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStyle(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_FontStyle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStretch() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_FontStretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStretch(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_FontStretch(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_Foreground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_Foreground(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextWrapping() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_TextWrapping()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextWrapping(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_TextWrapping(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextTrimming() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_TextTrimming()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextTrimming(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_TextTrimming(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextAlignment() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_TextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextAlignment(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_TextAlignment(value)
    }

    /**
     * 
     * @returns {BlockCollection} 
     */
    get_Blocks() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_Blocks()
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_Padding(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LineHeight() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_LineHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LineHeight(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_LineHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineStackingStrategy() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_LineStackingStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LineStackingStrategy(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_LineStackingStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSpacing() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_CharacterSpacing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSpacing(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_CharacterSpacing(value)
    }

    /**
     * 
     * @returns {RichTextBlockOverflow} 
     */
    get_OverflowContentTarget() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_OverflowContentTarget()
    }

    /**
     * 
     * @param {RichTextBlockOverflow} value 
     * @returns {HRESULT} 
     */
    put_OverflowContentTarget(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_OverflowContentTarget(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextSelectionEnabled() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_IsTextSelectionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextSelectionEnabled(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_IsTextSelectionEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasOverflowContent() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_HasOverflowContent()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SelectedText() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_SelectedText()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentStart() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_ContentStart()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentEnd() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_ContentEnd()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_SelectionStart() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_SelectionStart()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_SelectionEnd() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_SelectionEnd()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BaselineOffset() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_BaselineOffset()
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.add_SelectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.remove_SelectionChanged(token)
    }

    /**
     * 
     * @param {ContextMenuOpeningEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextMenuOpening(handler) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.add_ContextMenuOpening(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContextMenuOpening(token) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.remove_ContextMenuOpening(token)
    }

    /**
     * Selects the entire contents in the [RichTextBlock](richtextblock.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.selectall
     */
    SelectAll() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.SelectAll()
    }

    /**
     * Selects a range of text in the [RichTextBlock](richtextblock.md).
     * @remarks
     * In Windows Presentation Foundation (WPF) and Microsoft Silverlight the equivalent API uses integer for start and end positions. This implementation uses [TextPointer](../windows.ui.xaml.documents/textpointer.md) objects to specify the selection.
     * @param {TextPointer} start An object that represents the start of the range to select.
     * @param {TextPointer} end An object that represents the end of the range to select.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.select
     */
    Select(start, end) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.Select(start, end)
    }

    /**
     * Returns a [TextPointer](../windows.ui.xaml.documents/textpointer.md) text reference from a [RichTextBlock](richtextblock.md) by hit-testing a specific [Point](../windows.foundation/point.md) within the text display area.
     * @param {POINT} point_ The point to test.
     * @returns {TextPointer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.getpositionfrompoint
     */
    GetPositionFromPoint(point_) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.GetPositionFromPoint(point_)
    }

    /**
     * Focuses the [RichTextBlock](richtextblock.md), as if it were a conventionally focusable control.
     * @remarks
     * <!--Explain the scenario.-->
     * @param {Integer} value Specifies the desired target for focus state, as a value of the enumeration.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.focus
     */
    Focus(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.Focus(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TextIndent() {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.get_TextIndent()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TextIndent(value) {
        if (!this.HasProp("__IRichTextBlock")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock := IRichTextBlock(outPtr)
        }

        return this.__IRichTextBlock.put_TextIndent(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLines() {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.get_MaxLines()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxLines(value) {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.put_MaxLines(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextLineBounds() {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.get_TextLineBounds()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextLineBounds(value) {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.put_TextLineBounds(value)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_SelectionHighlightColor() {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.get_SelectionHighlightColor()
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_SelectionHighlightColor(value) {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.put_SelectionHighlightColor(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OpticalMarginAlignment() {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.get_OpticalMarginAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OpticalMarginAlignment(value) {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.put_OpticalMarginAlignment(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorFontEnabled() {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.get_IsColorFontEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorFontEnabled(value) {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.put_IsColorFontEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextReadingOrder() {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.get_TextReadingOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextReadingOrder(value) {
        if (!this.HasProp("__IRichTextBlock2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock2 := IRichTextBlock2(outPtr)
        }

        return this.__IRichTextBlock2.put_TextReadingOrder(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextScaleFactorEnabled() {
        if (!this.HasProp("__IRichTextBlock3")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock3 := IRichTextBlock3(outPtr)
        }

        return this.__IRichTextBlock3.get_IsTextScaleFactorEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextScaleFactorEnabled(value) {
        if (!this.HasProp("__IRichTextBlock3")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock3 := IRichTextBlock3(outPtr)
        }

        return this.__IRichTextBlock3.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextDecorations() {
        if (!this.HasProp("__IRichTextBlock4")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock4 := IRichTextBlock4(outPtr)
        }

        return this.__IRichTextBlock4.get_TextDecorations()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextDecorations(value) {
        if (!this.HasProp("__IRichTextBlock4")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock4 := IRichTextBlock4(outPtr)
        }

        return this.__IRichTextBlock4.put_TextDecorations(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextTrimmed() {
        if (!this.HasProp("__IRichTextBlock5")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock5 := IRichTextBlock5(outPtr)
        }

        return this.__IRichTextBlock5.get_IsTextTrimmed()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalTextAlignment() {
        if (!this.HasProp("__IRichTextBlock5")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock5 := IRichTextBlock5(outPtr)
        }

        return this.__IRichTextBlock5.get_HorizontalTextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalTextAlignment(value) {
        if (!this.HasProp("__IRichTextBlock5")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock5 := IRichTextBlock5(outPtr)
        }

        return this.__IRichTextBlock5.put_HorizontalTextAlignment(value)
    }

    /**
     * 
     * @returns {IVector<TextHighlighter>} 
     */
    get_TextHighlighters() {
        if (!this.HasProp("__IRichTextBlock5")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock5 := IRichTextBlock5(outPtr)
        }

        return this.__IRichTextBlock5.get_TextHighlighters()
    }

    /**
     * 
     * @param {TypedEventHandler<RichTextBlock, IsTextTrimmedChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsTextTrimmedChanged(handler) {
        if (!this.HasProp("__IRichTextBlock5")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock5 := IRichTextBlock5(outPtr)
        }

        return this.__IRichTextBlock5.add_IsTextTrimmedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsTextTrimmedChanged(token) {
        if (!this.HasProp("__IRichTextBlock5")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock5 := IRichTextBlock5(outPtr)
        }

        return this.__IRichTextBlock5.remove_IsTextTrimmedChanged(token)
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_SelectionFlyout() {
        if (!this.HasProp("__IRichTextBlock6")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock6 := IRichTextBlock6(outPtr)
        }

        return this.__IRichTextBlock6.get_SelectionFlyout()
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_SelectionFlyout(value) {
        if (!this.HasProp("__IRichTextBlock6")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock6 := IRichTextBlock6(outPtr)
        }

        return this.__IRichTextBlock6.put_SelectionFlyout(value)
    }

    /**
     * Copies the selected content to the Windows clipboard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblock.copyselectiontoclipboard
     */
    CopySelectionToClipboard() {
        if (!this.HasProp("__IRichTextBlock6")) {
            if ((queryResult := this.QueryInterface(IRichTextBlock6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlock6 := IRichTextBlock6(outPtr)
        }

        return this.__IRichTextBlock6.CopySelectionToClipboard()
    }

;@endregion Instance Methods
}
