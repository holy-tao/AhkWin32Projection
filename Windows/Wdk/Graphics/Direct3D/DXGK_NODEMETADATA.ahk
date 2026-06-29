#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DXGK_ENGINE_TYPE.ahk" { DXGK_ENGINE_TYPE }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_NODEMETADATA {
    #StructPack 8

    EngineType : DXGK_ENGINE_TYPE

    FriendlyName : WCHAR[32]

    Flags : IntPtr

    GpuMmuSupported : BOOLEAN

    IoMmuSupported : BOOLEAN

}
