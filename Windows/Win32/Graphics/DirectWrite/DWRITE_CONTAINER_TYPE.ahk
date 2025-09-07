#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the container format of a font resource. A container format is distinct from a font file format (DWRITE_FONT_FILE_TYPE) because the container describes the container in which the underlying font file is packaged.
 * @remarks
 * DWRITE_CONTAINER_TYPE is returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-analyzecontainertype">IDWriteFactory5::AnalyzeContainerType</a>
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_container_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_CONTAINER_TYPE{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_CONTAINER_TYPE_UNKNOWN => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_CONTAINER_TYPE_WOFF => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_CONTAINER_TYPE_WOFF2 => 2
}
