#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AMVPSIZE structure specifies the width and height for a VP image.
 * @remarks
 * 
 * The context could be anything such as scaling, cropping, and so on.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vptype/ns-vptype-amvpsize
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVPSIZE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Width, in pixels.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Height.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
