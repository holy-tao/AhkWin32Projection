#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the failure types for cluster resources.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-failure_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class FAILURE_TYPE{

    /**
     * A general failure.
     * @type {Integer (Int32)}
     */
    static FAILURE_TYPE_GENERAL => 0

    /**
     * An embedded failure.
     * @type {Integer (Int32)}
     */
    static FAILURE_TYPE_EMBEDDED => 1

    /**
     * A network failure.
     * @type {Integer (Int32)}
     */
    static FAILURE_TYPE_NETWORK_LOSS => 2
}
