#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCard.ahk
#Include .\ISmartCardConnect.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents info about a smart card.
  * 
  * The [SmartCard](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/SmartCard) sample application shows how to use **Windows.Devices.SmartCards** APIs to work with smart cards and smart card readers programmatically. The [Near field communication (NFC) sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/Nfc) application also shows how to communicate with a smart card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcard
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCard extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCard

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCard.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info about the smart card reader into which the smart card is inserted.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcard.reader
     * @type {SmartCardReader} 
     */
    Reader {
        get => this.get_Reader()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SmartCardReader} 
     */
    get_Reader() {
        if (!this.HasProp("__ISmartCard")) {
            if ((queryResult := this.QueryInterface(ISmartCard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCard := ISmartCard(outPtr)
        }

        return this.__ISmartCard.get_Reader()
    }

    /**
     * Returns the smart card's status.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcard.getstatusasync
     */
    GetStatusAsync() {
        if (!this.HasProp("__ISmartCard")) {
            if ((queryResult := this.QueryInterface(ISmartCard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCard := ISmartCard(outPtr)
        }

        return this.__ISmartCard.GetStatusAsync()
    }

    /**
     * Returns the smart card's *Answer to Reset* (ATR), a standard series of bytes that contains info about the smart card's characteristics, behaviors, and state.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcard.getanswertoresetasync
     */
    GetAnswerToResetAsync() {
        if (!this.HasProp("__ISmartCard")) {
            if ((queryResult := this.QueryInterface(ISmartCard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCard := ISmartCard(outPtr)
        }

        return this.__ISmartCard.GetAnswerToResetAsync()
    }

    /**
     * Establishes a connection to the smart card and returns a [SmartCardConnection](smartcardconnection.md) object representing the connection.
     * @returns {IAsyncOperation<SmartCardConnection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcard.connectasync
     */
    ConnectAsync() {
        if (!this.HasProp("__ISmartCardConnect")) {
            if ((queryResult := this.QueryInterface(ISmartCardConnect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardConnect := ISmartCardConnect(outPtr)
        }

        return this.__ISmartCardConnect.ConnectAsync()
    }

;@endregion Instance Methods
}
