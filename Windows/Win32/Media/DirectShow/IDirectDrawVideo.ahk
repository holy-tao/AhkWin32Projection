#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pSwitches 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getswitches
     */
    GetSwitches(pSwitches) {
        pSwitchesMarshal := pSwitches is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pSwitchesMarshal, pSwitches, "HRESULT")
        return result
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
     * @param {Pointer<DDCAPS_DX7>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getcaps
     */
    GetCaps(pCaps) {
        result := ComCall(5, this, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDCAPS_DX7>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getemulatedcaps
     */
    GetEmulatedCaps(pCaps) {
        result := ComCall(6, this, "ptr", pCaps, "HRESULT")
        return result
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
     * @param {Pointer<IDirectDraw>} ppDirectDraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getdirectdraw
     */
    GetDirectDraw(ppDirectDraw) {
        result := ComCall(10, this, "ptr*", ppDirectDraw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSurfaceType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getsurfacetype
     */
    GetSurfaceType(pSurfaceType) {
        pSurfaceTypeMarshal := pSurfaceType is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pSurfaceTypeMarshal, pSurfaceType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} UseScanLine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-canusescanline
     */
    CanUseScanLine(UseScanLine) {
        UseScanLineMarshal := UseScanLine is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, UseScanLineMarshal, UseScanLine, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} UseOverlayStretch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-canuseoverlaystretch
     */
    CanUseOverlayStretch(UseOverlayStretch) {
        UseOverlayStretchMarshal := UseOverlayStretch is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, UseOverlayStretchMarshal, UseOverlayStretch, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} UseWhenFullScreen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-willusefullscreen
     */
    WillUseFullScreen(UseWhenFullScreen) {
        UseWhenFullScreenMarshal := UseWhenFullScreen is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, UseWhenFullScreenMarshal, UseWhenFullScreen, "HRESULT")
        return result
    }
}
