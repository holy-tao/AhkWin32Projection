#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * States for the Main Mode (MM) negotiation exchanges that are part of the Authenticated Internet Protocol (AuthIP) and Internet Key Exchange (IKE) protocols.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_mm_sa_state
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_MM_SA_STATE extends Win32Enum {

    /**
     * Initial state.  No packets have been sent to the peer.
     * Native name: IKEEXT_MM_SA_STATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * First packet has been sent to the peer
     * Native name: IKEEXT_MM_SA_STATE_SA_SENT
     * @type {Integer (Int32)}
     */
    static SA_SENT => 1

    /**
     * Second packet has been sent to the peer, for SSPI authentication.
     * Native name: IKEEXT_MM_SA_STATE_SSPI_SENT
     * @type {Integer (Int32)}
     */
    static SSPI_SENT => 2

    /**
     * Third packet has been sent to the peer.
     * Native name: IKEEXT_MM_SA_STATE_FINAL
     * @type {Integer (Int32)}
     */
    static FINAL => 3

    /**
     * Final packet has been sent to the peer.
     * Native name: IKEEXT_MM_SA_STATE_FINAL_SENT
     * @type {Integer (Int32)}
     */
    static FINAL_SENT => 4

    /**
     * MM has been completed.
     * Native name: IKEEXT_MM_SA_STATE_COMPLETE
     * @type {Integer (Int32)}
     */
    static COMPLETE => 5

    /**
     * Maximum value for testing purposes.
     * Native name: IKEEXT_MM_SA_STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 6
}
