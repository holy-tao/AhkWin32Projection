#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SETCONTEXTSCHEDULINGPRIORITY {
    #StructPack 4

    hContext : UInt32

    Priority : Int32

}
