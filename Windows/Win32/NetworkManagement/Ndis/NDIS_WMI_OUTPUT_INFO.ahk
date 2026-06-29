#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_OUTPUT_INFO {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    Flags : UInt32

    SupportedRevision : Int8

    DataOffset : UInt32

}
