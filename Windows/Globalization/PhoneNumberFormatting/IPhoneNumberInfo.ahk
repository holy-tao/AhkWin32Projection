#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class IPhoneNumberInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneNumberInfo
     * @type {Guid}
     */
    static IID => Guid("{1c7ce4dd-c8b4-4ea3-9aef-b342e2c5b417}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CountryCode", "get_PhoneNumber", "GetLengthOfGeographicalAreaCode", "GetNationalSignificantNumber", "GetLengthOfNationalDestinationCode", "PredictNumberKind", "GetGeographicRegionCode", "CheckNumberMatch"]

    /**
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
    }

    /**
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CountryCode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLengthOfGeographicalAreaCode() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetNationalSignificantNumber() {
        result_ := HSTRING()
        result := ComCall(9, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLengthOfNationalDestinationCode() {
        result := ComCall(10, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    PredictNumberKind() {
        result := ComCall(11, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetGeographicRegionCode() {
        result_ := HSTRING()
        result := ComCall(12, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {PhoneNumberInfo} otherNumber 
     * @returns {Integer} 
     */
    CheckNumberMatch(otherNumber) {
        result := ComCall(13, this, "ptr", otherNumber, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
