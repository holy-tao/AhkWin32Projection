#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRT_SECURITY_MODE enumeration defines possible security modes for the DRT. The security mode is specified by a field of the DRT_SETTINGS structure.
 * @remarks
 * The more secure a DRT security mode, the more of a computational load exists for nodes participating in the DRT. More bandwidth is also consumed.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ne-drt-drt_security_mode
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_SECURITY_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Nodes must authenticate the keys they publish. Nodes are not required to authenticate themselves when performing searches.
     * @type {Integer (Int32)}
     */
    static DRT_SECURE_RESOLVE => 0

    /**
     * Nodes must authenticate the keys they publish. Nodes must also authenticate themselves when performing searches. Unauthorized nodes cannot search for  keys and cannot retrieve the data associated with published keys.
     * @type {Integer (Int32)}
     */
    static DRT_SECURE_MEMBERSHIP => 1

    /**
     * Nodes must authenticate the keys they publish. Nodes must also authenticate themselves when performing searches. Encryption is required for all data associated with published keys prior to transmission between DRT nodes. Unauthorized nodes cannot search for keys, cannot retrieve the data associated with published keys, and cannot retrieve data by observing network traffic between other DRT nodes.
     * @type {Integer (Int32)}
     */
    static DRT_SECURE_CONFIDENTIALPAYLOAD => 2
}
