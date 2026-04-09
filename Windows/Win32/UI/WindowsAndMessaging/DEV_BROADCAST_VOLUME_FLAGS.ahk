#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class DEV_BROADCAST_VOLUME_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt16)}
     */
    static DBTF_MEDIA => 1

    /**
     * @type {Integer (UInt16)}
     */
    static DBTF_NET => 2
}
