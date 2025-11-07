#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AMVABeginFrameInfo structure contains information for the IAMVideoAccelerator::BeginFrame method.
 * @remarks
 * 
 * The buffer pointed to by <b>pInputData</b> cannot contain pointer values, because their addresses will not be valid in kernel mode, where frame processing occurs.
 *       
 * 
 * The video accelerator might not use the same surface memory in two consecutive calls with the same frame index.
 *       Therefore, the decoder should not make any assumption about the initial contents of the frame.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//amva/ns-amva-amvabeginframeinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVABeginFrameInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The zero-based index of the uncompressed destination surface. The number of uncompressed surfaces is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoacceleratornotify-setuncompsurfacesinfo">IAMVideoAcceleratorNotify::SetUncompSurfacesInfo</a> method.
     * @type {Integer}
     */
    dwDestSurfaceIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a buffer that contains data for the video accelerator.
     * 
     * This buffer must contain a <b>WORD</b> value that is equal to the value of <b>dwDestSurfaceIndex</b>.
     * @type {Pointer<Void>}
     */
    pInputData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Size, in bytes, of the buffer that <b>pInputData</b> points to. The value must be 2.
     * @type {Integer}
     */
    dwSizeInputData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a buffer that the video accelerator can write to.
     * 
     * This member must be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pOutputData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Size, in bytes, of the buffer that <b>pOutputData</b> points to. The value must be zero.
     * @type {Integer}
     */
    dwSizeOutputData {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
