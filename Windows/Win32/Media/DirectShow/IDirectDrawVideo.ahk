#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\DDCAPS_DX7.ahk
#Include ..\..\Graphics\DirectDraw\IDirectDraw.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectDrawVideo interface queries the Video Renderer filter about DirectDraw surfaces and hardware capabilities.Applications can use this interface to control what DirectDraw features the Video Renderer will take advantage of.
 * @see https://docs.microsoft.com/windows/win32/api//amvideo/nn-amvideo-idirectdrawvideo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDirectDrawVideo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawVideo
     * @type {Guid}
     */
    static IID => Guid("{36d39eb0-dd75-11ce-bf0e-00aa0055595a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSwitches", "SetSwitches", "GetCaps", "GetEmulatedCaps", "GetSurfaceDesc", "GetFourCCCodes", "SetDirectDraw", "GetDirectDraw", "GetSurfaceType", "SetDefault", "UseScanLine", "CanUseScanLine", "UseOverlayStretch", "CanUseOverlayStretch", "UseWhenFullScreen", "WillUseFullScreen"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getswitches
     */
    GetSwitches() {
        result := ComCall(3, this, "uint*", &pSwitches := 0, "HRESULT")
        return pSwitches
    }

    /**
     * 
     * @param {Integer} Switches 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-setswitches
     */
    SetSwitches(Switches) {
        result := ComCall(4, this, "uint", Switches, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DDCAPS_DX7} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getcaps
     */
    GetCaps() {
        pCaps := DDCAPS_DX7()
        result := ComCall(5, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * 
     * @returns {DDCAPS_DX7} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getemulatedcaps
     */
    GetEmulatedCaps() {
        pCaps := DDCAPS_DX7()
        result := ComCall(6, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} pSurfaceDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getsurfacedesc
     */
    GetSurfaceDesc(pSurfaceDesc) {
        result := ComCall(7, this, "ptr", pSurfaceDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @param {Pointer<Integer>} pCodes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getfourcccodes
     */
    GetFourCCCodes(pCount, pCodes) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pCodesMarshal := pCodes is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pCountMarshal, pCount, pCodesMarshal, pCodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDraw} pDirectDraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-setdirectdraw
     */
    SetDirectDraw(pDirectDraw) {
        result := ComCall(9, this, "ptr", pDirectDraw, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDirectDraw} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getdirectdraw
     */
    GetDirectDraw() {
        result := ComCall(10, this, "ptr*", &ppDirectDraw := 0, "HRESULT")
        return IDirectDraw(ppDirectDraw)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getsurfacetype
     */
    GetSurfaceType() {
        result := ComCall(11, this, "uint*", &pSurfaceType := 0, "HRESULT")
        return pSurfaceType
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-setdefault
     */
    SetDefault() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} UseScanLine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-usescanline
     */
    UseScanLine(UseScanLine) {
        result := ComCall(13, this, "int", UseScanLine, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-canusescanline
     */
    CanUseScanLine() {
        result := ComCall(14, this, "int*", &UseScanLine := 0, "HRESULT")
        return UseScanLine
    }

    /**
     * 
     * @param {Integer} UseOverlayStretch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-useoverlaystretch
     */
    UseOverlayStretch(UseOverlayStretch) {
        result := ComCall(15, this, "int", UseOverlayStretch, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-canuseoverlaystretch
     */
    CanUseOverlayStretch() {
        result := ComCall(16, this, "int*", &UseOverlayStretch := 0, "HRESULT")
        return UseOverlayStretch
    }

    /**
     * 
     * @param {Integer} UseWhenFullScreen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-usewhenfullscreen
     */
    UseWhenFullScreen(UseWhenFullScreen) {
        result := ComCall(17, this, "int", UseWhenFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-willusefullscreen
     */
    WillUseFullScreen() {
        result := ComCall(18, this, "int*", &UseWhenFullScreen := 0, "HRESULT")
        return UseWhenFullScreen
    }
}
