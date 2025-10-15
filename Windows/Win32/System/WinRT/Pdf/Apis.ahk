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
     * @param {Pointer<IDXGIDevice>} pDevice 
     * @param {Pointer<IPdfRendererNative>} ppRenderer 
     * @returns {HRESULT} 
     */
    static PdfCreateRenderer(pDevice, ppRenderer) {
        result := DllCall("Windows.Data.Pdf.dll\PdfCreateRenderer", "ptr", pDevice, "ptr", ppRenderer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
