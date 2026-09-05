#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICJpegXLAnimProperties extends Win32Enum {

    /**
     * Native name: WICJpegXLAnimLoopCount
     * @type {Integer (Int32)}
     */
    static LoopCount => 1

    /**
     * Native name: WICJpegXLAnimFrameTicksPerSecondNumerator
     * @type {Integer (Int32)}
     */
    static FrameTicksPerSecondNumerator => 2

    /**
     * Native name: WICJpegXLAnimFrameTicksPerSecondDenominator
     * @type {Integer (Int32)}
     */
    static FrameTicksPerSecondDenominator => 3
}
