#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies which chroma subsampling mode will be used for image compression in JPEG images.
 * @remarks
 * **Y4Cb2Cr0** has the lowest space usage and lowest image quality. **Y4Cb2Cr2** provides medium space usage and image quality. **Y4Cb4Cr4** has the highest space usage and highest image quality.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.jpegsubsamplingmode
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class JpegSubsamplingMode extends Win32Enum{

    /**
     * The default mode will be used.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * 4:2:0 (2x2) chroma subsampling will be used.
     * @type {Integer (Int32)}
     */
    static Y4Cb2Cr0 => 1

    /**
     * 4:2:2 (2x1) chroma subsampling will be used.
     * @type {Integer (Int32)}
     */
    static Y4Cb2Cr2 => 2

    /**
     * 4:4:4 (1x1) chroma subsampling will be used.
     * @type {Integer (Int32)}
     */
    static Y4Cb4Cr4 => 3
}
