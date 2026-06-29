#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPS {
    #StructPack 4

    ResolutionX : Int32

    ResolutionY : Int32

    PorchTop : Int32

    PorchLeft : Int32

    PorchBottom : Int32

    PorchRight : Int32

    NonUpscalingWindowSize : Int32

    MinWindowSize : Int32

    MaxWindowSize : Int32

    Reserved : Int32

}
