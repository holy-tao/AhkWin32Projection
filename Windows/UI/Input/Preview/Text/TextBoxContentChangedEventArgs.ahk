#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextBoxContentChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextBoxContentChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextBoxContentChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextBoxContentChangedEventArgs.IID

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
    Source {
        get => this.get_Source()
    }

    /**
     * @type {RECT} 
     */
    SelectionBounds {
        get => this.get_SelectionBounds()
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
        if (!this.HasProp("__ITextBoxContentChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextBoxContentChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxContentChangedEventArgs := ITextBoxContentChangedEventArgs(outPtr)
        }

        return this.__ITextBoxContentChangedEventArgs.get_TextBoxId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Source() {
        if (!this.HasProp("__ITextBoxContentChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextBoxContentChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxContentChangedEventArgs := ITextBoxContentChangedEventArgs(outPtr)
        }

        return this.__ITextBoxContentChangedEventArgs.get_Source()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_SelectionBounds() {
        if (!this.HasProp("__ITextBoxContentChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextBoxContentChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxContentChangedEventArgs := ITextBoxContentChangedEventArgs(outPtr)
        }

        return this.__ITextBoxContentChangedEventArgs.get_SelectionBounds()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {Boolean} 
     */
    IsContentAttributeChanged(value) {
        if (!this.HasProp("__ITextBoxContentChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextBoxContentChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxContentChangedEventArgs := ITextBoxContentChangedEventArgs(outPtr)
        }

        return this.__ITextBoxContentChangedEventArgs.IsContentAttributeChanged(value)
    }

;@endregion Instance Methods
}
