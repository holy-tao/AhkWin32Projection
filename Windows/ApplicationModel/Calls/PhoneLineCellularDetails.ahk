#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneLineCellularDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides detailed interaction with the cellular components of a phone line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinecellulardetails
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineCellularDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneLineCellularDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneLineCellularDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the state of the SIM card associated with a cellular phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinecellulardetails.simstate
     * @type {Integer} 
     */
    SimState {
        get => this.get_SimState()
    }

    /**
     * Get the slot index of the SIM card associated with a cellular phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinecellulardetails.simslotindex
     * @type {Integer} 
     */
    SimSlotIndex {
        get => this.get_SimSlotIndex()
    }

    /**
     * Indicates if the modem for this phone line is on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinecellulardetails.ismodemon
     * @type {Boolean} 
     */
    IsModemOn {
        get => this.get_IsModemOn()
    }

    /**
     * Gets the registration reject code for the phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinecellulardetails.registrationrejectcode
     * @type {Integer} 
     */
    RegistrationRejectCode {
        get => this.get_RegistrationRejectCode()
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
    get_SimState() {
        if (!this.HasProp("__IPhoneLineCellularDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneLineCellularDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineCellularDetails := IPhoneLineCellularDetails(outPtr)
        }

        return this.__IPhoneLineCellularDetails.get_SimState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SimSlotIndex() {
        if (!this.HasProp("__IPhoneLineCellularDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneLineCellularDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineCellularDetails := IPhoneLineCellularDetails(outPtr)
        }

        return this.__IPhoneLineCellularDetails.get_SimSlotIndex()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsModemOn() {
        if (!this.HasProp("__IPhoneLineCellularDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneLineCellularDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineCellularDetails := IPhoneLineCellularDetails(outPtr)
        }

        return this.__IPhoneLineCellularDetails.get_IsModemOn()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RegistrationRejectCode() {
        if (!this.HasProp("__IPhoneLineCellularDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneLineCellularDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineCellularDetails := IPhoneLineCellularDetails(outPtr)
        }

        return this.__IPhoneLineCellularDetails.get_RegistrationRejectCode()
    }

    /**
     * Retrieves the appropriate connection string to display to the user.
     * @param {Integer} location_ The location where the text string is needed. This affects the format of the returned string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinecellulardetails.getnetworkoperatordisplaytext
     */
    GetNetworkOperatorDisplayText(location_) {
        if (!this.HasProp("__IPhoneLineCellularDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneLineCellularDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineCellularDetails := IPhoneLineCellularDetails(outPtr)
        }

        return this.__IPhoneLineCellularDetails.GetNetworkOperatorDisplayText(location_)
    }

;@endregion Instance Methods
}
