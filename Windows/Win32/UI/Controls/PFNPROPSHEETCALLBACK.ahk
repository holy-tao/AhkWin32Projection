#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * An application-defined callback function that the system calls when the property sheet is being created and initialized.
 * @remarks
 * To enable a *PropSheetProc* callback function, use the <a href="https://docs.microsoft.com/windows/win32/controls/pss-propsheetheader">PROPSHEETHEADER</a> structure when you call the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-propertysheeta">PropertySheet</a> function to create the property sheet. Use the *pfnCallback* member to specify an address of the callback function, and set the PSP_USECALLBACK flag in the *dwFlags* member.
 * 
 * *PropSheetProc* is a placeholder for the application-defined function name. The **PFNPROPSHEETCALLBACK** type is the address of a *PropSheetProc* callback function.
 * @see https://learn.microsoft.com/windows/win32/api/prsht/nc-prsht-pfnpropsheetcallback
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PFNPROPSHEETCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFNPROPSHEETCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Handle to the property sheet. This parameter is typically called *hWnd*.
     * @param {Integer} param1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Message being received. This parameter is typically called *uMsg*.
     * @param {LPARAM} param2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Additional information about the message. This parameter is typically called *lParam*.
     * 
     * The meaning of this value depends on the *uMsg* (*unnamedParam2*) parameter:
     * 
     * * If *uMsg* is  PSCB_INITIALIZED or PSCB_BUTTONPRESSED, the value of this parameter is zero.
     * * If *uMsg* is PSCB_PRECREATE, then this parameter will be a pointer to either a  <a href="../winuser/ns-winuser-dlgtemplate.md">DLGTEMPLATE</a> or <a href="https://docs.microsoft.com/windows/win32/dlgbox/dlgtemplateex">DLGTEMPLATEEX</a> structure describing the property sheet dialog box. Test the signature of the structure to determine the type. If signature is equal to 0xFFFF then the structure is an extended dialog template, otherwise the structure is a standard dialog template. The following example demonstrates how to do this.
     * 
     *     ```cpp
     *     if (uMsg == PSCB_PRECREATE) 
     *     {
     *          if (lParam)
     *          {
     *               DLGTEMPLATE *pDlgTemplate;
     *               DLGTEMPLATEEX *pDlgTemplateEx;
     *               
     *               pDlgTemplateEx = (DLGTEMPLATEEX *)lParam;  
     *               if (pDlgTemplateEx->signature == 0xFFFF)
     *               {
     *                    // pDlgTemplateEx points to an extended  
     *                    // dialog template structure.
     *               }
     *               else
     *               {
     *                    // This is a standard dialog template
     *                    //  structure.
     *                    pDlgTemplate = (DLGTEMPLATE *)lParam;
     *               }
     *          }    
     *     }
     *     ```
     * @returns {Integer} Type: <b>int</b>
     * 
     * Returns zero.
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, HWND, param0, UInt32, param1, LPARAM, param2, Int32)
        return result
    }

    /**
     * A PFNPROPSHEETCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNPROPSHEETCALLBACK {
        /**
         * Creates a PFNPROPSHEETCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, LPARAM, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
