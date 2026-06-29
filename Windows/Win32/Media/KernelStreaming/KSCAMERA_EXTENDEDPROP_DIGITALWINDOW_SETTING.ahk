#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING {
    #StructPack 4

    OriginX : Int32

    OriginY : Int32

    WindowSize : Int32

    Reserved : UInt32

}
