#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPPlugin_Caps enumeration type signals whether the plug-in can convert between input and output formats.
 * @remarks
 * When <b>IWMPPlugin::GetCaps</b> returns <b>WMPPlugin_Caps_CannotConvertFormats</b>, Windows Media Player handles any necessary format conversion.
 * @see https://learn.microsoft.com/windows/win32/api/wmpservices/ne-wmpservices-wmpplugin_caps
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPPlugin_Caps extends Win32Enum{

    /**
     * The plug-in requires that the input format and output format be the same.
     * @type {Integer (Int32)}
     */
    static WMPPlugin_Caps_CannotConvertFormats => 1
}
