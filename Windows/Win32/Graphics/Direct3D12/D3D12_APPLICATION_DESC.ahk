#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_VERSION_NUMBER.ahk" { D3D12_VERSION_NUMBER }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_APPLICATION_DESC {
    #StructPack 8

    pExeFilename : PWSTR

    pName : PWSTR

    Version : D3D12_VERSION_NUMBER

    pEngineName : PWSTR

    EngineVersion : D3D12_VERSION_NUMBER

}
