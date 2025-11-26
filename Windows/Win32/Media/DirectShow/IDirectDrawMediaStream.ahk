#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\IDirectDraw.ahk
#Include .\IDirectDrawStreamSample.ahk
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
     * Note  This interface is deprecated. New applications should not use it. Retrieves the current media stream's format and, optionally, its desired format.
     * @param {Pointer<DDSURFACEDESC>} pDDSDCurrent Pointer to a DirectDraw surface description that will contain the current media stream's format.
     * @param {Pointer<IDirectDrawPalette>} ppDirectDrawPalette Address of a pointer to an <b>IDirectDrawPalette</b> interface if one exists.
     * @param {Pointer<DDSURFACEDESC>} pDDSDDesired Pointer to a DirectDraw surface description that will contain the current media stream's desired format.
     * @param {Pointer<Integer>} pdwFlags Pointer to the flags set in a <b>DDSURFACEDESC</b> structure. Flags of interest include:
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>DDSD_CAPS</td>
     * <td>Indicates that the surface capability member of the structure is valid.</td>
     * </tr>
     * <tr>
     * <td>DDSD_HEIGHT</td>
     * <td>Indicates that the height member of the structure is valid.</td>
     * </tr>
     * <tr>
     * <td>DDSD_PIXELFORMAT</td>
     * <td>Indicates that the pixel format member of the structure is valid.</td>
     * </tr>
     * <tr>
     * <td>DDSD_WIDTH</td>
     * <td>Indicates that the width member of the structure is valid.</td>
     * </tr>
     * </table>
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
     * <dt><b>DDERR_INVALIDPARAMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the DirectDraw surface parameters is invalid.
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
     * One or more of the required parameters is invalid.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddstream/nf-ddstream-idirectdrawmediastream-getformat
     */
    GetFormat(pDDSDCurrent, ppDirectDrawPalette, pDDSDDesired, pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pDDSDCurrent, "ptr*", ppDirectDrawPalette, "ptr", pDDSDDesired, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Sets the format of the current media stream.
     * @param {Pointer<DDSURFACEDESC>} pDDSurfaceDesc Pointer to a DirectDraw surface description that contains the new format.
     * @param {IDirectDrawPalette} pDirectDrawPalette Optional parameter that is a pointer to an <b>IDirectDrawPalette</b> interface.
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
     * <dt><b>DDERR_INVALIDSURFACETYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified format is incompatible with the current stream.
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
     * Can't change the format because one or more stream samples are already allocated for this stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddstream/nf-ddstream-idirectdrawmediastream-setformat
     */
    SetFormat(pDDSurfaceDesc, pDirectDrawPalette) {
        result := ComCall(10, this, "ptr", pDDSurfaceDesc, "ptr", pDirectDrawPalette, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves a pointer to the DirectDraw object used by the current media stream.
     * @returns {IDirectDraw} Address of a pointer to an <b>IDirectDraw</b> interface that will contain the current media stream's associated DirectDraw object.
     * @see https://docs.microsoft.com/windows/win32/api//ddstream/nf-ddstream-idirectdrawmediastream-getdirectdraw
     */
    GetDirectDraw() {
        result := ComCall(11, this, "ptr*", &ppDirectDraw := 0, "HRESULT")
        return IDirectDraw(ppDirectDraw)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Sets the current media stream's DirectDraw object.
     * @param {IDirectDraw} pDirectDraw Pointer to an <b>IDirectDraw</b> interface that contains the media stream's new DirectDraw object.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if the pointer is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//ddstream/nf-ddstream-idirectdrawmediastream-setdirectdraw
     */
    SetDirectDraw(pDirectDraw) {
        result := ComCall(12, this, "ptr", pDirectDraw, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Creates a stream sample using the specified DirectDraw surface object.
     * @param {IDirectDrawSurface} pSurface Pointer to an existing DirectDraw surface. Use <b>QueryInterface</b> to obtain the <b>IDirectDrawSurface</b> interface from an <b>IDirectDrawSurface7</b> interface pointer.
     * @param {Pointer<RECT>} pRect Pointer to the clipping rectangle you want to use with the specified surface. Set this parameter to <b>NULL</b> if you want to use the entire surface.
     * @param {Integer} dwFlags Specifies miscellaneous flags. The following flag is defined:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>DDSFF_PROGRESSIVERENDER</td>
     * <td>If this flag is set, sample updates are performed directly on the surface. When this flag is absent, if the decoder uses delta frames, an extra copy is performed internally. Setting this flag can improve performance but can also introduce tearing.</td>
     * </tr>
     * </table>
     * @returns {IDirectDrawStreamSample} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ddstream/nn-ddstream-idirectdrawstreamsample">IDirectDrawStreamSample</a> interface that will point to the newly created sample.
     * @see https://docs.microsoft.com/windows/win32/api//ddstream/nf-ddstream-idirectdrawmediastream-createsample
     */
    CreateSample(pSurface, pRect, dwFlags) {
        result := ComCall(13, this, "ptr", pSurface, "ptr", pRect, "uint", dwFlags, "ptr*", &ppSample := 0, "HRESULT")
        return IDirectDrawStreamSample(ppSample)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves the average frames per second from a video stream.
     * @returns {Integer} Pointer to a <b>STREAM_TIME</b> value that indicates the average time per frame in 100-nanosecond units. (See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/multimedia-streaming-data-types">Multimedia Streaming Data Types</a>.)
     * @see https://docs.microsoft.com/windows/win32/api//ddstream/nf-ddstream-idirectdrawmediastream-gettimeperframe
     */
    GetTimePerFrame() {
        result := ComCall(14, this, "int64*", &pFrameTime := 0, "HRESULT")
        return pFrameTime
    }
}
