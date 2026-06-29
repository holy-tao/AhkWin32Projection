#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ADAPTERADDRESS {
    #StructPack 4

    BusNumber : UInt32

    DeviceNumber : UInt32

    FunctionNumber : UInt32

}
