#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSAUDIO_MICROPHONE_COORDINATES.ahk" { KSAUDIO_MICROPHONE_COORDINATES }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_MIC_ARRAY_GEOMETRY {
    #StructPack 2

    usVersion : UInt16

    usMicArrayType : UInt16

    wVerticalAngleBegin : Int16

    wVerticalAngleEnd : Int16

    wHorizontalAngleBegin : Int16

    wHorizontalAngleEnd : Int16

    usFrequencyBandLo : UInt16

    usFrequencyBandHi : UInt16

    usNumberOfMicrophones : UInt16

    KsMicCoord : KSAUDIO_MICROPHONE_COORDINATES[1]

}
