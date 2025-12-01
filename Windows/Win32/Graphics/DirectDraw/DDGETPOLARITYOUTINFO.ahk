#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDGETPOLARITYOUTINFO structure contains the polarity information of the video port extensions (VPE) object.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddgetpolarityoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDGETPOLARITYOUTINFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Indicates the polarity (even or odd) of the current field being written by the VPE object. A value of 0x00000001 indicates even, 0x00000000 indicates odd.
     * @type {Integer}
     */
    bPolarity {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
