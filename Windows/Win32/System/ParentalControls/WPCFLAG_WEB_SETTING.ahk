#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Downloads are blocked.
 * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcwebsettings-getsettings
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPCFLAG_WEB_SETTING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_WEB_SETTING_NOTBLOCKED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_WEB_SETTING_DOWNLOADSBLOCKED => 1
}
