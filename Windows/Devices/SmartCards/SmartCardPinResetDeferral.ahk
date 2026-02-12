#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardPinResetDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a wait time for a requested smart card personal identification number (PIN) reset.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinresetdeferral
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardPinResetDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardPinResetDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardPinResetDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns a wait time completion for a smart card personal identification number (PIN) reset.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinresetdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__ISmartCardPinResetDeferral")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinResetDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinResetDeferral := ISmartCardPinResetDeferral(outPtr)
        }

        return this.__ISmartCardPinResetDeferral.Complete()
    }

;@endregion Instance Methods
}
