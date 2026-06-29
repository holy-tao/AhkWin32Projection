#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct RENDDATA {
    #StructPack 4

    atyp : UInt16

    ulPosition : UInt32

    dxWidth : UInt16

    dyHeight : UInt16

    dwFlags : UInt32

}
