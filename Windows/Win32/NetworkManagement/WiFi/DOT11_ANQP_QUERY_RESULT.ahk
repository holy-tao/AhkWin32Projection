#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ANQP_QUERY_RESULT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static dot11_ANQP_query_result_success => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_ANQP_query_result_failure => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_ANQP_query_result_timed_out => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_ANQP_query_result_resources => 3

    /**
     * @type {Integer (Int32)}
     */
    static dot11_ANQP_query_result_advertisement_protocol_not_supported_on_remote => 4

    /**
     * @type {Integer (Int32)}
     */
    static dot11_ANQP_query_result_gas_protocol_failure => 5

    /**
     * @type {Integer (Int32)}
     */
    static dot11_ANQP_query_result_advertisement_server_not_responding => 6

    /**
     * @type {Integer (Int32)}
     */
    static dot11_ANQP_query_result_access_issues => 7
}
