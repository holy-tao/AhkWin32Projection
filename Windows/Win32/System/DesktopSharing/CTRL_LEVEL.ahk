#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the level of control that an attendee has on a session.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-ctrl_level
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class CTRL_LEVEL extends Win32Enum{

    /**
     * Minimum enumeration value.
     * @type {Integer (Int32)}
     */
    static CTRL_LEVEL_MIN => 0

    /**
     * The control level is not valid.
     * @type {Integer (Int32)}
     */
    static CTRL_LEVEL_INVALID => 0

    /**
     * The attendee cannot view or interact with the session. This is the default.
     * @type {Integer (Int32)}
     */
    static CTRL_LEVEL_NONE => 1

    /**
     * The attendee can view the session.
     * @type {Integer (Int32)}
     */
    static CTRL_LEVEL_VIEW => 2

    /**
     * The attendee can view and interact with the session. The local keyboard and mouse input is redirected to 
     *       the session.
     * @type {Integer (Int32)}
     */
    static CTRL_LEVEL_INTERACTIVE => 3

    /**
     * The attendee can view the session.
     * 
     * <b>Windows Server 2012, Windows 8, Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This enumeration value is not supported.
     * @type {Integer (Int32)}
     */
    static CTRL_LEVEL_REQCTRL_VIEW => 4

    /**
     * The attendee can view and interact with the session. The local keyboard and mouse input is redirected to the 
     *        session. Hosting applications that want to allow users to control the shared session must either define 
     *        <b>uiAccess</b> as "true" in their application manifest OR run at High Integrity 
     *        Level (elevated). For more information see 
     *        <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-securityoverview">Setting UIAccess in the Application Manifest File</a>.
     * 
     * <b>Windows Server 2012, Windows 8, Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This enumeration value is not supported.
     * @type {Integer (Int32)}
     */
    static CTRL_LEVEL_REQCTRL_INTERACTIVE => 5

    /**
     * Maximum enumeration value.
     * @type {Integer (Int32)}
     */
    static CTRL_LEVEL_MAX => 5
}
