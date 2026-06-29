#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_DRIVERESCAPETYPE.ahk" { D3DDDI_DRIVERESCAPETYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_DRIVERESCAPE_CPUEVENTUSAGE {
    #StructPack 8

    EscapeType : D3DDDI_DRIVERESCAPETYPE

    hSyncObject : UInt32

    hKmdCpuEvent : Int64

    Usage : UInt32[8]

}
