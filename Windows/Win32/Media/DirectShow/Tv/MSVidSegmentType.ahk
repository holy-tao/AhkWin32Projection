#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MSVidSegmentType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSVidSEG_SOURCE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSVidSEG_XFORM => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSVidSEG_DEST => 2
}
