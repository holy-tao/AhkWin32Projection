#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that manipulate and interact with image lists.
 * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nn-commoncontrols-iimagelist
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IImageList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageList
     * @type {Guid}
     */
    static IID => Guid("{43136eb8-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ImageListSetIcon", "ImageListSetStrip"]

    /**
     * 
     * @param {Pointer<Pointer>} pIcon 
     * @param {Integer} nLoc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iimagelist-imagelistseticon
     */
    ImageListSetIcon(pIcon, nLoc) {
        result := ComCall(3, this, "ptr*", pIcon, "int", nLoc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pBMapSm 
     * @param {Pointer<Pointer>} pBMapLg 
     * @param {Integer} nStartLoc 
     * @param {COLORREF} cMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iimagelist-imagelistsetstrip
     */
    ImageListSetStrip(pBMapSm, pBMapLg, nStartLoc, cMask) {
        result := ComCall(4, this, "ptr*", pBMapSm, "ptr*", pBMapLg, "int", nStartLoc, "uint", cMask, "HRESULT")
        return result
    }
}
