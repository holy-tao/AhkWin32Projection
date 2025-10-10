#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_VOICE_CLASS enumerated type specifies a device's voice capabilities and how they interact with the data service.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_voice_class
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_VOICE_CLASS{

    /**
     * The device voice class is unknown.
     * @type {Integer (Int32)}
     */
    static MBN_VOICE_CLASS_NONE => 0

    /**
     * The device does not support voice calls.
     * @type {Integer (Int32)}
     */
    static MBN_VOICE_CLASS_NO_VOICE => 1

    /**
     * The device supports voice calls, but does not support simultaneous voice and data.
     * @type {Integer (Int32)}
     */
    static MBN_VOICE_CLASS_SEPARATE_VOICE_DATA => 2

    /**
     * The device supports simultaneous voice and data.
     * @type {Integer (Int32)}
     */
    static MBN_VOICE_CLASS_SIMULTANEOUS_VOICE_DATA => 3
}
