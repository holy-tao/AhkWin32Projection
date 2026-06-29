#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATSTICS_ALLOCATIONS {
    #StructPack 8

    Created : IntPtr

    Destroyed : IntPtr

    Opened : IntPtr

    Closed : IntPtr

    MigratedSuccess : IntPtr

    MigratedFail : IntPtr

    MigratedAbandoned : IntPtr

}
