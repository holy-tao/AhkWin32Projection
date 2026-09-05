#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VideoProcAmpFlags enumeration indicates whether a particular video property is controlled manually or automatically.
 * @remarks
 * The following flags defined in KsMedia.h are equivalent to the values in <b>VideoProcAmpFlags</b>:
 * 
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-videoprocampflags
 * @namespace Windows.Win32.Media.DirectShow
 */
class VideoProcAmpFlags extends Win32Enum {

    /**
     * The setting is controlled automatically.
     * Native name: VideoProcAmp_Flags_Auto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * The setting is controlled manually.
     * Native name: VideoProcAmp_Flags_Manual
     * @type {Integer (Int32)}
     */
    static Manual => 2
}
