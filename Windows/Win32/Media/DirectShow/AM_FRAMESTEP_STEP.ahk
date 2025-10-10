#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the number of frames to step.
 * @see https://docs.microsoft.com/windows/win32/api//amvideo/ns-amvideo-am_framestep_step
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_FRAMESTEP_STEP extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * <b>DWORD</b> value specifying to the decoder the number of frames to step. Must be at least 1. If greater than 1, this instruction means to skip <i>n</i> - 1 frames and show the <i>n</i>th.
     * @type {Integer}
     */
    dwFramesToStep {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
