#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_FAILED_CONNECTION_RETRIES {
    #StructPack 4

    dwMaxRetries : UInt32

    dwAllowedRetryConditions : UInt32

}
