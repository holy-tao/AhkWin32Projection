#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DPICKRECORD {
    #StructPack 4

    bOpcode : Int8

    bPad : Int8

    dwOffset : UInt32

    dvZ : Float32

}
