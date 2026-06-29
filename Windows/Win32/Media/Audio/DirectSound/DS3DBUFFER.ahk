#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Graphics\Direct3D\D3DVECTOR.ahk" { D3DVECTOR }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DS3DBUFFER {
    #StructPack 4

    dwSize : UInt32

    vPosition : D3DVECTOR

    vVelocity : D3DVECTOR

    dwInsideConeAngle : UInt32

    dwOutsideConeAngle : UInt32

    vConeOrientation : D3DVECTOR

    lConeOutsideVolume : Int32

    flMinDistance : Float32

    flMaxDistance : Float32

    dwMode : UInt32

}
