#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class MSVidSegmentType extends Win32Enum {

    /**
     * Native name: MSVidSEG_SOURCE
     * @type {Integer (Int32)}
     */
    static VidSEG_SOURCE => 0

    /**
     * Native name: MSVidSEG_XFORM
     * @type {Integer (Int32)}
     */
    static VidSEG_XFORM => 1

    /**
     * Native name: MSVidSEG_DEST
     * @type {Integer (Int32)}
     */
    static VidSEG_DEST => 2
}
