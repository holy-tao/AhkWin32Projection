#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintPreviewDxgiPackageTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintPreviewDxgiPackageTarget
     * @type {Guid}
     */
    static IID => Guid("{1a6dd0ad-1e2a-4e99-a5ba-91f17818290e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetJobPageCount", "DrawPage", "InvalidatePreview"]

    /**
     * 
     * @param {Integer} countType 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    SetJobPageCount(countType, count) {
        result := ComCall(3, this, "int", countType, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} jobPageNumber 
     * @param {IDXGISurface} pageImage 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @returns {HRESULT} 
     */
    DrawPage(jobPageNumber, pageImage, dpiX, dpiY) {
        result := ComCall(4, this, "uint", jobPageNumber, "ptr", pageImage, "float", dpiX, "float", dpiY, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidatePreview() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
