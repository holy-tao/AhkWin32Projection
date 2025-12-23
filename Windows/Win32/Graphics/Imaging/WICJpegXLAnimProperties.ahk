#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegXLAnimProperties extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WICJpegXLAnimLoopCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static WICJpegXLAnimFrameTicksPerSecondNumerator => 2

    /**
     * @type {Integer (Int32)}
     */
    static WICJpegXLAnimFrameTicksPerSecondDenominator => 3
}
