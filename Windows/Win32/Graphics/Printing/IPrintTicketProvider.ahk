#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Data\Xml\MsXml\IXMLDOMDocument2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintTicketProvider extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedVersions", "BindPrinter", "QueryDeviceNamespace", "ConvertPrintTicketToDevMode", "ConvertDevModeToPrintTicket", "GetPrintCapabilities", "ValidatePrintTicket"]

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<Pointer<Integer>>} ppVersions 
     * @param {Pointer<Integer>} cVersions 
     * @returns {HRESULT} 
     */
    GetSupportedVersions(hPrinter, ppVersions, cVersions) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        ppVersionsMarshal := ppVersions is VarRef ? "ptr*" : "ptr"
        cVersionsMarshal := cVersions is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", hPrinter, ppVersionsMarshal, ppVersions, cVersionsMarshal, cVersions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} version 
     * @param {Pointer<Integer>} pOptions 
     * @param {Pointer<Integer>} pDevModeFlags 
     * @param {Pointer<Integer>} cNamespaces 
     * @param {Pointer<Pointer<BSTR>>} ppNamespaces 
     * @returns {HRESULT} 
     */
    BindPrinter(hPrinter, version, pOptions, pDevModeFlags, cNamespaces, ppNamespaces) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        pOptionsMarshal := pOptions is VarRef ? "int*" : "ptr"
        pDevModeFlagsMarshal := pDevModeFlags is VarRef ? "uint*" : "ptr"
        cNamespacesMarshal := cNamespaces is VarRef ? "int*" : "ptr"
        ppNamespacesMarshal := ppNamespaces is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", hPrinter, "int", version, pOptionsMarshal, pOptions, pDevModeFlagsMarshal, pDevModeFlags, cNamespacesMarshal, cNamespaces, ppNamespacesMarshal, ppNamespaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDefaultNamespace 
     * @returns {HRESULT} 
     */
    QueryDeviceNamespace(pDefaultNamespace) {
        result := ComCall(5, this, "ptr", pDefaultNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @param {Integer} cbDevmodeIn 
     * @param {Pointer<DEVMODEA>} pDevmodeIn 
     * @param {Pointer<Integer>} pcbDevmodeOut 
     * @param {Pointer<Pointer<DEVMODEA>>} ppDevmodeOut 
     * @returns {HRESULT} 
     */
    ConvertPrintTicketToDevMode(pPrintTicket, cbDevmodeIn, pDevmodeIn, pcbDevmodeOut, ppDevmodeOut) {
        pcbDevmodeOutMarshal := pcbDevmodeOut is VarRef ? "uint*" : "ptr"
        ppDevmodeOutMarshal := ppDevmodeOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pPrintTicket, "uint", cbDevmodeIn, "ptr", pDevmodeIn, pcbDevmodeOutMarshal, pcbDevmodeOut, ppDevmodeOutMarshal, ppDevmodeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbDevmode 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @returns {HRESULT} 
     */
    ConvertDevModeToPrintTicket(cbDevmode, pDevmode, pPrintTicket) {
        result := ComCall(7, this, "uint", cbDevmode, "ptr", pDevmode, "ptr", pPrintTicket, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @returns {IXMLDOMDocument2} 
     */
    GetPrintCapabilities(pPrintTicket) {
        result := ComCall(8, this, "ptr", pPrintTicket, "ptr*", &ppCapabilities := 0, "HRESULT")
        return IXMLDOMDocument2(ppCapabilities)
    }

    /**
     * 
     * @param {IXMLDOMDocument2} pBaseTicket 
     * @returns {HRESULT} 
     */
    ValidatePrintTicket(pBaseTicket) {
        result := ComCall(9, this, "ptr", pBaseTicket, "HRESULT")
        return result
    }
}
