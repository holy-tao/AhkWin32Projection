#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_BYTES.ahk" { WS_BYTES }

/**
 * A structure used to represent a discontiguous array of WS_BYTES.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_buffers
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_BUFFERS {
    #StructPack 8

    bufferCount : UInt32

    buffers : WS_BYTES.Ptr

}
