#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MagneticStripeReaderReport.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IMagneticStripeReaderAamvaCardDataReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagneticStripeReaderAamvaCardDataReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{0a4bbd51-c316-4910-87f3-7a62ba862d31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Report", "get_LicenseNumber", "get_ExpirationDate", "get_Restrictions", "get_Class", "get_Endorsements", "get_BirthDate", "get_FirstName", "get_Surname", "get_Suffix", "get_Gender", "get_HairColor", "get_EyeColor", "get_Height", "get_Weight", "get_Address", "get_City", "get_State", "get_PostalCode"]

    /**
     * @type {MagneticStripeReaderReport} 
     */
    Report {
        get => this.get_Report()
    }

    /**
     * @type {HSTRING} 
     */
    LicenseNumber {
        get => this.get_LicenseNumber()
    }

    /**
     * @type {HSTRING} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * @type {HSTRING} 
     */
    Restrictions {
        get => this.get_Restrictions()
    }

    /**
     * @type {HSTRING} 
     */
    Class {
        get => this.get_Class()
    }

    /**
     * @type {HSTRING} 
     */
    Endorsements {
        get => this.get_Endorsements()
    }

    /**
     * @type {HSTRING} 
     */
    BirthDate {
        get => this.get_BirthDate()
    }

    /**
     * @type {HSTRING} 
     */
    FirstName {
        get => this.get_FirstName()
    }

    /**
     * @type {HSTRING} 
     */
    Surname {
        get => this.get_Surname()
    }

    /**
     * @type {HSTRING} 
     */
    Suffix {
        get => this.get_Suffix()
    }

    /**
     * @type {HSTRING} 
     */
    Gender {
        get => this.get_Gender()
    }

    /**
     * @type {HSTRING} 
     */
    HairColor {
        get => this.get_HairColor()
    }

    /**
     * @type {HSTRING} 
     */
    EyeColor {
        get => this.get_EyeColor()
    }

    /**
     * @type {HSTRING} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {HSTRING} 
     */
    Weight {
        get => this.get_Weight()
    }

    /**
     * @type {HSTRING} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * @type {HSTRING} 
     */
    City {
        get => this.get_City()
    }

    /**
     * @type {HSTRING} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {HSTRING} 
     */
    PostalCode {
        get => this.get_PostalCode()
    }

    /**
     * 
     * @returns {MagneticStripeReaderReport} 
     */
    get_Report() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MagneticStripeReaderReport(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LicenseNumber() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExpirationDate() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Restrictions() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Class() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Endorsements() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BirthDate() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirstName() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Surname() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Suffix() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Gender() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HairColor() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EyeColor() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Height() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Weight() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Address() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_City() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_State() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PostalCode() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
