#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the layout template to use in a tile flyout (mix view) update. At present, only one template is defined.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyouttemplatetype
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class TileFlyoutTemplateType extends Win32Enum{

    /**
     * Eight sub-tiles that surround a central medium (150x150) tile. Each sub-tile supports a combination of text and images.
     * 
     * <img src="images/TileFlyoutTemplate01.png" alt="TileFlyoutTemplate01 example" />
     * + Sub-tiles 1-4 support an image optionally overlaid with a single text string normally used as a label. If the user hovers over one of these sub-tiles, the text scrolls.
     * + Sub-tiles 5-8 support an image optionally overlaid with one or more strings from a set of 11 possible strings, each of which provides its own placement and font size on the sub-tile.
     * @type {Integer (Int32)}
     */
    static TileFlyoutTemplate01 => 0
}
