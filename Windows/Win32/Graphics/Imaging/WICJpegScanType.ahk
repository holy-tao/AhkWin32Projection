#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the memory layout of pixel data in a JPEG image scan.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegscantype
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegScanType extends Win32Enum{

    /**
     * The pixel data is stored in an interleaved memory layout.
     * @type {Integer (Int32)}
     */
    static WICJpegScanTypeInterleaved => 0

    /**
     * The pixel data is stored in a planar memory layout.
     * @type {Integer (Int32)}
     */
    static WICJpegScanTypePlanarComponents => 1

    /**
     * The pixel data is stored in a progressive layout.
     * @type {Integer (Int32)}
     */
    static WICJpegScanTypeProgressive => 2
}
