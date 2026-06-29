#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_DRM_DRMSTATUS {
    #StructPack 8

    lResult : Int32

    DRMuuid : Guid

    ulDrmUuidListStringSize : UInt32

    argbDrmUuidListString : IntPtr[1]

}
