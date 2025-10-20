#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterExtensionManager
     * @type {Guid}
     */
    static IID => Guid("{93c6eb8c-b001-4355-9629-8e8a1b3f8e77}")

    /**
     * The class identifier for PrinterExtensionManager
     * @type {Guid}
     */
    static CLSID => Guid("{331b60da-9e90-4dd0-9c84-eac4e659b61f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableEvents", "DisableEvents"]

    /**
     * 
     * @param {Guid} printerDriverId 
     * @returns {HRESULT} 
     */
    EnableEvents(printerDriverId) {
        result := ComCall(3, this, "ptr", printerDriverId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableEvents() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
