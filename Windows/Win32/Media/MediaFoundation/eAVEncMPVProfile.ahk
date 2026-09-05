#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the MPEG-2 profile. This enumeration is used with the AVEncMPVProfile property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncMPVProfile extends Win32Enum {

    /**
     * The profile is not known.
     * Native name: eAVEncMPVProfile_unknown
     * @type {Integer (Int32)}
     */
    static unknown => 0

    /**
     * Simple Profile.
     * Native name: eAVEncMPVProfile_Simple
     * @type {Integer (Int32)}
     */
    static Simple => 1

    /**
     * Main Profile.
     * Native name: eAVEncMPVProfile_Main
     * @type {Integer (Int32)}
     */
    static Main => 2

    /**
     * High Profile.
     * Native name: eAVEncMPVProfile_High
     * @type {Integer (Int32)}
     */
    static High => 3

    /**
     * 4:2:2 Profile.
     * Native name: eAVEncMPVProfile_422
     * @type {Integer (Int32)}
     */
    static 422 => 4
}
