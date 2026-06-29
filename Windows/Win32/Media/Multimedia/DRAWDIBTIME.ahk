#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRAWDIBTIME structure contains elapsed timing information for performing a set of DrawDib operations. The DrawDibTime function resets the count and the elapsed time value for each operation each time it is called.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-drawdibtime
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct DRAWDIBTIME {
    #StructPack 4

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
     */
    timeCount : Int32

    /**
     * Time to draw bitmaps.
     */
    timeDraw : Int32

    /**
     * Time to decompress bitmaps.
     */
    timeDecompress : Int32

    /**
     * Time to dither bitmaps.
     */
    timeDither : Int32

    /**
     * Time to stretch bitmaps.
     */
    timeStretch : Int32

    /**
     * Time to transfer bitmaps by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-bitblt">BitBlt</a> function.
     */
    timeBlt : Int32

    /**
     * Time to transfer bitmaps by using the <a href="https://docs.microsoft.com/previous-versions//ms532281(v=vs.85)">SetDIBits</a> function.
     */
    timeSetDIBits : Int32

}
