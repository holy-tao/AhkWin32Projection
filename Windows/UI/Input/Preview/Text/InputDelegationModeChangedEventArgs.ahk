#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInputDelegationModeChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class InputDelegationModeChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputDelegationModeChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputDelegationModeChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Boolean} 
     */
    DelegationOn {
        get => this.get_DelegationOn()
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
    get_DelegationOn() {
        if (!this.HasProp("__IInputDelegationModeChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IInputDelegationModeChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputDelegationModeChangedEventArgs := IInputDelegationModeChangedEventArgs(outPtr)
        }

        return this.__IInputDelegationModeChangedEventArgs.get_DelegationOn()
    }

;@endregion Instance Methods
}
