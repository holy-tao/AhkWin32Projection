#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Block.ahk
#Include .\IParagraph.ahk
#Include .\IParagraphStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a block-level content element that is used to group content into a paragraph.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.paragraph
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class Paragraph extends Block {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IParagraph

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IParagraph.IID

    /**
     * Identifies the [TextIndent](paragraph_textindent.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.paragraph.textindentproperty
     * @type {DependencyProperty} 
     */
    static TextIndentProperty {
        get => Paragraph.get_TextIndentProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextIndentProperty() {
        if (!Paragraph.HasProp("__IParagraphStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Paragraph")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParagraphStatics.IID)
            Paragraph.__IParagraphStatics := IParagraphStatics(factoryPtr)
        }

        return Paragraph.__IParagraphStatics.get_TextIndentProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an [InlineCollection](inlinecollection.md) containing the top-level [Inline](inline.md) elements that include the contents of the [Paragraph](paragraph.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.paragraph.inlines
     * @type {InlineCollection} 
     */
    Inlines {
        get => this.get_Inlines()
    }

    /**
     * Gets or sets the indentation of the first line of text in a paragraph, in pixels.
     * @remarks
     * You can set the indent amount for all paragraphs in a [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) by setting the [RichTextBlock.TextIndent](../windows.ui.xaml.controls/richtextblock_textindent.md) property. You can override this setting for specific paragraphs in a [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) by setting the Paragraph.TextIndent property to a different value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.paragraph.textindent
     * @type {Float} 
     */
    TextIndent {
        get => this.get_TextIndent()
        set => this.put_TextIndent(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Paragraph](paragraph.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Paragraph")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {InlineCollection} 
     */
    get_Inlines() {
        if (!this.HasProp("__IParagraph")) {
            if ((queryResult := this.QueryInterface(IParagraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParagraph := IParagraph(outPtr)
        }

        return this.__IParagraph.get_Inlines()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TextIndent() {
        if (!this.HasProp("__IParagraph")) {
            if ((queryResult := this.QueryInterface(IParagraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParagraph := IParagraph(outPtr)
        }

        return this.__IParagraph.get_TextIndent()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TextIndent(value) {
        if (!this.HasProp("__IParagraph")) {
            if ((queryResult := this.QueryInterface(IParagraph.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParagraph := IParagraph(outPtr)
        }

        return this.__IParagraph.put_TextIndent(value)
    }

;@endregion Instance Methods
}
