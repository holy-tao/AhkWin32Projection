#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConversionModeChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class ConversionModeChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConversionModeChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConversionModeChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    NewConversionMode {
        get => this.get_NewConversionMode()
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
    get_NewConversionMode() {
        if (!this.HasProp("__IConversionModeChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IConversionModeChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversionModeChangedEventArgs := IConversionModeChangedEventArgs(outPtr)
        }

        return this.__IConversionModeChangedEventArgs.get_NewConversionMode()
    }

;@endregion Instance Methods
}
