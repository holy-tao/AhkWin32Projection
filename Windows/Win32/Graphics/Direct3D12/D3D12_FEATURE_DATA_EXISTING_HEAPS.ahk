#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Provides detail about whether the adapter supports creating heaps from existing system memory.
 * @remarks
 * For a variety of performance and compatibility reasons, applications should not make use of this feature except for diagnostic purposes. In particular, heaps created using this feature only support system-memory heaps with cross-adapter properties, which precludes many optimization opportunities that typical application scenarios could otherwise take advantage of.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_existing_heaps
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_EXISTING_HEAPS {
    #StructPack 4

    /**
     * <b>TRUE</b> if the adapter can create a heap from existing system memory. Otherwise, <b>FALSE</b>.
     */
    Supported : BOOL

}
