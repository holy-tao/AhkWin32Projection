#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that enable an application using the PrintDlgEx function to retrieve information about the currently selected printer.
 * @remarks
 * 
  * This printer is indicated on the list of installed printers on the <b>General</b> page of the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/print-property-sheet">Print Property Sheet</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commdlg/nn-commdlg-iprintdialogservices
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class IPrintDialogServices extends IUnknown{
    /**
     * The interface identifier for IPrintDialogServices
     * @type {Guid}
     */
    static IID => Guid("{509aaeda-5639-11d1-b6a1-0000f8757bf9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DEVMODEA>} pDevMode 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    GetCurrentDevMode(pDevMode, pcbSize) {
        result := ComCall(3, this, "ptr", pDevMode, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pPrinterName 
     * @param {Pointer<UInt32>} pcchSize 
     * @returns {HRESULT} 
     */
    GetCurrentPrinterName(pPrinterName, pcchSize) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        result := ComCall(4, this, "ptr", pPrinterName, "uint*", pcchSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pPortName 
     * @param {Pointer<UInt32>} pcchSize 
     * @returns {HRESULT} 
     */
    GetCurrentPortName(pPortName, pcchSize) {
        pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

        result := ComCall(5, this, "ptr", pPortName, "uint*", pcchSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
