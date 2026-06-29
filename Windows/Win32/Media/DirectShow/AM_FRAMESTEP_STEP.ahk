#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the number of frames to step.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/ns-amvideo-am_framestep_step
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_FRAMESTEP_STEP {
    #StructPack 4

    /**
     * <b>DWORD</b> value specifying to the decoder the number of frames to step. Must be at least 1. If greater than 1, this instruction means to skip <i>n</i> - 1 frames and show the <i>n</i>th.
     */
    dwFramesToStep : UInt32

}
