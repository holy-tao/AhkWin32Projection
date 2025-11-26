#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_MAPPED_RECT.ahk
#Include .\IDXGIObject.ahk

/**
 * The IDXGIOutputDuplication interface accesses and manipulates the duplicated desktop image.
 * @remarks
 * 
 * A collaboration application can use <b>IDXGIOutputDuplication</b> to access the desktop image. <b>IDXGIOutputDuplication</b> is supported in Desktop Window Manager (DWM) on non-8bpp DirectX full-screen modes and non-8bpp OpenGL full-screen modes. 16-bit or 32-bit GDI non-DWM desktop modes are not supported.
 *         
 * 
 * An application can use <b>IDXGIOutputDuplication</b> on a separate thread to receive the desktop images and to feed them into their specific image-processing pipeline.  The application uses <b>IDXGIOutputDuplication</b> to perform the following operations:
 *           
 * 
 * <ol>
 * <li>Acquire the next desktop image.</li>
 * <li>Retrieve the information that describes the image.</li>
 * <li>Perform an operation on the image. This operation can be as simple as copying the image to a staging buffer so that the application can read the pixel data on the image. The application reads the pixel data  after the application calls <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgisurface-map">IDXGISurface::Map</a>. Alternatively, this operation can be more complex. For example, the application can run some pixel shaders on the updated regions of the image to encode those regions for transmission to a client.
 *           </li>
 * <li>After the application finishes  processing each desktop image, it releases the image, loops to step 1, and repeats the steps. The application repeats these steps until it is finished processing desktop images.</li>
 * </ol>
 * The following components of the operating system can generate the desktop image:
 * 
 * <ul>
 * <li>The DWM by composing the desktop image
 *           </li>
 * <li>A full-screen DirectX or OpenGL application</li>
 * <li>An application by switching to a separate desktop, for example, the secure desktop that is used to display the login screen</li>
 * </ul>
 * All current <b>IDXGIOutputDuplication</b> interfaces become invalid when the operating system switches to a different component that produces the desktop image or when a mode change occurs.  In these situations, the application must destroy its current <b>IDXGIOutputDuplication</b> interface and create a new <b>IDXGIOutputDuplication</b> interface.
 *         
 * 
 * Examples of situations in which <b>IDXGIOutputDuplication</b> becomes invalid are:
 *           
 * 
 * <ul>
 * <li>Desktop switch</li>
 * <li>Mode change</li>
 * <li>Switch from DWM on, DWM off, or other full-screen application
 *           </li>
 * </ul>
 * In these situations, the application must release the <b>IDXGIOutputDuplication</b> interface and must create a new <b>IDXGIOutputDuplication</b> interface for the new content.  If the application does not have the appropriate privilege to the new desktop image, its call to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-duplicateoutput">IDXGIOutput1::DuplicateOutput</a> method fails.
 *         
 * 
 * While the application processes each desktop image, the operating system accumulates all the desktop image updates into a single update. For more information about desktop updates, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/desktop-dup-api">Updating the desktop image data</a>.
 *         
 * 
 * The desktop image is always in the <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a> format.
 *         
 * 
 * The <b>IDXGIOutputDuplication</b> interface does not exist for Windows Store apps.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgioutputduplication
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutputDuplication extends IDXGIObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutputDuplication
     * @type {Guid}
     */
    static IID => Guid("{191cfac3-a341-470d-b26e-a864f428319c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "AcquireNextFrame", "GetFrameDirtyRects", "GetFrameMoveRects", "GetFramePointerShape", "MapDesktopSurface", "UnMapDesktopSurface", "ReleaseFrame"]

    /**
     * Retrieves a description of a duplicated output. This description specifies the dimensions of the surface that contains the desktop image.
     * @remarks
     * 
     * After an application creates an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface, it calls <b>GetDesc</b> to retrieve the dimensions of the surface that contains the desktop image. The format of the desktop image is always <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a>.
     * 
     * 
     * @param {Pointer<DXGI_OUTDUPL_DESC>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_desc">DXGI_OUTDUPL_DESC</a> structure that describes the duplicated output. This parameter must not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, "ptr", pDesc)
    }

    /**
     * Indicates that the application is ready to process the next desktop image.
     * @param {Integer} TimeoutInMilliseconds The time-out interval, in milliseconds. This interval specifies the amount of time that this method waits for a new frame before it returns to the caller.  This method returns if the interval elapses, and a new desktop image is not available.
     * 
     * For more information about the time-out interval, see Remarks.
     * @param {Pointer<DXGI_OUTDUPL_FRAME_INFO>} pFrameInfo A pointer to a memory location that receives the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_frame_info">DXGI_OUTDUPL_FRAME_INFO</a> structure that describes timing and presentation statistics for a frame.
     * @param {Pointer<IDXGIResource>} ppDesktopResource A pointer to a variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interface of the surface that contains the desktop bitmap.
     * @returns {HRESULT} <b>AcquireNextFrame</b> returns:
     *         <ul>
     * <li>S_OK if it successfully received the next desktop image.</li>
     * <li>DXGI_ERROR_ACCESS_LOST if the desktop duplication interface is invalid. The desktop duplication interface typically becomes invalid when a different type of image is displayed on the desktop.  Examples of this situation are: <ul>
     * <li>Desktop switch</li>
     * <li>Mode change</li>
     * <li>Switch from DWM on, DWM off, or other full-screen application</li>
     * </ul>In this situation, the application must release the <a href="/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface and create a new <b>IDXGIOutputDuplication</b> for the new content.</li>
     * <li>DXGI_ERROR_WAIT_TIMEOUT if the time-out interval elapsed before the next desktop frame was available.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the application called <b>AcquireNextFrame</b> without releasing the previous frame.</li>
     * <li>E_INVALIDARG if one of the parameters to <b>AcquireNextFrame</b> is incorrect; for example, if <i>pFrameInfo</i> is NULL.</li>
     * <li>Possibly other error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutputduplication-acquirenextframe
     */
    AcquireNextFrame(TimeoutInMilliseconds, pFrameInfo, ppDesktopResource) {
        result := ComCall(8, this, "uint", TimeoutInMilliseconds, "ptr", pFrameInfo, "ptr*", ppDesktopResource, "HRESULT")
        return result
    }

    /**
     * Gets information about dirty rectangles for the current desktop frame.
     * @param {Integer} DirtyRectsBufferSize The size in bytes of the buffer that the caller passed to the  <i>pDirtyRectsBuffer</i> 
     *        parameter.
     * @param {Pointer} pDirtyRectsBuffer A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures 
     *         that identifies the dirty rectangle regions for the desktop frame.
     * @returns {Integer} Pointer to a variable that receives the number of bytes that 
     *        <b>GetFrameDirtyRects</b> 
     *        needs to store information about dirty regions in the buffer at 
     *        <i>pDirtyRectsBuffer</i>.
     * 
     * For more information about returning the required buffer size, see Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframedirtyrects
     */
    GetFrameDirtyRects(DirtyRectsBufferSize, pDirtyRectsBuffer) {
        result := ComCall(9, this, "uint", DirtyRectsBufferSize, "ptr", pDirtyRectsBuffer, "uint*", &pDirtyRectsBufferSizeRequired := 0, "HRESULT")
        return pDirtyRectsBufferSizeRequired
    }

    /**
     * Gets information about the moved rectangles for the current desktop frame.
     * @param {Integer} MoveRectsBufferSize The size in bytes of the buffer that the caller passed to the  <i>pMoveRectBuffer</i> parameter.
     * @param {Pointer} pMoveRectBuffer A pointer to an array of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_move_rect">DXGI_OUTDUPL_MOVE_RECT</a> structures 
     *        that identifies the moved rectangle regions for the desktop frame.
     * @returns {Integer} Pointer to a variable that receives the number of bytes that 
     *        <b>GetFrameMoveRects</b> 
     *        needs to store information about moved regions in the buffer at <i>pMoveRectBuffer</i>.
     * 
     * For more information about returning the required buffer size, see Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframemoverects
     */
    GetFrameMoveRects(MoveRectsBufferSize, pMoveRectBuffer) {
        result := ComCall(10, this, "uint", MoveRectsBufferSize, "ptr", pMoveRectBuffer, "uint*", &pMoveRectsBufferSizeRequired := 0, "HRESULT")
        return pMoveRectsBufferSizeRequired
    }

    /**
     * Gets information about the new pointer shape for the current desktop frame.
     * @param {Integer} PointerShapeBufferSize The size in bytes of the buffer that the caller passed to the  <i>pPointerShapeBuffer</i> parameter.
     * @param {Pointer} pPointerShapeBuffer A pointer to a buffer to which <b>GetFramePointerShape</b> copies and returns pixel data for the new pointer shape.
     * @param {Pointer<Integer>} pPointerShapeBufferSizeRequired Pointer to a variable that receives the number of bytes that <b>GetFramePointerShape</b> needs to store the new pointer shape pixel data in the buffer at <i>pPointerShapeBuffer</i>.
     * 
     * For more information about returning the required buffer size, see Remarks.
     * @param {Pointer<DXGI_OUTDUPL_POINTER_SHAPE_INFO>} pPointerShapeInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_shape_info">DXGI_OUTDUPL_POINTER_SHAPE_INFO</a> structure that receives the pointer shape information.
     * @returns {HRESULT} <b>GetFramePointerShape</b> returns:
     *         <ul>
     * <li>S_OK if it successfully retrieved information about the new pointer shape.</li>
     * <li>DXGI_ERROR_ACCESS_LOST if the desktop duplication interface is invalid. The desktop duplication interface typically becomes invalid when a different type of image is displayed on the desktop.  Examples of this situation are: <ul>
     * <li>Desktop switch</li>
     * <li>Mode change</li>
     * <li>Switch from DWM on, DWM off, or other full-screen application</li>
     * </ul>In this situation, the application must release the <a href="/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface and create a new <b>IDXGIOutputDuplication</b> for the new content.</li>
     * <li>DXGI_ERROR_MORE_DATA if the buffer that the calling application provided was not big enough.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the application called <b>GetFramePointerShape</b> without owning the desktop image.</li>
     * <li>E_INVALIDARG if one of the parameters to <b>GetFramePointerShape</b> is incorrect; for example, if <i>pPointerShapeInfo</i> is NULL.</li>
     * <li>Possibly other error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframepointershape
     */
    GetFramePointerShape(PointerShapeBufferSize, pPointerShapeBuffer, pPointerShapeBufferSizeRequired, pPointerShapeInfo) {
        pPointerShapeBufferSizeRequiredMarshal := pPointerShapeBufferSizeRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", PointerShapeBufferSize, "ptr", pPointerShapeBuffer, pPointerShapeBufferSizeRequiredMarshal, pPointerShapeBufferSizeRequired, "ptr", pPointerShapeInfo, "HRESULT")
        return result
    }

    /**
     * Provides the CPU with efficient access to a desktop image if that desktop image is already in system memory.
     * @returns {DXGI_MAPPED_RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_mapped_rect">DXGI_MAPPED_RECT</a> structure that receives the surface data that the CPU needs to directly access the surface data.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutputduplication-mapdesktopsurface
     */
    MapDesktopSurface() {
        pLockedRect := DXGI_MAPPED_RECT()
        result := ComCall(12, this, "ptr", pLockedRect, "HRESULT")
        return pLockedRect
    }

    /**
     * Invalidates the pointer to the desktop image that was retrieved by using IDXGIOutputDuplication::MapDesktopSurface.
     * @returns {HRESULT} <b>UnMapDesktopSurface</b> returns:
     *         <ul>
     * <li>S_OK if it successfully completed.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the application did not map the desktop surface by calling <a href="/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-mapdesktopsurface">IDXGIOutputDuplication::MapDesktopSurface</a>.</li>
     * <li>Possibly other error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutputduplication-unmapdesktopsurface
     */
    UnMapDesktopSurface() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Indicates that the application finished processing the frame.
     * @returns {HRESULT} <b>ReleaseFrame</b> returns:
     *         <ul>
     * <li>S_OK if it successfully completed.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the application already released the frame.</li>
     * <li>DXGI_ERROR_ACCESS_LOST if the desktop duplication interface is invalid. The desktop duplication interface typically becomes invalid when a different type of image is displayed on the desktop.  Examples of this situation are: <ul>
     * <li>Desktop switch</li>
     * <li>Mode change</li>
     * <li>Switch from DWM on, DWM off, or other full-screen application</li>
     * </ul>In this situation, the application must release the <a href="/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface and create a new <b>IDXGIOutputDuplication</b> for the new content.</li>
     * <li>Possibly other error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutputduplication-releaseframe
     */
    ReleaseFrame() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
