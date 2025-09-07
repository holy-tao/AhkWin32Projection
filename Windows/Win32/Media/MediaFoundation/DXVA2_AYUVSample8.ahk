#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an 8-bit AYUV pixel value.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_ayuvsample8
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_AYUVSample8 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Contains the Cr chroma value (also called V).
     * @type {Integer}
     */
    Cr {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Contains the Cb chroma value (also called U).
     * @type {Integer}
     */
    Cb {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Contains the luma value.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Contains the alpha value.
     * @type {Integer}
     */
    Alpha {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
