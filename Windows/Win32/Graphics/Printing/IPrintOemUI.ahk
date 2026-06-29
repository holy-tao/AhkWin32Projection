#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import ".\PRINTER_HANDLE.ahk" { PRINTER_HANDLE }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\PROPSHEETUI_INFO.ahk" { PROPSHEETUI_INFO }
#Import ".\IPrintOemCommon.ahk" { IPrintOemCommon }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OEMUIOBJ.ahk" { OEMUIOBJ }
#Import ".\OEMCUIPPARAM.ahk" { OEMCUIPPARAM }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import ".\DEVQUERYPRINT_INFO.ahk" { DEVQUERYPRINT_INFO }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintOemUI extends IPrintOemCommon {
    /**
     * The interface identifier for IPrintOemUI
     * @type {Guid}
     */
    static IID := Guid("{c6a7a9d0-774c-11d1-947f-00a0c90640b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintOemUI interfaces
    */
    struct Vtbl extends IPrintOemCommon.Vtbl {
        PublishDriverInterface : IntPtr
        CommonUIProp           : IntPtr
        DocumentPropertySheets : IntPtr
        DevicePropertySheets   : IntPtr
        DevQueryPrintEx        : IntPtr
        DeviceCapabilitiesA    : IntPtr
        UpgradePrinter         : IntPtr
        PrinterEvent           : IntPtr
        DriverEvent            : IntPtr
        QueryColorProfile      : IntPtr
        FontInstallerDlgProc   : IntPtr
        UpdateExternalFonts    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintOemUI.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(6, this, "uint", dwMode, OEMCUIPPARAM.Ptr, pOemCUIPParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPSHEETUI_INFO>} pPSUIInfo 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    DocumentPropertySheets(pPSUIInfo, _lParam) {
        result := ComCall(7, this, PROPSHEETUI_INFO.Ptr, pPSUIInfo, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPSHEETUI_INFO>} pPSUIInfo 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    DevicePropertySheets(pPSUIInfo, _lParam) {
        result := ComCall(8, this, PROPSHEETUI_INFO.Ptr, pPSUIInfo, LPARAM, _lParam, "HRESULT")
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

        result := ComCall(9, this, OEMUIOBJ.Ptr, poemuiobj, DEVQUERYPRINT_INFO.Ptr, pDQPInfo, DEVMODEA.Ptr, pPublicDM, pOEMDMMarshal, pOEMDM, "HRESULT")
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
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        pOutputMarshal := pOutput is VarRef ? "ptr" : "ptr"
        pOEMDMMarshal := pOEMDM is VarRef ? "ptr" : "ptr"
        dwResultMarshal := dwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, OEMUIOBJ.Ptr, poemuiobj, HANDLE, hPrinter, "ptr", pDeviceName, "ushort", wCapability, pOutputMarshal, pOutput, DEVMODEA.Ptr, pPublicDM, pOEMDMMarshal, pOEMDM, "uint", dwOld, dwResultMarshal, dwResult, "HRESULT")
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

        result := ComCall(12, this, "ptr", pPrinterName, "int", iDriverEvent, "uint", dwFlags, LPARAM, _lParam, "HRESULT")
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

        result := ComCall(13, this, "uint", dwDriverEvent, "uint", dwLevel, pDriverInfoMarshal, pDriverInfo, LPARAM, _lParam, "HRESULT")
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
        pOEMDMMarshal := pOEMDM is VarRef ? "ptr" : "ptr"
        pvProfileDataMarshal := pvProfileData is VarRef ? "ptr" : "ptr"
        pcbProfileDataMarshal := pcbProfileData is VarRef ? "uint*" : "ptr"
        pflProfileDataMarshal := pflProfileData is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, PRINTER_HANDLE, hPrinter, OEMUIOBJ.Ptr, poemuiobj, DEVMODEA.Ptr, pPublicDM, pOEMDMMarshal, pOEMDM, "uint", ulQueryMode, pvProfileDataMarshal, pvProfileData, pcbProfileDataMarshal, pcbProfileData, pflProfileDataMarshal, pflProfileData, "HRESULT")
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
        result := ComCall(15, this, HWND, _hWnd, "uint", usMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
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
        pwstrCartridges := pwstrCartridges is String ? StrPtr(pwstrCartridges) : pwstrCartridges

        result := ComCall(16, this, PRINTER_HANDLE, hPrinter, HANDLE, hHeap, "ptr", pwstrCartridges, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintOemUI.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PublishDriverInterface := CallbackCreate(GetMethod(implObj, "PublishDriverInterface"), flags, 2)
        this.vtbl.CommonUIProp := CallbackCreate(GetMethod(implObj, "CommonUIProp"), flags, 3)
        this.vtbl.DocumentPropertySheets := CallbackCreate(GetMethod(implObj, "DocumentPropertySheets"), flags, 3)
        this.vtbl.DevicePropertySheets := CallbackCreate(GetMethod(implObj, "DevicePropertySheets"), flags, 3)
        this.vtbl.DevQueryPrintEx := CallbackCreate(GetMethod(implObj, "DevQueryPrintEx"), flags, 5)
        this.vtbl.DeviceCapabilitiesA := CallbackCreate(GetMethod(implObj, "DeviceCapabilitiesA"), flags, 10)
        this.vtbl.UpgradePrinter := CallbackCreate(GetMethod(implObj, "UpgradePrinter"), flags, 3)
        this.vtbl.PrinterEvent := CallbackCreate(GetMethod(implObj, "PrinterEvent"), flags, 5)
        this.vtbl.DriverEvent := CallbackCreate(GetMethod(implObj, "DriverEvent"), flags, 5)
        this.vtbl.QueryColorProfile := CallbackCreate(GetMethod(implObj, "QueryColorProfile"), flags, 9)
        this.vtbl.FontInstallerDlgProc := CallbackCreate(GetMethod(implObj, "FontInstallerDlgProc"), flags, 5)
        this.vtbl.UpdateExternalFonts := CallbackCreate(GetMethod(implObj, "UpdateExternalFonts"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PublishDriverInterface)
        CallbackFree(this.vtbl.CommonUIProp)
        CallbackFree(this.vtbl.DocumentPropertySheets)
        CallbackFree(this.vtbl.DevicePropertySheets)
        CallbackFree(this.vtbl.DevQueryPrintEx)
        CallbackFree(this.vtbl.DeviceCapabilitiesA)
        CallbackFree(this.vtbl.UpgradePrinter)
        CallbackFree(this.vtbl.PrinterEvent)
        CallbackFree(this.vtbl.DriverEvent)
        CallbackFree(this.vtbl.QueryColorProfile)
        CallbackFree(this.vtbl.FontInstallerDlgProc)
        CallbackFree(this.vtbl.UpdateExternalFonts)
    }
}
