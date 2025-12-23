#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class WCS_DEVICE_CAPABILITIES_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VideoCardGammaTable => 1

    /**
     * @type {Integer (Int32)}
     */
    static MicrosoftHardwareColorV2 => 2
}
