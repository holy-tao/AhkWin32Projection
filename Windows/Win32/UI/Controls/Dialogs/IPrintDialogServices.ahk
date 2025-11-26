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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentDevMode", "GetCurrentPrinterName", "GetCurrentPortName"]

    /**
     * Fills a DEVMODE structure with information about the currently selected printer for use with PrintDlgEx.
     * @param {Pointer<DEVMODEA>} pDevMode Type: <b>LPDEVMODE</b>
     * 
     * A pointer to a buffer that receives a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure containing information about the currently selected printer.
     * @param {Pointer<Integer>} pcbSize Type: <b>UINT*</b>
     * 
     * On input, the variable specifies the size, in bytes, of the buffer pointed to by the <i>lpDevMode</i> parameter. On output, the variable contains the number of bytes written to <i>lpDevMode</i>.
     * 
     * If the size is zero on input, the function returns the required buffer size (in bytes) in <i>pcbSize</i> and does not use the <i>lpDevMode</i> buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method is successful, the return value is <b>S_OK</b>. If no printer is currently selected, the return value is <b>S_OK</b>, the value returned in <i>pcbSize</i> is zero, and the <i>lpDevMode</i> buffer is unchanged.
     * 
     * If an error occurs, the return value is a COM error code. For more information, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-iprintdialogservices-getcurrentdevmode
     */
    GetCurrentDevMode(pDevMode, pcbSize) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pDevMode, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the currently selected printer, for use with PrintDlgEx.
     * @param {PWSTR} pPrinterName Type: <b>LPTSTR</b>
     * 
     * The name of the currently selected printer.
     * @param {Pointer<Integer>} pcchSize Type: <b>UINT*</b>
     * 
     * On input, the variable specifies the size, in characters, of the buffer pointed to by the <i>lpPrinterName</i> parameter. On output, the variable contains the number of bytes (ANSI) or characters (Unicode), including the terminating null character, written to the buffer.
     * 
     *                     
     * 
     * If the size is zero on input, the function returns the required buffer size (in bytes or characters) in <i>pcchSize</i> and does not use the <i>lpPrinterName</i> buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method is successful, the return value is <b>S_OK</b>. If no printer is currently selected, the return value is <b>S_OK</b>, the value returned in <i>pcchSize</i> is zero, and the <i>lpPrinterName</i> buffer is unchanged.
     * 
     *                     
     * 
     * If an error occurs, the return value is a COM error code. For more information, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-iprintdialogservices-getcurrentprintername
     */
    GetCurrentPrinterName(pPrinterName, pcchSize) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        pcchSizeMarshal := pcchSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pPrinterName, pcchSizeMarshal, pcchSize, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the current port for use with PrintDlgEx.
     * @param {PWSTR} pPortName Type: <b>LPTSTR</b>
     * 
     * The name of the current port.
     * @param {Pointer<Integer>} pcchSize Type: <b>UINT*</b>
     * 
     * On input, the variable specifies the size, in characters, of the buffer pointed to by the <i>lpPortName</i> parameter. On output, the variable contains the number of bytes (ANSI) or characters (Unicode), including the terminating null character, written to the buffer.
     * 
     * If the size is zero on input, the function returns the required buffer size (in bytes or characters) in <i>pcchSize</i> and does not use the <i>lpPortName</i> buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method is successful, the return value is <b>S_OK</b>. If there is no current port, the return value is <b>S_OK</b>, the value returned in <i>pcchSize</i> is zero, and the <i>lpPortName</i> buffer is unchanged.
     * 
     * If an error occurs, the return value is a COM error code. For more information, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-iprintdialogservices-getcurrentportname
     */
    GetCurrentPortName(pPortName, pcchSize) {
        pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

        pcchSizeMarshal := pcchSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pPortName, pcchSizeMarshal, pcchSize, "HRESULT")
        return result
    }
}
