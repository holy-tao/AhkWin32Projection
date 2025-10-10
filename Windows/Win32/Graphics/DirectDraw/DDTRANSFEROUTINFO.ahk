#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDTRANSFEROUTINFO structure returns the polarity of the field being captured.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddtransferoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDTRANSFEROUTINFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the polarity of the field being captured. This value is set to true if the current video field is the even field of an interlaced video signal and false otherwise.
     * @type {Integer}
     */
    dwBufferPolarity {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
