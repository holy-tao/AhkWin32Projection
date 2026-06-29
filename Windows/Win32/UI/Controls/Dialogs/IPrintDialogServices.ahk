#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Graphics\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods that enable an application using the PrintDlgEx function to retrieve information about the currently selected printer.
 * @remarks
 * This printer is indicated on the list of installed printers on the <b>General</b> page of the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/print-property-sheet">Print Property Sheet</a>.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nn-commdlg-iprintdialogservices
 * @namespace Windows.Win32.UI.Controls.Dialogs
 */
export default struct IPrintDialogServices extends IUnknown {
    /**
     * The interface identifier for IPrintDialogServices
     * @type {Guid}
     */
    static IID := Guid("{509aaeda-5639-11d1-b6a1-0000f8757bf9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintDialogServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentDevMode     : IntPtr
        GetCurrentPrinterName : IntPtr
        GetCurrentPortName    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintDialogServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * If an error occurs, the return value is a COM error code. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-iprintdialogservices-getcurrentdevmode
     */
    GetCurrentDevMode(pDevMode, pcbSize) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, DEVMODEA.Ptr, pDevMode, pcbSizeMarshal, pcbSize, "HRESULT")
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
     * If an error occurs, the return value is a COM error code. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-iprintdialogservices-getcurrentprintername
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
     * If an error occurs, the return value is a COM error code. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-iprintdialogservices-getcurrentportname
     */
    GetCurrentPortName(pPortName, pcchSize) {
        pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

        pcchSizeMarshal := pcchSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pPortName, pcchSizeMarshal, pcchSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintDialogServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentDevMode := CallbackCreate(GetMethod(implObj, "GetCurrentDevMode"), flags, 3)
        this.vtbl.GetCurrentPrinterName := CallbackCreate(GetMethod(implObj, "GetCurrentPrinterName"), flags, 3)
        this.vtbl.GetCurrentPortName := CallbackCreate(GetMethod(implObj, "GetCurrentPortName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentDevMode)
        CallbackFree(this.vtbl.GetCurrentPrinterName)
        CallbackFree(this.vtbl.GetCurrentPortName)
    }
}
