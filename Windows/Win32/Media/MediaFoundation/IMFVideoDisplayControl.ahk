#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how the Enhanced Video Renderer (EVR) displays video.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideodisplaycontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoDisplayControl extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNativeVideoSize", "GetIdealVideoSize", "SetVideoPosition", "GetVideoPosition", "SetAspectRatioMode", "GetAspectRatioMode", "SetVideoWindow", "GetVideoWindow", "RepaintVideo", "GetCurrentImage", "SetBorderColor", "GetBorderColor", "SetRenderingPrefs", "GetRenderingPrefs", "SetFullscreen", "GetFullscreen"]

    /**
     * 
     * @param {Pointer<SIZE>} pszVideo 
     * @param {Pointer<SIZE>} pszARVideo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-getnativevideosize
     */
    GetNativeVideoSize(pszVideo, pszARVideo) {
        result := ComCall(3, this, "ptr", pszVideo, "ptr", pszARVideo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pszMin 
     * @param {Pointer<SIZE>} pszMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-getidealvideosize
     */
    GetIdealVideoSize(pszMin, pszMax) {
        result := ComCall(4, this, "ptr", pszMin, "ptr", pszMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource 
     * @param {Pointer<RECT>} prcDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-setvideoposition
     */
    SetVideoPosition(pnrcSource, prcDest) {
        result := ComCall(5, this, "ptr", pnrcSource, "ptr", prcDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource 
     * @param {Pointer<RECT>} prcDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-getvideoposition
     */
    GetVideoPosition(pnrcSource, prcDest) {
        result := ComCall(6, this, "ptr", pnrcSource, "ptr", prcDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAspectRatioMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-setaspectratiomode
     */
    SetAspectRatioMode(dwAspectRatioMode) {
        result := ComCall(7, this, "uint", dwAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(8, this, "uint*", &pdwAspectRatioMode := 0, "HRESULT")
        return pdwAspectRatioMode
    }

    /**
     * 
     * @param {HWND} hwndVideo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-setvideowindow
     */
    SetVideoWindow(hwndVideo) {
        hwndVideo := hwndVideo is Win32Handle ? NumGet(hwndVideo, "ptr") : hwndVideo

        result := ComCall(9, this, "ptr", hwndVideo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-getvideowindow
     */
    GetVideoWindow() {
        phwndVideo := HWND()
        result := ComCall(10, this, "ptr", phwndVideo, "HRESULT")
        return phwndVideo
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-repaintvideo
     */
    RepaintVideo() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFOHEADER>} pBih 
     * @param {Pointer<Pointer<Integer>>} pDib 
     * @param {Pointer<Integer>} pcbDib 
     * @param {Pointer<Integer>} pTimeStamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-getcurrentimage
     */
    GetCurrentImage(pBih, pDib, pcbDib, pTimeStamp) {
        pDibMarshal := pDib is VarRef ? "ptr*" : "ptr"
        pcbDibMarshal := pcbDib is VarRef ? "uint*" : "ptr"
        pTimeStampMarshal := pTimeStamp is VarRef ? "int64*" : "ptr"

        result := ComCall(12, this, "ptr", pBih, pDibMarshal, pDib, pcbDibMarshal, pcbDib, pTimeStampMarshal, pTimeStamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {COLORREF} Clr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(13, this, "uint", Clr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {COLORREF} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-getbordercolor
     */
    GetBorderColor() {
        result := ComCall(14, this, "uint*", &pClr := 0, "HRESULT")
        return pClr
    }

    /**
     * 
     * @param {Integer} dwRenderFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(15, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(16, this, "uint*", &pdwRenderFlags := 0, "HRESULT")
        return pdwRenderFlags
    }

    /**
     * 
     * @param {BOOL} fFullscreen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-setfullscreen
     */
    SetFullscreen(fFullscreen) {
        result := ComCall(17, this, "int", fFullscreen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodisplaycontrol-getfullscreen
     */
    GetFullscreen() {
        result := ComCall(18, this, "int*", &pfFullscreen := 0, "HRESULT")
        return pfFullscreen
    }
}
