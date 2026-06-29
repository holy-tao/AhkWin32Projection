#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRED_BREADCRUMB_CONTEXT {
    #StructPack 8

    BreadcrumbIndex : UInt32

    pContextString : PWSTR

}
