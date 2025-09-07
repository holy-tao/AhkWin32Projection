#Requires AutoHotkey v2.0.0 64-bit

/**
 * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The WMPTemplateSize enumeration represents HTML template sizes.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/ne-contentpartner-wmptemplatesize
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPTemplateSize{

    /**
     * Small template; height is fixed at 100 pixels.
     * @type {Integer (Int32)}
     */
    static wmptsSmall => 0

    /**
     * Medium template; height is fixed at 250 pixels.
     * @type {Integer (Int32)}
     */
    static wmptsMedium => 1

    /**
     * Large template. Windows Media Player allocates as much room as possible while allowing space for the list control to display a single row of items.
     * @type {Integer (Int32)}
     */
    static wmptsLarge => 2
}
