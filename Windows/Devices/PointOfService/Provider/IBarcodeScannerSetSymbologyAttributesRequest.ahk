#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\BarcodeSymbologyAttributes.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerSetSymbologyAttributesRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerSetSymbologyAttributesRequest
     * @type {Guid}
     */
    static IID => Guid("{32fb814f-a37f-48b0-acea-dce1480f12ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Symbology", "get_Attributes", "ReportCompletedAsync", "ReportFailedAsync"]

    /**
     * @type {Integer} 
     */
    Symbology {
        get => this.get_Symbology()
    }

    /**
     * @type {BarcodeSymbologyAttributes} 
     */
    Attributes {
        get => this.get_Attributes()
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
     * @returns {BarcodeSymbologyAttributes} 
     */
    get_Attributes() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BarcodeSymbologyAttributes(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ReportCompletedAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
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
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
