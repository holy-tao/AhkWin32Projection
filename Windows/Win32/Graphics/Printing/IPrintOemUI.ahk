#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintOemCommon.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintOemUI extends IPrintOemCommon{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintOemUI
     * @type {Guid}
     */
    static IID => Guid("{c6a7a9d0-774c-11d1-947f-00a0c90640b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PublishDriverInterface", "CommonUIProp", "DocumentPropertySheets", "DevicePropertySheets", "DevQueryPrintEx", "DeviceCapabilitiesA", "UpgradePrinter", "PrinterEvent", "DriverEvent", "QueryColorProfile", "FontInstallerDlgProc", "UpdateExternalFonts"]

    /**
     * 
     * @param {IUnknown} pIUnknown 
     * @returns {HRESULT} 
     */
    PublishDriverInterface(pIUnknown) {
        result := ComCall(5, this, "ptr", pIUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @param {Pointer<OEMCUIPPARAM>} pOemCUIPParam 
     * @returns {HRESULT} 
     */
    CommonUIProp(dwMode, pOemCUIPParam) {
        result := ComCall(6, this, "uint", dwMode, "ptr", pOemCUIPParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPSHEETUI_INFO>} pPSUIInfo 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    DocumentPropertySheets(pPSUIInfo, lParam) {
        result := ComCall(7, this, "ptr", pPSUIInfo, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPSHEETUI_INFO>} pPSUIInfo 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    DevicePropertySheets(pPSUIInfo, lParam) {
        result := ComCall(8, this, "ptr", pPSUIInfo, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {Pointer<DEVQUERYPRINT_INFO>} pDQPInfo 
     * @param {Pointer<DEVMODEA>} pPublicDM 
     * @param {Pointer<Void>} pOEMDM 
     * @returns {HRESULT} 
     */
    DevQueryPrintEx(poemuiobj, pDQPInfo, pPublicDM, pOEMDM) {
        result := ComCall(9, this, "ptr", poemuiobj, "ptr", pDQPInfo, "ptr", pPublicDM, "ptr", pOEMDM, "HRESULT")
        return result
    }

    /**
     * The DeviceCapabilities function retrieves the capabilities of a printer driver.
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {HANDLE} hPrinter 
     * @param {PWSTR} pDeviceName 
     * @param {Integer} wCapability 
     * @param {Pointer<Void>} pOutput A pointer to an array. The format of the array depends on the setting of the <i>fwCapability</i> parameter. See each capability above to find out what is returned if <i>pOutput</i> is <b>NULL</b>.
     * @param {Pointer<DEVMODEA>} pPublicDM 
     * @param {Pointer<Void>} pOEMDM 
     * @param {Integer} dwOld 
     * @param {Pointer<Integer>} dwResult 
     * @returns {HRESULT} If the function succeeds, the return value depends on the setting of the <i>fwCapability</i> parameter. A return value of zero generally indicates that, while the function completed successfully, there was some type of failure, such as a capability that is not supported. For more details, see the descriptions for the <i>fwCapability</i> values.
     * 
     * If the function returns -1, this may mean either that the capability is not supported or there was a general function failure.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-devicecapabilitiesa
     */
    DeviceCapabilitiesA(poemuiobj, hPrinter, pDeviceName, wCapability, pOutput, pPublicDM, pOEMDM, dwOld, dwResult) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := ComCall(10, this, "ptr", poemuiobj, "ptr", hPrinter, "ptr", pDeviceName, "ushort", wCapability, "ptr", pOutput, "ptr", pPublicDM, "ptr", pOEMDM, "uint", dwOld, "uint*", dwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLevel 
     * @param {Pointer<Integer>} pDriverUpgradeInfo 
     * @returns {HRESULT} 
     */
    UpgradePrinter(dwLevel, pDriverUpgradeInfo) {
        result := ComCall(11, this, "uint", dwLevel, "char*", pDriverUpgradeInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pPrinterName 
     * @param {Integer} iDriverEvent 
     * @param {Integer} dwFlags 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    PrinterEvent(pPrinterName, iDriverEvent, dwFlags, lParam) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        result := ComCall(12, this, "ptr", pPrinterName, "int", iDriverEvent, "uint", dwFlags, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDriverEvent 
     * @param {Integer} dwLevel 
     * @param {Pointer<Integer>} pDriverInfo 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    DriverEvent(dwDriverEvent, dwLevel, pDriverInfo, lParam) {
        result := ComCall(13, this, "uint", dwDriverEvent, "uint", dwLevel, "char*", pDriverInfo, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<OEMUIOBJ>} poemuiobj 
     * @param {Pointer<DEVMODEA>} pPublicDM 
     * @param {Pointer<Void>} pOEMDM 
     * @param {Integer} ulQueryMode 
     * @param {Pointer<Void>} pvProfileData 
     * @param {Pointer<Integer>} pcbProfileData 
     * @param {Pointer<Integer>} pflProfileData 
     * @returns {HRESULT} 
     */
    QueryColorProfile(hPrinter, poemuiobj, pPublicDM, pOEMDM, ulQueryMode, pvProfileData, pcbProfileData, pflProfileData) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := ComCall(14, this, "ptr", hPrinter, "ptr", poemuiobj, "ptr", pPublicDM, "ptr", pOEMDM, "uint", ulQueryMode, "ptr", pvProfileData, "uint*", pcbProfileData, "uint*", pflProfileData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} usMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    FontInstallerDlgProc(hWnd, usMsg, wParam, lParam) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(15, this, "ptr", hWnd, "uint", usMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {HANDLE} hHeap 
     * @param {PWSTR} pwstrCartridges 
     * @returns {HRESULT} 
     */
    UpdateExternalFonts(hPrinter, hHeap, pwstrCartridges) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        hHeap := hHeap is Win32Handle ? NumGet(hHeap, "ptr") : hHeap
        pwstrCartridges := pwstrCartridges is String ? StrPtr(pwstrCartridges) : pwstrCartridges

        result := ComCall(16, this, "ptr", hPrinter, "ptr", hHeap, "ptr", pwstrCartridges, "HRESULT")
        return result
    }
}
