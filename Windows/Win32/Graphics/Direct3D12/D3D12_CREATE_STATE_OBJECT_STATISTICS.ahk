#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_CREATE_STATE_OBJECT_STATISTICS {
    #StructPack 4

    NumCreated : UInt32

    NumPSDBCacheMissed : UInt32

    NumTotalCacheMissed : UInt32

    NumCacheUnknown : UInt32

}
