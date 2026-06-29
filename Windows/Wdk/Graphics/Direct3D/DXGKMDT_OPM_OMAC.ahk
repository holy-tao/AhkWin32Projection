#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_OMAC {
    #StructPack 1

    abOMAC : Int8[16]

}
