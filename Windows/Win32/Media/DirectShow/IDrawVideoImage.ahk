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
     * Note  This interface has been deprecated. New applications should not use it. The DrawVideoImageBegin method turns off DirectDraw in preparation for a call to the DrawVideoImageDraw method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idrawvideoimage-drawvideoimagebegin
     */
    DrawVideoImageBegin() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Note  This interface has been deprecated. New applications should not use it. The DrawVideoImageEnd method turns DirectDraw back on after drawing has been performed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idrawvideoimage-drawvideoimageend
     */
    DrawVideoImageEnd() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Note  This interface has been deprecated. New applications should not use it. The DrawVideoImageDraw method draws the specified source rectangle to the specified destination rectangle in the specified GDI device context.
     * @param {HDC} hdc Specifies the device context.
     * @param {Pointer<RECT>} lprcSrc Pointer to a <b>RECT</b> structure that specifies the source rectangle, as a subrectangle of the current video frame.
     * @param {Pointer<RECT>} lprcDst Pointer to a <b>RECT</b> structure that specifies the destination rectangle in the device context.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idrawvideoimage-drawvideoimagedraw
     */
    DrawVideoImageDraw(hdc, lprcSrc, lprcDst) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(5, this, "ptr", hdc, "ptr", lprcSrc, "ptr", lprcDst, "HRESULT")
        return result
    }
}
