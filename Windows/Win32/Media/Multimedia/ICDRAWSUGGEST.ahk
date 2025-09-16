#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICDRAWSUGGEST structure contains compression parameters used with the ICM_DRAW_SUGGESTFORMAT message to suggest an appropriate input format.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-icdrawsuggest
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICDRAWSUGGEST extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Pointer to the structure containing the compressed input format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiIn {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a buffer to return a compatible input format for the renderer.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiSuggest {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Width of the source rectangle.
     * @type {Integer}
     */
    dxSrc {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Height of the source rectangle.
     * @type {Integer}
     */
    dySrc {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Width of the destination rectangle.
     * @type {Integer}
     */
    dxDst {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Height of the destination rectangle.
     * @type {Integer}
     */
    dyDst {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Handle to a decompressor that supports the format of data described in <b>lpbiIn</b>.
     * @type {Pointer<HIC>}
     */
    hicDecompressor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
