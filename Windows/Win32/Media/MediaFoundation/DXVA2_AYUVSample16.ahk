#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a 16-bit AYUV pixel value.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ns-dxva2api-dxva2_ayuvsample16
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_AYUVSample16 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Contains the Cr chroma value (also called V).
     * @type {Integer}
     */
    Cr {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Contains the Cb chroma value (also called U).
     * @type {Integer}
     */
    Cb {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Contains the luma value.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Contains the alpha value.
     * @type {Integer}
     */
    Alpha {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
