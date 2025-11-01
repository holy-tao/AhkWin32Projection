#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrintWorkflowConfigurationNative extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowConfigurationNative
     * @type {Guid}
     */
    static IID => Guid("{c056be0a-9ee2-450a-9823-964f0006f2bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrinterQueue", "get_DriverProperties", "get_UserProperties"]

    /**
     * 
     * @param {Pointer<IPrinterQueue>} value 
     * @returns {HRESULT} 
     */
    get_PrinterQueue(value) {
        result := ComCall(3, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrinterPropertyBag>} value 
     * @returns {HRESULT} 
     */
    get_DriverProperties(value) {
        result := ComCall(4, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrinterPropertyBag>} value 
     * @returns {HRESULT} 
     */
    get_UserProperties(value) {
        result := ComCall(5, this, "ptr*", value, "HRESULT")
        return result
    }
}
