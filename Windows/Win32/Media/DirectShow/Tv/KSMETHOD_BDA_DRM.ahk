#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_DRM extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_DRM_CURRENT
     * @type {Integer (Int32)}
     */
    static CURRENT => 0

    /**
     * Native name: KSMETHOD_BDA_DRM_DRMSTATUS
     * @type {Integer (Int32)}
     */
    static DRMSTATUS => 1
}
