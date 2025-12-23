#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CERT_GET_CONFIG_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CC_DEFAULTCONFIG => 0

    /**
     * @type {Integer (Int32)}
     */
    static CC_FIRSTCONFIG => 2

    /**
     * @type {Integer (Int32)}
     */
    static CC_LOCALACTIVECONFIG => 4

    /**
     * @type {Integer (Int32)}
     */
    static CC_LOCALCONFIG => 3

    /**
     * @type {Integer (Int32)}
     */
    static CC_UIPICKCONFIG => 1

    /**
     * @type {Integer (Int32)}
     */
    static CC_UIPICKCONFIGSKIPLOCALCA => 5
}
