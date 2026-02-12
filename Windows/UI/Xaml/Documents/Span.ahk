#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Inline.ahk
#Include .\ISpan.ahk
#Include .\ISpanFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Groups other [Inline](inline.md) content elements. Parent class for [Bold](bold.md), [Hyperlink](hyperlink.md), [Italic](italic.md) and [Underline](underline.md).
 * @remarks
 * You can use Span as an object element in XAML to enclose text. This enables a similar usage to how you might use the` span` tag in HTML. For this usage you'd set the attributes that are supported by [TextElement](textelement.md) such as [FontSize](textelement_fontsize.md) or [FontFamily](textelement_fontfamily.md), so that you can apply these text formatting decisions to the enclosed span of text. [Run](run.md) has similar functionality of applying [TextElement](textelement.md) properties to a range of text, but [Run](run.md) doesn't support mixed content (its [Run.Text](run_text.md) XAML content property can only contain text, not mixed content and further inlines).
 * 
 * Span supports mixed content if you set the content in XAML. What this means is that you can mix [Inline](inline.md) tags such as [Run](run.md), [Bold](bold.md) and so on with XAML text content (plain text), with no restrictions on the order in which tags versus text must appear. All text, whether plain text or as enclosed in an [Inline](inline.md) tag, renders in the order that the text is defined in the mixed content. For example, this is legal XAML:
 * ```xaml
 * <RichTextBlock>
 *   <Paragraph>
 *     <Span>This is <Bold>mixed content</Bold> with multiple text areas <Italic> and inlines</Italic>.</Span>
 *   </Paragraph>
 * </RichTextBlock>
 * ```
 * 
 * When mixed content is parsed from XAML, and the text object model is examined at run time, any text area that came from the plain text generates a [Run](run.md) object at the appropriate reading-order position in the [InlineCollection](inlinecollection.md) collection class that enables run-time access. That [Run](run.md) element contains the text but otherwise has no properties set.
 * 
 * > [!NOTE]
 * > Placing XAML content whether tags or text directly within a Span element is supported because Span denotes that its [Inlines](span_inlines.md) property is the XAML content property. For more info on XAML content properties, see "XAML content properties" section of [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
 * 
 * Span elements are typically used as elements within an [InlineCollection](inlinecollection.md), either as child elements of a [Paragraph](paragraph.md) (becomes part of [Paragraph.Inlines](paragraph_inlines.md)) or as the content of another Span (becomes part of [Span.Inlines](span_inlines.md)).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.span
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class Span extends Inline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpan

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpan.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Span} 
     */
    static CreateInstance() {
        if (!Span.HasProp("__ISpanFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Span")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpanFactory.IID)
            Span.__ISpanFactory := ISpanFactory(factoryPtr)
        }

        return Span.__ISpanFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an [InlineCollection](inlinecollection.md) containing the top-level inline elements that include the contents of [Span](span.md).
     * @remarks
     * [Hyperlink](hyperlink.md) has restrictions on the content that can exist in its Inlines colllection. Specifically, a [Hyperlink](hyperlink.md) only permits [Run](run.md) and other [Span](span.md) types that aren't another [Hyperlink](hyperlink.md). [InlineUIContainer](inlineuicontainer.md) can't be in the Inlines colllection of a [Hyperlink](hyperlink.md). Attempting to add restricted content throws an invalid args exception or XAML parse exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.span.inlines
     * @type {InlineCollection} 
     */
    Inlines {
        get => this.get_Inlines()
        set => this.put_Inlines(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {InlineCollection} 
     */
    get_Inlines() {
        if (!this.HasProp("__ISpan")) {
            if ((queryResult := this.QueryInterface(ISpan.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpan := ISpan(outPtr)
        }

        return this.__ISpan.get_Inlines()
    }

    /**
     * 
     * @param {InlineCollection} value 
     * @returns {HRESULT} 
     */
    put_Inlines(value) {
        if (!this.HasProp("__ISpan")) {
            if ((queryResult := this.QueryInterface(ISpan.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpan := ISpan(outPtr)
        }

        return this.__ISpan.put_Inlines(value)
    }

;@endregion Instance Methods
}
