#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_COMPILER_VALUE_TYPE_FLAGS.ahk" { D3D12_COMPILER_VALUE_TYPE_FLAGS }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_COMPILER_DATABASE_PATH {
    #StructPack 8

    Types : D3D12_COMPILER_VALUE_TYPE_FLAGS

    pPath : PWSTR

}
