#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\DXGI_OUTDUPL_POINTER_POSITION.ahk" { DXGI_OUTDUPL_POINTER_POSITION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DXGI_OUTDUPL_FRAME_INFO structure describes the current desktop image.
 * @remarks
 * A non-zero <b>LastMouseUpdateTime</b> indicates an update to either a mouse pointer position or a mouse pointer position and shape. That is, the mouse pointer position is always valid for a non-zero <b>LastMouseUpdateTime</b>; however, the application must check the value of the <b>PointerShapeBufferSize</b> member to determine whether the shape was updated too.
 * 
 * If only the pointer was updated (that is, the desktop image was not updated), the <b>AccumulatedFrames</b>, <b>TotalMetadataBufferSize</b>, and <b>LastPresentTime</b> members are set to zero.
 * 
 * An <b>AccumulatedFrames</b> value of one indicates that the application completed processing the last frame before a new desktop image was presented.  If the <b>AccumulatedFrames</b> value is greater than one, more desktop image updates have occurred while the application processed the last desktop update. In this situation, the operating system accumulated the update regions. For more information about desktop updates, see Desktop Update Data.
 * 
 * A non-zero <b>TotalMetadataBufferSize</b> indicates the total size of the buffers that are required to store all the desktop update metadata.  An application cannot determine the size of each type of metadata.  The application must call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframedirtyrects">IDXGIOutputDuplication::GetFrameDirtyRects</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframemoverects">IDXGIOutputDuplication::GetFrameMoveRects</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframepointershape">IDXGIOutputDuplication::GetFramePointerShape</a> method to obtain information about each type of metadata.
 * 
 * <div class="alert"><b>Note</b>  To correct visual effects, an application must process the move region data before it processes the dirty rectangles.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_frame_info
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OUTDUPL_FRAME_INFO {
    #StructPack 8

    /**
     * The time stamp of the last update of the desktop image.  The operating system calls the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> 
     *         function to obtain the value. A zero value indicates that the desktop image was not updated since an application last called the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-acquirenextframe">IDXGIOutputDuplication::AcquireNextFrame</a> method to acquire the next frame of the desktop image.
     */
    LastPresentTime : Int64

    /**
     * The time stamp of the last update to the mouse.  The operating system calls the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> 
     *         function to obtain the value. A zero value indicates that the position or shape of the mouse was not updated since an application last called the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-acquirenextframe">IDXGIOutputDuplication::AcquireNextFrame</a> method to acquire the next frame of the desktop image.  The mouse position is always supplied for a mouse update. A new pointer shape is indicated by a non-zero value in the <b>PointerShapeBufferSize</b> member.
     */
    LastMouseUpdateTime : Int64

    /**
     * The number of frames that the operating system accumulated in the desktop image surface since the calling application processed the last desktop image.  For more information about this number, see Remarks.
     */
    AccumulatedFrames : UInt32

    /**
     * Specifies whether the operating system accumulated updates by coalescing dirty regions. Therefore,  the dirty regions might contain unmodified pixels. <b>TRUE</b> if dirty regions were accumulated; otherwise, <b>FALSE</b>.
     */
    RectsCoalesced : BOOL

    /**
     * Specifies whether the desktop image might contain protected content that was already blacked out in the desktop image.  <b>TRUE</b> if protected content was already blacked; otherwise, <b>FALSE</b>. The application can use this information to notify the remote user that some of the desktop content might be protected and therefore not visible.
     */
    ProtectedContentMaskedOut : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_position">DXGI_OUTDUPL_POINTER_POSITION</a> structure that describes the most recent mouse position if the <b>LastMouseUpdateTime</b> member is a non-zero value; otherwise, this value is ignored. This value provides the coordinates of the location where the top-left-hand corner of the pointer shape is drawn; this value is not the desktop position of the hot spot.
     */
    PointerPosition : DXGI_OUTDUPL_POINTER_POSITION

    /**
     * Size in bytes of the buffers to store all the desktop update metadata for this frame. For more information about this size, see Remarks.
     */
    TotalMetadataBufferSize : UInt32

    /**
     * Size in bytes of the buffer to hold the new pixel data for the mouse shape. For more information about this size, see Remarks.
     */
    PointerShapeBufferSize : UInt32

}
