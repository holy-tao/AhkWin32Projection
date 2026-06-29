#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_SHADER_CACHE_PSDB_PROPERTIES {
    #StructPack 8

    pAdapterFamily : PWSTR

    pPsdbPath : PWSTR

}
