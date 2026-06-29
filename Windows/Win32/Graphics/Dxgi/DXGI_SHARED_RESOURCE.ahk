#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Represents a handle to a shared resource.
 * @remarks
 * To create a shared surface, pass a shared-resource handle into the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-createsurface">IDXGIDevice::CreateSurface</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_shared_resource
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_SHARED_RESOURCE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * A handle to a shared resource.
     */
    Handle : HANDLE

}
