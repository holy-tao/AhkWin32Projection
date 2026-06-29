#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the reason why a connection attempt failed.
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/ne-adhoc-dot11_adhoc_connect_fail_reason
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ADHOC_CONNECT_FAIL_REASON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The local host's configuration is incompatible with the target network. This occurs when the local host is 802.11d compliant and the regulatory domain of the local host is not compatible with the regulatory domain of the target network. For more information about regulatory domains, see the IEEE 802.11d-2001 standard. The standard can be downloaded from the <a href="https://standards.ieee.org/standard">IEEE website</a>.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_CONNECT_FAIL_DOMAIN_MISMATCH => 0

    /**
     * The passphrase supplied to authenticate the local machine or user on the target network is incorrect.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_CONNECT_FAIL_PASSPHRASE_MISMATCH => 1

    /**
     * The connection failed for another reason.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_CONNECT_FAIL_OTHER => 2
}
