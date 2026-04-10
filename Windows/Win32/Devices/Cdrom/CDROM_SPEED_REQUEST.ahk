#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class CDROM_SPEED_REQUEST extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static CdromSetSpeed => 0

    /**
     * @type {Integer (Int32)}
     */
    static CdromSetStreaming => 1
}
