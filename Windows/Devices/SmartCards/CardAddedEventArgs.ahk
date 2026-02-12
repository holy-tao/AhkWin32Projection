#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICardAddedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [CardAdded](smartcardreader_cardadded.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.cardaddedeventargs
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class CardAddedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICardAddedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICardAddedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info about the smart card that was inserted into the smart card reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.cardaddedeventargs.smartcard
     * @type {SmartCard} 
     */
    SmartCard {
        get => this.get_SmartCard()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SmartCard} 
     */
    get_SmartCard() {
        if (!this.HasProp("__ICardAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICardAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICardAddedEventArgs := ICardAddedEventArgs(outPtr)
        }

        return this.__ICardAddedEventArgs.get_SmartCard()
    }

;@endregion Instance Methods
}
