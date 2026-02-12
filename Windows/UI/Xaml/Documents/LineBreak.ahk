#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Inline.ahk
#Include .\ILineBreak.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an inline element that causes a new line to begin in content when rendered in a text container.
 * @remarks
 * LineBreak is most commonly used when formatting text within the [TextBlock.Inlines](../windows.ui.xaml.controls/textblock_inlines.md) collection. [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) supports the [Paragraph](paragraph.md) element as an element that separately renders text blocks, so you don't typically need to use LineBreak content as often. (LineBreak is supported in the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) text model, for example you can place a LineBreak in [Paragraph.Inlines](paragraph_inlines.md), between other [Run](run.md) or [Span](span.md) elements, and a line break will render at that position.)
 * 
 * LineBreak inherits properties from the [TextElement](textelement.md) class. However, most of these properties don't have any visible effect. It's most common to declare a LineBreak object element in XAML without there being any attributes set, similar to how you might use a `<br/>` tag in HTML.
 * 
 * Setting properties on LineBreak that otherwise affect the character line height of a text element (such as [FontSize](textelement_fontsize.md), [FontFamily](textelement_fontfamily.md)) has no effect on the text rendering and appearance. The height of a text line is inferred from the other text elements that precedes the LineBreak, and the properties of a LineBreak don't modify that line height even if set explicitly.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.linebreak
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class LineBreak extends Inline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineBreak

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineBreak.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [LineBreak](linebreak.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.LineBreak")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
