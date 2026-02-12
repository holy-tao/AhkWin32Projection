#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ReceiptPrinterCapabilities.ahk
#Include .\SlipPrinterCapabilities.ahk
#Include .\JournalPrinterCapabilities.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IPosPrinterCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPosPrinterCapabilities
     * @type {Guid}
     */
    static IID => Guid("{cde95721-4380-4985-adc5-39db30cd93bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PowerReportingType", "get_IsStatisticsReportingSupported", "get_IsStatisticsUpdatingSupported", "get_DefaultCharacterSet", "get_HasCoverSensor", "get_CanMapCharacterSet", "get_IsTransactionSupported", "get_Receipt", "get_Slip", "get_Journal"]

    /**
     * @type {Integer} 
     */
    PowerReportingType {
        get => this.get_PowerReportingType()
    }

    /**
     * @type {Boolean} 
     */
    IsStatisticsReportingSupported {
        get => this.get_IsStatisticsReportingSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsStatisticsUpdatingSupported {
        get => this.get_IsStatisticsUpdatingSupported()
    }

    /**
     * @type {Integer} 
     */
    DefaultCharacterSet {
        get => this.get_DefaultCharacterSet()
    }

    /**
     * @type {Boolean} 
     */
    HasCoverSensor {
        get => this.get_HasCoverSensor()
    }

    /**
     * @type {Boolean} 
     */
    CanMapCharacterSet {
        get => this.get_CanMapCharacterSet()
    }

    /**
     * @type {Boolean} 
     */
    IsTransactionSupported {
        get => this.get_IsTransactionSupported()
    }

    /**
     * @type {ReceiptPrinterCapabilities} 
     */
    Receipt {
        get => this.get_Receipt()
    }

    /**
     * @type {SlipPrinterCapabilities} 
     */
    Slip {
        get => this.get_Slip()
    }

    /**
     * @type {JournalPrinterCapabilities} 
     */
    Journal {
        get => this.get_Journal()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PowerReportingType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsReportingSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsUpdatingSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultCharacterSet() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasCoverSensor() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMapCharacterSet() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransactionSupported() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ReceiptPrinterCapabilities} 
     */
    get_Receipt() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ReceiptPrinterCapabilities(value)
    }

    /**
     * 
     * @returns {SlipPrinterCapabilities} 
     */
    get_Slip() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SlipPrinterCapabilities(value)
    }

    /**
     * 
     * @returns {JournalPrinterCapabilities} 
     */
    get_Journal() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JournalPrinterCapabilities(value)
    }
}
