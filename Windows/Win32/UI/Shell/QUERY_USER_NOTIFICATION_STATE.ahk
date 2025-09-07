#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the state of the machine for the current user in relation to the propriety of sending a notification. Used by SHQueryUserNotificationState.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ne-shellapi-query_user_notification_state
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class QUERY_USER_NOTIFICATION_STATE{

    /**
     * A screen saver is displayed, the machine is locked, or a nonactive Fast User Switching session is in progress.
     * @type {Integer (Int32)}
     */
    static QUNS_NOT_PRESENT => 1

    /**
     * A full-screen application is running or Presentation Settings are applied. Presentation Settings allow a user to put their machine into a state fit for an uninterrupted presentation, such as a set of PowerPoint slides, with a single click.
     * @type {Integer (Int32)}
     */
    static QUNS_BUSY => 2

    /**
     * A full-screen (exclusive mode) Direct3D application is running.
     * @type {Integer (Int32)}
     */
    static QUNS_RUNNING_D3D_FULL_SCREEN => 3

    /**
     * The user has activated Windows presentation settings to block notifications and pop-up messages.
     * @type {Integer (Int32)}
     */
    static QUNS_PRESENTATION_MODE => 4

    /**
     * None of the other states are found, notifications can be freely sent.
     * @type {Integer (Int32)}
     */
    static QUNS_ACCEPTS_NOTIFICATIONS => 5

    /**
     * <b>Introduced in Windows 7</b>. The current user is in "quiet time", which is the first hour after a new user logs into his or her account for the first time. During this time, most notifications should not be sent or shown. This lets a user become accustomed to a new computer system without those distractions. Quiet time also occurs for each user after an operating system upgrade or clean installation.
 *         
 *                         
 * 
 * Applications should set the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/ns-shellapi-notifyicondataa">NIIF_RESPECT_QUIET_TIME</a> flag in their notifications or balloon tooltip, which prevents those items from being displayed while the current user is in the quiet-time state.
 * 
 * Note that during quiet time, if the user is in one of the other blocked modes (QUNS_NOT_PRESENT, QUNS_BUSY, QUNS_PRESENTATION_MODE, or QUNS_RUNNING_D3D_FULL_SCREEN) <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shqueryusernotificationstate">SHQueryUserNotificationState</a> returns only that value, and does not report QUNS_QUIET_TIME.
     * @type {Integer (Int32)}
     */
    static QUNS_QUIET_TIME => 6

    /**
     * <b>Introduced in Windows 8</b>. A Windows Store app is running.
     * @type {Integer (Int32)}
     */
    static QUNS_APP => 7
}
