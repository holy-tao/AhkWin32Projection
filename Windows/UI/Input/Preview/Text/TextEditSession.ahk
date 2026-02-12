#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextEditSession.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextEditSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextEditSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextEditSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {TextBoxId} 
     */
    TextBoxId {
        get => this.get_TextBoxId()
    }

    /**
     * @type {Integer} 
     */
    TextLength {
        get => this.get_TextLength()
    }

    /**
     * @type {CoreTextRange} 
     */
    PopulatedRange {
        get => this.get_PopulatedRange()
    }

    /**
     * @type {TextComposition} 
     */
    Composition {
        get => this.get_Composition()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TextBoxId} 
     */
    get_TextBoxId() {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.get_TextBoxId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextLength() {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.get_TextLength()
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_PopulatedRange() {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.get_PopulatedRange()
    }

    /**
     * 
     * @param {CoreTextRange} range 
     * @returns {IAsyncAction} 
     */
    PopulateAsync(range) {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.PopulateAsync(range)
    }

    /**
     * 
     * @param {CoreTextRange} range 
     * @returns {HSTRING} 
     */
    GetText(range) {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.GetText(range)
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    GetSelectedRange() {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.GetSelectedRange()
    }

    /**
     * 
     * @param {CoreTextRange} value 
     * @returns {HRESULT} 
     */
    SetSelectedRange(value) {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.SetSelectedRange(value)
    }

    /**
     * 
     * @param {CoreTextRange} replaceRange 
     * @param {HSTRING} text 
     * @returns {CoreTextRange} 
     */
    ReplaceText(replaceRange, text) {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.ReplaceText(replaceRange, text)
    }

    /**
     * 
     * @returns {TextComposition} 
     */
    get_Composition() {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.get_Composition()
    }

    /**
     * 
     * @returns {TextComposition} 
     */
    StartComposition() {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.StartComposition()
    }

    /**
     * 
     * @param {CoreTextRange} range 
     * @returns {TextComposition} 
     */
    StartReconversion(range) {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.StartReconversion(range)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    SubmitPayload() {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.SubmitPayload()
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    SubmitPayloadAsync() {
        if (!this.HasProp("__ITextEditSession")) {
            if ((queryResult := this.QueryInterface(ITextEditSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextEditSession := ITextEditSession(outPtr)
        }

        return this.__ITextEditSession.SubmitPayloadAsync()
    }

;@endregion Instance Methods
}
