#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_DRM extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_DRM_CURRENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_DRM_DRMSTATUS => 1
}
