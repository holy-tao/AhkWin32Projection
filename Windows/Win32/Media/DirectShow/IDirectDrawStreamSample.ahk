#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStreamSample.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//ddstream/nn-ddstream-idirectdrawstreamsample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDirectDrawStreamSample extends IStreamSample{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawStreamSample
     * @type {Guid}
     */
    static IID => Guid("{f4104fcf-9a70-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSurface", "SetRect"]

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves pointers to the current sample's DirectDraw surface and associated clipping rectangle.
     * @param {Pointer<IDirectDrawSurface>} ppDirectDrawSurface Address of a pointer to an <b>IDirectDrawSurface</b> interface that specifies the sample's new surface. Set this parameter to <b>NULL</b> if you don't want to specify a new surface.
     * @param {Pointer<RECT>} pRect Pointer to a <b>RECT</b> structure that will contain the current sample's clipping rectangle. Set this parameter to <b>NULL</b> if you don't want to retrieve the clipping rectangle.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//ddstream/nf-ddstream-idirectdrawstreamsample-getsurface
     */
    GetSurface(ppDirectDrawSurface, pRect) {
        result := ComCall(8, this, "ptr*", ppDirectDrawSurface, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Changes the clipping rectangle for a sample.
     * @param {Pointer<RECT>} pRect Pointer to a <b>RECT</b> structure that specifies the stream's new clipping rectangle.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DDERR_INVALIDPIXELFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream isn't compatible with the pixel format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DDERR_INVALIDRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified rectangle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DDERR_INVALIDSURFACETYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream isn't compatible with the surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the pointers is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_E_SAMPLEALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream format doesn't match the surface and samples are currently allocated to the stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ddstream/nf-ddstream-idirectdrawstreamsample-setrect
     */
    SetRect(pRect) {
        result := ComCall(9, this, "ptr", pRect, "HRESULT")
        return result
    }
}
