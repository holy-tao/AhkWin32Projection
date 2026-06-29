#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DRED_BREADCRUMB_CONTEXT.ahk" { D3D12_DRED_BREADCRUMB_CONTEXT }
#Import ".\ID3D12GraphicsCommandList.ahk" { ID3D12GraphicsCommandList }
#Import ".\ID3D12CommandQueue.ahk" { ID3D12CommandQueue }
#Import ".\D3D12_AUTO_BREADCRUMB_OP.ahk" { D3D12_AUTO_BREADCRUMB_OP }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_AUTO_BREADCRUMB_NODE1 {
    #StructPack 8

    pCommandListDebugNameA : IntPtr

    pCommandListDebugNameW : PWSTR

    pCommandQueueDebugNameA : IntPtr

    pCommandQueueDebugNameW : PWSTR

    pCommandList : ID3D12GraphicsCommandList

    pCommandQueue : ID3D12CommandQueue

    BreadcrumbCount : UInt32

    pLastBreadcrumbValue : IntPtr

    pCommandHistory : D3D12_AUTO_BREADCRUMB_OP.Ptr

    pNext : D3D12_AUTO_BREADCRUMB_NODE1.Ptr

    BreadcrumbContextsCount : UInt32

    pBreadcrumbContexts : D3D12_DRED_BREADCRUMB_CONTEXT.Ptr

}
