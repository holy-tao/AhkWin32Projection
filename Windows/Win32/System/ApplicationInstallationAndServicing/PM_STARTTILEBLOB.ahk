#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PM_INVOCATIONINFO.ahk" { PM_INVOCATIONINFO }
#Import ".\PM_STARTTILE_TYPE.ahk" { PM_STARTTILE_TYPE }
#Import ".\TILE_TEMPLATE_TYPE.ahk" { TILE_TEMPLATE_TYPE }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_STARTTILEBLOB {
    #StructPack 8

    cbSize : UInt32 := this.Size

    ProductID : Guid

    TileID : BSTR

    TemplateType : TILE_TEMPLATE_TYPE

    HubPosition : UInt32[32]

    HubVisibilityBitmask : UInt32

    IsDefault : BOOL

    TileType : PM_STARTTILE_TYPE

    pbPropBlob : IntPtr

    cbPropBlob : UInt32

    IsRestoring : BOOL

    IsModern : BOOL

    InvocationInfo : PM_INVOCATIONINFO

}
