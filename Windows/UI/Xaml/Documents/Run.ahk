#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Inline.ahk
#Include .\IRun.ahk
#Include .\IRunStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a discrete section of formatted or unformatted text.
 * @remarks
 * A Run represents a discrete section of formatted or unformatted text and can be used in a [TextBlock](../windows.ui.xaml.controls/textblock.md) or [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md). You can place multiple Run elements inside of a [Span](span.md).
 * 
 * When you use a [TextBlock](../windows.ui.xaml.controls/textblock.md), set the [TextBlock.Text](../windows.ui.xaml.controls/textblock_text.md) property directly for best performance. You typically use the Run element only when you want to format a discrete section of text within the [TextBlock](../windows.ui.xaml.controls/textblock.md).
 * 
 * For more details on the TextBlock and RichTextBlock controls, see:
 * 
 * + [TextBlock control guide](/windows/uwp/controls-and-patterns/text-block)
 * + [RichTextBlock control guide](/windows/uwp/controls-and-patterns/rich-text-block)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.run
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class Run extends Inline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRun

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRun.IID

    /**
     * Identifies the [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.run.flowdirectionproperty
     * @type {DependencyProperty} 
     */
    static FlowDirectionProperty {
        get => Run.get_FlowDirectionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FlowDirectionProperty() {
        if (!Run.HasProp("__IRunStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Run")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRunStatics.IID)
            Run.__IRunStatics := IRunStatics(factoryPtr)
        }

        return Run.__IRunStatics.get_FlowDirectionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the text contents of the [Run](run.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.run.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the direction that text and other user interface elements flow within the [Run](run.md) element that controls their layout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.run.flowdirection
     * @type {Integer} 
     */
    FlowDirection {
        get => this.get_FlowDirection()
        set => this.put_FlowDirection(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Run](run.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Run")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IRun")) {
            if ((queryResult := this.QueryInterface(IRun.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRun := IRun(outPtr)
        }

        return this.__IRun.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IRun")) {
            if ((queryResult := this.QueryInterface(IRun.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRun := IRun(outPtr)
        }

        return this.__IRun.put_Text(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlowDirection() {
        if (!this.HasProp("__IRun")) {
            if ((queryResult := this.QueryInterface(IRun.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRun := IRun(outPtr)
        }

        return this.__IRun.get_FlowDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FlowDirection(value) {
        if (!this.HasProp("__IRun")) {
            if ((queryResult := this.QueryInterface(IRun.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRun := IRun(outPtr)
        }

        return this.__IRun.put_FlowDirection(value)
    }

;@endregion Instance Methods
}
