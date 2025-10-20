#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintTicketProvider extends IUnknown{
    /**
     * The interface identifier for IPrintTicketProvider
     * @type {Guid}
     */
    static IID => Guid("{bb5116db-0a23-4c3a-a6b6-89e5558dfb5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<Int32>} ppVersions 
     * @param {Pointer<Int32>} cVersions 
     * @returns {HRESULT} 
     */
    GetSupportedVersions(hPrinter, ppVersions, cVersions) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := ComCall(3, this, "ptr", hPrinter, "int*", ppVersions, "int*", cVersions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} version 
     * @param {Pointer<Int32>} pOptions 
     * @param {Pointer<UInt32>} pDevModeFlags 
     * @param {Pointer<Int32>} cNamespaces 
     * @param {Pointer<BSTR>} ppNamespaces 
     * @returns {HRESULT} 
     */
    BindPrinter(hPrinter, version, pOptions, pDevModeFlags, cNamespaces, ppNamespaces) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := ComCall(4, this, "ptr", hPrinter, "int", version, "int*", pOptions, "uint*", pDevModeFlags, "int*", cNamespaces, "ptr", ppNamespaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDefaultNamespace 
     * @returns {HRESULT} 
     */
    QueryDeviceNamespace(pDefaultNamespace) {
        result := ComCall(5, this, "ptr", pDefaultNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMDocument2>} pPrintTicket 
     * @param {Integer} cbDevmodeIn 
     * @param {Pointer<DEVMODEA>} pDevmodeIn 
     * @param {Pointer<UInt32>} pcbDevmodeOut 
     * @param {Pointer<DEVMODEA>} ppDevmodeOut 
     * @returns {HRESULT} 
     */
    ConvertPrintTicketToDevMode(pPrintTicket, cbDevmodeIn, pDevmodeIn, pcbDevmodeOut, ppDevmodeOut) {
        result := ComCall(6, this, "ptr", pPrintTicket, "uint", cbDevmodeIn, "ptr", pDevmodeIn, "uint*", pcbDevmodeOut, "ptr", ppDevmodeOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbDevmode 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {Pointer<IXMLDOMDocument2>} pPrintTicket 
     * @returns {HRESULT} 
     */
    ConvertDevModeToPrintTicket(cbDevmode, pDevmode, pPrintTicket) {
        result := ComCall(7, this, "uint", cbDevmode, "ptr", pDevmode, "ptr", pPrintTicket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMDocument2>} pPrintTicket 
     * @param {Pointer<IXMLDOMDocument2>} ppCapabilities 
     * @returns {HRESULT} 
     */
    GetPrintCapabilities(pPrintTicket, ppCapabilities) {
        result := ComCall(8, this, "ptr", pPrintTicket, "ptr", ppCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMDocument2>} pBaseTicket 
     * @returns {HRESULT} 
     */
    ValidatePrintTicket(pBaseTicket) {
        result := ComCall(9, this, "ptr", pBaseTicket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
