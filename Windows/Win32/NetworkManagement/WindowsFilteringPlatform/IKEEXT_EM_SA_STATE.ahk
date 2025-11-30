#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * States for the Extended Mode (EM) negotiation exchanges that are part of the Authenticated Internet Protocol (AuthIP) protocol.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ne-iketypes-ikeext_em_sa_state
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_EM_SA_STATE extends Win32Enum{

    /**
     * Initial state.  No Extended Mode packets have been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_EM_SA_STATE_NONE => 0

    /**
     * First packet has been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_EM_SA_STATE_SENT_ATTS => 1

    /**
     * Second packet has been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_EM_SA_STATE_SSPI_SENT => 2

    /**
     * Third packet has been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_EM_SA_STATE_AUTH_COMPLETE => 3

    /**
     * Final packet has been sent to the peer.
     * @type {Integer (Int32)}
     */
    static IKEEXT_EM_SA_STATE_FINAL => 4

    /**
     * Extended mode has been completed.
     * @type {Integer (Int32)}
     */
    static IKEEXT_EM_SA_STATE_COMPLETE => 5

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_EM_SA_STATE_MAX => 6
}
