#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFocusEnteredEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class FocusEnteredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFocusEnteredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFocusEnteredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {TextBoxInfo} 
     */
    FocusedTextBoxInfo {
        get => this.get_FocusedTextBoxInfo()
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
    get_FocusedTextBoxInfo() {
        if (!this.HasProp("__IFocusEnteredEventArgs")) {
            if ((queryResult := this.QueryInterface(IFocusEnteredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusEnteredEventArgs := IFocusEnteredEventArgs(outPtr)
        }

        return this.__IFocusEnteredEventArgs.get_FocusedTextBoxInfo()
    }

;@endregion Instance Methods
}
