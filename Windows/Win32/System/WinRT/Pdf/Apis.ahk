#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include .\IPdfRendererNative.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Pdf
 * @version v4.0.30319
 */
class Pdf {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {IDXGIDevice} pDevice 
     * @returns {IPdfRendererNative} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-pdfcreaterenderer
     */
    static PdfCreateRenderer(pDevice) {
        result := DllCall("Windows.Data.Pdf.dll\PdfCreateRenderer", "ptr", pDevice, "ptr*", &ppRenderer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPdfRendererNative(ppRenderer)
    }

;@endregion Methods
}
