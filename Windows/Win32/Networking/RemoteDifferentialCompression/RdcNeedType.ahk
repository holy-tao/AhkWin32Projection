#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of data chunks used to generate a remote copy.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/ne-msrdc-rdcneedtype
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RdcNeedType{

    /**
     * The chunk is a source chunk.
     * @type {Integer (Int32)}
     */
    static RDCNEED_SOURCE => 0

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static RDCNEED_TARGET => 1

    /**
     * The chunk is a seed chunk.
     * @type {Integer (Int32)}
     */
    static RDCNEED_SEED => 2

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static RDCNEED_SEED_MAX => 255
}
