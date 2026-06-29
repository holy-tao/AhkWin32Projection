#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_OUTPUT_ID {
    #StructPack 8

    rnRandomNumber : IntPtr

    ulStatusFlags : UInt32

    OutputId : Int64

}
