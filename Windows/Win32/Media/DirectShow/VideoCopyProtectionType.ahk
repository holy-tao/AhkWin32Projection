#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class VideoCopyProtectionType extends Win32Enum {

    /**
     * Native name: VideoCopyProtectionMacrovisionBasic
     * @type {Integer (Int32)}
     */
    static MacrovisionBasic => 0

    /**
     * Native name: VideoCopyProtectionMacrovisionCBI
     * @type {Integer (Int32)}
     */
    static MacrovisionCBI => 1
}
