#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify heap serialization support.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_serialization_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_HEAP_SERIALIZATION_TIER extends Win32Enum{

    /**
     * Indicates that heap serialization is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_SERIALIZATION_TIER_0 => 0

    /**
     * Indicates that heap serialization is supported. Your application can serialize resource data in heaps through copying APIs such as [CopyResource](/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copyresource), without necessarily requiring an explicit [state transition](/windows/desktop/direct3d12/using-resource-barriers-to-synchronize-resource-states-in-direct3d-12#implicit-state-transitions) of resources on those heaps.
     * @type {Integer (Int32)}
     */
    static D3D12_HEAP_SERIALIZATION_TIER_10 => 10
}
