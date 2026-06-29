#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_MICROPHONE_COORDINATES {
    #StructPack 2

    usType : UInt16

    wXCoord : Int16

    wYCoord : Int16

    wZCoord : Int16

    wVerticalAngle : Int16

    wHorizontalAngle : Int16

}
