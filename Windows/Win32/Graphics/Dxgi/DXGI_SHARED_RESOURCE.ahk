#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Represents a handle to a shared resource.
 * @remarks
 * To create a shared surface, pass a shared-resource handle into the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-createsurface">IDXGIDevice::CreateSurface</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_shared_resource
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_SHARED_RESOURCE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * A handle to a shared resource.
     * @type {HANDLE}
     */
    Handle{
        get {
            if(!this.HasProp("__Handle"))
                this.__Handle := HANDLE(this.ptr + 0)
            return this.__Handle
        }
    }
}
