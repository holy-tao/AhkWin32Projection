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
     * 
     * @returns {HRESULT} 
     */
    DrawVideoImageBegin() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DrawVideoImageEnd() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} lprcSrc 
     * @param {Pointer<RECT>} lprcDst 
     * @returns {HRESULT} 
     */
    DrawVideoImageDraw(hdc, lprcSrc, lprcDst) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(5, this, "ptr", hdc, "ptr", lprcSrc, "ptr", lprcDst, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
