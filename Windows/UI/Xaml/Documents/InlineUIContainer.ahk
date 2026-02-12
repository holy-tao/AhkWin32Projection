#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Inline.ahk
#Include .\IInlineUIContainer.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides an inline content element that enables [UIElement](../windows.ui.xaml/uielement.md) types to be embedded in the content of a [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md).
 * @remarks
 * The most common scenario for using an InlineUIContainer object is to introduce an image into text content. Use a new [Image](../windows.ui.xaml.controls/image.md) object for the image, as the child content for an InlineUIContainer. Set [Height](../windows.ui.xaml/frameworkelement_height.md) and [Width](../windows.ui.xaml/frameworkelement_width.md) on the image if you don't want it to scale to the natural image size.
 * 
 * If you want more than one element inlined in the same position, consider using a panel as the single InlineUIContainer child and then placing the multiple elements within that panel.
 * 
 * If placed within an InlineUIContainer, a control that can be focused still appears in the top-level tab sequence.
 * 
 * If you want interactive text, consider using a [Hyperlink](hyperlink.md) element (a type of [Inline](inline.md)) rather than using InlineUIContainer with a [Button](../windows.ui.xaml.controls/button.md) or similar within it. See [Guidelines for links](/windows/uwp/controls-and-patterns/hyperlinks).
 * 
 * InlineUIContainer inherits properties from the [TextElement](textelement.md) class. However, most of these properties don't have any visible effect. It's most common to declare a InlineUIContainer object element in XAML without there being any attributes set (except possibly [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute)) with the single child element that you're inlining as content of the InlineUIContainer object element.
 * 
 * Setting properties on InlineUIContainer that otherwise affect the character line height of a text element (such as [FontSize](textelement_fontsize.md), [FontFamily](textelement_fontfamily.md)) has no effect on the rendering and appearance. The content dictates its size and the InlineUIContainer sizes to fit it.
 * 
 * If there's further text within the child content (like [TextBlock.Text](../windows.ui.xaml.controls/textblock_text.md) or other text elements within a nested [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md)) the text element properties of the InlineUIContainer parent won't inherit into the content, they're ignored.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.inlineuicontainer
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class InlineUIContainer extends Inline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInlineUIContainer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInlineUIContainer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the [UIElement](../windows.ui.xaml/uielement.md) hosted by the [InlineUIContainer](inlineuicontainer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.inlineuicontainer.child
     * @type {UIElement} 
     */
    Child {
        get => this.get_Child()
        set => this.put_Child(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [InlineUIContainer](inlineuicontainer.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.InlineUIContainer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Child() {
        if (!this.HasProp("__IInlineUIContainer")) {
            if ((queryResult := this.QueryInterface(IInlineUIContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInlineUIContainer := IInlineUIContainer(outPtr)
        }

        return this.__IInlineUIContainer.get_Child()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Child(value) {
        if (!this.HasProp("__IInlineUIContainer")) {
            if ((queryResult := this.QueryInterface(IInlineUIContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInlineUIContainer := IInlineUIContainer(outPtr)
        }

        return this.__IInlineUIContainer.put_Child(value)
    }

;@endregion Instance Methods
}
