#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IImageList.ahk

/**
 * Extends IImageList by providing additional methods for manipulating and interacting with image lists.
 * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nn-commoncontrols-iimagelist2
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class IImageList2 extends IImageList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageList2
     * @type {Guid}
     */
    static IID => Guid("{192b9d83-50fc-457b-90a0-2b82a8b5dae1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Resize", "GetOriginalSize", "SetOriginalSize", "SetCallback", "GetCallback", "ForceImagePresent", "DiscardImages", "PreloadImages", "GetStatistics", "Initialize", "Replace2", "ReplaceFromImageList"]

    /**
     * 
     * @param {Integer} cxNewIconSize 
     * @param {Integer} cyNewIconSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-resize
     */
    Resize(cxNewIconSize, cyNewIconSize) {
        result := ComCall(32, this, "int", cxNewIconSize, "int", cyNewIconSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pcx 
     * @param {Pointer<Integer>} pcy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-getoriginalsize
     */
    GetOriginalSize(iImage, dwFlags, pcx, pcy) {
        pcxMarshal := pcx is VarRef ? "int*" : "ptr"
        pcyMarshal := pcy is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, "int", iImage, "uint", dwFlags, pcxMarshal, pcx, pcyMarshal, pcy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-setoriginalsize
     */
    SetOriginalSize(iImage, cx, cy) {
        result := ComCall(34, this, "int", iImage, "int", cx, "int", cy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-setcallback
     */
    SetCallback(punk) {
        result := ComCall(35, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-getcallback
     */
    GetCallback(riid, ppv) {
        result := ComCall(36, this, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-forceimagepresent
     */
    ForceImagePresent(iImage, dwFlags) {
        result := ComCall(37, this, "int", iImage, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFirstImage 
     * @param {Integer} iLastImage 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-discardimages
     */
    DiscardImages(iFirstImage, iLastImage, dwFlags) {
        result := ComCall(38, this, "int", iFirstImage, "int", iLastImage, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMAGELISTDRAWPARAMS>} pimldp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-preloadimages
     */
    PreloadImages(pimldp) {
        result := ComCall(39, this, "ptr", pimldp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMAGELISTSTATS>} pils 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-getstatistics
     */
    GetStatistics(pils) {
        result := ComCall(40, this, "ptr", pils, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @param {Integer} flags 
     * @param {Integer} cInitial 
     * @param {Integer} cGrow 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(cx, cy, flags, cInitial, cGrow) {
        result := ComCall(41, this, "int", cx, "int", cy, "uint", flags, "int", cInitial, "int", cGrow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {HBITMAP} hbmImage 
     * @param {HBITMAP} hbmMask 
     * @param {IUnknown} punk 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-replace2
     */
    Replace2(i, hbmImage, hbmMask, punk, dwFlags) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := ComCall(42, this, "int", i, "ptr", hbmImage, "ptr", hbmMask, "ptr", punk, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {IImageList} pil 
     * @param {Integer} iSrc 
     * @param {IUnknown} punk 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-replacefromimagelist
     */
    ReplaceFromImageList(i, pil, iSrc, punk, dwFlags) {
        result := ComCall(43, this, "int", i, "ptr", pil, "int", iSrc, "ptr", punk, "uint", dwFlags, "HRESULT")
        return result
    }
}
