#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerGetSymbologyAttributesRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerGetSymbologyAttributesRequest
     * @type {Guid}
     */
    static IID => Guid("{9774c46a-58e4-4c5f-b8e9-e41467632700}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Symbology", "ReportCompletedAsync", "ReportFailedAsync"]

    /**
     * @type {Integer} 
     */
    Symbology {
        get => this.get_Symbology()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Symbology() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {BarcodeSymbologyAttributes} attributes 
     * @returns {IAsyncAction} 
     */
    ReportCompletedAsync(attributes) {
        result := ComCall(7, this, "ptr", attributes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ReportFailedAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
