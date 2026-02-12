#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReaderBankCardDataReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides bank card data from the [BankCardDataReceived](claimedmagneticstripereader_bankcarddatareceived.md) event.
 * @remarks
 * This object is created by the [BankCardDataReceived](claimedmagneticstripereader_bankcarddatareceived.md) event and is returned as an argument to the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderBankCardDataReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagneticStripeReaderBankCardDataReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagneticStripeReaderBankCardDataReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data from the swiped bank card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs.report
     * @type {MagneticStripeReaderReport} 
     */
    Report {
        get => this.get_Report()
    }

    /**
     * Gets the account number from the swiped bank card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs.accountnumber
     * @type {HSTRING} 
     */
    AccountNumber {
        get => this.get_AccountNumber()
    }

    /**
     * Gets the expiration date from the swiped card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs.expirationdate
     * @type {HSTRING} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * Gets the service code for the swiped bank card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs.servicecode
     * @type {HSTRING} 
     */
    ServiceCode {
        get => this.get_ServiceCode()
    }

    /**
     * Gets the title from the swiped bank card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the first name from the swiped bank card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs.firstname
     * @type {HSTRING} 
     */
    FirstName {
        get => this.get_FirstName()
    }

    /**
     * Gets the middle initial from the swiped bank card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs.middleinitial
     * @type {HSTRING} 
     */
    MiddleInitial {
        get => this.get_MiddleInitial()
    }

    /**
     * Gets the surname from the swiped bank card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs.surname
     * @type {HSTRING} 
     */
    Surname {
        get => this.get_Surname()
    }

    /**
     * Gets the suffix from the swiped bank card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderbankcarddatareceivedeventargs.suffix
     * @type {HSTRING} 
     */
    Suffix {
        get => this.get_Suffix()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MagneticStripeReaderReport} 
     */
    get_Report() {
        if (!this.HasProp("__IMagneticStripeReaderBankCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderBankCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderBankCardDataReceivedEventArgs := IMagneticStripeReaderBankCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderBankCardDataReceivedEventArgs.get_Report()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountNumber() {
        if (!this.HasProp("__IMagneticStripeReaderBankCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderBankCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderBankCardDataReceivedEventArgs := IMagneticStripeReaderBankCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderBankCardDataReceivedEventArgs.get_AccountNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExpirationDate() {
        if (!this.HasProp("__IMagneticStripeReaderBankCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderBankCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderBankCardDataReceivedEventArgs := IMagneticStripeReaderBankCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderBankCardDataReceivedEventArgs.get_ExpirationDate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceCode() {
        if (!this.HasProp("__IMagneticStripeReaderBankCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderBankCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderBankCardDataReceivedEventArgs := IMagneticStripeReaderBankCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderBankCardDataReceivedEventArgs.get_ServiceCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IMagneticStripeReaderBankCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderBankCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderBankCardDataReceivedEventArgs := IMagneticStripeReaderBankCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderBankCardDataReceivedEventArgs.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirstName() {
        if (!this.HasProp("__IMagneticStripeReaderBankCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderBankCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderBankCardDataReceivedEventArgs := IMagneticStripeReaderBankCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderBankCardDataReceivedEventArgs.get_FirstName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MiddleInitial() {
        if (!this.HasProp("__IMagneticStripeReaderBankCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderBankCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderBankCardDataReceivedEventArgs := IMagneticStripeReaderBankCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderBankCardDataReceivedEventArgs.get_MiddleInitial()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Surname() {
        if (!this.HasProp("__IMagneticStripeReaderBankCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderBankCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderBankCardDataReceivedEventArgs := IMagneticStripeReaderBankCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderBankCardDataReceivedEventArgs.get_Surname()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Suffix() {
        if (!this.HasProp("__IMagneticStripeReaderBankCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderBankCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderBankCardDataReceivedEventArgs := IMagneticStripeReaderBankCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderBankCardDataReceivedEventArgs.get_Suffix()
    }

;@endregion Instance Methods
}
