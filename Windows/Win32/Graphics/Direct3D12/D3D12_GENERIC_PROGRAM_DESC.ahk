#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_STATE_SUBOBJECT.ahk" { D3D12_STATE_SUBOBJECT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_GENERIC_PROGRAM_DESC {
    #StructPack 8

    ProgramName : PWSTR

    NumExports : UInt32

    pExports : PWSTR.Ptr

    NumSubobjects : UInt32

    ppSubobjects : IntPtr

}
