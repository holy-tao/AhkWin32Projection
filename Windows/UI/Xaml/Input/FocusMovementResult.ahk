#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFocusMovementResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the status of a focus operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmovementresult
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class FocusMovementResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFocusMovementResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFocusMovementResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a boolean value that indicates whether focus can be assigned to an object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmovementresult.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IFocusMovementResult")) {
            if ((queryResult := this.QueryInterface(IFocusMovementResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusMovementResult := IFocusMovementResult(outPtr)
        }

        return this.__IFocusMovementResult.get_Succeeded()
    }

;@endregion Instance Methods
}
