#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY_S {
    #StructPack 4

    Capabilities : UInt32

    Reserved0 : UInt32

}
