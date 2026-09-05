#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the reasons why an attendee was disconnected from the session.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-attendee_disconnect_reason
 * @namespace Windows.Win32.System.DesktopSharing
 */
class ATTENDEE_DISCONNECT_REASON extends Win32Enum {

    /**
     * Minimum enumeration value.
     * Native name: ATTENDEE_DISCONNECT_REASON_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 0

    /**
     * The application called the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-terminateconnection">IRDPSRAPIAttendee::TerminateConnection</a> method.
     * Native name: ATTENDEE_DISCONNECT_REASON_APP
     * @type {Integer (Int32)}
     */
    static APP => 0

    /**
     * There was an internal error when processing data from an attendee or trying to manage an attendee
     * Native name: ATTENDEE_DISCONNECT_REASON_ERR
     * @type {Integer (Int32)}
     */
    static ERR => 1

    /**
     * The attendee disconnected after a request from the attendee itself.
     * Native name: ATTENDEE_DISCONNECT_REASON_CLI
     * @type {Integer (Int32)}
     */
    static CLI => 2

    /**
     * Maximum enumeration value.
     * Native name: ATTENDEE_DISCONNECT_REASON_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
