#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the location of a resource.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_LOCALITY extends Win32Enum{

    /**
     * The resource is remote, and information about it is unknown, including the file size and date. If you attempt to create a font or file stream, the creation will fail until locality becomes at least partial.
     * @type {Integer (Int32)}
     */
    static DWRITE_LOCALITY_REMOTE => 0

    /**
     * The resource is partially local, which means you can query the size and date of the file stream. With this type, you also might be able to create a font face and retrieve the particular glyphs for metrics and drawing, but not all the glyphs will be present.
     * @type {Integer (Int32)}
     */
    static DWRITE_LOCALITY_PARTIAL => 1

    /**
     * The resource is completely local, and all font functions can be called without concern of missing data or errors related to network connectivity.
     * @type {Integer (Int32)}
     */
    static DWRITE_LOCALITY_LOCAL => 2
}
