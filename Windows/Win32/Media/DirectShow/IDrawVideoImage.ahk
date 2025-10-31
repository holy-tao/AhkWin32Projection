#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idrawvideoimage
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDrawVideoImage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDrawVideoImage
     * @type {Guid}
     */
    static IID => Guid("{48efb120-ab49-11d2-aed2-00a0c995e8d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DrawVideoImageBegin", "DrawVideoImageEnd", "DrawVideoImageDraw"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idrawvideoimage-drawvideoimagebegin
     */
    DrawVideoImageBegin() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idrawvideoimage-drawvideoimageend
     */
    DrawVideoImageEnd() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} lprcSrc 
     * @param {Pointer<RECT>} lprcDst 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idrawvideoimage-drawvideoimagedraw
     */
    DrawVideoImageDraw(hdc, lprcSrc, lprcDst) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(5, this, "ptr", hdc, "ptr", lprcSrc, "ptr", lprcDst, "HRESULT")
        return result
    }
}
