#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PdfPage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class IPdfDocument extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPdfDocument
     * @type {Guid}
     */
    static IID => Guid("{ac7ebedd-80fa-4089-846e-81b77ff5a86c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPage", "get_PageCount", "get_IsPasswordProtected"]

    /**
     * @type {Integer} 
     */
    PageCount {
        get => this.get_PageCount()
    }

    /**
     * @type {Boolean} 
     */
    IsPasswordProtected {
        get => this.get_IsPasswordProtected()
    }

    /**
     * 
     * @param {Integer} pageIndex 
     * @returns {PdfPage} 
     */
    GetPage(pageIndex) {
        result := ComCall(6, this, "uint", pageIndex, "ptr*", &pdfPage_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PdfPage(pdfPage_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageCount() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPasswordProtected() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
