#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_S {
    #StructPack 4

    VideoStabilizationMode : UInt32

    Capabilities : UInt32

}
