#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }
#Import ".\DXGK_ENGINE_TYPE.ahk" { DXGK_ENGINE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_TRACKEDWORKLOAD_SUPPORT {
    #StructPack 4

    PhysicalAdapterIndex : UInt32

    EngineType : DXGK_ENGINE_TYPE

    Support : BOOL

}
