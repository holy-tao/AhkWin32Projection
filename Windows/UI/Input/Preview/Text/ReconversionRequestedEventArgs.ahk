#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IReconversionRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class ReconversionRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IReconversionRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IReconversionRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_Range() {
        if (!this.HasProp("__IReconversionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IReconversionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReconversionRequestedEventArgs := IReconversionRequestedEventArgs(outPtr)
        }

        return this.__IReconversionRequestedEventArgs.get_Range()
    }

;@endregion Instance Methods
}
