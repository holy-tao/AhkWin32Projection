#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_MAPPED_RECT.ahk
#Include .\IDXGIObject.ahk

/**
 * The IDXGIOutputDuplication interface accesses and manipulates the duplicated desktop image.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nn-dxgi1_2-idxgioutputduplication
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
     * After an application creates an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface, it calls <b>GetDesc</b> to retrieve the dimensions of the surface that contains the desktop image. The format of the desktop image is always <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a>.
     * @param {Pointer<DXGI_OUTDUPL_DESC>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_desc">DXGI_OUTDUPL_DESC</a> structure that describes the duplicated output. This parameter must not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, "ptr", pDesc)
    }

    /**
     * Indicates that the application is ready to process the next desktop image.
     * @remarks
     * When <b>AcquireNextFrame</b> returns successfully, the calling application can access the desktop image that <b>AcquireNextFrame</b> returns in the variable at <i>ppDesktopResource</i>.
     * If the caller specifies a zero time-out interval in the <i>TimeoutInMilliseconds</i> parameter, <b>AcquireNextFrame</b> verifies whether there is a new desktop image available, returns immediately, and indicates its outcome with the return value.  If the caller specifies an <b>INFINITE</b> time-out interval in the <i>TimeoutInMilliseconds</i> parameter, the time-out interval never elapses.
     * 
     * <div class="alert"><b>Note</b>  You cannot cancel the wait that you specified in the <i>TimeoutInMilliseconds</i> parameter. Therefore, if you must periodically check for other conditions (for example, a terminate signal), you should specify a non-<b>INFINITE</b> time-out interval. After the time-out interval elapses, you can check for these other conditions and then call <b>AcquireNextFrame</b> again to wait for the next frame.</div>
     * <div> </div>
     * <b>AcquireNextFrame</b> acquires a new desktop frame when the operating system either updates the desktop bitmap image or changes the shape or position of a hardware pointer.  The new frame that <b>AcquireNextFrame</b> acquires might have only the desktop image updated, only the pointer shape or position updated, or both.
     * @param {Integer} TimeoutInMilliseconds The time-out interval, in milliseconds. This interval specifies the amount of time that this method waits for a new frame before it returns to the caller.  This method returns if the interval elapses, and a new desktop image is not available.
     * 
     * For more information about the time-out interval, see Remarks.
     * @param {Pointer<DXGI_OUTDUPL_FRAME_INFO>} pFrameInfo A pointer to a memory location that receives the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_frame_info">DXGI_OUTDUPL_FRAME_INFO</a> structure that describes timing and presentation statistics for a frame.
     * @param {Pointer<Pointer<IDXGIResource>>} ppDesktopResource A pointer to a variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interface of the surface that contains the desktop bitmap.
     * @returns {HRESULT} <b>AcquireNextFrame</b> returns:
     *         <ul>
     * <li>S_OK if it successfully received the next desktop image.</li>
     * <li>DXGI_ERROR_ACCESS_LOST if the desktop duplication interface is invalid. The desktop duplication interface typically becomes invalid when a different type of image is displayed on the desktop.  Examples of this situation are: <ul>
     * <li>Desktop switch</li>
     * <li>Mode change</li>
     * <li>Switch from DWM on, DWM off, or other full-screen application</li>
     * </ul>In this situation, the application must release the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface and create a new <b>IDXGIOutputDuplication</b> for the new content.</li>
     * <li>DXGI_ERROR_WAIT_TIMEOUT if the time-out interval elapsed before the next desktop frame was available.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the application called <b>AcquireNextFrame</b> without releasing the previous frame.</li>
     * <li>E_INVALIDARG if one of the parameters to <b>AcquireNextFrame</b> is incorrect; for example, if <i>pFrameInfo</i> is NULL.</li>
     * <li>Possibly other error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-acquirenextframe
     */
    AcquireNextFrame(TimeoutInMilliseconds, pFrameInfo, ppDesktopResource) {
        result := ComCall(8, this, "uint", TimeoutInMilliseconds, "ptr", pFrameInfo, "ptr*", ppDesktopResource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets information about dirty rectangles for the current desktop frame.
     * @remarks
     * <b>GetFrameDirtyRects</b> stores a size value in the variable at <i>pDirtyRectsBufferSizeRequired</i>. This  value specifies the number of bytes that <b>GetFrameDirtyRects</b> needs to store information about dirty regions. You can use this value 
     *        in the following situations to determine the amount of memory to allocate for future buffers that you pass to <i>pDirtyRectsBuffer</i>:
     * 
     * <ul>
     * <li><b>GetFrameDirtyRects</b> 
     *       fails with DXGI_ERROR_MORE_DATA because the buffer is not big enough.</li>
     * <li><b>GetFrameDirtyRects</b> 
     *       supplies a buffer that is bigger than necessary. The size value returned at 
     *       <i>pDirtyRectsBufferSizeRequired</i> informs the caller how much buffer space was actually 
     *       used compared to how much buffer space the caller allocated and specified in the 
     *       <i>DirtyRectsBufferSize</i> parameter.</li>
     * </ul>
     * The caller can also use the value returned at <i>pDirtyRectsBufferSizeRequired</i> to 
     *      determine the number of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>s returned in the <i>pDirtyRectsBuffer</i> array.
     * 
     * The buffer contains the list of dirty <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>s for the current frame.
     * 
     * <div class="alert"><b>Note</b>  To produce a visually accurate copy of the desktop, an application must first process all move <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>s before 
     *      it processes dirty <b>RECT</b>s.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframedirtyrects
     */
    GetFrameDirtyRects(DirtyRectsBufferSize, pDirtyRectsBuffer) {
        result := ComCall(9, this, "uint", DirtyRectsBufferSize, "ptr", pDirtyRectsBuffer, "uint*", &pDirtyRectsBufferSizeRequired := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDirtyRectsBufferSizeRequired
    }

    /**
     * Gets information about the moved rectangles for the current desktop frame.
     * @remarks
     * <b>GetFrameMoveRects</b> 
     *       stores a size value in the variable at <i>pMoveRectsBufferSizeRequired</i>. This  value specifies the number of bytes that <b>GetFrameMoveRects</b> needs to store information about moved regions. You can use 
     *       this value in the following situations to determine the amount of memory to allocate for future buffers that you pass to <i>pMoveRectBuffer</i>:
     * 
     * <ul>
     * <li><b>GetFrameMoveRects</b> fails with DXGI_ERROR_MORE_DATA because the buffer is not big enough.</li>
     * <li><b>GetFrameMoveRects</b> supplies a buffer that is bigger than necessary. The size value returned at <i>pMoveRectsBufferSizeRequired</i> informs the caller how much buffer space was actually used compared to how much buffer space the caller allocated and specified in the  <i>MoveRectsBufferSize</i> parameter.</li>
     * </ul>
     * The caller can also use the value returned at <i>pMoveRectsBufferSizeRequired</i> to determine the number of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_move_rect">DXGI_OUTDUPL_MOVE_RECT</a> structures returned.
     * 
     * The buffer contains the list of move RECTs for the current frame.
     * 
     * <div class="alert"><b>Note</b>  To produce a visually accurate copy of the desktop, an application must first process all move RECTs before it processes dirty RECTs.</div>
     * <div> </div>
     * @param {Integer} MoveRectsBufferSize The size in bytes of the buffer that the caller passed to the  <i>pMoveRectBuffer</i> parameter.
     * @param {Pointer} pMoveRectBuffer A pointer to an array of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_move_rect">DXGI_OUTDUPL_MOVE_RECT</a> structures 
     *        that identifies the moved rectangle regions for the desktop frame.
     * @returns {Integer} Pointer to a variable that receives the number of bytes that 
     *        <b>GetFrameMoveRects</b> 
     *        needs to store information about moved regions in the buffer at <i>pMoveRectBuffer</i>.
     * 
     * For more information about returning the required buffer size, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframemoverects
     */
    GetFrameMoveRects(MoveRectsBufferSize, pMoveRectBuffer) {
        result := ComCall(10, this, "uint", MoveRectsBufferSize, "ptr", pMoveRectBuffer, "uint*", &pMoveRectsBufferSizeRequired := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pMoveRectsBufferSizeRequired
    }

    /**
     * Gets information about the new pointer shape for the current desktop frame.
     * @remarks
     * <b>GetFramePointerShape</b> 
     *       stores a size value in the variable at <i>pPointerShapeBufferSizeRequired</i>. This  value specifies the number of bytes that <i>pPointerShapeBufferSizeRequired</i> needs to store the new pointer shape pixel data. You can use the value in the following situations to determine the amount of memory to allocate for future buffers that you pass to <i>pPointerShapeBuffer</i>:
     * 
     * <ul>
     * <li><b>GetFramePointerShape</b> fails with DXGI_ERROR_MORE_DATA because the buffer is not big enough.</li>
     * <li><b>GetFramePointerShape</b> supplies a bigger than necessary buffer. The size value returned at <i>pPointerShapeBufferSizeRequired</i> informs the caller how much buffer space was actually used compared to how much buffer space the caller allocated and specified in the  <i>PointerShapeBufferSize</i> parameter.</li>
     * </ul>
     * The <i>pPointerShapeInfo</i> parameter describes the new pointer shape.
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
     * </ul>In this situation, the application must release the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface and create a new <b>IDXGIOutputDuplication</b> for the new content.</li>
     * <li>DXGI_ERROR_MORE_DATA if the buffer that the calling application provided was not big enough.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the application called <b>GetFramePointerShape</b> without owning the desktop image.</li>
     * <li>E_INVALIDARG if one of the parameters to <b>GetFramePointerShape</b> is incorrect; for example, if <i>pPointerShapeInfo</i> is NULL.</li>
     * <li>Possibly other error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframepointershape
     */
    GetFramePointerShape(PointerShapeBufferSize, pPointerShapeBuffer, pPointerShapeBufferSizeRequired, pPointerShapeInfo) {
        pPointerShapeBufferSizeRequiredMarshal := pPointerShapeBufferSizeRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", PointerShapeBufferSize, "ptr", pPointerShapeBuffer, pPointerShapeBufferSizeRequiredMarshal, pPointerShapeBufferSizeRequired, "ptr", pPointerShapeInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides the CPU with efficient access to a desktop image if that desktop image is already in system memory.
     * @remarks
     * You can successfully call <b>MapDesktopSurface</b> if the  <b>DesktopImageInSystemMemory</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_desc">DXGI_OUTDUPL_DESC</a> structure is set to <b>TRUE</b>. If <b>DesktopImageInSystemMemory</b> is <b>FALSE</b>, <b>MapDesktopSurface</b> returns DXGI_ERROR_UNSUPPORTED. Call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getdesc">IDXGIOutputDuplication::GetDesc</a> to retrieve the <b>DXGI_OUTDUPL_DESC</b> structure.
     * @returns {DXGI_MAPPED_RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_mapped_rect">DXGI_MAPPED_RECT</a> structure that receives the surface data that the CPU needs to directly access the surface data.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-mapdesktopsurface
     */
    MapDesktopSurface() {
        pLockedRect := DXGI_MAPPED_RECT()
        result := ComCall(12, this, "ptr", pLockedRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pLockedRect
    }

    /**
     * Invalidates the pointer to the desktop image that was retrieved by using IDXGIOutputDuplication::MapDesktopSurface.
     * @returns {HRESULT} <b>UnMapDesktopSurface</b> returns:
     *         <ul>
     * <li>S_OK if it successfully completed.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the application did not map the desktop surface by calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-mapdesktopsurface">IDXGIOutputDuplication::MapDesktopSurface</a>.</li>
     * <li>Possibly other error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-unmapdesktopsurface
     */
    UnMapDesktopSurface() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates that the application finished processing the frame.
     * @remarks
     * The application must release the frame before it acquires the next frame.  After the frame is released, the surface that contains the desktop bitmap becomes invalid; you will not be able to use the surface in a DirectX graphics operation.
     * 
     * For performance reasons, we recommend that you release the frame just before you call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-acquirenextframe">IDXGIOutputDuplication::AcquireNextFrame</a> method to acquire the next frame.  When the client does not own the frame, the operating system copies all desktop updates to the surface. This can result in wasted GPU cycles if the operating system updates the same region for each frame that occurs.  When the client acquires the frame, the client is aware of only the final update to this region; therefore, any overlapping updates during previous frames are wasted. When the client acquires a frame, the client owns the surface; therefore, the operating system can track only the updated regions and cannot copy desktop updates to the surface. Because of this behavior, we recommend that you minimize the time between the call to release the current frame and the call to acquire the next frame.
     * @returns {HRESULT} <b>ReleaseFrame</b> returns:
     *         <ul>
     * <li>S_OK if it successfully completed.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the application already released the frame.</li>
     * <li>DXGI_ERROR_ACCESS_LOST if the desktop duplication interface is invalid. The desktop duplication interface typically becomes invalid when a different type of image is displayed on the desktop.  Examples of this situation are: <ul>
     * <li>Desktop switch</li>
     * <li>Mode change</li>
     * <li>Switch from DWM on, DWM off, or other full-screen application</li>
     * </ul>In this situation, the application must release the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface and create a new <b>IDXGIOutputDuplication</b> for the new content.</li>
     * <li>Possibly other error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-releaseframe
     */
    ReleaseFrame() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
