#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how the Enhanced Video Renderer (EVR) displays video.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideodisplaycontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoDisplayControl extends IUnknown{
    /**
     * The interface identifier for IMFVideoDisplayControl
     * @type {Guid}
     */
    static IID => Guid("{a490b1e4-ab84-4d31-a1b2-181e03b1077a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SIZE>} pszVideo 
     * @param {Pointer<SIZE>} pszARVideo 
     * @returns {HRESULT} 
     */
    GetNativeVideoSize(pszVideo, pszARVideo) {
        result := ComCall(3, this, "ptr", pszVideo, "ptr", pszARVideo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pszMin 
     * @param {Pointer<SIZE>} pszMax 
     * @returns {HRESULT} 
     */
    GetIdealVideoSize(pszMin, pszMax) {
        result := ComCall(4, this, "ptr", pszMin, "ptr", pszMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource 
     * @param {Pointer<RECT>} prcDest 
     * @returns {HRESULT} 
     */
    SetVideoPosition(pnrcSource, prcDest) {
        result := ComCall(5, this, "ptr", pnrcSource, "ptr", prcDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource 
     * @param {Pointer<RECT>} prcDest 
     * @returns {HRESULT} 
     */
    GetVideoPosition(pnrcSource, prcDest) {
        result := ComCall(6, this, "ptr", pnrcSource, "ptr", prcDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAspectRatioMode 
     * @returns {HRESULT} 
     */
    SetAspectRatioMode(dwAspectRatioMode) {
        result := ComCall(7, this, "uint", dwAspectRatioMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwAspectRatioMode 
     * @returns {HRESULT} 
     */
    GetAspectRatioMode(pdwAspectRatioMode) {
        result := ComCall(8, this, "uint*", pdwAspectRatioMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndVideo 
     * @returns {HRESULT} 
     */
    SetVideoWindow(hwndVideo) {
        hwndVideo := hwndVideo is Win32Handle ? NumGet(hwndVideo, "ptr") : hwndVideo

        result := ComCall(9, this, "ptr", hwndVideo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwndVideo 
     * @returns {HRESULT} 
     */
    GetVideoWindow(phwndVideo) {
        result := ComCall(10, this, "ptr", phwndVideo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RepaintVideo() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFOHEADER>} pBih 
     * @param {Pointer<Byte>} pDib 
     * @param {Pointer<UInt32>} pcbDib 
     * @param {Pointer<Int64>} pTimeStamp 
     * @returns {HRESULT} 
     */
    GetCurrentImage(pBih, pDib, pcbDib, pTimeStamp) {
        result := ComCall(12, this, "ptr", pBih, "char*", pDib, "uint*", pcbDib, "int64*", pTimeStamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {COLORREF} Clr 
     * @returns {HRESULT} 
     */
    SetBorderColor(Clr) {
        result := ComCall(13, this, "uint", Clr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} pClr 
     * @returns {HRESULT} 
     */
    GetBorderColor(pClr) {
        result := ComCall(14, this, "ptr", pClr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRenderFlags 
     * @returns {HRESULT} 
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(15, this, "uint", dwRenderFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRenderFlags 
     * @returns {HRESULT} 
     */
    GetRenderingPrefs(pdwRenderFlags) {
        result := ComCall(16, this, "uint*", pdwRenderFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fFullscreen 
     * @returns {HRESULT} 
     */
    SetFullscreen(fFullscreen) {
        result := ComCall(17, this, "int", fFullscreen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFullscreen 
     * @returns {HRESULT} 
     */
    GetFullscreen(pfFullscreen) {
        result := ComCall(18, this, "ptr", pfFullscreen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
