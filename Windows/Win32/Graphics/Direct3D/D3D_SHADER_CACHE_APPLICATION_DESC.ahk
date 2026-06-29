#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D_VERSION_NUMBER.ahk" { D3D_VERSION_NUMBER }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_SHADER_CACHE_APPLICATION_DESC {
    #StructPack 8

    pExeFilename : PWSTR

    pName : PWSTR

    Version : D3D_VERSION_NUMBER

    pEngineName : PWSTR

    EngineVersion : D3D_VERSION_NUMBER

}
