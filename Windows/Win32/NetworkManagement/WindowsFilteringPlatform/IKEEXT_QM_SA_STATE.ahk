#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * States for the Quick Mode (QM) negotiation exchanges that are part of the Authenticated Internet Protocol (AuthIP) and Internet Key Exchange (IKE) protocols.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_qm_sa_state
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_QM_SA_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Initial state.  No QM packets have been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_QM_SA_STATE_NONE => 0

    /**
     * First packet has been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_QM_SA_STATE_INITIAL => 1

    /**
     * Final packet has been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_QM_SA_STATE_FINAL => 2

    /**
     * QM has been completed.
     * @type {Integer (Int32)}
     */
    static IKEEXT_QM_SA_STATE_COMPLETE => 3

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_QM_SA_STATE_MAX => 4
}
