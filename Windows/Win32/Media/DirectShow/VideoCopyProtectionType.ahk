#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class VideoCopyProtectionType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static VideoCopyProtectionMacrovisionBasic => 0

    /**
     * @type {Integer (Int32)}
     */
    static VideoCopyProtectionMacrovisionCBI => 1
}
