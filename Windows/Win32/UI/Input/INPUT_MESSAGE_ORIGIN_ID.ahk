#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ID of the input message source.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-input_message_origin_id
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class INPUT_MESSAGE_ORIGIN_ID{

    /**
     * The source isn't identified.
     * @type {Integer (Int32)}
     */
    static IMO_UNAVAILABLE => 0

    /**
     * The input message is from a hardware device or has been  injected into the message queue by an application that has the <b>UIAccess</b> attribute set to TRUE in its manifest file. 
 * 
 * For more information about the <b>UIAccess</b> attribute and application manifests, see <a href="https://docs.microsoft.com/previous-versions/bb756883(v=msdn.10)">UAC References</a>.
     * @type {Integer (Int32)}
     */
    static IMO_HARDWARE => 1

    /**
     * The input message has been injected (through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> function) by an application that doesn't have the <b>UIAccess</b> attribute set to TRUE in its manifest file.
     * @type {Integer (Int32)}
     */
    static IMO_INJECTED => 2

    /**
     * The system has injected the input message.
     * @type {Integer (Int32)}
     */
    static IMO_SYSTEM => 4
}
