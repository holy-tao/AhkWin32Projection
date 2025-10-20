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
     * 
     * @param {Pointer<UInt32>} pSwitches 
     * @returns {HRESULT} 
     */
    GetSwitches(pSwitches) {
        result := ComCall(3, this, "uint*", pSwitches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Switches 
     * @returns {HRESULT} 
     */
    SetSwitches(Switches) {
        result := ComCall(4, this, "uint", Switches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDCAPS_DX7>} pCaps 
     * @returns {HRESULT} 
     */
    GetCaps(pCaps) {
        result := ComCall(5, this, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDCAPS_DX7>} pCaps 
     * @returns {HRESULT} 
     */
    GetEmulatedCaps(pCaps) {
        result := ComCall(6, this, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} pSurfaceDesc 
     * @returns {HRESULT} 
     */
    GetSurfaceDesc(pSurfaceDesc) {
        result := ComCall(7, this, "ptr", pSurfaceDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @param {Pointer<UInt32>} pCodes 
     * @returns {HRESULT} 
     */
    GetFourCCCodes(pCount, pCodes) {
        result := ComCall(8, this, "uint*", pCount, "uint*", pCodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDraw>} pDirectDraw 
     * @returns {HRESULT} 
     */
    SetDirectDraw(pDirectDraw) {
        result := ComCall(9, this, "ptr", pDirectDraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDraw>} ppDirectDraw 
     * @returns {HRESULT} 
     */
    GetDirectDraw(ppDirectDraw) {
        result := ComCall(10, this, "ptr", ppDirectDraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pSurfaceType 
     * @returns {HRESULT} 
     */
    GetSurfaceType(pSurfaceType) {
        result := ComCall(11, this, "uint*", pSurfaceType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetDefault() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} UseScanLine 
     * @returns {HRESULT} 
     */
    UseScanLine(UseScanLine) {
        result := ComCall(13, this, "int", UseScanLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} UseScanLine 
     * @returns {HRESULT} 
     */
    CanUseScanLine(UseScanLine) {
        result := ComCall(14, this, "int*", UseScanLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} UseOverlayStretch 
     * @returns {HRESULT} 
     */
    UseOverlayStretch(UseOverlayStretch) {
        result := ComCall(15, this, "int", UseOverlayStretch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} UseOverlayStretch 
     * @returns {HRESULT} 
     */
    CanUseOverlayStretch(UseOverlayStretch) {
        result := ComCall(16, this, "int*", UseOverlayStretch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} UseWhenFullScreen 
     * @returns {HRESULT} 
     */
    UseWhenFullScreen(UseWhenFullScreen) {
        result := ComCall(17, this, "int", UseWhenFullScreen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} UseWhenFullScreen 
     * @returns {HRESULT} 
     */
    WillUseFullScreen(UseWhenFullScreen) {
        result := ComCall(18, this, "int*", UseWhenFullScreen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
