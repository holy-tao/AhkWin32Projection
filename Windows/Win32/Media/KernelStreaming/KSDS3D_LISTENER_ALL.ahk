#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DS3DVECTOR.ahk" { DS3DVECTOR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_LISTENER_ALL {
    #StructPack 4

    Position : DS3DVECTOR

    Velocity : DS3DVECTOR

    OrientFront : DS3DVECTOR

    OrientTop : DS3DVECTOR

    DistanceFactor : Float32

    RolloffFactor : Float32

    DopplerFactor : Float32

}
