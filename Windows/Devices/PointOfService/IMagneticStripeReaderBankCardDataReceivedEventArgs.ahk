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
class IMagneticStripeReaderBankCardDataReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagneticStripeReaderBankCardDataReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2e958823-a31a-4763-882c-23725e39b08e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Report", "get_AccountNumber", "get_ExpirationDate", "get_ServiceCode", "get_Title", "get_FirstName", "get_MiddleInitial", "get_Surname", "get_Suffix"]

    /**
     * @type {MagneticStripeReaderReport} 
     */
    Report {
        get => this.get_Report()
    }

    /**
     * @type {HSTRING} 
     */
    AccountNumber {
        get => this.get_AccountNumber()
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
    ServiceCode {
        get => this.get_ServiceCode()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
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
    MiddleInitial {
        get => this.get_MiddleInitial()
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
    get_AccountNumber() {
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
    get_ServiceCode() {
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
    get_Title() {
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
    get_FirstName() {
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
    get_MiddleInitial() {
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
    get_Surname() {
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
    get_Suffix() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
