#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class CDROM_SPEED_REQUEST extends Win32Enum {

    /**
     * Native name: CdromSetSpeed
     * @type {Integer (Int32)}
     */
    static SetSpeed => 0

    /**
     * Native name: CdromSetStreaming
     * @type {Integer (Int32)}
     */
    static SetStreaming => 1
}
