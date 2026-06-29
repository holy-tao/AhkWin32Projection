#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_HTTP2_RECEIVE_WINDOW {
    #StructPack 4

    ulStreamWindow : UInt32

    ulStreamWindowUpdateDelta : UInt32

}
