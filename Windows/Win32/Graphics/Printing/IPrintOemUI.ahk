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
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    DocumentPropertySheets(pPSUIInfo, _lParam) {
        result := ComCall(7, this, "ptr", pPSUIInfo, "ptr", _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPSHEETUI_INFO>} pPSUIInfo 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    DevicePropertySheets(pPSUIInfo, _lParam) {
        result := ComCall(8, this, "ptr", pPSUIInfo, "ptr", _lParam, "HRESULT")
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
        pOEMDMMarshal := pOEMDM is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "ptr", poemuiobj, "ptr", pDQPInfo, "ptr", pPublicDM, pOEMDMMarshal, pOEMDM, "HRESULT")
        return result
    }

    /**
     * The DeviceCapabilities function retrieves the capabilities of a printer driver. (ANSI)
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure pointed to by the <i>pDevMode</i> parameter may be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/printdocs/documentproperties">DocumentProperties</a> function.
     * 
     * If a printer driver supports custom device capabilities, the driver must call the <a href="https://docs.microsoft.com/windows/desktop/printdocs/setprinterdata">SetPrinterData</a> function for each custom capability. The <b>SetPrinterData</b> function adds the appropriate printer data to the print system, which enables 32-bit applications to access the custom capabilities on 64-bit Windows installations.
     * 
     * For each custom capability, you must first add printer data that describes the type of the capability. To do this, when you call <b>SetPrinterData</b>, set the <i>pValueName</i> string to <b>CustomDeviceCapabilityType_Xxx</b>, where "Xxx" is the hexadecimal representation of the capability. For example, you might have "CustomDeviceCapabilityType_1234". The registry data that you set must be of the <b>REG_DWORD</b> type, and you must set its value to one of the following:
     * 
     * <ul>
     * <li>0, if the custom capability is a <b>DWORD</b></li>
     * <li>1, if the custom capability is a buffer of bytes</li>
     * <li>2, if the custom capability is an array of items</li>
     * </ul>
     * If the custom capability is an array of items, you must call <b>SetPinterData</b> a second time to provide information about the size of an item in the array. To do this, when you call <b>SetPinterData</b>, the <i>pValueName</i> string that you provide must be "CustomDeviceCapabilitySize_Xxx" where Xxx is the hexadecimal representation of the capability. For example, you might have "CustomDeviceCapabilitySize_1234". The registry data that you set must be of the <b>REG_DWORD</b> type, and you must set its value to the size in bytes of an item in the array.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines DeviceCapabilities as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
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
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-devicecapabilitiesa
     */
    DeviceCapabilitiesA(poemuiobj, hPrinter, pDeviceName, wCapability, pOutput, pPublicDM, pOEMDM, dwOld, dwResult) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        pOutputMarshal := pOutput is VarRef ? "ptr" : "ptr"
        pOEMDMMarshal := pOEMDM is VarRef ? "ptr" : "ptr"
        dwResultMarshal := dwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", poemuiobj, "ptr", hPrinter, "ptr", pDeviceName, "ushort", wCapability, pOutputMarshal, pOutput, "ptr", pPublicDM, pOEMDMMarshal, pOEMDM, "uint", dwOld, dwResultMarshal, dwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLevel 
     * @param {Pointer<Integer>} pDriverUpgradeInfo 
     * @returns {HRESULT} 
     */
    UpgradePrinter(dwLevel, pDriverUpgradeInfo) {
        pDriverUpgradeInfoMarshal := pDriverUpgradeInfo is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "uint", dwLevel, pDriverUpgradeInfoMarshal, pDriverUpgradeInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pPrinterName 
     * @param {Integer} iDriverEvent 
     * @param {Integer} dwFlags 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    PrinterEvent(pPrinterName, iDriverEvent, dwFlags, _lParam) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        result := ComCall(12, this, "ptr", pPrinterName, "int", iDriverEvent, "uint", dwFlags, "ptr", _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDriverEvent 
     * @param {Integer} dwLevel 
     * @param {Pointer<Integer>} pDriverInfo 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    DriverEvent(dwDriverEvent, dwLevel, pDriverInfo, _lParam) {
        pDriverInfoMarshal := pDriverInfo is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "uint", dwDriverEvent, "uint", dwLevel, pDriverInfoMarshal, pDriverInfo, "ptr", _lParam, "HRESULT")
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

        pOEMDMMarshal := pOEMDM is VarRef ? "ptr" : "ptr"
        pvProfileDataMarshal := pvProfileData is VarRef ? "ptr" : "ptr"
        pcbProfileDataMarshal := pcbProfileData is VarRef ? "uint*" : "ptr"
        pflProfileDataMarshal := pflProfileData is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", hPrinter, "ptr", poemuiobj, "ptr", pPublicDM, pOEMDMMarshal, pOEMDM, "uint", ulQueryMode, pvProfileDataMarshal, pvProfileData, pcbProfileDataMarshal, pcbProfileData, pflProfileDataMarshal, pflProfileData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Integer} usMsg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    FontInstallerDlgProc(_hWnd, usMsg, _wParam, _lParam) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(15, this, "ptr", _hWnd, "uint", usMsg, "ptr", _wParam, "ptr", _lParam, "HRESULT")
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
