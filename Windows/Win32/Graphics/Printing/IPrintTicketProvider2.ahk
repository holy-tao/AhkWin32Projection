#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintTicketProvider.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintTicketProvider2 extends IPrintTicketProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTicketProvider2
     * @type {Guid}
     */
    static IID => Guid("{b8a70ab2-3dfc-4fec-a074-511b13c651cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrintDeviceCapabilities", "GetPrintDeviceResources"]

    /**
     * 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @param {Pointer<IXMLDOMDocument2>} ppDeviceCapabilities 
     * @returns {HRESULT} 
     */
    GetPrintDeviceCapabilities(pPrintTicket, ppDeviceCapabilities) {
        result := ComCall(10, this, "ptr", pPrintTicket, "ptr*", ppDeviceCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszLocaleName 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @param {Pointer<IXMLDOMDocument2>} ppDeviceResources 
     * @returns {HRESULT} 
     */
    GetPrintDeviceResources(pszLocaleName, pPrintTicket, ppDeviceResources) {
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(11, this, "ptr", pszLocaleName, "ptr", pPrintTicket, "ptr*", ppDeviceResources, "HRESULT")
        return result
    }
}
