#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IViewObjectPresentFlipSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewObjectPresentFlipSite
     * @type {Guid}
     */
    static IID => Guid("{30510846-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSurfacePresenterFlip", "GetDeviceLuid", "EnterFullScreen", "ExitFullScreen", "IsFullScreen", "GetBoundingRect", "GetMetrics", "GetFullScreenSize"]

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} backBufferCount 
     * @param {Integer} format 
     * @param {Integer} mode 
     * @param {Pointer<ISurfacePresenterFlip>} ppSPFlip 
     * @returns {HRESULT} 
     */
    CreateSurfacePresenterFlip(pDevice, width, height, backBufferCount, format, mode, ppSPFlip) {
        result := ComCall(3, this, "ptr", pDevice, "uint", width, "uint", height, "uint", backBufferCount, "int", format, "int", mode, "ptr*", ppSPFlip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LUID>} pLuid 
     * @returns {HRESULT} 
     */
    GetDeviceLuid(pLuid) {
        result := ComCall(4, this, "ptr", pLuid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnterFullScreen() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExitFullScreen() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFullScreen 
     * @returns {HRESULT} 
     */
    IsFullScreen(pfFullScreen) {
        result := ComCall(7, this, "ptr", pfFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    GetBoundingRect(pRect) {
        result := ComCall(8, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pPos 
     * @param {Pointer<SIZE>} pSize 
     * @param {Pointer<Float>} pScaleX 
     * @param {Pointer<Float>} pScaleY 
     * @returns {HRESULT} 
     */
    GetMetrics(pPos, pSize, pScaleX, pScaleY) {
        pScaleXMarshal := pScaleX is VarRef ? "float*" : "ptr"
        pScaleYMarshal := pScaleY is VarRef ? "float*" : "ptr"

        result := ComCall(9, this, "ptr", pPos, "ptr", pSize, pScaleXMarshal, pScaleX, pScaleYMarshal, pScaleY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pSize 
     * @returns {HRESULT} 
     */
    GetFullScreenSize(pSize) {
        result := ComCall(10, this, "ptr", pSize, "HRESULT")
        return result
    }
}
