#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PerformUv => 1

    /**
     * @type {Integer (Int32)}
     */
    static GetUvCount => 2

    /**
     * @type {Integer (Int32)}
     */
    static GetPubKey => 3
}
