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
     * The IImageList::ImageListSetIcon method enables a user to set an icon in the image list or to create an icon if it is not there.
     * @param {Pointer<Pointer>} pIcon A value that specifies the Win32
     *       HICON handle to the icon to set. The type must be cast as a pointer to a LONG_PTR. The snap-in owns this resource and must free it when finished. A resource memory leak will occur if the snap-in does not free Icon.
     * @param {Integer} nLoc A value that specifies the index assigned to the entry. This is a virtual index that is internally mapped to the actual index.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iimagelist-imagelistseticon
     */
    ImageListSetIcon(pIcon, nLoc) {
        pIconMarshal := pIcon is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pIconMarshal, pIcon, "int", nLoc, "HRESULT")
        return result
    }

    /**
     * The IImageList::ImageListSetStrip method enables a user to add a strip of icons to the image list using a pair of bitmaps (large and small icons), starting at a location identified by nStartLoc.
     * @param {Pointer<Pointer>} pBMapSm Win32 HBITMAP handle to the small (16x16) icon image strip. The snap-in owns this resource and must free it when finished. A resource memory leak will occur if the snap-in does not free BMapSm.
     * @param {Pointer<Pointer>} pBMapLg Win32 HBITMAP handle to the large (32x32) icon image strip. The snap-in owns this resource and must free it when finished. A resource memory leak will occur if the snap-in does not free BMapLg.
     * @param {Integer} nStartLoc A value that specifies the index assigned to the first image in the strip. This is a virtual index that is internally mapped to the actual index.
     * @param {COLORREF} cMask A value that specifies the color used to generate a mask.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iimagelist-imagelistsetstrip
     */
    ImageListSetStrip(pBMapSm, pBMapLg, nStartLoc, cMask) {
        pBMapSmMarshal := pBMapSm is VarRef ? "ptr*" : "ptr"
        pBMapLgMarshal := pBMapLg is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pBMapSmMarshal, pBMapSm, pBMapLgMarshal, pBMapLg, "int", nStartLoc, "uint", cMask, "HRESULT")
        return result
    }
}
