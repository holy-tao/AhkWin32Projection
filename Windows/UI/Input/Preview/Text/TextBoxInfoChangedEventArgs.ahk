#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextBoxInfoChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextBoxInfoChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextBoxInfoChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextBoxInfoChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {TextBoxInfo} 
     */
    TextBoxInfo {
        get => this.get_TextBoxInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TextBoxInfo} 
     */
    get_TextBoxInfo() {
        if (!this.HasProp("__ITextBoxInfoChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextBoxInfoChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxInfoChangedEventArgs := ITextBoxInfoChangedEventArgs(outPtr)
        }

        return this.__ITextBoxInfoChangedEventArgs.get_TextBoxInfo()
    }

;@endregion Instance Methods
}
