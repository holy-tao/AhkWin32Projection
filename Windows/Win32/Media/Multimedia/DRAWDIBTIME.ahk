#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRAWDIBTIME structure contains elapsed timing information for performing a set of DrawDib operations. The DrawDibTime function resets the count and the elapsed time value for each operation each time it is called.
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-drawdibtime
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class DRAWDIBTIME extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Number of times the following operations have been performed since <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-drawdibtime">DrawDibTime</a> was last called:
     * 
     * <ul>
     * <li>Draw a bitmap on the screen.</li>
     * <li>Decompress a bitmap.</li>
     * <li>Dither a bitmap.</li>
     * <li>Stretch a bitmap.</li>
     * <li>Transfer bitmap data by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-bitblt">BitBlt</a> function.</li>
     * <li>Transfer bitmap data by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-setdibits">SetDIBits</a> function.</li>
     * </ul>
     * @type {Integer}
     */
    timeCount {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Time to draw bitmaps.
     * @type {Integer}
     */
    timeDraw {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Time to decompress bitmaps.
     * @type {Integer}
     */
    timeDecompress {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Time to dither bitmaps.
     * @type {Integer}
     */
    timeDither {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Time to stretch bitmaps.
     * @type {Integer}
     */
    timeStretch {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Time to transfer bitmaps by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-bitblt">BitBlt</a> function.
     * @type {Integer}
     */
    timeBlt {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Time to transfer bitmaps by using the <a href="https://docs.microsoft.com/previous-versions//ms532281(v=vs.85)">SetDIBits</a> function.
     * @type {Integer}
     */
    timeSetDIBits {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
