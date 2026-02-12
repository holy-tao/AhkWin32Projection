#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextCompositionSegment.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextCompositionSegment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextCompositionSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextCompositionSegment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * @type {HSTRING} 
     */
    ConvertedText {
        get => this.get_ConvertedText()
        set => this.put_ConvertedText(value)
    }

    /**
     * @type {HSTRING} 
     */
    UnconvertedText {
        get => this.get_UnconvertedText()
        set => this.put_UnconvertedText(value)
    }

    /**
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

    /**
     * @type {Integer} 
     */
    ConversionState {
        get => this.get_ConversionState()
        set => this.put_ConversionState(value)
    }

    /**
     * @type {TextCompositionSegment} 
     */
    Next {
        get => this.get_Next()
    }

    /**
     * @type {TextCompositionSegment} 
     */
    Previous {
        get => this.get_Previous()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.put_Text(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConvertedText() {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.get_ConvertedText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ConvertedText(value) {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.put_ConvertedText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnconvertedText() {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.get_UnconvertedText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UnconvertedText(value) {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.put_UnconvertedText(value)
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_Range() {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.get_Range()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConversionState() {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.get_ConversionState()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ConversionState(value) {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.put_ConversionState(value)
    }

    /**
     * 
     * @returns {TextCompositionSegment} 
     */
    get_Next() {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.get_Next()
    }

    /**
     * 
     * @returns {TextCompositionSegment} 
     */
    get_Previous() {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.get_Previous()
    }

    /**
     * 
     * @returns {TextStyle} 
     */
    GetTextStyle() {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.GetTextStyle()
    }

    /**
     * 
     * @param {TextStyle} value 
     * @returns {HRESULT} 
     */
    SetTextStyle(value) {
        if (!this.HasProp("__ITextCompositionSegment")) {
            if ((queryResult := this.QueryInterface(ITextCompositionSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionSegment := ITextCompositionSegment(outPtr)
        }

        return this.__ITextCompositionSegment.SetTextStyle(value)
    }

;@endregion Instance Methods
}
