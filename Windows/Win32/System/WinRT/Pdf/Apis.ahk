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
     * Gets an instance of the IPdfRendererNative interface for displaying a single page of a Portable Document Format (PDF) file.
     * @remarks
     * This function is specifically designed for DirectX apps that use C++ and Extensible Application Markup Language (XAML).
     * 
     * The <b>PdfCreateRenderer</b> function should be called to display single pages of a PDF file,  one at a time. While you could call this function in parallel to display multiple pages at the same time, this could lead to unexpected results.
     * @param {IDXGIDevice} pDevice An instance of a  Microsoft DirectX Graphics Infrastructure (DXGI) object that is used for producing image data.
     * @returns {IPdfRendererNative} An instance of the high-performance <a href="https://docs.microsoft.com/windows/desktop/api/windows.data.pdf.interop/nn-windows-data-pdf-interop-ipdfrenderernative">IPdfRendererNative</a> interface for  rendering PDF content on a DirectX surface.
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
