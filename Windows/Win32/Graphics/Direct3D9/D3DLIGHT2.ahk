#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DCOLORVALUE.ahk" { D3DCOLORVALUE }
#Import "..\Direct3D\D3DVECTOR.ahk" { D3DVECTOR }
#Import ".\D3DLIGHTTYPE.ahk" { D3DLIGHTTYPE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DLIGHT2 {
    #StructPack 4

    dwSize : UInt32

    dltType : D3DLIGHTTYPE

    dcvColor : D3DCOLORVALUE

    dvPosition : D3DVECTOR

    dvDirection : D3DVECTOR

    dvRange : Float32

    dvFalloff : Float32

    dvAttenuation0 : Float32

    dvAttenuation1 : Float32

    dvAttenuation2 : Float32

    dvTheta : Float32

    dvPhi : Float32

    dwFlags : UInt32

}
