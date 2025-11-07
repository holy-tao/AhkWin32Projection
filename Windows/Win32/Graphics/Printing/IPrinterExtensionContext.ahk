#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrinterQueue.ahk
#Include .\IPrintSchemaTicket.ahk
#Include .\IPrinterPropertyBag.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterExtensionContext
     * @type {Guid}
     */
    static IID => Guid("{39843bf2-c4d2-41fd-b4b2-aedbee5e1900}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrinterQueue", "get_PrintSchemaTicket", "get_DriverProperties", "get_UserProperties"]

    /**
     * 
     * @returns {IPrinterQueue} 
     */
    get_PrinterQueue() {
        result := ComCall(7, this, "ptr*", &ppQueue := 0, "HRESULT")
        return IPrinterQueue(ppQueue)
    }

    /**
     * 
     * @returns {IPrintSchemaTicket} 
     */
    get_PrintSchemaTicket() {
        result := ComCall(8, this, "ptr*", &ppTicket := 0, "HRESULT")
        return IPrintSchemaTicket(ppTicket)
    }

    /**
     * 
     * @returns {IPrinterPropertyBag} 
     */
    get_DriverProperties() {
        result := ComCall(9, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterPropertyBag(ppPropertyBag)
    }

    /**
     * 
     * @returns {IPrinterPropertyBag} 
     */
    get_UserProperties() {
        result := ComCall(10, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterPropertyBag(ppPropertyBag)
    }
}
