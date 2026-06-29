#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHDETW_CREATEVIDEOPROCESSOR {
    #StructPack 8

    pObject : Int64

    pD3D9Ex : Int64

    VPGuid : Guid

}
