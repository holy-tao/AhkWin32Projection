#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_CONNECTED_HDCP_DEVICE_INFORMATION {
    #StructPack 8

    rnRandomNumber : IntPtr

    ulStatusFlags : UInt32

    ulHDCPFlags : UInt32

    ksvB : IntPtr

    Reserved : Int8[11]

    Reserved2 : Int8[16]

    Reserved3 : Int8[16]

}
