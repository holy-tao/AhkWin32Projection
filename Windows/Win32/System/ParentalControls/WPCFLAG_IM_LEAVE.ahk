#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about when a participant leaves the instant messaging interaction.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpcflag_im_leave
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPCFLAG_IM_LEAVE extends Win32Enum{

    /**
     * An instant message participant left the interaction.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_LEAVE_NORMAL => 0

    /**
     * An instant message participant was forced to leave the interaction.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_LEAVE_FORCED => 1

    /**
     * This marks the end of the entire conversation.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_LEAVE_CONVERSATION_END => 2
}
