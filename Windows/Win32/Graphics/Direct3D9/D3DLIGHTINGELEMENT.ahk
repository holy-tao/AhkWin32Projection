#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3DVECTOR.ahk" { D3DVECTOR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DLIGHTINGELEMENT {
    #StructPack 4

    dvPosition : D3DVECTOR

    dvNormal : D3DVECTOR

}
