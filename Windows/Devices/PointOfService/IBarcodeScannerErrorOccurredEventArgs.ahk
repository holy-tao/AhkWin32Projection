#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BarcodeScannerReport.ahk
#Include .\UnifiedPosErrorData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerErrorOccurredEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerErrorOccurredEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2cd2602f-cf3a-4002-a75a-c5ec468f0a20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PartialInputData", "get_IsRetriable", "get_ErrorData"]

    /**
     * @type {BarcodeScannerReport} 
     */
    PartialInputData {
        get => this.get_PartialInputData()
    }

    /**
     * @type {Boolean} 
     */
    IsRetriable {
        get => this.get_IsRetriable()
    }

    /**
     * @type {UnifiedPosErrorData} 
     */
    ErrorData {
        get => this.get_ErrorData()
    }

    /**
     * 
     * @returns {BarcodeScannerReport} 
     */
    get_PartialInputData() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BarcodeScannerReport(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRetriable() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UnifiedPosErrorData(value)
    }
}
