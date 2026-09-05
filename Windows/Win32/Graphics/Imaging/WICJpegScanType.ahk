#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the memory layout of pixel data in a JPEG image scan.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegscantype
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICJpegScanType extends Win32Enum {

    /**
     * The pixel data is stored in an interleaved memory layout.
     * Native name: WICJpegScanTypeInterleaved
     * @type {Integer (Int32)}
     */
    static Interleaved => 0

    /**
     * The pixel data is stored in a planar memory layout.
     * Native name: WICJpegScanTypePlanarComponents
     * @type {Integer (Int32)}
     */
    static PlanarComponents => 1

    /**
     * The pixel data is stored in a progressive layout.
     * Native name: WICJpegScanTypeProgressive
     * @type {Integer (Int32)}
     */
    static Progressive => 2
}
