#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the MPEG-2 profile. This enumeration is used with the AVEncMPVLevel property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencmpvlevel
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPVLevel{

    /**
     * Low Level.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVLevel_Low => 1

    /**
     * Main Level.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVLevel_Main => 2

    /**
     * High 1440 Level.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVLevel_High1440 => 3

    /**
     * High Level.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVLevel_High => 4
}
