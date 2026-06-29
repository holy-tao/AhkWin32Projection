#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DLIGHTINGCAPS {
    #StructPack 4

    dwSize : UInt32

    dwCaps : UInt32

    dwLightingModel : UInt32

    dwNumLights : UInt32

}
