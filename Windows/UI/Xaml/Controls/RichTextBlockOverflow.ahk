#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IRichTextBlockOverflow.ahk
#Include .\IRichTextBlockOverflow2.ahk
#Include .\IRichTextBlockOverflow3.ahk
#Include .\IRichTextBlockOverflowStatics3.ahk
#Include .\IRichTextBlockOverflowStatics2.ahk
#Include .\IRichTextBlockOverflowStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\RichTextBlockOverflow.ahk
#Include .\IsTextTrimmedChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a rich text display overflow container. This element cannot have direct content. The only purpose of RichTextBlockOverflow is to display text content that does not fit in the bounds of a [RichTextBlock](richtextblock.md) or another RichTextBlockOverflow element.
 * @remarks
 * You can use a [RichTextBlock](richtextblock.md) with RichTextBlockOverflow elements to create advanced page layouts. The content for a RichTextBlockOverflow element always comes from a [RichTextBlock](richtextblock.md) element. You link RichTextBlockOverflow elements by setting them as the [OverflowContentTarget](richtextblock_overflowcontenttarget.md) of a [RichTextBlock](richtextblock.md) or another RichTextBlockOverflow.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RichTextBlockOverflow extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRichTextBlockOverflow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRichTextBlockOverflow.IID

    /**
     * Identifies the IsTextTrimmed dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.istexttrimmedproperty
     * @type {DependencyProperty} 
     */
    static IsTextTrimmedProperty {
        get => RichTextBlockOverflow.get_IsTextTrimmedProperty()
    }

    /**
     * Identifies the [MaxLines](richtextblockoverflow_maxlines.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.maxlinesproperty
     * @type {DependencyProperty} 
     */
    static MaxLinesProperty {
        get => RichTextBlockOverflow.get_MaxLinesProperty()
    }

    /**
     * Identifies the [OverflowContentTarget](richtextblockoverflow_overflowcontenttarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.overflowcontenttargetproperty
     * @type {DependencyProperty} 
     */
    static OverflowContentTargetProperty {
        get => RichTextBlockOverflow.get_OverflowContentTargetProperty()
    }

    /**
     * Identifies the [Padding](richtextblockoverflow_padding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => RichTextBlockOverflow.get_PaddingProperty()
    }

    /**
     * Identifies the [HasOverflowContent](richtextblockoverflow_hasoverflowcontent.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.hasoverflowcontentproperty
     * @type {DependencyProperty} 
     */
    static HasOverflowContentProperty {
        get => RichTextBlockOverflow.get_HasOverflowContentProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextTrimmedProperty() {
        if (!RichTextBlockOverflow.HasProp("__IRichTextBlockOverflowStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlockOverflow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockOverflowStatics3.IID)
            RichTextBlockOverflow.__IRichTextBlockOverflowStatics3 := IRichTextBlockOverflowStatics3(factoryPtr)
        }

        return RichTextBlockOverflow.__IRichTextBlockOverflowStatics3.get_IsTextTrimmedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxLinesProperty() {
        if (!RichTextBlockOverflow.HasProp("__IRichTextBlockOverflowStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlockOverflow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockOverflowStatics2.IID)
            RichTextBlockOverflow.__IRichTextBlockOverflowStatics2 := IRichTextBlockOverflowStatics2(factoryPtr)
        }

        return RichTextBlockOverflow.__IRichTextBlockOverflowStatics2.get_MaxLinesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OverflowContentTargetProperty() {
        if (!RichTextBlockOverflow.HasProp("__IRichTextBlockOverflowStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlockOverflow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockOverflowStatics.IID)
            RichTextBlockOverflow.__IRichTextBlockOverflowStatics := IRichTextBlockOverflowStatics(factoryPtr)
        }

        return RichTextBlockOverflow.__IRichTextBlockOverflowStatics.get_OverflowContentTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!RichTextBlockOverflow.HasProp("__IRichTextBlockOverflowStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlockOverflow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockOverflowStatics.IID)
            RichTextBlockOverflow.__IRichTextBlockOverflowStatics := IRichTextBlockOverflowStatics(factoryPtr)
        }

        return RichTextBlockOverflow.__IRichTextBlockOverflowStatics.get_PaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HasOverflowContentProperty() {
        if (!RichTextBlockOverflow.HasProp("__IRichTextBlockOverflowStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlockOverflow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRichTextBlockOverflowStatics.IID)
            RichTextBlockOverflow.__IRichTextBlockOverflowStatics := IRichTextBlockOverflowStatics(factoryPtr)
        }

        return RichTextBlockOverflow.__IRichTextBlockOverflowStatics.get_HasOverflowContentProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a reference to another [RichTextBlockOverflow](richtextblockoverflow.md) that is the linked target for any text overflow from this [RichTextBlockOverflow](richtextblockoverflow.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.overflowcontenttarget
     * @type {RichTextBlockOverflow} 
     */
    OverflowContentTarget {
        get => this.get_OverflowContentTarget()
        set => this.put_OverflowContentTarget(value)
    }

    /**
     * Gets or sets a value that indicates the thickness of padding space between the boundaries of the content area and the content displayed by a [RichTextBlockOverflow](richtextblockoverflow.md).
     * @remarks
     * [RichTextBlock](richtextblock.md) also has a [Padding](richtextblock_padding.md) property, therefore the padding applied to the [RichTextBlockOverflow](richtextblockoverflow.md) can be different than on the [RichTextBlock](richtextblock.md) associated with it. The padding on the overflow won't default to the value from the associated [RichTextBlock](richtextblock.md), so you'll have to set it manually if you want the same padding on each.
     * 
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets the [RichTextBlock](richtextblock.md) content source of this [RichTextBlockOverflow](richtextblockoverflow.md).
     * @remarks
     * This is a calculated property that is reflective of how [OverflowContentTarget](richtextblock_overflowcontenttarget.md) is set.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.contentsource
     * @type {RichTextBlock} 
     */
    ContentSource {
        get => this.get_ContentSource()
    }

    /**
     * Gets a value that indicates whether the [RichTextBlockOverflow](richtextblockoverflow.md) has content that extends beyond its bounds, that can provide content to an [OverflowContentTarget](richtextblockoverflow_overflowcontenttarget.md) element.
     * @remarks
     * If HasOverflowContent is **true** and the [OverflowContentTarget](richtextblockoverflow_overflowcontenttarget.md) property is set, the extra content flows into the [OverflowContentTarget](richtextblockoverflow_overflowcontenttarget.md) element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.hasoverflowcontent
     * @type {Boolean} 
     */
    HasOverflowContent {
        get => this.get_HasOverflowContent()
    }

    /**
     * Gets a [TextPointer](../windows.ui.xaml.documents/textpointer.md) that indicates the start of content in the [RichTextBlockOverflow](richtextblockoverflow.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.contentstart
     * @type {TextPointer} 
     */
    ContentStart {
        get => this.get_ContentStart()
    }

    /**
     * Gets a [TextPointer](../windows.ui.xaml.documents/textpointer.md) that indicates the end of content in the [RichTextBlockOverflow](richtextblockoverflow.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.contentend
     * @type {TextPointer} 
     */
    ContentEnd {
        get => this.get_ContentEnd()
    }

    /**
     * Gets a value that represents the offset in pixels from the top of the content to the baseline of the first paragraph. The baseline of the paragraph is the baseline of the first line in it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.baselineoffset
     * @type {Float} 
     */
    BaselineOffset {
        get => this.get_BaselineOffset()
    }

    /**
     * Gets or sets the maximum lines of text shown in the [RichTextBlockOverflow](richtextblockoverflow.md).
     * @remarks
     * Use the **MaxLines** property to specify the maximum lines of text shown in a text block. The text control will adjust it’s height to show no more than the specified number of lines, regardless of the font size, font style, or text length.
     * 
     * Negative integer values are invalid, and will cause a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.maxlines
     * @type {Integer} 
     */
    MaxLines {
        get => this.get_MaxLines()
        set => this.put_MaxLines(value)
    }

    /**
     * Gets a value that indicates whether the control has trimmed text that overflows the content area.
     * @remarks
     * [RichTextBlockOverflow](richtextblockoverflow.md) inherits the [TextTrimming](richtextblock_texttrimming.md) behavior from the bound [RichTextBlock](richtextblock.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.istexttrimmed
     * @type {Boolean} 
     */
    IsTextTrimmed {
        get => this.get_IsTextTrimmed()
    }

    /**
     * Occurs when the [IsTextTrimmed](richtextblockoverflow_istexttrimmed.md) property value has changed.
     * @remarks
     * If the TextTrimming property of [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md)/[TextBlock](../windows.ui.xaml.controls/textblock.md) is set to None (default), no trim indicator is drawn and the [IsTextTrimmedChanged](richtextblockoverflow_istexttrimmedchanged.md) event does not fire.
     * @type {TypedEventHandler<RichTextBlockOverflow, IsTextTrimmedChangedEventArgs>}
    */
    OnIsTextTrimmedChanged {
        get {
            if(!this.HasProp("__OnIsTextTrimmedChanged")){
                this.__OnIsTextTrimmedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8f4572d1-9348-56b3-b045-cb42f98a43a4}"),
                    RichTextBlockOverflow,
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
     * Initializes a new instance of the [RichTextBlockOverflow](richtextblockoverflow.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RichTextBlockOverflow")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsTextTrimmedChangedToken")) {
            this.remove_IsTextTrimmedChanged(this.__OnIsTextTrimmedChangedToken)
            this.__OnIsTextTrimmedChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {RichTextBlockOverflow} 
     */
    get_OverflowContentTarget() {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.get_OverflowContentTarget()
    }

    /**
     * 
     * @param {RichTextBlockOverflow} value 
     * @returns {HRESULT} 
     */
    put_OverflowContentTarget(value) {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.put_OverflowContentTarget(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.put_Padding(value)
    }

    /**
     * 
     * @returns {RichTextBlock} 
     */
    get_ContentSource() {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.get_ContentSource()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasOverflowContent() {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.get_HasOverflowContent()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentStart() {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.get_ContentStart()
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentEnd() {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.get_ContentEnd()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BaselineOffset() {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.get_BaselineOffset()
    }

    /**
     * Returns a [TextPointer](../windows.ui.xaml.documents/textpointer.md) text reference from a [RichTextBlockOverflow](richtextblockoverflow.md) by hit-testing a specific [Point](../windows.foundation/point.md) within the text display area.
     * @param {POINT} point_ The point to test.
     * @returns {TextPointer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.getpositionfrompoint
     */
    GetPositionFromPoint(point_) {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.GetPositionFromPoint(point_)
    }

    /**
     * Focuses the [RichTextBlockOverflow](richtextblockoverflow.md), as if it were a conventionally focusable control.
     * @remarks
     * <!--Explain the scenario.-->
     * @param {Integer} value Specifies the desired target for focus state, as a value of the enumeration.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richtextblockoverflow.focus
     */
    Focus(value) {
        if (!this.HasProp("__IRichTextBlockOverflow")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow := IRichTextBlockOverflow(outPtr)
        }

        return this.__IRichTextBlockOverflow.Focus(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLines() {
        if (!this.HasProp("__IRichTextBlockOverflow2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow2 := IRichTextBlockOverflow2(outPtr)
        }

        return this.__IRichTextBlockOverflow2.get_MaxLines()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxLines(value) {
        if (!this.HasProp("__IRichTextBlockOverflow2")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow2 := IRichTextBlockOverflow2(outPtr)
        }

        return this.__IRichTextBlockOverflow2.put_MaxLines(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextTrimmed() {
        if (!this.HasProp("__IRichTextBlockOverflow3")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow3 := IRichTextBlockOverflow3(outPtr)
        }

        return this.__IRichTextBlockOverflow3.get_IsTextTrimmed()
    }

    /**
     * 
     * @param {TypedEventHandler<RichTextBlockOverflow, IsTextTrimmedChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsTextTrimmedChanged(handler) {
        if (!this.HasProp("__IRichTextBlockOverflow3")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow3 := IRichTextBlockOverflow3(outPtr)
        }

        return this.__IRichTextBlockOverflow3.add_IsTextTrimmedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsTextTrimmedChanged(token) {
        if (!this.HasProp("__IRichTextBlockOverflow3")) {
            if ((queryResult := this.QueryInterface(IRichTextBlockOverflow3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichTextBlockOverflow3 := IRichTextBlockOverflow3(outPtr)
        }

        return this.__IRichTextBlockOverflow3.remove_IsTextTrimmedChanged(token)
    }

;@endregion Instance Methods
}
