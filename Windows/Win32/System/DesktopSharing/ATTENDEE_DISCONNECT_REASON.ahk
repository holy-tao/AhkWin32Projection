#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the reasons why an attendee was disconnected from the session.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-attendee_disconnect_reason
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct ATTENDEE_DISCONNECT_REASON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Minimum enumeration value.
     * @type {Integer (Int32)}
     */
    static ATTENDEE_DISCONNECT_REASON_MIN => 0

    /**
     * The application called the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-terminateconnection">IRDPSRAPIAttendee::TerminateConnection</a> method.
     * @type {Integer (Int32)}
     */
    static ATTENDEE_DISCONNECT_REASON_APP => 0

    /**
     * There was an internal error when processing data from an attendee or trying to manage an attendee
     * @type {Integer (Int32)}
     */
    static ATTENDEE_DISCONNECT_REASON_ERR => 1

    /**
     * The attendee disconnected after a request from the attendee itself.
     * @type {Integer (Int32)}
     */
    static ATTENDEE_DISCONNECT_REASON_CLI => 2

    /**
     * Maximum enumeration value.
     * @type {Integer (Int32)}
     */
    static ATTENDEE_DISCONNECT_REASON_MAX => 2
}
