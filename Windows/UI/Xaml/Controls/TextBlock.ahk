#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\ITextBlock.ahk
#Include .\ITextBlock2.ahk
#Include .\ITextBlock3.ahk
#Include .\ITextBlock4.ahk
#Include .\ITextBlock5.ahk
#Include .\ITextBlock6.ahk
#Include .\ITextBlock7.ahk
#Include .\ITextBlockStatics3.ahk
#Include .\ITextBlockStatics2.ahk
#Include .\ITextBlockStatics7.ahk
#Include .\ITextBlockStatics5.ahk
#Include .\ITextBlockStatics6.ahk
#Include .\ITextBlockStatics.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ContextMenuOpeningEventHandler.ahk
#Include .\ContextMenuEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\TextBlock.ahk
#Include .\IsTextTrimmedChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a lightweight control for displaying small amounts of text.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Text block](/windows/uwp/design/controls-and-patterns/text-block).
 * 
 * TextBlock is the primary control for displaying read-only text in apps. You can use it to display single-line or multi-line text, inline hyperlinks, and text with formatting like bold, italic, or underlined.
 * 
 * <img alt="Text block control" src="images/controls/TextBlock.png" />
 * 
 *  TextBlock is typically easier to use and provides better text rendering performance than [RichTextBlock](richtextblock.md), so it's preferred for most app UI text. It also provides many of the same formatting options for customizing how your text is rendered. Although you can put line breaks in the text, TextBlock is designed to display a single paragraph and doesn’t support text indentation. Consider a [RichTextBlock](richtextblock.md) if you need support for multiple paragraphs, multi-column text, or inline UI elements like images.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TextBlock extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextBlock

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextBlock.IID

    /**
     * Identifies the [IsTextScaleFactorEnabled](textblock_istextscalefactorenabled.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.istextscalefactorenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextScaleFactorEnabledProperty {
        get => TextBlock.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * Identifies the [SelectionHighlightColor](textblock_selectionhighlightcolor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.selectionhighlightcolorproperty
     * @type {DependencyProperty} 
     */
    static SelectionHighlightColorProperty {
        get => TextBlock.get_SelectionHighlightColorProperty()
    }

    /**
     * Identifies the [MaxLines](textblock_maxlines.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.maxlinesproperty
     * @type {DependencyProperty} 
     */
    static MaxLinesProperty {
        get => TextBlock.get_MaxLinesProperty()
    }

    /**
     * Identifies the [TextLineBounds](textblock_textlinebounds.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textlineboundsproperty
     * @type {DependencyProperty} 
     */
    static TextLineBoundsProperty {
        get => TextBlock.get_TextLineBoundsProperty()
    }

    /**
     * Identifies the [OpticalMarginAlignment](textblock_opticalmarginalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.opticalmarginalignmentproperty
     * @type {DependencyProperty} 
     */
    static OpticalMarginAlignmentProperty {
        get => TextBlock.get_OpticalMarginAlignmentProperty()
    }

    /**
     * Identifies the [IsColorFontEnabled](textblock_iscolorfontenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.iscolorfontenabledproperty
     * @type {DependencyProperty} 
     */
    static IsColorFontEnabledProperty {
        get => TextBlock.get_IsColorFontEnabledProperty()
    }

    /**
     * Identifies the [TextReadingOrder](textblock_textreadingorder.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textreadingorderproperty
     * @type {DependencyProperty} 
     */
    static TextReadingOrderProperty {
        get => TextBlock.get_TextReadingOrderProperty()
    }

    /**
     * Identifies the SelectionFlyout dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.selectionflyoutproperty
     * @type {DependencyProperty} 
     */
    static SelectionFlyoutProperty {
        get => TextBlock.get_SelectionFlyoutProperty()
    }

    /**
     * Identifies the **TextDecorations** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textdecorationsproperty
     * @type {DependencyProperty} 
     */
    static TextDecorationsProperty {
        get => TextBlock.get_TextDecorationsProperty()
    }

    /**
     * Identifies the IsTextTrimmed dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.istexttrimmedproperty
     * @type {DependencyProperty} 
     */
    static IsTextTrimmedProperty {
        get => TextBlock.get_IsTextTrimmedProperty()
    }

    /**
     * Identifies the HorizontalTextAlignment dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.horizontaltextalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalTextAlignmentProperty {
        get => TextBlock.get_HorizontalTextAlignmentProperty()
    }

    /**
     * Identifies the [FontSize](textblock_fontsize.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontsizeproperty
     * @type {DependencyProperty} 
     */
    static FontSizeProperty {
        get => TextBlock.get_FontSizeProperty()
    }

    /**
     * Identifies the [FontFamily](textblock_fontfamily.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontfamilyproperty
     * @type {DependencyProperty} 
     */
    static FontFamilyProperty {
        get => TextBlock.get_FontFamilyProperty()
    }

    /**
     * Identifies the [FontWeight](textblock_fontweight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontweightproperty
     * @type {DependencyProperty} 
     */
    static FontWeightProperty {
        get => TextBlock.get_FontWeightProperty()
    }

    /**
     * Identifies the [FontStyle](textblock_fontstyle.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontstyleproperty
     * @type {DependencyProperty} 
     */
    static FontStyleProperty {
        get => TextBlock.get_FontStyleProperty()
    }

    /**
     * Identifies the [FontStretch](textblock_fontstretch.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontstretchproperty
     * @type {DependencyProperty} 
     */
    static FontStretchProperty {
        get => TextBlock.get_FontStretchProperty()
    }

    /**
     * Identifies the [CharacterSpacing](textblock_characterspacing.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.characterspacingproperty
     * @type {DependencyProperty} 
     */
    static CharacterSpacingProperty {
        get => TextBlock.get_CharacterSpacingProperty()
    }

    /**
     * Identifies the [Foreground](textblock_foreground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.foregroundproperty
     * @type {DependencyProperty} 
     */
    static ForegroundProperty {
        get => TextBlock.get_ForegroundProperty()
    }

    /**
     * Identifies the [TextWrapping](textblock_textwrapping.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textwrappingproperty
     * @type {DependencyProperty} 
     */
    static TextWrappingProperty {
        get => TextBlock.get_TextWrappingProperty()
    }

    /**
     * Identifies the [TextTrimming](textblock_texttrimming.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.texttrimmingproperty
     * @type {DependencyProperty} 
     */
    static TextTrimmingProperty {
        get => TextBlock.get_TextTrimmingProperty()
    }

    /**
     * Identifies the [TextAlignment](textblock_textalignment.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textalignmentproperty
     * @type {DependencyProperty} 
     */
    static TextAlignmentProperty {
        get => TextBlock.get_TextAlignmentProperty()
    }

    /**
     * Identifies the [Text](textblock_text.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textproperty
     * @type {DependencyProperty} 
     */
    static TextProperty {
        get => TextBlock.get_TextProperty()
    }

    /**
     * Identifies the [Padding](textblock_padding.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => TextBlock.get_PaddingProperty()
    }

    /**
     * Identifies the [LineHeight](textblock_lineheight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.lineheightproperty
     * @type {DependencyProperty} 
     */
    static LineHeightProperty {
        get => TextBlock.get_LineHeightProperty()
    }

    /**
     * Identifies the [LineStackingStrategy](textblock_linestackingstrategy.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.linestackingstrategyproperty
     * @type {DependencyProperty} 
     */
    static LineStackingStrategyProperty {
        get => TextBlock.get_LineStackingStrategyProperty()
    }

    /**
     * Identifies the [IsTextSelectionEnabled](textblock_istextselectionenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.istextselectionenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextSelectionEnabledProperty {
        get => TextBlock.get_IsTextSelectionEnabledProperty()
    }

    /**
     * Identifies the [SelectedText](textblock_selectedtext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.selectedtextproperty
     * @type {DependencyProperty} 
     */
    static SelectedTextProperty {
        get => TextBlock.get_SelectedTextProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextScaleFactorEnabledProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics3.IID)
            TextBlock.__ITextBlockStatics3 := ITextBlockStatics3(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics3.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionHighlightColorProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics2.IID)
            TextBlock.__ITextBlockStatics2 := ITextBlockStatics2(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics2.get_SelectionHighlightColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxLinesProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics2.IID)
            TextBlock.__ITextBlockStatics2 := ITextBlockStatics2(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics2.get_MaxLinesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextLineBoundsProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics2.IID)
            TextBlock.__ITextBlockStatics2 := ITextBlockStatics2(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics2.get_TextLineBoundsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpticalMarginAlignmentProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics2.IID)
            TextBlock.__ITextBlockStatics2 := ITextBlockStatics2(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics2.get_OpticalMarginAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsColorFontEnabledProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics2.IID)
            TextBlock.__ITextBlockStatics2 := ITextBlockStatics2(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics2.get_IsColorFontEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextReadingOrderProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics2.IID)
            TextBlock.__ITextBlockStatics2 := ITextBlockStatics2(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics2.get_TextReadingOrderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionFlyoutProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics7.IID)
            TextBlock.__ITextBlockStatics7 := ITextBlockStatics7(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics7.get_SelectionFlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextDecorationsProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics5.IID)
            TextBlock.__ITextBlockStatics5 := ITextBlockStatics5(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics5.get_TextDecorationsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextTrimmedProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics6.IID)
            TextBlock.__ITextBlockStatics6 := ITextBlockStatics6(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics6.get_IsTextTrimmedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalTextAlignmentProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics6.IID)
            TextBlock.__ITextBlockStatics6 := ITextBlockStatics6(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics6.get_HorizontalTextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontSizeProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_FontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontFamilyProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_FontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontWeightProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_FontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStyleProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_FontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStretchProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_FontStretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CharacterSpacingProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_CharacterSpacingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForegroundProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_ForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextWrappingProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_TextWrappingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextTrimmingProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_TextTrimmingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextAlignmentProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_TextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_TextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_PaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LineHeightProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_LineHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LineStackingStrategyProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_LineStackingStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextSelectionEnabledProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_IsTextSelectionEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedTextProperty() {
        if (!TextBlock.HasProp("__ITextBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextBlockStatics.IID)
            TextBlock.__ITextBlockStatics := ITextBlockStatics(factoryPtr)
        }

        return TextBlock.__ITextBlockStatics.get_SelectedTextProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the font size for the text content in this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontsize
     * @type {Float} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * Gets or sets the preferred top-level font family for the text content in this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontfamily
     * @type {FontFamily} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * Gets or sets the top-level font weight for the [TextBlock](textblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontweight
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * Gets or sets the font style for the content in this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * Gets or sets the font stretch for the text content in this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.fontstretch
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
        set => this.put_FontStretch(value)
    }

    /**
     * Gets or sets the uniform spacing between characters, in units of 1/1000 of an em.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.characterspacing
     * @type {Integer} 
     */
    CharacterSpacing {
        get => this.get_CharacterSpacing()
        set => this.put_CharacterSpacing(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) to apply to the text contents of the [TextBlock](textblock.md).
     * @remarks
     * [TextBlock](textblock.md) isn't a control so you don't use templates to change its appearance. Instead you can use styles. It's more common (and a better practice) to use named styles for [TextBlock](textblock.md) appearance than it is to set inline attributes for each [TextBlock](textblock.md) instance, particularly if you are using common values in many elements. For more info on styles, see [Quickstart: Styling controls](/previous-versions/windows/apps/hh465498(v=win.10)).
     * 
     * 
     * The default appearance of text and text styles depends heavily on the active theme and other settings. The theme and various styles and behaviors that are using default system settings or user preferences are the source of the effective runtime appearance of [TextBlock](textblock.md) foreground color of text as well as other text characteristics. You can change these defaults by changing the property values, or by applying a different style to specific [TextBlock](textblock.md) instances. You can change the foreground value for all default text by overriding the resource named **DefaultTextForegroundThemeBrush** in App.xaml.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.foreground
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * Gets or sets how the [TextBlock](textblock.md) wraps text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textwrapping
     * @type {Integer} 
     */
    TextWrapping {
        get => this.get_TextWrapping()
        set => this.put_TextWrapping(value)
    }

    /**
     * Gets or sets the text trimming behavior to employ when content overflows the content area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.texttrimming
     * @type {Integer} 
     */
    TextTrimming {
        get => this.get_TextTrimming()
        set => this.put_TextTrimming(value)
    }

    /**
     * Gets or sets a value that indicates the horizontal alignment of text content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textalignment
     * @type {Integer} 
     */
    TextAlignment {
        get => this.get_TextAlignment()
        set => this.put_TextAlignment(value)
    }

    /**
     * Gets or sets the text contents of a [TextBlock](textblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets the collection of inline text elements within a [TextBlock](textblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.inlines
     * @type {InlineCollection} 
     */
    Inlines {
        get => this.get_Inlines()
    }

    /**
     * Gets or sets a value that indicates the thickness of padding space between the boundaries of the content area and the content displayed by a [TextBlock](textblock.md).
     * @remarks
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets the height of each line of content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.lineheight
     * @type {Float} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets a value that indicates how a line box is determined for each line of text in the [TextBlock](textblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.linestackingstrategy
     * @type {Integer} 
     */
    LineStackingStrategy {
        get => this.get_LineStackingStrategy()
        set => this.put_LineStackingStrategy(value)
    }

    /**
     * Gets or sets a value that indicates whether text selection is enabled in the [TextBlock](textblock.md), either through user action or calling selection-related API.
     * @remarks
     * > [!IMPORTANT]
     * > If using a keyboard for text selection within a TextBlock, the user must first activate *Caret Browsing* (with the app in the foreground, press F7).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.istextselectionenabled
     * @type {Boolean} 
     */
    IsTextSelectionEnabled {
        get => this.get_IsTextSelectionEnabled()
        set => this.put_IsTextSelectionEnabled(value)
    }

    /**
     * Gets a text range of selected text.
     * @remarks
     * > [!IMPORTANT]
     * > If using a keyboard for text selection within a TextBlock, the user must first activate *Caret Browsing* (with the app in the foreground, press F7).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.selectedtext
     * @type {HSTRING} 
     */
    SelectedText {
        get => this.get_SelectedText()
    }

    /**
     * Gets a [TextPointer](../windows.ui.xaml.documents/textpointer.md) object for the start of text content in the [TextBlock](textblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.contentstart
     * @type {TextPointer} 
     */
    ContentStart {
        get => this.get_ContentStart()
    }

    /**
     * Gets a [TextPointer](../windows.ui.xaml.documents/textpointer.md) object for the end of text content in the [TextBlock](textblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.contentend
     * @type {TextPointer} 
     */
    ContentEnd {
        get => this.get_ContentEnd()
    }

    /**
     * Gets the starting position of the text selected in the [TextBlock](textblock.md).
     * @remarks
     * Use [Select](textblock_select_694729799.md) to set the selection start and end.
     * 
     * > [!IMPORTANT]
     * > If using a keyboard for text selection within a TextBlock, the user must first activate *Caret Browsing* (with the app in the foreground, press F7).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.selectionstart
     * @type {TextPointer} 
     */
    SelectionStart {
        get => this.get_SelectionStart()
    }

    /**
     * Gets the end position of the text selected in the [TextBlock](textblock.md).
     * @remarks
     * Use [Select](textblock_select_694729799.md) to set the selection start and end.
     * 
     * > [!IMPORTANT]
     * > If using a keyboard for text selection within a TextBlock, the user must first activate *Caret Browsing* (with the app in the foreground, press F7).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.selectionend
     * @type {TextPointer} 
     */
    SelectionEnd {
        get => this.get_SelectionEnd()
    }

    /**
     * Returns a value by which each line of text is offset from a baseline.
     * @remarks
     * If the BaselineOffset is NaN, then an optimal baseline offset is automatically calculated from the current font characteristics.
     * 
     * > [!NOTE]
     * > In C#, you can obtain NaN from [Double.NaN](/dotnet/api/system.double.nan?view=dotnet-uwp-10.0&preserve-view=true).
     * >
     * > In C++, you can obtain NaN by using the [`NAN` macro](/cpp/standard-library/cmath) or [`std::numeric_limits<double>::quiet_NaN()`](/cpp/standard-library/numeric-limits-class#quiet_nan).
     * >
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.baselineoffset
     * @type {Float} 
     */
    BaselineOffset {
        get => this.get_BaselineOffset()
    }

    /**
     * Gets or sets the brush used to highlight the selected text.
     * @remarks
     * > [!IMPORTANT]
     * > If using a keyboard for text selection within a TextBlock, the user must first activate *Caret Browsing* (with the app in the foreground, press F7).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.selectionhighlightcolor
     * @type {SolidColorBrush} 
     */
    SelectionHighlightColor {
        get => this.get_SelectionHighlightColor()
        set => this.put_SelectionHighlightColor(value)
    }

    /**
     * Gets or sets the maximum number of lines of text shown in the [TextBlock](textblock.md).
     * @remarks
     * Use the **MaxLines** property to specify the maximum number of lines of text shown in a text block. The text control will adjust its height to show no more than the specified number of lines, regardless of the font size, font style, or text length.
     * 
     * Negative integer values are invalid, and will cause a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.maxlines
     * @type {Integer} 
     */
    MaxLines {
        get => this.get_MaxLines()
        set => this.put_MaxLines(value)
    }

    /**
     * Gets or sets a value that indicates how the line box height is determined for each line of text in the [TextBlock](textblock.md).
     * @remarks
     * For illustrations of how the different values for [TextLineBounds](../windows.ui.xaml/textlinebounds.md) affect adjacent lines of text, see [TextLineBounds](../windows.ui.xaml/textlinebounds.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textlinebounds
     * @type {Integer} 
     */
    TextLineBounds {
        get => this.get_TextLineBounds()
        set => this.put_TextLineBounds(value)
    }

    /**
     * Get or sets a value that indicates how the font is modified to align with fonts of different sizes.
     * @remarks
     * When OpticalMarginAlignment is set to [TrimSideBearings](../windows.ui.xaml/opticalmarginalignment.md), the text is trimmed to the leftmost stroke of the first character and the rightmost stroke of the last character on a line. For example, an "L" has a small amount of space to the left of the vertical stroke, which scales with font size. When [TrimSideBearings](../windows.ui.xaml/opticalmarginalignment.md) is set, the left of the vertical stroke is directly aligned without the spacing. This enables easier alignment to the Windows grid system as explained in [Laying out an app page](/previous-versions/windows/apps/hh872191(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.opticalmarginalignment
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.iscolorfontenabled
     * @type {Boolean} 
     */
    IsColorFontEnabled {
        get => this.get_IsColorFontEnabled()
        set => this.put_IsColorFontEnabled(value)
    }

    /**
     * Gets or sets a value that indicates how the reading order is determined for the [TextBlock](textblock.md).
     * @remarks
     * This property can be useful when the base direction of the text is unknown, and may not match the user's language or direction. For more info, see the Remarks section of the [TextReadingOrder](../windows.ui.xaml/textreadingorder.md) enumeration or [How to support bidirectional UI](/previous-versions/windows/apps/jj712703(v=win.10)).
     * 
     * > [!NOTE]
     * > In Windows 8.1, the default value is **0**, **Default**. Starting with Windows 10, the enumeration value **0** has the constant name **UseFlowDirection**, and is not the default value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textreadingorder
     * @type {Integer} 
     */
    TextReadingOrder {
        get => this.get_TextReadingOrder()
        set => this.put_TextReadingOrder(value)
    }

    /**
     * Gets or sets whether automatic text enlargement, to reflect the system text size setting, is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.istextscalefactorenabled
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.textdecorations
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.istexttrimmed
     * @type {Boolean} 
     */
    IsTextTrimmed {
        get => this.get_IsTextTrimmed()
    }

    /**
     * Gets or sets a value that indicates how text is aligned in the TextBlock.
     * @remarks
     * This property provides the same functionality as the **TextAlignment** property. If both properties are set to conflicting values, the last one set is used.
     * 
     * Apps that target the Fall Creators Update (SDK 16299) or later should use this property instead of **TextAlignment**. If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.horizontaltextalignment
     * @type {Integer} 
     */
    HorizontalTextAlignment {
        get => this.get_HorizontalTextAlignment()
        set => this.put_HorizontalTextAlignment(value)
    }

    /**
     * Gets the collection of text highlights.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.texthighlighters
     * @type {IVector<TextHighlighter>} 
     */
    TextHighlighters {
        get => this.get_TextHighlighters()
    }

    /**
     * Gets or sets the flyout that is shown when text is selected using touch or pen, or **null** if no flyout is shown.
     * @remarks
     * > [!IMPORTANT]
     * > If using a keyboard for text selection within a TextBlock, the user must first activate *Caret Browsing* (with the app in the foreground, press F7).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.selectionflyout
     * @type {FlyoutBase} 
     */
    SelectionFlyout {
        get => this.get_SelectionFlyout()
        set => this.put_SelectionFlyout(value)
    }

    /**
     * Occurs when the text selection has changed.
     * @remarks
     * > [!IMPORTANT]
     * > If using a keyboard for text selection within a TextBlock, the user must first activate *Caret Browsing* (with the app in the foreground, press F7).
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
     * Occurs when the [IsTextTrimmed](textblock_istexttrimmed.md) property value has changed.
     * @remarks
     * If the [TextTrimming](textblock_texttrimming.md) property is set to None (default), no trim indicator is drawn and the [IsTextTrimmedChanged](textblock_istexttrimmedchanged.md) event does not fire.
     * @type {TypedEventHandler<TextBlock, IsTextTrimmedChangedEventArgs>}
    */
    OnIsTextTrimmedChanged {
        get {
            if(!this.HasProp("__OnIsTextTrimmedChanged")){
                this.__OnIsTextTrimmedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4f8ad0d6-06e6-5c3d-b253-8e23991f4e80}"),
                    TextBlock,
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
     * Initializes a new instance of the [TextBlock](textblock.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextBlock")
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
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_FontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontSize(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_FontSize(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FontFamily() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_FontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_FontFamily(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_FontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_FontWeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_FontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStyle(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_FontStyle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStretch() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_FontStretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStretch(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_FontStretch(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSpacing() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_CharacterSpacing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSpacing(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_CharacterSpacing(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_Foreground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_Foreground(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextWrapping() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_TextWrapping()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextWrapping(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_TextWrapping(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextTrimming() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_TextTrimming()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextTrimming(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_TextTrimming(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextAlignment() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_TextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextAlignment(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_TextAlignment(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_Text(value)
    }

    /**
     * 
     * @returns {InlineCollection} 
     */
    get_Inlines() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_Inlines()
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_Padding(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LineHeight() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_LineHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LineHeight(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_LineHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineStackingStrategy() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_LineStackingStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LineStackingStrategy(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_LineStackingStrategy(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextSelectionEnabled() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_IsTextSelectionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextSelectionEnabled(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.put_IsTextSelectionEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SelectedText() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_SelectedText()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentStart() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_ContentStart()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentEnd() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_ContentEnd()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_SelectionStart() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_SelectionStart()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_SelectionEnd() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_SelectionEnd()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BaselineOffset() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.get_BaselineOffset()
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.add_SelectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.remove_SelectionChanged(token)
    }

    /**
     * 
     * @param {ContextMenuOpeningEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextMenuOpening(handler) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.add_ContextMenuOpening(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContextMenuOpening(token) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.remove_ContextMenuOpening(token)
    }

    /**
     * Selects the entire contents in the [TextBlock](textblock.md).
     * @remarks
     * > [!IMPORTANT]
     * > If using a keyboard for text selection within a TextBlock, the user must first activate *Caret Browsing* (with the app in the foreground, press F7).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.selectall
     */
    SelectAll() {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.SelectAll()
    }

    /**
     * Selects a range of text in the [TextBlock](textblock.md).
     * @remarks
     * In WPF and Silverlight the equivalent API uses integer for start and end positions. This implementation uses [TextPointer](../windows.ui.xaml.documents/textpointer.md) objects to specify the selection.
     * @param {TextPointer} start An object that represents the start of the range to select.
     * @param {TextPointer} end An object that represents the end of the range to select.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.select
     */
    Select(start, end) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.Select(start, end)
    }

    /**
     * Focuses the [TextBlock](textblock.md), as if it were a conventionally focusable control.
     * @remarks
     * <!--Explain the scenario.-->
     * @param {Integer} value Specifies the desired target for focus state, as a value of the enumeration.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.focus
     */
    Focus(value) {
        if (!this.HasProp("__ITextBlock")) {
            if ((queryResult := this.QueryInterface(ITextBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock := ITextBlock(outPtr)
        }

        return this.__ITextBlock.Focus(value)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_SelectionHighlightColor() {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.get_SelectionHighlightColor()
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_SelectionHighlightColor(value) {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.put_SelectionHighlightColor(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLines() {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.get_MaxLines()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxLines(value) {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.put_MaxLines(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextLineBounds() {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.get_TextLineBounds()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextLineBounds(value) {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.put_TextLineBounds(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OpticalMarginAlignment() {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.get_OpticalMarginAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OpticalMarginAlignment(value) {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.put_OpticalMarginAlignment(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorFontEnabled() {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.get_IsColorFontEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorFontEnabled(value) {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.put_IsColorFontEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextReadingOrder() {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.get_TextReadingOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextReadingOrder(value) {
        if (!this.HasProp("__ITextBlock2")) {
            if ((queryResult := this.QueryInterface(ITextBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock2 := ITextBlock2(outPtr)
        }

        return this.__ITextBlock2.put_TextReadingOrder(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextScaleFactorEnabled() {
        if (!this.HasProp("__ITextBlock3")) {
            if ((queryResult := this.QueryInterface(ITextBlock3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock3 := ITextBlock3(outPtr)
        }

        return this.__ITextBlock3.get_IsTextScaleFactorEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextScaleFactorEnabled(value) {
        if (!this.HasProp("__ITextBlock3")) {
            if ((queryResult := this.QueryInterface(ITextBlock3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock3 := ITextBlock3(outPtr)
        }

        return this.__ITextBlock3.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * Returns a mask that represents the alpha channel of the text as a [CompositionBrush](../windows.ui.composition/compositionbrush.md).
     * @remarks
     * This method gets an alpha mask from the text as a [CompositionBrush](../windows.ui.composition/compositionbrush.md) that you can use as an input to composition shadows and effects. The alpha mask [CompositionBrush](../windows.ui.composition/compositionbrush.md) has the same alignment and stretch property values that the source XAML element applies to its rendered content so that you can use those values to correctly position shadows or effects relative to the XAML element.
     * @returns {CompositionBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.getalphamask
     */
    GetAlphaMask() {
        if (!this.HasProp("__ITextBlock4")) {
            if ((queryResult := this.QueryInterface(ITextBlock4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock4 := ITextBlock4(outPtr)
        }

        return this.__ITextBlock4.GetAlphaMask()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextDecorations() {
        if (!this.HasProp("__ITextBlock5")) {
            if ((queryResult := this.QueryInterface(ITextBlock5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock5 := ITextBlock5(outPtr)
        }

        return this.__ITextBlock5.get_TextDecorations()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextDecorations(value) {
        if (!this.HasProp("__ITextBlock5")) {
            if ((queryResult := this.QueryInterface(ITextBlock5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock5 := ITextBlock5(outPtr)
        }

        return this.__ITextBlock5.put_TextDecorations(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextTrimmed() {
        if (!this.HasProp("__ITextBlock6")) {
            if ((queryResult := this.QueryInterface(ITextBlock6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock6 := ITextBlock6(outPtr)
        }

        return this.__ITextBlock6.get_IsTextTrimmed()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalTextAlignment() {
        if (!this.HasProp("__ITextBlock6")) {
            if ((queryResult := this.QueryInterface(ITextBlock6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock6 := ITextBlock6(outPtr)
        }

        return this.__ITextBlock6.get_HorizontalTextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalTextAlignment(value) {
        if (!this.HasProp("__ITextBlock6")) {
            if ((queryResult := this.QueryInterface(ITextBlock6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock6 := ITextBlock6(outPtr)
        }

        return this.__ITextBlock6.put_HorizontalTextAlignment(value)
    }

    /**
     * 
     * @returns {IVector<TextHighlighter>} 
     */
    get_TextHighlighters() {
        if (!this.HasProp("__ITextBlock6")) {
            if ((queryResult := this.QueryInterface(ITextBlock6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock6 := ITextBlock6(outPtr)
        }

        return this.__ITextBlock6.get_TextHighlighters()
    }

    /**
     * 
     * @param {TypedEventHandler<TextBlock, IsTextTrimmedChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsTextTrimmedChanged(handler) {
        if (!this.HasProp("__ITextBlock6")) {
            if ((queryResult := this.QueryInterface(ITextBlock6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock6 := ITextBlock6(outPtr)
        }

        return this.__ITextBlock6.add_IsTextTrimmedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsTextTrimmedChanged(token) {
        if (!this.HasProp("__ITextBlock6")) {
            if ((queryResult := this.QueryInterface(ITextBlock6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock6 := ITextBlock6(outPtr)
        }

        return this.__ITextBlock6.remove_IsTextTrimmedChanged(token)
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_SelectionFlyout() {
        if (!this.HasProp("__ITextBlock7")) {
            if ((queryResult := this.QueryInterface(ITextBlock7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock7 := ITextBlock7(outPtr)
        }

        return this.__ITextBlock7.get_SelectionFlyout()
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_SelectionFlyout(value) {
        if (!this.HasProp("__ITextBlock7")) {
            if ((queryResult := this.QueryInterface(ITextBlock7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock7 := ITextBlock7(outPtr)
        }

        return this.__ITextBlock7.put_SelectionFlyout(value)
    }

    /**
     * Copies the selected content to the Windows clipboard.
     * @remarks
     * > [!IMPORTANT]
     * > If using a keyboard for text selection within a TextBlock, the user must first activate *Caret Browsing* (with the app in the foreground, press F7).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock.copyselectiontoclipboard
     */
    CopySelectionToClipboard() {
        if (!this.HasProp("__ITextBlock7")) {
            if ((queryResult := this.QueryInterface(ITextBlock7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBlock7 := ITextBlock7(outPtr)
        }

        return this.__ITextBlock7.CopySelectionToClipboard()
    }

;@endregion Instance Methods
}
