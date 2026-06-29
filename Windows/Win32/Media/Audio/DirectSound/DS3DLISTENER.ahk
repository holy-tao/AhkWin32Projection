#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Graphics\Direct3D\D3DVECTOR.ahk" { D3DVECTOR }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DS3DLISTENER {
    #StructPack 4

    dwSize : UInt32

    vPosition : D3DVECTOR

    vVelocity : D3DVECTOR

    vOrientFront : D3DVECTOR

    vOrientTop : D3DVECTOR

    flDistanceFactor : Float32

    flRolloffFactor : Float32

    flDopplerFactor : Float32

}
