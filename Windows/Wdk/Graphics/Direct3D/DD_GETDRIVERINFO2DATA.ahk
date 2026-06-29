#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DD_GETDRIVERINFO2DATA {
    #StructPack 4

    dwReserved : UInt32

    dwMagic : UInt32

    dwType : UInt32

    dwExpectedSize : UInt32

}
