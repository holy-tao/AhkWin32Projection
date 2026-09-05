#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * States for the Extended Mode (EM) negotiation exchanges that are part of the Authenticated Internet Protocol (AuthIP) protocol.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_em_sa_state
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_EM_SA_STATE extends Win32Enum {

    /**
     * Initial state.  No Extended Mode packets have been sent to the peer.
     * Native name: IKEEXT_EM_SA_STATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * First packet has been sent to the peer.
     * Native name: IKEEXT_EM_SA_STATE_SENT_ATTS
     * @type {Integer (Int32)}
     */
    static SENT_ATTS => 1

    /**
     * Second packet has been sent to the peer.
     * Native name: IKEEXT_EM_SA_STATE_SSPI_SENT
     * @type {Integer (Int32)}
     */
    static SSPI_SENT => 2

    /**
     * Third packet has been sent to the peer.
     * Native name: IKEEXT_EM_SA_STATE_AUTH_COMPLETE
     * @type {Integer (Int32)}
     */
    static AUTH_COMPLETE => 3

    /**
     * Final packet has been sent to the peer.
     * Native name: IKEEXT_EM_SA_STATE_FINAL
     * @type {Integer (Int32)}
     */
    static FINAL => 4

    /**
     * Extended mode has been completed.
     * Native name: IKEEXT_EM_SA_STATE_COMPLETE
     * @type {Integer (Int32)}
     */
    static COMPLETE => 5

    /**
     * Maximum value for testing purposes.
     * Native name: IKEEXT_EM_SA_STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 6
}
