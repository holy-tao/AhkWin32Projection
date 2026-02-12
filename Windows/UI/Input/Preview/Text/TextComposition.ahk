#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextComposition.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextComposition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextComposition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextComposition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {TextCompositionSegment} 
     */
    FirstSegment {
        get => this.get_FirstSegment()
    }

    /**
     * @type {TextCompositionSegment} 
     */
    SelectedSegment {
        get => this.get_SelectedSegment()
    }

    /**
     * @type {Integer} 
     */
    CaretPosition {
        get => this.get_CaretPosition()
        set => this.put_CaretPosition(value)
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
        if (!this.HasProp("__ITextComposition")) {
            if ((queryResult := this.QueryInterface(ITextComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextComposition := ITextComposition(outPtr)
        }

        return this.__ITextComposition.get_Text()
    }

    /**
     * 
     * @returns {TextCompositionSegment} 
     */
    get_FirstSegment() {
        if (!this.HasProp("__ITextComposition")) {
            if ((queryResult := this.QueryInterface(ITextComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextComposition := ITextComposition(outPtr)
        }

        return this.__ITextComposition.get_FirstSegment()
    }

    /**
     * 
     * @returns {TextCompositionSegment} 
     */
    get_SelectedSegment() {
        if (!this.HasProp("__ITextComposition")) {
            if ((queryResult := this.QueryInterface(ITextComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextComposition := ITextComposition(outPtr)
        }

        return this.__ITextComposition.get_SelectedSegment()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CaretPosition() {
        if (!this.HasProp("__ITextComposition")) {
            if ((queryResult := this.QueryInterface(ITextComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextComposition := ITextComposition(outPtr)
        }

        return this.__ITextComposition.get_CaretPosition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CaretPosition(value) {
        if (!this.HasProp("__ITextComposition")) {
            if ((queryResult := this.QueryInterface(ITextComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextComposition := ITextComposition(outPtr)
        }

        return this.__ITextComposition.put_CaretPosition(value)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @returns {TextCompositionSegment} 
     */
    InsertText(text) {
        if (!this.HasProp("__ITextComposition")) {
            if ((queryResult := this.QueryInterface(ITextComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextComposition := ITextComposition(outPtr)
        }

        return this.__ITextComposition.InsertText(text)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Complete() {
        if (!this.HasProp("__ITextComposition")) {
            if ((queryResult := this.QueryInterface(ITextComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextComposition := ITextComposition(outPtr)
        }

        return this.__ITextComposition.Complete()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteUnconverted() {
        if (!this.HasProp("__ITextComposition")) {
            if ((queryResult := this.QueryInterface(ITextComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextComposition := ITextComposition(outPtr)
        }

        return this.__ITextComposition.CompleteUnconverted()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteFirstSegment() {
        if (!this.HasProp("__ITextComposition")) {
            if ((queryResult := this.QueryInterface(ITextComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextComposition := ITextComposition(outPtr)
        }

        return this.__ITextComposition.CompleteFirstSegment()
    }

;@endregion Instance Methods
}
