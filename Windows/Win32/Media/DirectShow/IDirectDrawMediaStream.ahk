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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormat", "SetFormat", "GetDirectDraw", "SetDirectDraw", "CreateSample", "GetTimePerFrame"]

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} pDDSDCurrent 
     * @param {Pointer<IDirectDrawPalette>} ppDirectDrawPalette 
     * @param {Pointer<DDSURFACEDESC>} pDDSDDesired 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddstream/nf-ddstream-idirectdrawmediastream-getformat
     */
    GetFormat(pDDSDCurrent, ppDirectDrawPalette, pDDSDDesired, pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pDDSDCurrent, "ptr*", ppDirectDrawPalette, "ptr", pDDSDDesired, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} pDDSurfaceDesc 
     * @param {IDirectDrawPalette} pDirectDrawPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddstream/nf-ddstream-idirectdrawmediastream-setformat
     */
    SetFormat(pDDSurfaceDesc, pDirectDrawPalette) {
        result := ComCall(10, this, "ptr", pDDSurfaceDesc, "ptr", pDirectDrawPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDraw>} ppDirectDraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddstream/nf-ddstream-idirectdrawmediastream-getdirectdraw
     */
    GetDirectDraw(ppDirectDraw) {
        result := ComCall(11, this, "ptr*", ppDirectDraw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDraw} pDirectDraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddstream/nf-ddstream-idirectdrawmediastream-setdirectdraw
     */
    SetDirectDraw(pDirectDraw) {
        result := ComCall(12, this, "ptr", pDirectDraw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface} pSurface 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDirectDrawStreamSample>} ppSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddstream/nf-ddstream-idirectdrawmediastream-createsample
     */
    CreateSample(pSurface, pRect, dwFlags, ppSample) {
        result := ComCall(13, this, "ptr", pSurface, "ptr", pRect, "uint", dwFlags, "ptr*", ppSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFrameTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddstream/nf-ddstream-idirectdrawmediastream-gettimeperframe
     */
    GetTimePerFrame(pFrameTime) {
        pFrameTimeMarshal := pFrameTime is VarRef ? "int64*" : "ptr"

        result := ComCall(14, this, pFrameTimeMarshal, pFrameTime, "HRESULT")
        return result
    }
}
