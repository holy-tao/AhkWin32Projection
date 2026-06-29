#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDIFORMAT.ahk" { D3DDDIFORMAT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_DISPLAY_INFORMATION {
    #StructPack 8

    Width : UInt32

    Height : UInt32

    Pitch : UInt32

    ColorFormat : D3DDDIFORMAT

    PhysicAddress : Int64

    TargetId : UInt32

    AcpiId : UInt32

}
