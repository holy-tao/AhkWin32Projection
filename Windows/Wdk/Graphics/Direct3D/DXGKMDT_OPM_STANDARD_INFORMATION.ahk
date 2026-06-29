#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_STANDARD_INFORMATION {
    #StructPack 8

    rnRandomNumber : IntPtr

    ulStatusFlags : UInt32

    ulInformation : UInt32

    ulReserved : UInt32

    ulReserved2 : UInt32

}
