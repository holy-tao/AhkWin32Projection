#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_SET_PROTECTION_LEVEL_PARAMETERS {
    #StructPack 4

    ulProtectionType : UInt32

    ulProtectionLevel : UInt32

    Reserved : UInt32

    Reserved2 : UInt32

}
