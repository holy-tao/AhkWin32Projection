#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardConnection.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a connection to a smart card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardconnection
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardConnection.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Asynchronously transmits the supplied application protocol data unit (APDU) command and returns the response.
     * @param {IBuffer} command The application protocol data unit (APDU) command to transmit to the smart card.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardconnection.transmitasync
     */
    TransmitAsync(command) {
        if (!this.HasProp("__ISmartCardConnection")) {
            if ((queryResult := this.QueryInterface(ISmartCardConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardConnection := ISmartCardConnection(outPtr)
        }

        return this.__ISmartCardConnection.TransmitAsync(command)
    }

    /**
     * Completes the smart card authentication challenge/response operation and frees associated system resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardconnection.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
