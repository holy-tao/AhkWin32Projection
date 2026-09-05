#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICJpegXLAnimFrameProperties extends Win32Enum {

    /**
     * Native name: WICJpegXLAnimFrameDurationInTicks
     * @type {Integer (Int32)}
     */
    static DurationInTicks => 1

    /**
     * Native name: WICJpegXLAnimFrameName
     * @type {Integer (Int32)}
     */
    static Name => 2
}
