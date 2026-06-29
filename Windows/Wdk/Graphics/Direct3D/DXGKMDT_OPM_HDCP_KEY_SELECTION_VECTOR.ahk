#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_HDCP_KEY_SELECTION_VECTOR {
    #StructPack 1

    abKeySelectionVector : Int8[5]

}
