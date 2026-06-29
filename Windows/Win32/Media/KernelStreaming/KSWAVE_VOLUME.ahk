#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSWAVE_VOLUME {
    #StructPack 4

    LeftAttenuation : Int32

    RightAttenuation : Int32

}
