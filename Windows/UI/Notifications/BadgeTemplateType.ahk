#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the template to use for a tile's badge overlay. Used by [BadgeUpdateManager.getTemplateContent](badgeupdatemanager_gettemplatecontent_2049200015.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgetemplatetype
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class BadgeTemplateType extends Win32Enum{

    /**
     * A system-provided glyph image. For more information, see [Badge overview](/previous-versions/windows/apps/hh779719(v=win.10)).
     * @type {Integer (Int32)}
     */
    static BadgeGlyph => 0

    /**
     * A numerical value from 1 to 99. Values greater than 99 are accepted, but in those cases "99+" is displayed instead of the actual number. In scenarios where your numbers are expected to be greater than 99, you should consider using a glyph instead.
     * @type {Integer (Int32)}
     */
    static BadgeNumber => 1
}
