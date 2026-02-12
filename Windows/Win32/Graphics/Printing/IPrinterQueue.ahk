#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\PRINTER_HANDLE.ahk
#Include .\IPrinterPropertyBag.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterQueue extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterQueue
     * @type {Guid}
     */
    static IID => Guid("{3580a828-07fe-4b94-ac1a-757d9d2d3056}")

    /**
     * The class identifier for PrinterQueue
     * @type {Guid}
     */
    static CLSID => Guid("{eb54c230-798c-4c9e-b461-29fad04039b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Handle", "get_Name", "SendBidiQuery", "GetProperties"]

    /**
     * @type {PRINTER_HANDLE} 
     */
    Handle {
        get => this.get_Handle()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {PRINTER_HANDLE} 
     */
    get_Handle() {
        phPrinter := PRINTER_HANDLE()
        result := ComCall(7, this, "ptr", phPrinter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPrinter
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(8, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrBidiQuery 
     * @returns {HRESULT} 
     */
    SendBidiQuery(bstrBidiQuery) {
        if(bstrBidiQuery is String) {
            pin := BSTR.Alloc(bstrBidiQuery)
            bstrBidiQuery := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrBidiQuery, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IPrinterPropertyBag} 
     */
    GetProperties() {
        result := ComCall(10, this, "ptr*", &ppPropertyBag := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrinterPropertyBag(ppPropertyBag)
    }
}
