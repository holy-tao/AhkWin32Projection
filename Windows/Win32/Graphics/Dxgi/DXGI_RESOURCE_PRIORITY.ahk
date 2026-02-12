#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The eviction priority of the resource is high. The resource is placed in its preferred location instead of a low-priority or normal-priority resource.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgiresource-setevictionpriority
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_RESOURCE_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_MINIMUM => 671088640

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_LOW => 1342177280

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_NORMAL => 2013265920

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_HIGH => 2684354560

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_MAXIMUM => 3355443200
}
