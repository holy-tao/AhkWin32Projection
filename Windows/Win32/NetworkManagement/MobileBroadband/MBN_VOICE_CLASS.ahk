#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_VOICE_CLASS enumerated type specifies a device's voice capabilities and how they interact with the data service.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_voice_class
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_VOICE_CLASS extends Win32Enum {

    /**
     * The device voice class is unknown.
     * Native name: MBN_VOICE_CLASS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The device does not support voice calls.
     * Native name: MBN_VOICE_CLASS_NO_VOICE
     * @type {Integer (Int32)}
     */
    static NO_VOICE => 1

    /**
     * The device supports voice calls, but does not support simultaneous voice and data.
     * Native name: MBN_VOICE_CLASS_SEPARATE_VOICE_DATA
     * @type {Integer (Int32)}
     */
    static SEPARATE_VOICE_DATA => 2

    /**
     * The device supports simultaneous voice and data.
     * Native name: MBN_VOICE_CLASS_SIMULTANEOUS_VOICE_DATA
     * @type {Integer (Int32)}
     */
    static SIMULTANEOUS_VOICE_DATA => 3
}
