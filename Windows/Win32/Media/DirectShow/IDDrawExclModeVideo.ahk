#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDDrawExclModeVideo interface enables video playback in DirectDraw exclusive full-screen mode.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iddrawexclmodevideo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDDrawExclModeVideo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDDrawExclModeVideo
     * @type {Guid}
     */
    static IID => Guid("{153acc21-d83b-11d1-82bf-00a0c9696c8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDDrawObject", "GetDDrawObject", "SetDDrawSurface", "GetDDrawSurface", "SetDrawParameters", "GetNativeVideoProps", "SetCallbackInterface"]

    /**
     * 
     * @param {IDirectDraw} pDDrawObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-setddrawobject
     */
    SetDDrawObject(pDDrawObject) {
        result := ComCall(3, this, "ptr", pDDrawObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDraw>} ppDDrawObject 
     * @param {Pointer<BOOL>} pbUsingExternal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-getddrawobject
     */
    GetDDrawObject(ppDDrawObject, pbUsingExternal) {
        result := ComCall(4, this, "ptr*", ppDDrawObject, "ptr", pbUsingExternal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface} pDDrawSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-setddrawsurface
     */
    SetDDrawSurface(pDDrawSurface) {
        result := ComCall(5, this, "ptr", pDDrawSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface>} ppDDrawSurface 
     * @param {Pointer<BOOL>} pbUsingExternal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-getddrawsurface
     */
    GetDDrawSurface(ppDDrawSurface, pbUsingExternal) {
        result := ComCall(6, this, "ptr*", ppDDrawSurface, "ptr", pbUsingExternal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcSource 
     * @param {Pointer<RECT>} prcTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-setdrawparameters
     */
    SetDrawParameters(prcSource, prcTarget) {
        result := ComCall(7, this, "ptr", prcSource, "ptr", prcTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVideoWidth 
     * @param {Pointer<Integer>} pdwVideoHeight 
     * @param {Pointer<Integer>} pdwPictAspectRatioX 
     * @param {Pointer<Integer>} pdwPictAspectRatioY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-getnativevideoprops
     */
    GetNativeVideoProps(pdwVideoWidth, pdwVideoHeight, pdwPictAspectRatioX, pdwPictAspectRatioY) {
        pdwVideoWidthMarshal := pdwVideoWidth is VarRef ? "uint*" : "ptr"
        pdwVideoHeightMarshal := pdwVideoHeight is VarRef ? "uint*" : "ptr"
        pdwPictAspectRatioXMarshal := pdwPictAspectRatioX is VarRef ? "uint*" : "ptr"
        pdwPictAspectRatioYMarshal := pdwPictAspectRatioY is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwVideoWidthMarshal, pdwVideoWidth, pdwVideoHeightMarshal, pdwVideoHeight, pdwPictAspectRatioXMarshal, pdwPictAspectRatioX, pdwPictAspectRatioYMarshal, pdwPictAspectRatioY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDDrawExclModeVideoCallback} pCallback 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-setcallbackinterface
     */
    SetCallbackInterface(pCallback, dwFlags) {
        result := ComCall(9, this, "ptr", pCallback, "uint", dwFlags, "HRESULT")
        return result
    }
}
