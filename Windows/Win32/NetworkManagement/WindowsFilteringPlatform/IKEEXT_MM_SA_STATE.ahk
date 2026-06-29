#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * States for the Main Mode (MM) negotiation exchanges that are part of the Authenticated Internet Protocol (AuthIP) and Internet Key Exchange (IKE) protocols.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_mm_sa_state
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_MM_SA_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Initial state.  No packets have been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_MM_SA_STATE_NONE => 0

    /**
     * First packet has been sent to the peer
     * @type {Integer (Int32)}
     */
    static IKEEXT_MM_SA_STATE_SA_SENT => 1

    /**
     * Second packet has been sent to the peer, for SSPI authentication.
     * @type {Integer (Int32)}
     */
    static IKEEXT_MM_SA_STATE_SSPI_SENT => 2

    /**
     * Third packet has been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_MM_SA_STATE_FINAL => 3

    /**
     * Final packet has been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_MM_SA_STATE_FINAL_SENT => 4

    /**
     * MM has been completed.
     * @type {Integer (Int32)}
     */
    static IKEEXT_MM_SA_STATE_COMPLETE => 5

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_MM_SA_STATE_MAX => 6
}
