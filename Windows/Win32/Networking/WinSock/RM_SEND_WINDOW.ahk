#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RM_SEND_WINDOW structure specifies the Reliable Multicast send window. This structure is used with the RM_RATE_WINDOW_SIZE socket option.
 * @remarks
 * Any combination of the three available members may be set for a given socket option call. For example, one, any two, or all three members may be specified during a <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a> function call. Regardless of settings, Windows enforces the following ratio: <b>TransmissionRate</b> == (<b>WindowSizeBytes</b>/<b>WindowSizeMSecs</b>) * 8. As such, setting any two parameters effectively sets the third to ensure optimum performance. 
 * 
 * The combination of these members can affect the resources used on a PGM sender's computer. For example, a large transmission rate value combined with a large window size results in more required buffer space.
 * @see https://learn.microsoft.com/windows/win32/api/wsrm/ns-wsrm-rm_send_window
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct RM_SEND_WINDOW {
    #StructPack 4

    /**
     * Transmission rate for the send window, in kilobits per second.
     */
    RateKbitsPerSec : UInt32

    /**
     * Window size for the send window, in milliseconds.
     */
    WindowSizeInMSecs : UInt32

    /**
     * Window size for the session, in bytes.
     */
    WindowSizeInBytes : UInt32

}
