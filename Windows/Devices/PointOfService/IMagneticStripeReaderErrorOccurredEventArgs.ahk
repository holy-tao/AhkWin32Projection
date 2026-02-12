#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UnifiedPosErrorData.ahk
#Include .\MagneticStripeReaderReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IMagneticStripeReaderErrorOccurredEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagneticStripeReaderErrorOccurredEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1fedf95d-2c84-41ad-b778-f2356a789ab1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Track1Status", "get_Track2Status", "get_Track3Status", "get_Track4Status", "get_ErrorData", "get_PartialInputData"]

    /**
     * @type {Integer} 
     */
    Track1Status {
        get => this.get_Track1Status()
    }

    /**
     * @type {Integer} 
     */
    Track2Status {
        get => this.get_Track2Status()
    }

    /**
     * @type {Integer} 
     */
    Track3Status {
        get => this.get_Track3Status()
    }

    /**
     * @type {Integer} 
     */
    Track4Status {
        get => this.get_Track4Status()
    }

    /**
     * @type {UnifiedPosErrorData} 
     */
    ErrorData {
        get => this.get_ErrorData()
    }

    /**
     * @type {MagneticStripeReaderReport} 
     */
    PartialInputData {
        get => this.get_PartialInputData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Track1Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Track2Status() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Track3Status() {
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
    get_Track4Status() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UnifiedPosErrorData} 
     */
    get_ErrorData() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UnifiedPosErrorData(value)
    }

    /**
     * 
     * @returns {MagneticStripeReaderReport} 
     */
    get_PartialInputData() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MagneticStripeReaderReport(value)
    }
}
