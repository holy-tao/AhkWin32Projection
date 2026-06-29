#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct DATAINFO {
    #StructPack 4

    ulTotalSize : UInt32

    ulavrPacketSize : UInt32

    ulConnectSpeed : UInt32

    ulProcessorSpeed : UInt32

}
