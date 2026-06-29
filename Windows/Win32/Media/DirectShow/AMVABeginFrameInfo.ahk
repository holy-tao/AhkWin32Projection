#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AMVABeginFrameInfo structure contains information for the IAMVideoAccelerator::BeginFrame method.
 * @remarks
 * The buffer pointed to by <b>pInputData</b> cannot contain pointer values, because their addresses will not be valid in kernel mode, where frame processing occurs.
 *       
 * 
 * The video accelerator might not use the same surface memory in two consecutive calls with the same frame index.
 *       Therefore, the decoder should not make any assumption about the initial contents of the frame.
 * @see https://learn.microsoft.com/windows/win32/api/amva/ns-amva-amvabeginframeinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVABeginFrameInfo {
    #StructPack 8

    /**
     * The zero-based index of the uncompressed destination surface. The number of uncompressed surfaces is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoacceleratornotify-setuncompsurfacesinfo">IAMVideoAcceleratorNotify::SetUncompSurfacesInfo</a> method.
     */
    dwDestSurfaceIndex : UInt32

    /**
     * Pointer to a buffer that contains data for the video accelerator.
     * 
     * This buffer must contain a <b>WORD</b> value that is equal to the value of <b>dwDestSurfaceIndex</b>.
     */
    pInputData : IntPtr

    /**
     * Size, in bytes, of the buffer that <b>pInputData</b> points to. The value must be 2.
     */
    dwSizeInputData : UInt32

    /**
     * Pointer to a buffer that the video accelerator can write to.
     * 
     * This member must be <b>NULL</b>.
     */
    pOutputData : IntPtr

    /**
     * Size, in bytes, of the buffer that <b>pOutputData</b> points to. The value must be zero.
     */
    dwSizeOutputData : UInt32

}
