#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_MONITOR_CAPABILITIES_ORIGIN.ahk" { D3DKMDT_MONITOR_CAPABILITIES_ORIGIN }
#Import ".\D3DKMDT_MONITOR_DESCRIPTOR_TYPE.ahk" { D3DKMDT_MONITOR_DESCRIPTOR_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_MONITOR_DESCRIPTOR {
    #StructPack 8

    Id : UInt32

    Type : D3DKMDT_MONITOR_DESCRIPTOR_TYPE

    DataSize : IntPtr

    pData : IntPtr

    Origin : D3DKMDT_MONITOR_CAPABILITIES_ORIGIN

}
