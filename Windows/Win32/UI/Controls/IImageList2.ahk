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
     * 
     * @param {Integer} cxNewIconSize 
     * @param {Integer} cyNewIconSize 
     * @returns {HRESULT} 
     */
    Resize(cxNewIconSize, cyNewIconSize) {
        result := ComCall(32, this, "int", cxNewIconSize, "int", cyNewIconSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} pcx 
     * @param {Pointer<Int32>} pcy 
     * @returns {HRESULT} 
     */
    GetOriginalSize(iImage, dwFlags, pcx, pcy) {
        result := ComCall(33, this, "int", iImage, "uint", dwFlags, "int*", pcx, "int*", pcy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @returns {HRESULT} 
     */
    SetOriginalSize(iImage, cx, cy) {
        result := ComCall(34, this, "int", iImage, "int", cx, "int", cy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    SetCallback(punk) {
        result := ComCall(35, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetCallback(riid, ppv) {
        result := ComCall(36, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    ForceImagePresent(iImage, dwFlags) {
        result := ComCall(37, this, "int", iImage, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFirstImage 
     * @param {Integer} iLastImage 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    DiscardImages(iFirstImage, iLastImage, dwFlags) {
        result := ComCall(38, this, "int", iFirstImage, "int", iLastImage, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMAGELISTDRAWPARAMS>} pimldp 
     * @returns {HRESULT} 
     */
    PreloadImages(pimldp) {
        result := ComCall(39, this, "ptr", pimldp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMAGELISTSTATS>} pils 
     * @returns {HRESULT} 
     */
    GetStatistics(pils) {
        result := ComCall(40, this, "ptr", pils, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(41, this, "int", cx, "int", cy, "uint", flags, "int", cInitial, "int", cGrow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {HBITMAP} hbmImage 
     * @param {HBITMAP} hbmMask 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Replace2(i, hbmImage, hbmMask, punk, dwFlags) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := ComCall(42, this, "int", i, "ptr", hbmImage, "ptr", hbmMask, "ptr", punk, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<IImageList>} pil 
     * @param {Integer} iSrc 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    ReplaceFromImageList(i, pil, iSrc, punk, dwFlags) {
        result := ComCall(43, this, "int", i, "ptr", pil, "int", iSrc, "ptr", punk, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
