#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class STREAMING_CONTROL_REQUEST_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static CdromStreamingDisable => 1

    /**
     * @type {Integer (Int32)}
     */
    static CdromStreamingEnableForReadOnly => 2

    /**
     * @type {Integer (Int32)}
     */
    static CdromStreamingEnableForWriteOnly => 3

    /**
     * @type {Integer (Int32)}
     */
    static CdromStreamingEnableForReadWrite => 4
}
