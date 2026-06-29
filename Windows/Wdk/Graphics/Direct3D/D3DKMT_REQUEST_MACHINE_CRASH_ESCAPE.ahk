#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_REQUEST_MACHINE_CRASH_ESCAPE {
    #StructPack 8

    Param1 : IntPtr

    Param2 : IntPtr

    Param3 : IntPtr

}
