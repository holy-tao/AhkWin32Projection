#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class HTTP_POLICY_EXTENSION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_EXTENSION_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_EXTENSION_TYPE_WINHTTP => 1

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_EXTENSION_TYPE_WININET => 2
}
