#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct TRANSPORTAUDIOPARMS {
    #StructPack 4

    EnableOutput : Int32

    EnableRecord : Int32

    EnableSelsync : Int32

    Input : Int32

    MonitorSource : Int32

}
