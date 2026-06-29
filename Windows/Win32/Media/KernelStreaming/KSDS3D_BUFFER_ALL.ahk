#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DS3DVECTOR.ahk" { DS3DVECTOR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_BUFFER_ALL {
    #StructPack 4

    Position : DS3DVECTOR

    Velocity : DS3DVECTOR

    InsideConeAngle : UInt32

    OutsideConeAngle : UInt32

    ConeOrientation : DS3DVECTOR

    ConeOutsideVolume : Int32

    MinDistance : Float32

    MaxDistance : Float32

    Mode : UInt32

}
