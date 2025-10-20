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
     * 
     * @param {Pointer<IDirectDraw>} pDDrawObject 
     * @returns {HRESULT} 
     */
    SetDDrawObject(pDDrawObject) {
        result := ComCall(3, this, "ptr", pDDrawObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDraw>} ppDDrawObject 
     * @param {Pointer<BOOL>} pbUsingExternal 
     * @returns {HRESULT} 
     */
    GetDDrawObject(ppDDrawObject, pbUsingExternal) {
        result := ComCall(4, this, "ptr", ppDDrawObject, "ptr", pbUsingExternal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface>} pDDrawSurface 
     * @returns {HRESULT} 
     */
    SetDDrawSurface(pDDrawSurface) {
        result := ComCall(5, this, "ptr", pDDrawSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface>} ppDDrawSurface 
     * @param {Pointer<BOOL>} pbUsingExternal 
     * @returns {HRESULT} 
     */
    GetDDrawSurface(ppDDrawSurface, pbUsingExternal) {
        result := ComCall(6, this, "ptr", ppDDrawSurface, "ptr", pbUsingExternal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcSource 
     * @param {Pointer<RECT>} prcTarget 
     * @returns {HRESULT} 
     */
    SetDrawParameters(prcSource, prcTarget) {
        result := ComCall(7, this, "ptr", prcSource, "ptr", prcTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVideoWidth 
     * @param {Pointer<UInt32>} pdwVideoHeight 
     * @param {Pointer<UInt32>} pdwPictAspectRatioX 
     * @param {Pointer<UInt32>} pdwPictAspectRatioY 
     * @returns {HRESULT} 
     */
    GetNativeVideoProps(pdwVideoWidth, pdwVideoHeight, pdwPictAspectRatioX, pdwPictAspectRatioY) {
        result := ComCall(8, this, "uint*", pdwVideoWidth, "uint*", pdwVideoHeight, "uint*", pdwPictAspectRatioX, "uint*", pdwPictAspectRatioY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDDrawExclModeVideoCallback>} pCallback 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetCallbackInterface(pCallback, dwFlags) {
        result := ComCall(9, this, "ptr", pCallback, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
