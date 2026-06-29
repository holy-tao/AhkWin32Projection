#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_CAMERAOFFSET {
    #StructPack 4

    PitchAngle : Int32

    YawAngle : Int32

    Flag : UInt32

    Reserved : UInt32

}
