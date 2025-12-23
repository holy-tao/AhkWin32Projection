#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @remarks
 * This enumeration is used by the [RegisterForTooltipDismissNotification](nf-winuser-registerfortooltipdismissnotification.md) function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-tooltip_dismiss_flags
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class TOOLTIP_DISMISS_FLAGS extends Win32Enum{

    /**
     * The window is registered to receive tooltip dismiss notifications.
     * @type {Integer (Int32)}
     */
    static TDF_REGISTER => 1

    /**
     * The window is unregistered from receiving tooltip dismiss notifications.
     * @type {Integer (Int32)}
     */
    static TDF_UNREGISTER => 2
}
