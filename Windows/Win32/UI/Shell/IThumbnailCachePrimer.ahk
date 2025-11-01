#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nn-thumbcache-ithumbnailcacheprimer
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IThumbnailCachePrimer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbnailCachePrimer
     * @type {Guid}
     */
    static IID => Guid("{0f03f8fe-2b26-46f0-965a-212aa8d66b76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PageInThumbnail"]

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} wtsFlags 
     * @param {Integer} cxyRequestedThumbSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/thumbcache/nf-thumbcache-ithumbnailcacheprimer-pageinthumbnail
     */
    PageInThumbnail(psi, wtsFlags, cxyRequestedThumbSize) {
        result := ComCall(3, this, "ptr", psi, "int", wtsFlags, "uint", cxyRequestedThumbSize, "HRESULT")
        return result
    }
}
