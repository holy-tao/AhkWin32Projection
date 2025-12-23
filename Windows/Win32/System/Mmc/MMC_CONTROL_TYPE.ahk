#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MMC_CONTROL_TYPE enumeration defines the kinds of controls that can appear in the control bar. The values can be used in the nType parameter of the IControlbar::Attach and IControlbar::Create methods.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_control_type
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_CONTROL_TYPE extends Win32Enum{

    /**
     * The control to be associated with the control bar is a toolbar.
     * @type {Integer (Int32)}
     */
    static TOOLBAR => 0

    /**
     * The control is a drop-down menu. This is a standard Win32 menu button.
     * @type {Integer (Int32)}
     */
    static MENUBUTTON => 1

    /**
     * Not implemented at this time. This is a standard Win32 combo box.
     * @type {Integer (Int32)}
     */
    static COMBOBOXBAR => 2
}
