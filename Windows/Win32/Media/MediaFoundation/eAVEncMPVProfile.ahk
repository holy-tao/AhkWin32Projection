#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the MPEG-2 profile. This enumeration is used with the AVEncMPVProfile property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPVProfile extends Win32Enum{

    /**
     * The profile is not known.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_unknown => 0

    /**
     * Simple Profile.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_Simple => 1

    /**
     * Main Profile.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_Main => 2

    /**
     * High Profile.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_High => 3

    /**
     * 4:2:2 Profile.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_422 => 4
}
