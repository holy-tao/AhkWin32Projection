#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AMVAEndFrameInfo structure contains information for the IAMVideoAccelerator::EndFrame method.
 * @remarks
 * 
  * The buffer pointed to by <b>pMiscData</b> cannot contain pointer values, because their addresses will not be valid in kernel mode, where frame processing occurs.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//amva/ns-amva-amvaendframeinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVAEndFrameInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size, in bytes, of the buffer that <b>pMiscData</b> points to. The value must be 2.
     * @type {Integer}
     */
    dwSizeMiscData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a buffer that contains data for the video accelerator.
     * 
     * This buffer must contain a <b>WORD</b> value equal equal to the same surface index that passed to the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/videoacc/nf-videoacc-iamvideoaccelerator-beginframe">IAMVideoAccelerator::BeginFrame</a> method.
     * @type {Pointer<Void>}
     */
    pMiscData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
