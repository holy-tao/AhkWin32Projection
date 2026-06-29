#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_AUTO_BREADCRUMB_NODE1.ahk" { D3D12_AUTO_BREADCRUMB_NODE1 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1 {
    #StructPack 8

    pHeadAutoBreadcrumbNode : D3D12_AUTO_BREADCRUMB_NODE1.Ptr

}
