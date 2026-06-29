#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DD_GETADAPTERGROUPDATA {
    #StructPack 8

    gdi2 : IntPtr

    ulUniqueAdapterGroupId : IntPtr

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}
