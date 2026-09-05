#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the failure types for cluster resources.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-failure_type
 * @namespace Windows.Win32.Networking.Clustering
 */
class FAILURE_TYPE extends Win32Enum {

    /**
     * A general failure.
     * Native name: FAILURE_TYPE_GENERAL
     * @type {Integer (Int32)}
     */
    static GENERAL => 0

    /**
     * An embedded failure.
     * Native name: FAILURE_TYPE_EMBEDDED
     * @type {Integer (Int32)}
     */
    static EMBEDDED => 1

    /**
     * A network failure.
     * Native name: FAILURE_TYPE_NETWORK_LOSS
     * @type {Integer (Int32)}
     */
    static NETWORK_LOSS => 2
}
