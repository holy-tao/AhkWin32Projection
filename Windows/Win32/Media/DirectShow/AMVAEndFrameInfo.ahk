#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AMVAEndFrameInfo structure contains information for the IAMVideoAccelerator::EndFrame method.
 * @remarks
 * The buffer pointed to by <b>pMiscData</b> cannot contain pointer values, because their addresses will not be valid in kernel mode, where frame processing occurs.
 * @see https://learn.microsoft.com/windows/win32/api/amva/ns-amva-amvaendframeinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVAEndFrameInfo {
    #StructPack 8

    /**
     * Size, in bytes, of the buffer that <b>pMiscData</b> points to. The value must be 2.
     */
    dwSizeMiscData : UInt32

    /**
     * Pointer to a buffer that contains data for the video accelerator.
     * 
     * This buffer must contain a <b>WORD</b> value equal equal to the same surface index that passed to the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-beginframe">IAMVideoAccelerator::BeginFrame</a> method.
     */
    pMiscData : IntPtr

}
