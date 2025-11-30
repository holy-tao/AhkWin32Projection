#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmplatformversion
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MrmPlatformVersion extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MrmPlatformVersion_Default => 0

    /**
     * @type {Integer (Int32)}
     */
    static MrmPlatformVersion_Windows10_0_0_0 => 17432576

    /**
     * @type {Integer (Int32)}
     */
    static MrmPlatformVersion_Windows10_0_0_5 => 17432581
}
