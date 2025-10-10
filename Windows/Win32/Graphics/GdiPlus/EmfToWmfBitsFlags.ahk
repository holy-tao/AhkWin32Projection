#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies options for the Metafile::EmfToWmfBits method, which converts an Enhanced Metafile (EMF) metafile to a Windows Metafile Format (WMF) metafile.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-emftowmfbitsflags
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EmfToWmfBitsFlags{

    /**
     * Specifies the default conversion.
     * @type {Integer (Int32)}
     */
    static EmfToWmfBitsFlagsDefault => 0

    /**
     * Specifies that the source EMF metafile is embedded as a comment in the resulting WMF metafile.
     * @type {Integer (Int32)}
     */
    static EmfToWmfBitsFlagsEmbedEmf => 1

    /**
     * Specifies that the resulting WMF metafile is in the placeable metafile format; that is, it has the additional 22-byte header required by a placeable metafile.
     * @type {Integer (Int32)}
     */
    static EmfToWmfBitsFlagsIncludePlaceable => 2

    /**
     * Specifies that the clipping region is stored in the metafile in the traditional way. If you do not set this flag, the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-metafile-emftowmfbits">Metafile::EmfToWmfBits</a> method applies an optimization that stores the clipping region as a path and simulates clipping by using the XOR operator.
     * @type {Integer (Int32)}
     */
    static EmfToWmfBitsFlagsNoXORClip => 4
}
