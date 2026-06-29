#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_DRIVERESCAPETYPE.ahk" { D3DDDI_DRIVERESCAPETYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_DRIVERESCAPE_TRANSLATEALLOCATIONEHANDLE {
    #StructPack 4

    EscapeType : D3DDDI_DRIVERESCAPETYPE

    hAllocation : UInt32

}
