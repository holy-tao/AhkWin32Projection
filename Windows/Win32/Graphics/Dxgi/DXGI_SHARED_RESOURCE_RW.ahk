#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Shared resource constants.
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-shared-resource-rw
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_SHARED_RESOURCE_RW extends Win32BitflagEnum {

    /**
     * Native name: DXGI_SHARED_RESOURCE_READ
     * @type {Integer (UInt32)}
     */
    static READ => 2147483648

    /**
     * Native name: DXGI_SHARED_RESOURCE_WRITE
     * @type {Integer (UInt32)}
     */
    static WRITE => 1
}
