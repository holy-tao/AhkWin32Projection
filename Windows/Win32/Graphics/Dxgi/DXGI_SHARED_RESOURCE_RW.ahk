#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-shared-resource-rw
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_SHARED_RESOURCE_RW extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_SHARED_RESOURCE_READ => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_SHARED_RESOURCE_WRITE => 1
}
