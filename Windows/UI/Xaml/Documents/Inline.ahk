#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TextElement.ahk
#Include .\IInline.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class for inline text elements, such as [Span](span.md) and [Run](run.md).
 * @remarks
 * [InlineCollection](inlinecollection.md) is a strongly typed collection class that is used by various **Inlines** properties: [TextBlock.Inlines](../windows.ui.xaml.controls/textblock_inlines.md), [Paragraph.Inlines](paragraph_inlines.md) and [Span.Inlines](span_inlines.md). By specifying XAML object elements within one of these **Inlines** properties, you can assign multiple Inline elements to be the text content for an inline text container. This is usually done using an implicit collection and XAML property syntax, such that the inline child elements appear as direct children of the container in XAML markup. This example uses all of the common Inline types as content for a [Paragraph](paragraph.md):
 * ```xaml
 * <Paragraph>
 *   <Bold>Bold</Bold><LineBreak/>
 *   <Hyperlink>Hyperlink</Hyperlink><LineBreak/>
 *   <InlineUIContainer>
 *     <Ellipse Fill="Red" Height="20" Width="20"/>
 *   </InlineUIContainer><LineBreak/>
 *   <Italic>Italic</Italic><LineBreak/>
 *   <Run>Run</Run><LineBreak/>
 *   <Span>Span</Span><LineBreak/>
 *   <Underline>Underline</Underline><LineBreak/>
 *  </Paragraph>
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.inline
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class Inline extends TextElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInline

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInline.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
