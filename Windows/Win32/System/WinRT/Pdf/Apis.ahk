#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

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
     * @param {Pointer<IPdfRendererNative>} ppRenderer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.data.pdf.interop/nf-windows-data-pdf-interop-pdfcreaterenderer
     */
    static PdfCreateRenderer(pDevice, ppRenderer) {
        result := DllCall("Windows.Data.Pdf.dll\PdfCreateRenderer", "ptr", pDevice, "ptr*", ppRenderer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
