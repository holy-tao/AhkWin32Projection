#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION_TYPE.ahk" { D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION {
    #StructPack 8

    CopyProtectionType : D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION_TYPE

    APSTriggerBits : UInt32

    OEMCopyProtection : Int8[256]

    CopyProtectionSupport : IntPtr

}
