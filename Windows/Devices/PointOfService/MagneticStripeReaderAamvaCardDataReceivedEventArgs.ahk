#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReaderAamvaCardDataReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the American Association of Motor Vehicle Administrators (AAMVA) card data from the [AamvaCardDataReceived](claimedmagneticstripereader_aamvacarddatareceived.md) event.
 * @remarks
 * This object is created by the [AamvaCardDataReceived](claimedmagneticstripereader_aamvacarddatareceived.md) event and is returned as an argument to the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderAamvaCardDataReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagneticStripeReaderAamvaCardDataReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the additional data from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.report
     * @type {MagneticStripeReaderReport} 
     */
    Report {
        get => this.get_Report()
    }

    /**
     * Gets the license number from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.licensenumber
     * @type {HSTRING} 
     */
    LicenseNumber {
        get => this.get_LicenseNumber()
    }

    /**
     * Gets the expiration date from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.expirationdate
     * @type {HSTRING} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * Gets the restrictions from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.restrictions
     * @type {HSTRING} 
     */
    Restrictions {
        get => this.get_Restrictions()
    }

    /**
     * Gets the class from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.class
     * @type {HSTRING} 
     */
    Class {
        get => this.get_Class()
    }

    /**
     * Gets the endorsements from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.endorsements
     * @type {HSTRING} 
     */
    Endorsements {
        get => this.get_Endorsements()
    }

    /**
     * Gets the birth date from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.birthdate
     * @type {HSTRING} 
     */
    BirthDate {
        get => this.get_BirthDate()
    }

    /**
     * Gets the first name from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.firstname
     * @type {HSTRING} 
     */
    FirstName {
        get => this.get_FirstName()
    }

    /**
     * Gets the surname from the swiped card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.surname
     * @type {HSTRING} 
     */
    Surname {
        get => this.get_Surname()
    }

    /**
     * Gets the suffix from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.suffix
     * @type {HSTRING} 
     */
    Suffix {
        get => this.get_Suffix()
    }

    /**
     * Gets the gender from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.gender
     * @type {HSTRING} 
     */
    Gender {
        get => this.get_Gender()
    }

    /**
     * Gets the hair color from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.haircolor
     * @type {HSTRING} 
     */
    HairColor {
        get => this.get_HairColor()
    }

    /**
     * Gets the eye color from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.eyecolor
     * @type {HSTRING} 
     */
    EyeColor {
        get => this.get_EyeColor()
    }

    /**
     * Gets the height from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.height
     * @type {HSTRING} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the weight from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.weight
     * @type {HSTRING} 
     */
    Weight {
        get => this.get_Weight()
    }

    /**
     * Gets the address from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.address
     * @type {HSTRING} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * Gets the city from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.city
     * @type {HSTRING} 
     */
    City {
        get => this.get_City()
    }

    /**
     * Gets the state from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.state
     * @type {HSTRING} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the postal code from the swiped AAMVA card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderaamvacarddatareceivedeventargs.postalcode
     * @type {HSTRING} 
     */
    PostalCode {
        get => this.get_PostalCode()
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
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Report()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LicenseNumber() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_LicenseNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExpirationDate() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_ExpirationDate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Restrictions() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Restrictions()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Class() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Class()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Endorsements() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Endorsements()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BirthDate() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_BirthDate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirstName() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_FirstName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Surname() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Surname()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Suffix() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Suffix()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Gender() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Gender()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HairColor() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_HairColor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EyeColor() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_EyeColor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Height() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Height()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Weight() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Weight()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Address() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_Address()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_City() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_City()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_State() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PostalCode() {
        if (!this.HasProp("__IMagneticStripeReaderAamvaCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderAamvaCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs := IMagneticStripeReaderAamvaCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderAamvaCardDataReceivedEventArgs.get_PostalCode()
    }

;@endregion Instance Methods
}
