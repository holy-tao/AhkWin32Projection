#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the MPEG-2 profile. This enumeration is used with the AVEncMPVLevel property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvlevel
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncMPVLevel extends Win32Enum {

    /**
     * Low Level.
     * Native name: eAVEncMPVLevel_Low
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * Main Level.
     * Native name: eAVEncMPVLevel_Main
     * @type {Integer (Int32)}
     */
    static Main => 2

    /**
     * High 1440 Level.
     * Native name: eAVEncMPVLevel_High1440
     * @type {Integer (Int32)}
     */
    static High1440 => 3

    /**
     * High Level.
     * Native name: eAVEncMPVLevel_High
     * @type {Integer (Int32)}
     */
    static High => 4
}
