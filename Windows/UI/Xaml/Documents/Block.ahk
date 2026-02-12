#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TextElement.ahk
#Include .\IBlock.ahk
#Include .\IBlock2.ahk
#Include .\IBlockStatics.ahk
#Include .\IBlockStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * An abstract class that provides a base for all block-level content elements.
 * @remarks
 * Block defines text formatting properties that should apply to all types of Block content. These properties are: [LineHeight](block_lineheight.md), [LineStackingStrategy](block_linestackingstrategy.md), [Margin](block_margin.md), and [TextAlignment](block_textalignment.md). Block also inherits the text formatting properties and other API of [TextElement](textelement.md).
 * 
 * In the Windows Runtime XAML vocabulary the only block type is [Paragraph](paragraph.md). You use [Paragraph](paragraph.md) to define the blocks of text to display within a [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) control. Every [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) should include at least one [Paragraph](paragraph.md).
 * 
 * [BlockCollection](blockcollection.md) is a strongly typed collection class that is used by the [RichTextBlock.Blocks](../windows.ui.xaml.controls/richtextblock_blocks.md) property. By specifying XAML object elements within a [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md), you can assign the block text content for the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md). This is usually done using an implicit collection and XAML property syntax, such that the [Paragraph](paragraph.md) elements appear as direct children of [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) in XAML markup. For example:
 * ```xaml
 * <RichTextBlock>
 *   <Paragraph>First paragraph.</Paragraph>
 *   <Paragraph>Second paragraph.</Paragraph>
 *   <Paragraph>Third paragraph. <Bold>With an inline.</Bold></Paragraph>
 * </RichTextBlock>
 * ```
 * 
 * <!--For more info on how to use block and inline elements, see <xref targtype="ovw" rid="m_ui_controls_mca.quickstart__displaying_text"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">Quickstart: Displaying text</xref>.Commented out because the QS only covers TextBlock, we have no ovw on the rich TOM-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class Block extends TextElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBlock

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBlock.IID

    /**
     * Identifies the [TextAlignment](block_textalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.textalignmentproperty
     * @type {DependencyProperty} 
     */
    static TextAlignmentProperty {
        get => Block.get_TextAlignmentProperty()
    }

    /**
     * Identifies the [LineHeight](block_lineheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.lineheightproperty
     * @type {DependencyProperty} 
     */
    static LineHeightProperty {
        get => Block.get_LineHeightProperty()
    }

    /**
     * Identifies the [LineStackingStrategy](block_linestackingstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.linestackingstrategyproperty
     * @type {DependencyProperty} 
     */
    static LineStackingStrategyProperty {
        get => Block.get_LineStackingStrategyProperty()
    }

    /**
     * Identifies the [Margin](block_margin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.marginproperty
     * @type {DependencyProperty} 
     */
    static MarginProperty {
        get => Block.get_MarginProperty()
    }

    /**
     * Identifies the HorizontalTextAlignment dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.horizontaltextalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalTextAlignmentProperty {
        get => Block.get_HorizontalTextAlignmentProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextAlignmentProperty() {
        if (!Block.HasProp("__IBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Block")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBlockStatics.IID)
            Block.__IBlockStatics := IBlockStatics(factoryPtr)
        }

        return Block.__IBlockStatics.get_TextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LineHeightProperty() {
        if (!Block.HasProp("__IBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Block")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBlockStatics.IID)
            Block.__IBlockStatics := IBlockStatics(factoryPtr)
        }

        return Block.__IBlockStatics.get_LineHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LineStackingStrategyProperty() {
        if (!Block.HasProp("__IBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Block")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBlockStatics.IID)
            Block.__IBlockStatics := IBlockStatics(factoryPtr)
        }

        return Block.__IBlockStatics.get_LineStackingStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MarginProperty() {
        if (!Block.HasProp("__IBlockStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Block")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBlockStatics.IID)
            Block.__IBlockStatics := IBlockStatics(factoryPtr)
        }

        return Block.__IBlockStatics.get_MarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalTextAlignmentProperty() {
        if (!Block.HasProp("__IBlockStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Block")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBlockStatics2.IID)
            Block.__IBlockStatics2 := IBlockStatics2(factoryPtr)
        }

        return Block.__IBlockStatics2.get_HorizontalTextAlignmentProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the horizontal alignment of the text content.
     * @remarks
     * [Block](block.md) is a base class for [Paragraph](paragraph.md). [Paragraph](paragraph.md) is the only element that you can set a TextAlignment value on in Windows Runtime XAML, unless you create a custom class based on [Block](block.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.textalignment
     * @type {Integer} 
     */
    TextAlignment {
        get => this.get_TextAlignment()
        set => this.put_TextAlignment(value)
    }

    /**
     * Gets or sets the height of each line of content.
     * @remarks
     * [Block](block.md) is a base class for [Paragraph](paragraph.md). [Paragraph](paragraph.md) is the only element that you can set a LineHeight value on in Windows Runtime XAML, unless you create a custom class based on [Block](block.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.lineheight
     * @type {Float} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets a value that indicates how a line box is determined for each line of text in the [Block](block.md).
     * @remarks
     * [Block](block.md) is a base class for [Paragraph](paragraph.md). [Paragraph](paragraph.md) is the only element that you can set a LineStackingStrategy value on in Windows Runtime XAML, unless you create a custom class based on [Block](block.md).
     * 
     * **BlockLineHeight** and **MaxHeight** are the only two constant names that exist in the [LineStackingStrategy](../windows.ui.xaml/linestackingstrategy.md) enumeration, so the XAML syntax shows those two choices.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.linestackingstrategy
     * @type {Integer} 
     */
    LineStackingStrategy {
        get => this.get_LineStackingStrategy()
        set => this.put_LineStackingStrategy(value)
    }

    /**
     * Gets or sets the amount of space around a [Block](block.md) element.
     * @remarks
     * > **Code migration note**
     * > Microsoft Silverlight doesn't support a **Margin** property on **Block** or **Paragraph**. Windows Presentation Foundation (WPF) has a **Margin** property on **Block** and **Paragraph**, but also has a **Padding** property there that the Windows Runtime doesn't support. If you need per-paragraph padding support, you might need to put each [Paragraph](paragraph.md) in a different [Border](../windows.ui.xaml.controls/border.md) container and use a [Panel](../windows.ui.xaml.controls/panel.md) for layout control, and set [Border.Padding](../windows.ui.xaml.controls/border_padding.md) on each [Border](../windows.ui.xaml.controls/border.md). Or, use [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.margin
     * @type {Thickness} 
     */
    Margin {
        get => this.get_Margin()
        set => this.put_Margin(value)
    }

    /**
     * Gets or sets a value that indicates how text is aligned in the Block.
     * @remarks
     * This property supports [XAML Standard](https://aka.ms/xamlstandard). It provides the same functionality as the **TextAlignement** property. If both properties are set to conflicting values, the last one set is used.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.block.horizontaltextalignment
     * @type {Integer} 
     */
    HorizontalTextAlignment {
        get => this.get_HorizontalTextAlignment()
        set => this.put_HorizontalTextAlignment(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextAlignment() {
        if (!this.HasProp("__IBlock")) {
            if ((queryResult := this.QueryInterface(IBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock := IBlock(outPtr)
        }

        return this.__IBlock.get_TextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextAlignment(value) {
        if (!this.HasProp("__IBlock")) {
            if ((queryResult := this.QueryInterface(IBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock := IBlock(outPtr)
        }

        return this.__IBlock.put_TextAlignment(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LineHeight() {
        if (!this.HasProp("__IBlock")) {
            if ((queryResult := this.QueryInterface(IBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock := IBlock(outPtr)
        }

        return this.__IBlock.get_LineHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LineHeight(value) {
        if (!this.HasProp("__IBlock")) {
            if ((queryResult := this.QueryInterface(IBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock := IBlock(outPtr)
        }

        return this.__IBlock.put_LineHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineStackingStrategy() {
        if (!this.HasProp("__IBlock")) {
            if ((queryResult := this.QueryInterface(IBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock := IBlock(outPtr)
        }

        return this.__IBlock.get_LineStackingStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LineStackingStrategy(value) {
        if (!this.HasProp("__IBlock")) {
            if ((queryResult := this.QueryInterface(IBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock := IBlock(outPtr)
        }

        return this.__IBlock.put_LineStackingStrategy(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Margin() {
        if (!this.HasProp("__IBlock")) {
            if ((queryResult := this.QueryInterface(IBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock := IBlock(outPtr)
        }

        return this.__IBlock.get_Margin()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Margin(value) {
        if (!this.HasProp("__IBlock")) {
            if ((queryResult := this.QueryInterface(IBlock.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock := IBlock(outPtr)
        }

        return this.__IBlock.put_Margin(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalTextAlignment() {
        if (!this.HasProp("__IBlock2")) {
            if ((queryResult := this.QueryInterface(IBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock2 := IBlock2(outPtr)
        }

        return this.__IBlock2.get_HorizontalTextAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalTextAlignment(value) {
        if (!this.HasProp("__IBlock2")) {
            if ((queryResult := this.QueryInterface(IBlock2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBlock2 := IBlock2(outPtr)
        }

        return this.__IBlock2.put_HorizontalTextAlignment(value)
    }

;@endregion Instance Methods
}
