#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMPPlugin_Caps enumeration type signals whether the plug-in can convert between input and output formats.
 * @remarks
 * When <b>IWMPPlugin::GetCaps</b> returns <b>WMPPlugin_Caps_CannotConvertFormats</b>, Windows Media Player handles any necessary format conversion.
 * @see https://learn.microsoft.com/windows/win32/api/wmpservices/ne-wmpservices-wmpplugin_caps
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPPlugin_Caps {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The plug-in requires that the input format and output format be the same.
     * @type {Integer (Int32)}
     */
    static WMPPlugin_Caps_CannotConvertFormats => 1
}
