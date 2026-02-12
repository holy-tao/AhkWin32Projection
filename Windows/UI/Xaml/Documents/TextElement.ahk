#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\ITextElement.ahk
#Include .\ITextElement2.ahk
#Include .\ITextElement3.ahk
#Include .\ITextElement4.ahk
#Include .\ITextElement5.ahk
#Include .\ITextElementOverrides.ahk
#Include .\ITextElementStatics2.ahk
#Include .\ITextElementStatics4.ahk
#Include .\ITextElementStatics.ahk
#Include .\ITextElementStatics3.ahk
#Include .\ITextElementFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\TextElement.ahk
#Include ..\Input\AccessKeyDisplayRequestedEventArgs.ahk
#Include ..\Input\AccessKeyDisplayDismissedEventArgs.ahk
#Include ..\Input\AccessKeyInvokedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * An abstract class used as the base class for the also-abstract [Block](block.md) and [Inline](inline.md) classes. TextElement supports common API for classes involved in the XAML text object model, such as properties that control text size, font families and so on.
 * @remarks
 * The various properties defined by TextElement support a common API for classes involved in the XAML text object model. Here's a list of the most commonly used properties:
 * + [FontFamily](textelement_fontfamily.md)
 * + [FontSize](textelement_fontsize.md)
 * + [FontStretch](textelement_fontstretch.md)
 * + [Foreground](textelement_foreground.md)
 * 
 * By setting TextElement properties, you can apply common text formatting properties to text, both in blocks and in inlines. There are also additional ways to format text, but these aren't directly supported by TextElement. Instead, you can use the attached properties of the [Typography](typography.md) class. [Typography](typography.md) attached properties typically support advanced typographic features or conventions, such as accessing typographic features defined at the font level that are not necessarily supported by all fonts. For example, you could set [Typography.Variants](/uwp/api/windows.ui.xaml.documents.typography.variants) as an attached property on any text block or inline, and this would influence the font-variants behavior as enabled by the particular font you chose for setting [FontFamily](textelement_fontfamily.md) on that text element.
 * 
 * TextElement doesn't inherently define a connection point to a XAML visual tree. In other words a TextElement defines text and text object model within that text, but it doesn't yet enable the display of that text within a UI. For that, you need to use one of the controls or elements that are descendants of [UIElement](../windows.ui.xaml/uielement.md) and can be connected to the XAML tree and the root visual of your app window. There are two such elements in the Windows Runtime:
 * + [TextBlock](../windows.ui.xaml.controls/textblock.md): Supports a text object model of inlines only with its [Inlines](../windows.ui.xaml.controls/textblock_inlines.md) collection.
 * + [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md): Supports a block text object model with its [Blocks](../windows.ui.xaml.controls/richtextblock_blocks.md) collection. The blocks can contain blocks and inlines.
 * 
 * > [!NOTE]
 * > [PasswordBox](../windows.ui.xaml.controls/passwordbox.md), [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) and [TextBox](../windows.ui.xaml.controls/textbox.md) don't support a text object model that's based on TextElement. [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) does enable programmatic access to a different text object model through the [ITextDocument](../windows.ui.text/itextdocument.md) interface.
 * 
 * TextElement defines API that support examining the text object model as programming objects after the XAML is parsed. In particular TextElement implements [Name](textelement_name.md) and [Language](textelement_language.md), which parallel properties of the same name on [FrameworkElement](../windows.ui.xaml/frameworkelement.md). TextElement also implements [FindName](textelement_findname_634111277.md) (a utility method for finding objects at run time based on how [Name](textelement_name.md) was set in initial XAML), and [OnDisconnectVisualChildren](textelement_ondisconnectvisualchildren_1726180609.md) (for advanced scenarios and designer support).
 * 
 *  TextElement has four properties that provide access to [TextPointer](textpointer.md) objects from within text. These properties are: [ContentStart](textelement_contentstart.md), [ContentEnd](textelement_contentend.md), [ElementStart](textelement_elementstart.md), [ElementEnd](textelement_elementend.md). A Windows Runtime  [TextPointer](textpointer.md) object gives you an entry point for traversal of content. For more info, see [TextPointer](textpointer.md).
 * 
 * TextElement is a class derived from [DependencyObject](../windows.ui.xaml/dependencyobject.md). That means it can define dependency properties, and each of the read-write properties of TextElement is a dependency property, with its property identifier also defined by TextElement. For more info on what dependency properties enable, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class TextElement extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextElement.IID

    /**
     * Identifies the [IsTextScaleFactorEnabled](textelement_istextscalefactorenabled.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.istextscalefactorenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextScaleFactorEnabledProperty {
        get => TextElement.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * Identifies the **TextDecorations** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.textdecorationsproperty
     * @type {DependencyProperty} 
     */
    static TextDecorationsProperty {
        get => TextElement.get_TextDecorationsProperty()
    }

    /**
     * Identifies the **IsAccessKeyScope** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.isaccesskeyscopeproperty
     * @type {DependencyProperty} 
     */
    static IsAccessKeyScopeProperty {
        get => TextElement.get_IsAccessKeyScopeProperty()
    }

    /**
     * Identifies the **AccessKeyScopeOwner** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.accesskeyscopeownerproperty
     * @type {DependencyProperty} 
     */
    static AccessKeyScopeOwnerProperty {
        get => TextElement.get_AccessKeyScopeOwnerProperty()
    }

    /**
     * Identifies the **KeyTipPlacementMode** dependency property.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.keytipplacementmodeproperty
     * @type {DependencyProperty} 
     */
    static KeyTipPlacementModeProperty {
        get => TextElement.get_KeyTipPlacementModeProperty()
    }

    /**
     * Identifies the **KeyTipHorizontalOffset** dependency property.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.keytiphorizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static KeyTipHorizontalOffsetProperty {
        get => TextElement.get_KeyTipHorizontalOffsetProperty()
    }

    /**
     * Identifies the **KeyTipVerticalOffset** dependency property.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.keytipverticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static KeyTipVerticalOffsetProperty {
        get => TextElement.get_KeyTipVerticalOffsetProperty()
    }

    /**
     * Identifies the [FontSize](textelement_fontsize.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontsizeproperty
     * @type {DependencyProperty} 
     */
    static FontSizeProperty {
        get => TextElement.get_FontSizeProperty()
    }

    /**
     * Identifies the [FontFamily](textelement_fontfamily.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontfamilyproperty
     * @type {DependencyProperty} 
     */
    static FontFamilyProperty {
        get => TextElement.get_FontFamilyProperty()
    }

    /**
     * Identifies the [FontWeight](textelement_fontweight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontweightproperty
     * @type {DependencyProperty} 
     */
    static FontWeightProperty {
        get => TextElement.get_FontWeightProperty()
    }

    /**
     * Identifies the [FontStyle](textelement_fontstyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontstyleproperty
     * @type {DependencyProperty} 
     */
    static FontStyleProperty {
        get => TextElement.get_FontStyleProperty()
    }

    /**
     * Identifies the [FontStretch](textelement_fontstretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontstretchproperty
     * @type {DependencyProperty} 
     */
    static FontStretchProperty {
        get => TextElement.get_FontStretchProperty()
    }

    /**
     * Identifies the [CharacterSpacing](textelement_characterspacing.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.characterspacingproperty
     * @type {DependencyProperty} 
     */
    static CharacterSpacingProperty {
        get => TextElement.get_CharacterSpacingProperty()
    }

    /**
     * Identifies the [Foreground](textelement_foreground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.foregroundproperty
     * @type {DependencyProperty} 
     */
    static ForegroundProperty {
        get => TextElement.get_ForegroundProperty()
    }

    /**
     * Identifies the [Language](textelement_language.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.languageproperty
     * @type {DependencyProperty} 
     */
    static LanguageProperty {
        get => TextElement.get_LanguageProperty()
    }

    /**
     * Identifies the [AllowFocusOnInteraction](textelement_allowfocusoninteraction.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.allowfocusoninteractionproperty
     * @type {DependencyProperty} 
     */
    static AllowFocusOnInteractionProperty {
        get => TextElement.get_AllowFocusOnInteractionProperty()
    }

    /**
     * Identifies the [AccessKey](textelement_accesskey.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.accesskeyproperty
     * @type {DependencyProperty} 
     */
    static AccessKeyProperty {
        get => TextElement.get_AccessKeyProperty()
    }

    /**
     * Identifies the [ExitDisplayModeOnAccessKeyInvoked](textelement_exitdisplaymodeonaccesskeyinvoked.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.exitdisplaymodeonaccesskeyinvokedproperty
     * @type {DependencyProperty} 
     */
    static ExitDisplayModeOnAccessKeyInvokedProperty {
        get => TextElement.get_ExitDisplayModeOnAccessKeyInvokedProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextScaleFactorEnabledProperty() {
        if (!TextElement.HasProp("__ITextElementStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics2.IID)
            TextElement.__ITextElementStatics2 := ITextElementStatics2(factoryPtr)
        }

        return TextElement.__ITextElementStatics2.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextDecorationsProperty() {
        if (!TextElement.HasProp("__ITextElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics4.IID)
            TextElement.__ITextElementStatics4 := ITextElementStatics4(factoryPtr)
        }

        return TextElement.__ITextElementStatics4.get_TextDecorationsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsAccessKeyScopeProperty() {
        if (!TextElement.HasProp("__ITextElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics4.IID)
            TextElement.__ITextElementStatics4 := ITextElementStatics4(factoryPtr)
        }

        return TextElement.__ITextElementStatics4.get_IsAccessKeyScopeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AccessKeyScopeOwnerProperty() {
        if (!TextElement.HasProp("__ITextElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics4.IID)
            TextElement.__ITextElementStatics4 := ITextElementStatics4(factoryPtr)
        }

        return TextElement.__ITextElementStatics4.get_AccessKeyScopeOwnerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTipPlacementModeProperty() {
        if (!TextElement.HasProp("__ITextElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics4.IID)
            TextElement.__ITextElementStatics4 := ITextElementStatics4(factoryPtr)
        }

        return TextElement.__ITextElementStatics4.get_KeyTipPlacementModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTipHorizontalOffsetProperty() {
        if (!TextElement.HasProp("__ITextElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics4.IID)
            TextElement.__ITextElementStatics4 := ITextElementStatics4(factoryPtr)
        }

        return TextElement.__ITextElementStatics4.get_KeyTipHorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTipVerticalOffsetProperty() {
        if (!TextElement.HasProp("__ITextElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics4.IID)
            TextElement.__ITextElementStatics4 := ITextElementStatics4(factoryPtr)
        }

        return TextElement.__ITextElementStatics4.get_KeyTipVerticalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontSizeProperty() {
        if (!TextElement.HasProp("__ITextElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics.IID)
            TextElement.__ITextElementStatics := ITextElementStatics(factoryPtr)
        }

        return TextElement.__ITextElementStatics.get_FontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontFamilyProperty() {
        if (!TextElement.HasProp("__ITextElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics.IID)
            TextElement.__ITextElementStatics := ITextElementStatics(factoryPtr)
        }

        return TextElement.__ITextElementStatics.get_FontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontWeightProperty() {
        if (!TextElement.HasProp("__ITextElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics.IID)
            TextElement.__ITextElementStatics := ITextElementStatics(factoryPtr)
        }

        return TextElement.__ITextElementStatics.get_FontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStyleProperty() {
        if (!TextElement.HasProp("__ITextElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics.IID)
            TextElement.__ITextElementStatics := ITextElementStatics(factoryPtr)
        }

        return TextElement.__ITextElementStatics.get_FontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStretchProperty() {
        if (!TextElement.HasProp("__ITextElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics.IID)
            TextElement.__ITextElementStatics := ITextElementStatics(factoryPtr)
        }

        return TextElement.__ITextElementStatics.get_FontStretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CharacterSpacingProperty() {
        if (!TextElement.HasProp("__ITextElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics.IID)
            TextElement.__ITextElementStatics := ITextElementStatics(factoryPtr)
        }

        return TextElement.__ITextElementStatics.get_CharacterSpacingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForegroundProperty() {
        if (!TextElement.HasProp("__ITextElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics.IID)
            TextElement.__ITextElementStatics := ITextElementStatics(factoryPtr)
        }

        return TextElement.__ITextElementStatics.get_ForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LanguageProperty() {
        if (!TextElement.HasProp("__ITextElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics.IID)
            TextElement.__ITextElementStatics := ITextElementStatics(factoryPtr)
        }

        return TextElement.__ITextElementStatics.get_LanguageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AllowFocusOnInteractionProperty() {
        if (!TextElement.HasProp("__ITextElementStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics3.IID)
            TextElement.__ITextElementStatics3 := ITextElementStatics3(factoryPtr)
        }

        return TextElement.__ITextElementStatics3.get_AllowFocusOnInteractionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AccessKeyProperty() {
        if (!TextElement.HasProp("__ITextElementStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics3.IID)
            TextElement.__ITextElementStatics3 := ITextElementStatics3(factoryPtr)
        }

        return TextElement.__ITextElementStatics3.get_AccessKeyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExitDisplayModeOnAccessKeyInvokedProperty() {
        if (!TextElement.HasProp("__ITextElementStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextElementStatics3.IID)
            TextElement.__ITextElementStatics3 := ITextElementStatics3(factoryPtr)
        }

        return TextElement.__ITextElementStatics3.get_ExitDisplayModeOnAccessKeyInvokedProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a unique identification for the object. Name can only be set from initial parsing of XAML.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets or sets the font size for the content of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontsize
     * @type {Float} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * Gets or sets the preferred top-level font family for the content of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontfamily
     * @type {FontFamily} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * Gets or sets the top-level font weight to select from the font family for the content in this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontweight
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * Gets or sets the font style for the content in this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * Gets or sets the glyph width of the font in a family to select.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.fontstretch
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
        set => this.put_FontStretch(value)
    }

    /**
     * Gets or sets the uniform spacing between characters, in units of 1/1000 of an em.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.characterspacing
     * @type {Integer} 
     */
    CharacterSpacing {
        get => this.get_CharacterSpacing()
        set => this.put_CharacterSpacing(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) to apply to the content in this element.
     * @remarks
     * Setting Foreground has no visible effect for [LineBreak](linebreak.md) or [InlineUIContainer](inlineuicontainer.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.foreground
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * Gets or sets localization/globalization language information that applies to a [TextElement](textelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets a [TextPointer](textpointer.md) that represents the start of content in the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.contentstart
     * @type {TextPointer} 
     */
    ContentStart {
        get => this.get_ContentStart()
    }

    /**
     * Gets a [TextPointer](textpointer.md) that represents the end of the content in the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.contentend
     * @type {TextPointer} 
     */
    ContentEnd {
        get => this.get_ContentEnd()
    }

    /**
     * Gets a [TextPointer](textpointer.md) that represents the position just before the start of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.elementstart
     * @type {TextPointer} 
     */
    ElementStart {
        get => this.get_ElementStart()
    }

    /**
     * Gets a [TextPointer](textpointer.md) that represents the position just after the end of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.elementend
     * @type {TextPointer} 
     */
    ElementEnd {
        get => this.get_ElementEnd()
    }

    /**
     * Gets or sets whether automatic text enlargement, to reflect the system text size setting, is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.istextscalefactorenabled
     * @type {Boolean} 
     */
    IsTextScaleFactorEnabled {
        get => this.get_IsTextScaleFactorEnabled()
        set => this.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the element automatically gets focus when the user interacts with it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.allowfocusoninteraction
     * @type {Boolean} 
     */
    AllowFocusOnInteraction {
        get => this.get_AllowFocusOnInteraction()
        set => this.put_AllowFocusOnInteraction(value)
    }

    /**
     * Gets or sets the access key for this element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.accesskey
     * @type {HSTRING} 
     */
    AccessKey {
        get => this.get_AccessKey()
        set => this.put_AccessKey(value)
    }

    /**
     * Gets or sets a value that specifies whether the access key display is dismissed when an access key is invoked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.exitdisplaymodeonaccesskeyinvoked
     * @type {Boolean} 
     */
    ExitDisplayModeOnAccessKeyInvoked {
        get => this.get_ExitDisplayModeOnAccessKeyInvoked()
        set => this.put_ExitDisplayModeOnAccessKeyInvoked(value)
    }

    /**
     * Gets or sets a value that indicates what decorations are applied to the text.
     * @remarks
     * For more info and examples, see [RichTextBlock.TextDecorations](../windows.ui.xaml.controls/richtextblock_textdecorations.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.textdecorations
     * @type {Integer} 
     */
    TextDecorations {
        get => this.get_TextDecorations()
        set => this.put_TextDecorations(value)
    }

    /**
     * Gets or sets a value that indicates whether an element defines its own access key scope.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.isaccesskeyscope
     * @type {Boolean} 
     */
    IsAccessKeyScope {
        get => this.get_IsAccessKeyScope()
        set => this.put_IsAccessKeyScope(value)
    }

    /**
     * Gets or sets a source element that provides the access key scope for this element, even if it's not in the visual tree of the source element.
     * @remarks
     * The source element must have its **IsAccessKeyScope** property set to **true**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.accesskeyscopeowner
     * @type {DependencyObject} 
     */
    AccessKeyScopeOwner {
        get => this.get_AccessKeyScopeOwner()
        set => this.put_AccessKeyScopeOwner(value)
    }

    /**
     * Gets or sets a value that indicates where the keytip is placed in relation to the text element.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.keytipplacementmode
     * @type {Integer} 
     */
    KeyTipPlacementMode {
        get => this.get_KeyTipPlacementMode()
        set => this.put_KeyTipPlacementMode(value)
    }

    /**
     * Gets or sets a value that indicates how far left or right the keytip is placed in relation to the text element.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.keytiphorizontaloffset
     * @type {Float} 
     */
    KeyTipHorizontalOffset {
        get => this.get_KeyTipHorizontalOffset()
        set => this.put_KeyTipHorizontalOffset(value)
    }

    /**
     * Gets or sets a value that indicates how far up or down the keytip is placed in relation to the text element.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.keytipverticaloffset
     * @type {Float} 
     */
    KeyTipVerticalOffset {
        get => this.get_KeyTipVerticalOffset()
        set => this.put_KeyTipVerticalOffset(value)
    }

    /**
     * Gets or sets the XamlRoot in which this element is being viewed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.xamlroot
     * @type {XamlRoot} 
     */
    XamlRoot {
        get => this.get_XamlRoot()
        set => this.put_XamlRoot(value)
    }

    /**
     * Occurs when the access key sequence is started to notify controls that they should show access key visuals.
     * @remarks
     * This event is not raised if the element is under an element with its [Visibility](../windows.ui.xaml/uielement_visibility.md) property set to **Collapsed**.
     * @type {TypedEventHandler<TextElement, AccessKeyDisplayRequestedEventArgs>}
    */
    OnAccessKeyDisplayRequested {
        get {
            if(!this.HasProp("__OnAccessKeyDisplayRequested")){
                this.__OnAccessKeyDisplayRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{39ad7708-254e-560a-9e2e-73b1db31f935}"),
                    TextElement,
                    AccessKeyDisplayRequestedEventArgs
                )
                this.__OnAccessKeyDisplayRequestedToken := this.add_AccessKeyDisplayRequested(this.__OnAccessKeyDisplayRequested.iface)
            }
            return this.__OnAccessKeyDisplayRequested
        }
    }

    /**
     * Occurs when the access key sequence is complete to notify controls that they should hide access key visuals.
     * @type {TypedEventHandler<TextElement, AccessKeyDisplayDismissedEventArgs>}
    */
    OnAccessKeyDisplayDismissed {
        get {
            if(!this.HasProp("__OnAccessKeyDisplayDismissed")){
                this.__OnAccessKeyDisplayDismissed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a8c9544b-7078-5316-beb6-d9ec916ab88a}"),
                    TextElement,
                    AccessKeyDisplayDismissedEventArgs
                )
                this.__OnAccessKeyDisplayDismissedToken := this.add_AccessKeyDisplayDismissed(this.__OnAccessKeyDisplayDismissed.iface)
            }
            return this.__OnAccessKeyDisplayDismissed
        }
    }

    /**
     * Occurs when a user completes an access key sequence to notify the element that the access key action should be invoked.
     * @remarks
     * For more info, see [UIElement.AccessKeyInvoked](./../windows.ui.xaml/uielement_accesskeyinvoked.md).
     * @type {TypedEventHandler<TextElement, AccessKeyInvokedEventArgs>}
    */
    OnAccessKeyInvoked {
        get {
            if(!this.HasProp("__OnAccessKeyInvoked")){
                this.__OnAccessKeyInvoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a72c6b01-2e3c-57b5-9ec4-948f6c6d930a}"),
                    TextElement,
                    AccessKeyInvokedEventArgs
                )
                this.__OnAccessKeyInvokedToken := this.add_AccessKeyInvoked(this.__OnAccessKeyInvoked.iface)
            }
            return this.__OnAccessKeyInvoked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAccessKeyDisplayRequestedToken")) {
            this.remove_AccessKeyDisplayRequested(this.__OnAccessKeyDisplayRequestedToken)
            this.__OnAccessKeyDisplayRequested.iface.Dispose()
        }

        if(this.HasProp("__OnAccessKeyDisplayDismissedToken")) {
            this.remove_AccessKeyDisplayDismissed(this.__OnAccessKeyDisplayDismissedToken)
            this.__OnAccessKeyDisplayDismissed.iface.Dispose()
        }

        if(this.HasProp("__OnAccessKeyInvokedToken")) {
            this.remove_AccessKeyInvoked(this.__OnAccessKeyInvokedToken)
            this.__OnAccessKeyInvoked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_Name()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontSize() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_FontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontSize(value) {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.put_FontSize(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FontFamily() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_FontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.put_FontFamily(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_FontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.put_FontWeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_FontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStyle(value) {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.put_FontStyle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStretch() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_FontStretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStretch(value) {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.put_FontStretch(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSpacing() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_CharacterSpacing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSpacing(value) {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.put_CharacterSpacing(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_Foreground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.put_Foreground(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_Language()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.put_Language(value)
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentStart() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_ContentStart()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentEnd() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_ContentEnd()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ElementStart() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_ElementStart()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ElementEnd() {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.get_ElementEnd()
    }

    /**
     * Retrieves an object in the object model / runtime object graph by referencing the object's **x:Name** or **Name** attribute value.
     * @remarks
     * [FrameworkElement](../windows.ui.xaml/frameworkelement.md) is the class that implements [Name](../windows.ui.xaml/frameworkelement_name.md) support for most other run-time classes, but [TextElement](textelement.md) is not a [FrameworkElement](../windows.ui.xaml/frameworkelement.md) derived class. [TextElement](textelement.md) supports its own [Name](textelement_name.md) and FindName implementations, and the underlying logic for name lookup does not differentiate between [TextElement](textelement.md) and [FrameworkElement](../windows.ui.xaml/frameworkelement.md). You can use the [TextElement](textelement.md)-implemented FindName to find a named [FrameworkElement](../windows.ui.xaml/frameworkelement.md), and vice versa.
     * 
     * Because FindName relies on all the XAML sources being parsed for the **Name** attributes, you should not attempt to call FindName until the XAML is loaded.
     * 
     * Names and FindName are influenced by the concept of a XAML namescope. 
     * <!--For more information, see ...-->
     * @param {HSTRING} name The name of the object to retrieve.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.findname
     */
    FindName(name) {
        if (!this.HasProp("__ITextElement")) {
            if ((queryResult := this.QueryInterface(ITextElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement := ITextElement(outPtr)
        }

        return this.__ITextElement.FindName(name)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextScaleFactorEnabled() {
        if (!this.HasProp("__ITextElement2")) {
            if ((queryResult := this.QueryInterface(ITextElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement2 := ITextElement2(outPtr)
        }

        return this.__ITextElement2.get_IsTextScaleFactorEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextScaleFactorEnabled(value) {
        if (!this.HasProp("__ITextElement2")) {
            if ((queryResult := this.QueryInterface(ITextElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement2 := ITextElement2(outPtr)
        }

        return this.__ITextElement2.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowFocusOnInteraction() {
        if (!this.HasProp("__ITextElement3")) {
            if ((queryResult := this.QueryInterface(ITextElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement3 := ITextElement3(outPtr)
        }

        return this.__ITextElement3.get_AllowFocusOnInteraction()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowFocusOnInteraction(value) {
        if (!this.HasProp("__ITextElement3")) {
            if ((queryResult := this.QueryInterface(ITextElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement3 := ITextElement3(outPtr)
        }

        return this.__ITextElement3.put_AllowFocusOnInteraction(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccessKey() {
        if (!this.HasProp("__ITextElement3")) {
            if ((queryResult := this.QueryInterface(ITextElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement3 := ITextElement3(outPtr)
        }

        return this.__ITextElement3.get_AccessKey()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AccessKey(value) {
        if (!this.HasProp("__ITextElement3")) {
            if ((queryResult := this.QueryInterface(ITextElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement3 := ITextElement3(outPtr)
        }

        return this.__ITextElement3.put_AccessKey(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExitDisplayModeOnAccessKeyInvoked() {
        if (!this.HasProp("__ITextElement3")) {
            if ((queryResult := this.QueryInterface(ITextElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement3 := ITextElement3(outPtr)
        }

        return this.__ITextElement3.get_ExitDisplayModeOnAccessKeyInvoked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExitDisplayModeOnAccessKeyInvoked(value) {
        if (!this.HasProp("__ITextElement3")) {
            if ((queryResult := this.QueryInterface(ITextElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement3 := ITextElement3(outPtr)
        }

        return this.__ITextElement3.put_ExitDisplayModeOnAccessKeyInvoked(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextDecorations() {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.get_TextDecorations()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextDecorations(value) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.put_TextDecorations(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAccessKeyScope() {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.get_IsAccessKeyScope()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAccessKeyScope(value) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.put_IsAccessKeyScope(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_AccessKeyScopeOwner() {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.get_AccessKeyScopeOwner()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_AccessKeyScopeOwner(value) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.put_AccessKeyScopeOwner(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyTipPlacementMode() {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.get_KeyTipPlacementMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_KeyTipPlacementMode(value) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.put_KeyTipPlacementMode(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KeyTipHorizontalOffset() {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.get_KeyTipHorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_KeyTipHorizontalOffset(value) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.put_KeyTipHorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KeyTipVerticalOffset() {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.get_KeyTipVerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_KeyTipVerticalOffset(value) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.put_KeyTipVerticalOffset(value)
    }

    /**
     * 
     * @param {TypedEventHandler<TextElement, AccessKeyDisplayRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyDisplayRequested(handler) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.add_AccessKeyDisplayRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AccessKeyDisplayRequested(token) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.remove_AccessKeyDisplayRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextElement, AccessKeyDisplayDismissedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyDisplayDismissed(handler) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.add_AccessKeyDisplayDismissed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AccessKeyDisplayDismissed(token) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.remove_AccessKeyDisplayDismissed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextElement, AccessKeyInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessKeyInvoked(handler) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.add_AccessKeyInvoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AccessKeyInvoked(token) {
        if (!this.HasProp("__ITextElement4")) {
            if ((queryResult := this.QueryInterface(ITextElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement4 := ITextElement4(outPtr)
        }

        return this.__ITextElement4.remove_AccessKeyInvoked(token)
    }

    /**
     * 
     * @returns {XamlRoot} 
     */
    get_XamlRoot() {
        if (!this.HasProp("__ITextElement5")) {
            if ((queryResult := this.QueryInterface(ITextElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement5 := ITextElement5(outPtr)
        }

        return this.__ITextElement5.get_XamlRoot()
    }

    /**
     * 
     * @param {XamlRoot} value 
     * @returns {HRESULT} 
     */
    put_XamlRoot(value) {
        if (!this.HasProp("__ITextElement5")) {
            if ((queryResult := this.QueryInterface(ITextElement5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElement5 := ITextElement5(outPtr)
        }

        return this.__ITextElement5.put_XamlRoot(value)
    }

    /**
     * Override this method to implement how layout and logic should behave when items are removed from a class-specific content or child property.
     * @remarks
     * [TextElement](textelement.md) does not define any of the content or children properties that OnDisconnectVisualChildren might act upon. Such properties are introduced by derived classes such as [Paragraph](paragraph.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textelement.ondisconnectvisualchildren
     */
    OnDisconnectVisualChildren() {
        if (!this.HasProp("__ITextElementOverrides")) {
            if ((queryResult := this.QueryInterface(ITextElementOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextElementOverrides := ITextElementOverrides(outPtr)
        }

        return this.__ITextElementOverrides.OnDisconnectVisualChildren()
    }

;@endregion Instance Methods
}
