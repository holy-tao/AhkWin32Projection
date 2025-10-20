#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaStream.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//ddstream/nn-ddstream-idirectdrawmediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDirectDrawMediaStream extends IMediaStream{
    /**
     * The interface identifier for IDirectDrawMediaStream
     * @type {Guid}
     */
    static IID => Guid("{f4104fce-9a70-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} pDDSDCurrent 
     * @param {Pointer<IDirectDrawPalette>} ppDirectDrawPalette 
     * @param {Pointer<DDSURFACEDESC>} pDDSDDesired 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFormat(pDDSDCurrent, ppDirectDrawPalette, pDDSDDesired, pdwFlags) {
        result := ComCall(9, this, "ptr", pDDSDCurrent, "ptr", ppDirectDrawPalette, "ptr", pDDSDDesired, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} pDDSurfaceDesc 
     * @param {Pointer<IDirectDrawPalette>} pDirectDrawPalette 
     * @returns {HRESULT} 
     */
    SetFormat(pDDSurfaceDesc, pDirectDrawPalette) {
        result := ComCall(10, this, "ptr", pDDSurfaceDesc, "ptr", pDirectDrawPalette, "int")
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
        result := ComCall(11, this, "ptr", ppDirectDraw, "int")
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
        result := ComCall(12, this, "ptr", pDirectDraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface>} pSurface 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDirectDrawStreamSample>} ppSample 
     * @returns {HRESULT} 
     */
    CreateSample(pSurface, pRect, dwFlags, ppSample) {
        result := ComCall(13, this, "ptr", pSurface, "ptr", pRect, "uint", dwFlags, "ptr", ppSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pFrameTime 
     * @returns {HRESULT} 
     */
    GetTimePerFrame(pFrameTime) {
        result := ComCall(14, this, "int64*", pFrameTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
