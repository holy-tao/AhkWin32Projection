#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the failure types for cluster resources.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-failure_type
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct FAILURE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
