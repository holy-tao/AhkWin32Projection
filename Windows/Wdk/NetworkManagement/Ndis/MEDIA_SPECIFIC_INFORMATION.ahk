#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_CLASS_ID.ahk" { NDIS_CLASS_ID }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct MEDIA_SPECIFIC_INFORMATION {
    #StructPack 4

    NextEntryOffset : UInt32

    ClassId : NDIS_CLASS_ID

    Size : UInt32

    ClassInformation : Int8[1]

}
