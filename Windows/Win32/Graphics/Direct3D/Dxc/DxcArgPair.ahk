#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct DxcArgPair {
    #StructPack 8

    pName : PWSTR

    pValue : PWSTR

}
