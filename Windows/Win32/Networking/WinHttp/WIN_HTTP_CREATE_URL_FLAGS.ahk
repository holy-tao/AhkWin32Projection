#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WIN_HTTP_CREATE_URL_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_ESCAPE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_REJECT_USERPWD => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_DECODE => 268435456
}
